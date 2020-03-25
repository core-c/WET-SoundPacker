unit uDir;

interface

  // parameter 'Subirs' is een comma-seperated string
  function CreateDir(DirName: string): boolean;
  function CreateDirs(DirList: array of string): boolean;
  procedure RemoveDir(DirName: string; recurseSubDirs: boolean=true; Exclude: string='');


  function CopyFile_(SrcFilename,DstFilename: string): boolean;

//  if not SelectDirectory(DirName, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then Exit;

implementation
uses Windows, SysUtils, Classes;


function CreateDir(DirName: string): boolean;
var Sec: TSecurityAttributes;
begin
  Result := true;
  if not DirectoryExists(DirName) then begin
    Sec.nLength := SizeOf(PSecurityAttributes);
    Sec.lpSecurityDescriptor := nil;
    Sec.bInheritHandle := true;
    Result := CreateDirectory(PChar(DirName),@Sec);
  end;
end;

function CreateDirs(DirList: array of string): boolean;
var I: integer;
begin
  Result := false;
  // controleer of er sub-irectories moeten worden aangemaakt..
  if High(DirList)=-1 then Exit;
  for I:=Low(DirList) to High(DirList) do
    // de sub-dir maken
    if not CreateDir(DirList[I]) then Exit {continue};
  Result := true;
end;



procedure RemoveDir(DirName: string; recurseSubDirs: boolean=true; Exclude: string='');
var sr: TSearchRec;
    FileAttrs: integer;
    aName: string;
begin
  if not DirectoryExists(DirName) then Exit;
  FileAttrs := faAnyFile;
  if FindFirst(DirName+'\*.*', FileAttrs, sr) = 0 then begin
    repeat
      if (sr.Attr and FileAttrs) = sr.Attr then begin
        if (sr.Name='.') or (sr.Name='..') then continue;
        aName := DirName+'\'+sr.Name;
        if aName = Exclude then continue;
        if (sr.Attr and faDirectory)=0 then begin// geen map?
          if FileExists(aName) then
            if DeleteFile(aName) then begin
              //if MessagesLevel then Memo.Lines.Add(TAB+'Wissen bestand: '+ aName);
            end else
              continue;
        end else begin // een map..
          if recurseSubDirs then RemoveDir(aName, true, '');
          //deze dir nu wissen..
          if DirectoryExists(aName) then begin
            //if MessagesLevel then Memo.Lines.Add(TAB+'Wissen map: '+ aName);
            if not RemoveDirectory(PChar(aName)) then continue;
          end else
            continue;
        end;
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  if DirectoryExists(DirName) then RemoveDirectory(PChar(DirName));
end;




function CopyFile_(SrcFilename,DstFilename: string): boolean;
(*!
var CancelPossible: BOOL;
    dwCopyFlags: cardinal;
*)
var FSfrom, FSto: TFileStream;
begin
//  Result := CopyFile(PChar(SrcFilename),PChar(DstFilename),false);

(*!
  // zonder progress indicator
  CancelPossible := true;
  dwCopyFlags := 0;
  Result := CopyFileEx(PChar(SrcFilename),PChar(DstFilename),nil,nil,@CancelPossible,dwCopyFlags);
*)

  Result := true;
  FSfrom := TFileStream.Create(SrcFilename,fmOpenRead);
  FSto := TFileStream.Create(DstFilename,fmCreate);
  try
    try
      FSto.CopyFrom(FSfrom,FSfrom.Size);
    except
      Result := false;
    end;
  finally
    FSfrom.Free;
    FSto.Free;
  end;
end;





end.
