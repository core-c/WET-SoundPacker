unit uWolf;
interface
uses Graphics;


type
  // Wolfenstein kleurcodes
  TWolfColorCode = record
    ASCII: char;
    Color: TColor;
  end;

const
  NrOfWolfColorCodes = 47;
  WolfColorCodes : array[0..NrOfWolfColorCodes-1] of TWolfColorCode = (
                 (ASCII:'1';  Color:$F70400),
                 (ASCII:'2';  Color:$02F702),
                 (ASCII:'3';  Color:$FDF900),
                 (ASCII:'4';  Color:$0006F8),
                 (ASCII:'5';  Color:$00F6F3),
                 (ASCII:'6';  Color:$F407F5),
                 (ASCII:'7';  Color:$F9F9F9),
                 (ASCII:'8';  Color:$FF7B06),
                 (ASCII:'9';  Color:$7C7D81),
                 (ASCII:'0';  Color:$000100),
                 (ASCII:'q';  Color:$F70303),
                 (ASCII:'w';  Color:$F4F6F1),
                 (ASCII:'e';  Color:$8100FD),
                 (ASCII:'r';  Color:$00F904),
                 (ASCII:'t';  Color:$0005F4),
                 (ASCII:'y';  Color:$7B7D7A),
                 (ASCII:'u';  Color:$00FAF6),
                 (ASCII:'i';  Color:$FB0033),
                 (ASCII:'o';  Color:$EFF174),
                 (ASCII:'p';  Color:$060702),
                 (ASCII:'a';  Color:$FD9534),
                 (ASCII:'s';  Color:$FBF904),
                 (ASCII:'d';  Color:$007DFE),
                 (ASCII:'*';  Color:$AE181A),
                 (ASCII:'f';  Color:$3795C8),
                 (ASCII:'g';  Color:$C2FCC9),
                 (ASCII:'h';  Color:$066432),
                 (ASCII:'j';  Color:$AD1C17),
                 (ASCII:'k';  Color:$9B3107),
                 (ASCII:'l';  Color:$CF9834),
                 (ASCII:';';  Color:$C0BFC7),
                 (ASCII:'z';  Color:$BCBDC2),
                 (ASCII:'x';  Color:$F98000),
                 (ASCII:'c';  Color:$7B0484),
                 (ASCII:'v';  Color:$F900F9),
                 (ASCII:'b';  Color:$037D7E),
                 (ASCII:'n';  Color:$FAF9C0),
                 (ASCII:'m';  Color:$9B9935),
                 (ASCII:',';  Color:$CF9A3A),
                 (ASCII:'.';  Color:$F7F8B6),
                 (ASCII:'/';  Color:$FBFC7C),
                 (ASCII:'-';  Color:$98972D),
                 (ASCII:'=';  Color:$7F7F00),
                 (ASCII:'\';  Color:$007F03),
                 (ASCII:'[';  Color:$BEC0BB),
                 (ASCII:']';  Color:$7F7C0B),
                 (ASCII:''''; Color:$C5F9C8)
               );


type
  TWolfTeams = set of (AxisTeam,AlliesTeam,FireTeam,GlobalTeam);


type
  // Wolfenstein Sound-Data (ListView.Items.Item[x].Data)
  TWolfSoundData = record
    Name: string;
    WaveFilePath, WaveFileName, DstFilePath: string;
    ChatText, PlainChatText,
    MenuText, CleanMenuText, PlainMenuText: string;
    Team : TWolfTeams;
  end;
  PWolfSoundData = ^TWolfSoundData;


  // Wolfenstein Menu-Data  (TreeView.Items.Item[x].Data)
  TWolfMenuData = record
    Choice: Char;
    Text, CleanText, PlainText, // WolfColored text, CleanText (zonder menukeuze), en plaintext (CleanText zonder kleuren)
    Cmd0,Cmd1, CmdLine,
    Menu,                // de naam van een menu
    SubMenu,             // gevuld als Cmd0=close menu & Cmd1=open menu         //submenu
    ExecVoice,           // gevuld als Cmd0=exec & Cmd1=close menu              //menu item
    ExecChat,            // het vsay commando
    VoiceName: string;   // als ExecVoice<>'', de naam van het geluid
  end;
  PWolfMenuData = ^TWolfMenuData;



  TWolf = class(TObject)
  private
  public
    constructor Create;
    destructor Destroy; virtual;
    //
    function StrTeam(Team: TWolfTeams) : string;

    //--------------------------------
    // een menu-regel ontleden
    function GetChoice(MenuLine:string) : Char;
    function GetText(MenuLine:string) : string;
    function GetCleanText(MenuText: string) : string;
    function GetPlainText(MenuText: string) : string;
    function GetCmd0(MenuLine:string) : string;
    function GetCmd1(MenuLine:string) : string;
    function GetCmdLine(MenuLine:string) : string;
    function GetExecVoice(MenuLine:string) : string;
    function GetVoiceChat(MenuLine:string) : string;
    function GetVoiceName(MenuLine: string) : string;
    function GetSubMenuName(MenuLine:string) : string;
    //--------------------------------

    function TrimWolfColors(const s: string): string;
    function GetWolfColor(WolfColorCode: Char): TColor;
  end;



var
  Wolf: TWolf;





implementation
uses StrUtils, SysUtils, Unit1;


constructor TWolf.Create;
begin
  //
end;

destructor TWolf.Destroy;
begin
  //
end;



function TWolf.StrTeam(Team: TWolfTeams): string;
begin
  Result := '';
  if AxisTeam in Team then Result := Result +'X';
  if AlliesTeam in Team then Result := Result +'A';
  if FireTeam in Team then Result := Result +'F';
  if GlobalTeam in Team then Result := Result +'G';
end;

function TWolf.TrimWolfColors(const s: string): string;
var Len,I: integer;
    trimmed: string;
begin
  // verwijder alle Wolfenstein kleurcodes
  trimmed := '';
  I := 1;
  Len := Length(s);
  while I<=Len do
    if s[I]='^' then
      inc(I,2)
    else begin
      trimmed := trimmed + s[I];
      Inc(I);
    end;
  Result := trimmed;
end;


function TWolf.GetWolfColor(WolfColorCode: Char): TColor;
var I,J: integer;
  //----------------------------
  function SwapRGB(const WolfColor: TColor) : TColor;
  begin
    Result := ((WolfColor and $000000FF) shl 16);            //R
    Result := Result or (WolfColor and $0000FF00);           //G
    Result := Result or ((WolfColor and $00FF0000) shr 16);  //B
    //Result := Result or $01000000;
  end;
  //----------------------------
begin
  Result := clWhite;
  for I:=0 to NrOfWolfColorCodes-1 do
    if WolfColorCodes[I].ASCII = WolfColorCode then begin
      Result := SwapRGB(WolfColorCodes[I].Color);
      break;
    end;
end;



function TWolf.GetChoice(MenuLine: string): Char;
var P0: integer;
begin
  // .Choice : tussen het laatste paar ""
  P0 := Length(MenuLine);
  repeat
    if MenuLine[P0]='"' then break;
    dec(P0);
  until P0=0;
  Result := Copy(MenuLine,P0-1,1)[1];
end;

function TWolf.GetText(MenuLine: string): string;
var P0,P1: integer;
begin
  // .Text : tussen het eerste paar ""
  P0 := Pos('"',MenuLine)+1;
  P1 := PosEx('"',MenuLine,P0)-1;
  Result := trim(Copy(MenuLine,P0,P1-P0+1));
end;

function TWolf.GetCleanText(MenuText: string): string;
var P0: integer;
begin
  // strip de menukeuze van de tekst
  P0 := Pos('. ',MenuText);
  if P0=0 then Result := MenuText
          else Result := Copy(MenuText,P0+2,Length(MenuText)-P0+1);
end;

function TWolf.GetPlainText(MenuText: string): string;
begin
  Result := Wolf.TrimWolfColors(MenuText);
end;

function TWolf.GetCmd0(MenuLine: string): string;
var P0,P1: integer;
begin
  // .Cmd0 : na het eerste paar "",
  // dan na de eerstevolgende comma "," tot aan de eerste punt-comma ";" (trimmed)
  P0 := Pos('"',MenuLine)+1;
  P0 := PosEx('"',MenuLine,P0)+1;
  P0 := PosEx(',',MenuLine,P0)+1;
  P1 := PosEx(';',MenuLine,P0)-1;
  Result := trim(Copy(MenuLine,P0,P1-P0+1));
end;

function TWolf.GetCmd1(MenuLine: string): string;
var P0,P1: integer;
begin
  // .Cmd1 : na de ";" van .Cmd0, tot aan de eerstevolgende comma ","
  P0 := Pos('"',MenuLine)+1;
  P0 := PosEx('"',MenuLine,P0)+1;
  P0 := PosEx(',',MenuLine,P0)+1;
  P0 := PosEx(';',MenuLine,P0)+1;
  P1 := PosEx(',',MenuLine,P0)-1;
  Result := trim(Copy(MenuLine,P0,P1-P0+1));
end;

function TWolf.GetCmdLine(MenuLine: string): string;
begin
  Result := TAB+ GetCmd0(MenuLine) +';'+TAB+ GetCmd1(MenuLine)
end;

function TWolf.GetSubMenuName(MenuLine: string): string;
var P0,P1: integer;
    s: string;
begin
  // als er een "close" & "open" op 1 regel staan (in resp. .Cmd0 & .Cmd1)
  s := GetCmd0(MenuLine);
  P0 := Pos('close',s);
  s := GetCmd1(MenuLine);
  P1 := Pos('open',s);
  if (P0=1) and (P1=1) then
    // submenu-naam staat in .Cmd1 na het "open" statement
    Result := trim(Copy(s,P1+4,Length(s)-4))
  else
    // er wordt geen submenu geopend..
    Result := '';
end;

function TWolf.GetExecVoice(MenuLine: string): string;
var s: string;
begin
  Result := '';
  s := GetCmd0(MenuLine);
  if Pos('exec "',s)<>0 then Result := s;
end;

function TWolf.GetVoiceChat(MenuLine: string): string;
var P0,P1,Ps: integer;
    s,Voice,SoundName,VSAY: string;
begin
  // exec "VoiceChat Bye";     of VoiceTeamChat
  // na de eerste "exec", dan tussen het eerstvolgende paar "".
  // het eerste woord is de vsay of vsay_team
  // het tweede woord is de soundname
  Result := '';
  s := GetCmd0(MenuLine);
  P0 := Pos('exec "',s);
  if P0=0 then Exit;
  P0 := P0+6;
  P1 := PosEx('"',s,P0)-1;
  Ps := PosEx(' ',s,P0+1);
  if Ps=0 then Exit; // geen vsay commando
  Voice := trim(Copy(s,P0,Ps-P0));
  SoundName := trim(Copy(s,Ps+1,P1-Ps));
  if lowercase(Voice)='voiceteamchat' then VSAY := 'vsay_team '
                                      else VSAY := 'vsay ';
  Result := VSAY + SoundName;
end;

function TWolf.GetVoiceName(MenuLine: string): string;
var P0,P1,Ps: integer;
    s,Voice,SoundName,VSAY: string;
begin
  // exec "VoiceChat Bye";     of VoiceTeamChat
  // na de eerste "exec", dan tussen het eerstvolgende paar "".
  // het eerste woord is de vsay of vsay_team
  // het tweede woord is de soundname
  Result := '';
  s := GetCmd0(MenuLine);
  P0 := Pos('exec "',s);
  if P0=0 then Exit;
  P0 := P0+6;
  P1 := PosEx('"',s,P0)-1;
  Ps := PosEx(' ',s,P0+1);
  if Ps=0 then Exit; // geen vsay commando
  Result := trim(Copy(s,Ps+1,P1-Ps));
end;






initialization
  Wolf := TWolf.Create;

finalization
  Wolf.Free;

end.

