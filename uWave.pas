unit uWave;
interface
uses Classes, sysutils; //, Windows;

type
  str4 = array[0..3] of Char; // string[4];

  TDataChunk = record
    Subchunk2ID : str4;       // "data"                                         // 40 PCM, 40+ExtraParamSize !PCM
    Subchunk2Size : cardinal; // == NumSamples * NumChannels * BitsPerSample/8  // 44
  end;
  PDataChunk = ^TDataChunk;


  TWaveHeader = packed record // array[0..43] of byte;                          // 0
    ChunkID : str4;           // "RIFF"                                         // 4
    ChunkSize : cardinal;     // 4 + (8 + SubChunk1Size) + (8 + SubChunk2Size)  // 8
    Format : str4;            // "WAVE"                                         // 12
    Subchunk1ID : str4;       // "fmt "                                         // 16
    Subchunk1Size : cardinal; // 16=PCM                                         // 20
    AudioFormat : word;       // 1=PCM, <>1=compressed                          // 24
    NumChannels : word;       // 1=mono. 2=stereo, ...                          // 26
    SampleRate : cardinal;    // bv. 8000, 22050 of 44100                       // 28
    ByteRate : cardinal;      // == SampleRate * NumChannels * BitsPerSample/8  // 32
    BlockAlign : smallint;    // == NumChannels * BitsPerSample/8               // 36
    BitsPerSample : word;     // 8=8 bits, 16=16 bits, ...                      // 38
    // ExtraParamSize : word; // exists only if this is not a PCM wave          // 40 !PCM
    // X ExtraParams          // space for extra parameters                     //
    Subchunk2ID : str4;       // "data"                                         // 40 PCM, 40+ExtraParamSize !PCM
    Subchunk2Size : cardinal; // == NumSamples * NumChannels * BitsPerSample/8  // 44
    // Data
  end;
  PWaveHeader = ^TWaveHeader;                                                   // offset


  TWave = class(TObject)
  private
    // De var voor de huidige wave-header
    WaveHeader: TWaveHeader;
    //
    function Str4ToString(var item: str4) : string;

    function ReadHeader(Filename: string{; Header: PWaveHeader=nil}) : boolean;
    function BytesPerSample : word; // == .BitsPerSample/8;
    function BytesPerFullSample : word; // == BytesPerSample() * NumChannels
    function NumSamples : cardinal; // == SizeOf("data") / BytesPerFullSample()
    function Duration : single; // de duur in seconde (tijdens afspelen)
    function StrDuration : string; // de duur in seconde (tijdens afspelen)
    function StrAudioFormat : string;
    function StrNumChannels : string;
    function StrSampleRate : string;
    function StrByteRate : string;
    function StrBitRate : string; // == .ByteRate*8
  public
    constructor Create;
    destructor Destroy; virtual;
    //
    function Valid(Filename: string) : boolean; // geldige wave??
    function ValidWolfWave(Filename: string='') : boolean; // geldige Wolfenstein wave??
    function GetInfoStr(Filename: string; style: byte=0) : string; // info in 1 string; Hoe > style, hoe meer info..
    function Play(Filename: string) : boolean;
  end;

var
  Wave: TWave;

(*
  // functions en procedures
  function ValidWolfWave(Filename: string='') : boolean; // geldige Wolfenstein wave??
*)


implementation
uses MMSystem,dialogs;

constructor TWave.Create;
begin
  //
end;

destructor TWave.Destroy;
begin
  //
end;


function TWave.Str4ToString(var item: str4): string;
begin
  Result := item[0] + item[1] + item[2] + item[3];
end;

function TWave.Play(Filename: string): boolean;
begin
  Result := FileExists(Filename);
  if Result then
    Result := PlaySound(PChar(FileName), 0, SND_FILENAME + SND_ASYNC);
end;





function TWave.ReadHeader(Filename: string): boolean;
var FS: TFileStream;
    BytesRead: integer;
    ExtraParamSize: word;
    DataChunk: TDataChunk;
begin
  Result := false;
  if not FileExists(Filename) then Exit;
  FS := TFileStream.Create(Filename,fmOpenRead);
  try
    BytesRead := FS.Read(WaveHeader,SizeOf(TWaveHeader));
    Result := (BytesRead=SizeOf(TWaveHeader));
    // data-chunk controleren
    if not Result then Exit;
    if WaveHeader.AudioFormat<>1 then begin
      // ExtraParamSize
      FS.Seek(40,soFromBeginning);
      BytesRead := FS.Read(ExtraParamSize,SizeOf(ExtraParamSize));
      Result := (BytesRead=SizeOf(ExtraParamSize));
      if not Result then Exit;
      // de chunk
      FS.Seek(40+ExtraParamSize,soFromBeginning);
      BytesRead := FS.Read(DataChunk,SizeOf(TDataChunk));
      Result := (BytesRead=SizeOf(TDataChunk));
      if not Result then Exit;
      // overnemen naar de waveheader
      WaveHeader.Subchunk2ID := DataChunk.Subchunk2ID;
      WaveHeader.Subchunk2Size := DataChunk.Subchunk2Size;
    end;
  finally
    FS.Free;
  end;
