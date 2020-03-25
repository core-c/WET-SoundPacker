program SoundPacker;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fSoundPacker},
  uWolf in 'uWolf.pas',
  uWaveDialog in 'uWaveDialog.pas' {fSelectWave};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SoundPacker';
  Application.CreateForm(TfSoundPacker, fSoundPacker);
  Application.CreateForm(TfSelectWave, fSelectWave);
  Application.Run;
end.