end;



function TWave.BytesPerSample: word;
begin
  Result := WaveHeader.BitsPerSample div 8;
end;

function TWave.BytesPerFullSample: word;
begin
  Result := BytesPerSample * WaveHeader.NumChannels;
end;

function TWave.NumSamples: cardinal;
var SubChunk2Size: cardinal;
begin
  Result := 0;
  SubChunk2Size := (8+WaveHeader.ChunkSize)-44;
//  SubChunk2Size := WaveHeader.ChunkSize - WaveHeader.Subchunk1Size - 20;
//  if SubChunk2Size<>WaveHeader.Subchunk2Size then Exit;
  Result := SubChunk2Size div BytesPerFullSample;
end;

function TWave.Duration: single;
begin
  Result := NumSamples / WaveHeader.SampleRate;
end;




function TWave.StrAudioFormat: string;
begin
  if WaveHeader.AudioFormat=1 then Result := 'PCM'
                              else Result := 'Compressed';
end;

function TWave.StrSampleRate: string;
begin
  Result := IntToStr(WaveHeader.SampleRate) +'Hz';
end;

function TWave.StrNumChannels: string;
begin
  // deze function heeft een header met data nodig..
  case WaveHeader.NumChannels of
    1:   Result := 'Mono';
    2:   Result := 'Stereo';
    else Result := IntToStr(WaveHeader.NumChannels)+'CH';
  end;
end;


function TWave.StrBitRate: string;
begin
  Result := IntToStr(WaveHeader.ByteRate*8) +'bps';
end;

function TWave.StrByteRate: string;
begin
  Result := IntToStr(WaveHeader.ByteRate) +'Bps';
end;

function TWave.StrDuration: string;
const minuut=60;  uur=60*minuut; dag=24*uur;
var DT: TDateTime;
begin
  //tijd in seconden omrekenen naar dagen
  DT := Duration/dag;
  Result := 'Duur: '+ TimeToStr(DT);
end;




function TWave.GetInfoStr(Filename: string; style: byte): string;
begin
  Result := '';
  if not ReadHeader(Filename) then Exit;

  case style of
    0: Result := StrAudioFormat;
    1: Result := StrAudioFormat +' '+ StrSampleRate;
    2: Result := StrAudioFormat +' '+ StrSampleRate +' '+ IntToStr(WaveHeader.BitsPerSample)+'b';
    3: Result := StrAudioFormat +' '+ StrSampleRate +' '+ IntToStr(WaveHeader.BitsPerSample)+'b '+
                 StrNumChannels;
    4: Result := StrAudioFormat +' '+ StrSampleRate +' '+ IntToStr(WaveHeader.BitsPerSample)+'b '+
                 StrNumChannels +' ('+ StrBitRate +')';
    5: Result := StrAudioFormat +' '+ StrSampleRate +' '+ IntToStr(WaveHeader.BitsPerSample)+'b '+
                 StrNumChannels +' ('+ StrBitRate +', '+ StrDuration +')';
    else Result := '';
  end;
end;







function TWave.Valid(Filename: string): boolean;
begin
  Result := false;
  if Filename<>'' then
    if not ReadHeader(Filename) then Exit;
  with WaveHeader do begin
    //------------------------------------------------
    // RIFF header
    if Str4ToString(ChunkID)<>'RIFF' then Exit;
    if Str4ToString(Format)<>'WAVE' then Exit;
    //------------------------------------------------
    // "fmt " subchunk
    if Str4ToString(Subchunk1ID)<>'fmt ' then Exit;
    //------------------------------------------------
    // "data" subchunk
   {if Subchunk1Size=16 then}
      if Str4ToString(Subchunk2ID)<>'data' then Exit;

    Result := true;
  end
end;

function TWave.ValidWolfWave(Filename: string): boolean;
begin
  Result := Valid(Filename);
  if not Result then Exit;
  with WaveHeader do begin
    // 16=PCM
    if Subchunk1Size<>16 then Exit;
    // 1=PCM
    if AudioFormat<>1 then Exit;
    // 1=mono, 2=stereo, ...
    if NumChannels>1 then Exit;
    // alleen 44100KHz samples
    if SampleRate<>44100 then Exit;

    // eenmaal hier beland, dan is het een te gebruiken wave-file..
    // 44.1KHz mono, PCM, geen compressie
    Result := true;
  end;
end;





initialization
  Wave := TWave.Create;

finalization
  Wave.Free;

end.
