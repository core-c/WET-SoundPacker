unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  FileCtrl,
  uWave, uDir, uWolf, ImgList, ZipForge, ActnList, Buttons, Grids, Menus;

const
  CRLF = #13#10;
  TAB  = #9;
  UJE_Prefix = 'wm_quickuje';
  FileName_SoundPack = 'UJE_SoundPack.PK3';


type
  TfSoundPacker = class(TForm)
    PageControl: TPageControl;
    TabOpties: TTabSheet;
    TabSounds: TTabSheet;
    TabMenu: TTabSheet;
    TabSoundPack: TTabSheet;
    pSoundsTop: TPanel;
    pSoundsBottom: TPanel;
    StatusBar: TStatusBar;
    pMenuTop: TPanel;
    pMenuBottom: TPanel;
    pSoundPackBottom: TPanel;
    pSoundPackTop: TPanel;
    PageControlSoundPack: TPageControl;
    TabSoundPackAllies: TTabSheet;
    TabSoundPackAxis: TTabSheet;
    TabSoundPackMenu: TTabSheet;
    mMenu: TMemo;
    mAxis: TMemo;
    mAllies: TMemo;
    pOptiesTop: TPanel;
    gbWorkDir: TGroupBox;
    Panel1: TPanel;
    bWorkDir: TButton;
    cbWorkDirCleanUp: TCheckBox;
    ImageList: TImageList;
    ZipForge: TZipForge;
    ActionList: TActionList;
    ActionSoundDelete: TAction;
    M: TMemo;
    ActionSoundAdd: TAction;
    ActionAddSubSound: TAction;
    ActionMenuInsertSubMenu: TAction;
    gbFolder: TGroupBox;
    cbOpenFolder: TCheckBox;
    gbCreate: TGroupBox;
    cbOptiesMenu: TCheckBox;
    cbOptiesPK3: TCheckBox;
    gbHelp: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ShapeSubSound: TShape;
    Label12: TLabel;
    Shape1: TShape;
    Label15: TLabel;
    ImageMenu: TImage;
    Label16: TLabel;
    ActionMenuDelete: TAction;
    eWorkDir: TEdit;
    PageControlMenu: TPageControl;
    TabMenuEditor: TTabSheet;
    tvMenu: TTreeView;
    RTF: TRichEdit;
    RTFChat: TRichEdit;
    PageControlSounds: TPageControl;
    TabSoundsSelector: TTabSheet;
    lvSounds: TListView;
    pSoundPackBottomRight: TPanel;
    pMenuBottomRight: TPanel;
    pSoundsBottomRight: TPanel;
    gbSound: TGroupBox;
    bSoundAdd: TButton;
    gbSubSound: TGroupBox;
    bSoundAddSub: TButton;
    gbMenuSubMenu: TGroupBox;
    bMenuInsertSubMenu: TButton;
    bMenuDeleteSubMenu: TButton;
    gbSoundPack: TGroupBox;
    bSoundPackCreate: TBitBtn;
    PopupMenu: TPopupMenu;
    PopupEdit: TMenuItem;
    ActionSoundEdit: TAction;
    bSoundPackLoad: TButton;
    OpenDialog: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    //
    procedure bWorkDirClick(Sender: TObject);
    //
    procedure lvSoundsCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvSoundsCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure bSoundPlayMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    //
    procedure tvMenuClick(Sender: TObject);
    //
    procedure tvMenuStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure tvMenuDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvMenuDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvMenuDblClick(Sender: TObject);
    procedure tvMenuCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvSoundsDblClick(Sender: TObject);
    procedure tvMenuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvSoundsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionSoundDeleteExecute(Sender: TObject);
    procedure lvSoundsResize(Sender: TObject);
    procedure StatusBarResize(Sender: TObject);
    procedure lvSoundsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure ActionSoundAddExecute(Sender: TObject);
    procedure ActionAddSubSoundExecute(Sender: TObject);
    procedure ActionMenuInsertSubMenuExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure bSoundPackCreateClick(Sender: TObject);
    procedure bSoundPackCreateMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionMenuDeleteExecute(Sender: TObject);
    procedure tvMenuChange(Sender: TObject; Node: TTreeNode);
    procedure tvMenuCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure ActionSoundEditExecute(Sender: TObject);
    procedure lvSoundsContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure bSoundPackLoadClick(Sender: TObject);
  private
    Progress: single;
    ColWidthChat: integer;
    CurrentMenu: string;
    SelectedNode,
    DraggingNode, DroppedOnNode: TTreeNode;
    NodeAttachMode: TNodeAttachMode;
    MenuNumber: integer;
    resourceStream : TResourceStream;
    procedure LoadResource(resourceName: string; var M: TMemo);
    //
    procedure SetStatusBar(const panel0, panel1: string);
    procedure ClearStatusBar;
    procedure StatusProgress(const Progress: single=0.0);
    //
    function CreateWorkDir(NewWorkDir: string) : boolean;
    //
    procedure FillListItem(var LI: TListItem);
    procedure SoundToMenu(const LI: TListItem);
    function GetNrOfChildren(MenuName: string) : integer; overload;
    function GetNrOfChildren(MenuNode: TTreeNode) : integer; overload;

    function IsMenu(Node: TTreeNode) : boolean;
    function IsSubMenu(Node: TTreeNode) : boolean;
    function IsMenuItem(Node: TTreeNode) : boolean;
    function IsDefMenu(Node: TTreeNode) : boolean;
    function IsDefSubMenu(Node: TTreeNode) : boolean;
    function IsDefMenuItem(Node: TTreeNode) : boolean;

    function GetParentItemIndex(index: integer): integer;
    function IsParentSound(index: integer): boolean;
    function IsSubSound(index: integer): boolean;
    function IsLastSubSound(index: integer): boolean;
    function IsSingleSound(index: integer): boolean;

    function hasSoundData(index: integer; var SoundData: PWolfSoundData) : boolean; overload;
    function hasSoundData(var LI: TListItem; var SoundData: PWolfSoundData) : boolean; overload;
    function hasMenuData(index: integer; var MenuData: PWolfMenuData) : boolean; overload;
    function hasMenuData(const Node: TTreeNode; var MenuData: PWolfMenuData) : boolean; overload;

    function DeleteSound(var Item: TListItem) : boolean;
    function DeleteSubSound(Item: TListItem) : boolean;
    function DeleteNode(var Node: TTreeNode) : boolean;

    function FindSoundRef(SoundName: string; var Node: TTreeNode) : boolean; //zoek menunode met ref naar soundname
    function FindSoundItem(SoundName: string; var Item: TListItem) : boolean; //zoek sound listitem
    function FindSoundData(SoundName: string; var SoundData: PWolfSoundData) : boolean; //zoek sound listitem's sounddata
    function FindMenuNode(MenuName: string; var Node: TTreeNode) : boolean; //zoek menu treenode
    function FindMenuData(MenuName: string; var MenuData: PWolfMenuData) : boolean; //zoek menu treenode's menudata

    procedure MenuToRTF(MenuName: string); overload;
    procedure MenuToRTF(MenuNode: TTreeNode); overload;

    procedure OptimizeMenu;
    procedure BuildMenu;       //input lezen en tree opbouwen
    procedure RebuildMenuFile; //output maken
    procedure RebuildSoundFiles;
  public
    WolfPath, AppPath, SoundPackPath, WorkDir, ScriptsDir, SoundDir, UIDir: string;
  end;

var
  fSoundPacker: TfSoundPacker;



implementation
uses uWaveDialog, StrUtils, ShellAPI;
{$R *.dfm}
{$R .\Files\SoundPacker.res}


//-------------------------------------------------------

procedure TfSoundPacker.FormCreate(Sender: TObject);
begin
  Progress := 0.0;
  //
  ColWidthChat := fSoundPacker.Width - lvSounds.Columns.Items[2].Width;
  lvSounds.Columns.Items[2].Width := fSoundPacker.Width-ColWidthChat;
  //
  StatusBar.Panels[1].Width := fSoundPacker.Width - StatusBar.Panels[0].Width - 8;

  CurrentMenu := '';
  SelectedNode := nil;
  DraggingNode := nil;
  DroppedOnNode := nil;
  MenuNumber := 0;  // menu wm_quickuje bestaat al.., wm_quickuje0 wordt de volgende..etc.

  // de mappen
  AppPath := ExtractFilePath(Application.ExeName);
  SoundPackPath := AppPath +'SoundPack'; // de output directory
  WorkDir := AppPath +'WorkDir';         // de werkmap
  ScriptsDir := WorkDir+'\scripts';      //   Wolf-ET game-dir
  SoundDir := WorkDir+'\sound';          //   Wolf-ET game-dir
  UIDir := WorkDir+'\ui';                //   Wolf-ET game-dir
  eWorkDir.Text := WorkDir;

  // de resource file
  LoadResource('VoiceAllies',mAllies);
  LoadResource('VoiceAxis',mAxis);
  LoadResource('MsgAltMenu',mMenu);

  // menu-tree genereren
  BuildMenu;
end;

procedure TfSoundPacker.FormDestroy(Sender: TObject);
var I: integer;
begin
  // De SoundData verwijderen
  for I:=0 to lvSounds.Items.Count-1 do
    with lvSounds.Items.Item[I] do begin
      if Data<>nil then Dispose(Data);
      Data := nil;
    end;
  // De MenuData verwijderen
  for I:=0 to tvMenu.Items.Count-1 do
    with tvMenu.Items.Item[I] do begin
      if Data<>nil then Dispose(Data);
      Data := nil;
    end;
end;

procedure TfSoundPacker.LoadResource(resourceName: string; var M: TMemo);
begin
  resourceStream := TResourceStream.Create(HInstance, resourceName, 'TXT');
  try
    M.Lines.Clear;
    M.Lines.LoadFromStream(resourceStream);
  finally
    resourceStream.Free;
  end;
end;


procedure TfSoundPacker.PageControlChange(Sender: TObject);
begin
  SetStatusBar('','');
end;


//-------------------------------------------------------

// de kolombreedte van StatusBar.panel[1] aanpassen
procedure TfSoundPacker.StatusBarResize(Sender: TObject);
begin
  StatusBar.Panels[1].Width := fSoundPacker.Width - StatusBar.Panels[0].Width - 8;
end;

procedure TfSoundPacker.SetStatusBar(const panel0, panel1: string);
begin
  StatusBar.Panels[0].Text := panel0;
  StatusBar.Panels[1].Text := panel1;
end;

procedure TfSoundPacker.ClearStatusBar;
begin
  SetStatusBar('','');
end;

procedure TfSoundPacker.StatusProgress(const Progress: single=0.0);
var Rect: TRect;
begin
  Rect.Top := 2;
  Rect.Bottom := Rect.Top + StatusBar.Height - 4;
  Rect.Left := StatusBar.Panels[0].Width + 4;
  Rect.Right := round((Rect.Left + StatusBar.Panels[1].Width - 24) * Progress);
  //
  if Progress=0.0 then begin
    StatusBar.Canvas.Brush.Color := clBtnFace;
    StatusBar.Canvas.Pen.Color := clBlack;
  end else begin
    StatusBar.Canvas.Brush.Color := clBlue;
    StatusBar.Canvas.Pen.Color := clBlue;
  end;
  StatusBar.Canvas.FillRect(Rect);
end;


//-------------------------------------------------------

function TfSoundPacker.CreateWorkDir(NewWorkDir: string): boolean;
var NewScriptsDir, NewSoundDir, NewUIDir: string;
begin
  NewScriptsDir := NewWorkDir+'\scripts';      //   Wolf-ET game-dir
  NewSoundDir := NewWorkDir+'\sound';          //   Wolf-ET game-dir
  NewUIDir := NewWorkDir+'\ui';                //   Wolf-ET game-dir

  Result := CreateDirs([NewWorkDir,
                        NewScriptsDir,
                        NewSoundDir,
                        NewSoundDir+'\axis',
                        NewSoundDir+'\allies',
                        NewSoundDir+'\both',
                        NewSoundDir+'\chat',
                        NewSoundDir+'\chat\UJE',
                        NewUIDir]);
  if not Result then Exit;

  WorkDir := NewWorkDir;
  ScriptsDir := NewScriptsDir;
  SoundDir := NewSoundDir;
  UIDir := NewUIDir;

  eWorkDir.Text := WorkDir;
end;

procedure TfSoundPacker.bWorkDirClick(Sender: TObject);
const SELDIRHELP = 1000;
var NewWorkDir: string;
begin
  ClearStatusBar;
  NewWorkDir := WorkDir;
  // Select Directory dialog box
  if not SelectDirectory(NewWorkDir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then Exit;
  // Windows directory browser
//  if not SelectDirectory('Selecteer een werkmap',WorkDir,NewWorkDir) then Exit;
  if not CreateWorkDir(NewWorkDir) then Exit;
end;




//-------------------------------------------------------

procedure TfSoundPacker.bSoundPlayMouseUp(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  lvSounds.SetFocus;
end;


//-------------------------------------------------------

// de kolombreedte van de chattext aanpassen
procedure TfSoundPacker.lvSoundsResize(Sender: TObject);
begin
  lvSounds.Columns.Items[2].Width := fSoundPacker.Width-ColWidthChat;
end;

// info afbeelden op selectitem
procedure TfSoundPacker.lvSoundsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var SoundData: PWolfSoundData;
begin
  SetStatusBar('','');
  if Item=nil then Exit;
  if not hasSoundData(Item,SoundData) then Exit;
  if GlobalTeam in SoundData.Team then
    SetStatusBar('','vsay '+ SoundData.Name)
  else
    SetStatusBar('','vsay_team '+ SoundData.Name);
end;

// geluid afspelen op een dubbelklik
procedure TfSoundPacker.lvSoundsDblClick(Sender: TObject);
var SoundData: PWolfSoundData;
    LI: TListItem;
begin
  LI := lvSounds.Selected;
  if not hasSoundData(LI,SoundData) then Exit;
  Wave.Play(SoundData.WaveFilePath);
end;

// sound verwijderen op een DEL toetsdruk
// sound toevoegen op een INSERT toetsdruk
// subsound toevoegen op een Num.pad + toetsdruk
procedure TfSoundPacker.lvSoundsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // een sound verwijderen??
  if Key=VK_DELETE then
    ActionSoundDeleteExecute(nil)
  else
  // een sound toevoegen??
  if Key=VK_INSERT then
    ActionSoundAddExecute(nil)
  else
  // een subsound toevoegen??  (keypad +)
  if Key=VK_ADD then
    ActionAddSubSoundExecute(nil);
end;

// een menu-node verwijderen op een DEL toetsdruk
// een menu-node toevoegen op een INSERT toetsdruk
procedure TfSoundPacker.tvMenuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    // een submenu tussenvoegen??
    VK_INSERT: ActionMenuInsertSubMenuExecute(nil);
    // menu/submenu/item wissen??
    VK_DELETE: ActionMenuDeleteExecute(nil);
  end;
end;

procedure TfSoundPacker.tvMenuChange(Sender: TObject; Node: TTreeNode);
var SoundData: PWolfSoundData;
    VoiceName: string;
begin
  // RTF's verversen..
  MenuToRTF(Node);

  // de chattekst
  RTFchat.Lines.Clear;
  if not IsMenuItem(Node) then Exit;
  VoiceName := PWolfMenuData(Node.Data).VoiceName;
  if VoiceName='' then Exit;
  // sound erbij zoeken..
  if FindSoundData(VoiceName,SoundData) then
    RTFChat.Lines.Add(SoundData.ChatText);
end;

// de menu-node 'wm_quickmessageAlt', de root, mag niet inklappen..
// ..anders zijn ze 'm kwijt.   ;-)
procedure TfSoundPacker.tvMenuCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
begin
  if IsMenu(Node) then
    AllowCollapse := (PWolfMenuData(Node.Data).Menu<>'wm_quickmessageAlt');
end;

//-------------------------------------------------------

function TfSoundPacker.IsParentSound(index: integer): boolean;
var LI: TListItem;
    SoundData: PWolfSoundData;
begin
  Result := true;
  if (index=0) then Exit;
  LI := lvSounds.Items.Item[index];
  if not hasSoundData(LI,SoundData) then Exit;
  Result := (SoundData.Name <> '');
end;

function TfSoundPacker.IsSubSound(index: integer): boolean;
var SoundName: string;
begin
  Result := false;
  with lvSounds.Items do begin
    if (index=0) or (index>Count-1) then Exit;
    if Item[index].Data=nil then Exit;
    SoundName := PWolfSoundData(Item[index].Data).Name;
    Result := (SoundName = '');
  end;
end;

function TfSoundPacker.IsLastSubSound(index: integer): boolean;
begin
  with lvSounds.Items do begin
    Result := (index>=Count-1);
    if not Result then begin
      Result := IsSubSound(index);
      if Item[index+1].Data=nil then Exit;
      if Result then Result := (PWolfSoundData(Item[index+1].Data).Name <> '');
    end;
  end;
end;

function TfSoundPacker.IsSingleSound(index: integer): boolean;
begin
  Result := false;
  with lvSounds.Items do begin
    if (index<Count-1) then Result := (IsParentSound(index) and not IsSubSound(index+1));
    if not Result then Result := ((index>=Count-1) and IsParentSound(index));
  end;
end;

function TfSoundPacker.GetParentItemIndex(index: integer): integer;
var i: integer;
begin
  Result := index;
  if IsSubSound(index) then
    for i:=index-1 downto 0 do
      if IsParentSound(i) then begin
        Result := i;
        Exit;
      end;
end;
//-------------------------------------------------------



procedure TfSoundPacker.lvSoundsCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var Color: TColor;
begin
  if Item=nil then Exit;
  If IsSubSound(Item.Index) then Color := clSkyBlue
                            else Color := clWhite;
  (Sender as TCustomListView).Canvas.Brush.Color := Color;

  // regel de knoppen..
  bSoundAddSub.Enabled := (lvSounds.Items.Count>=1) and (lvSounds.Selected<>nil);
end;

procedure TfSoundPacker.lvSoundsCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
var Color: TColor;
begin
  if Item=nil then Exit;
  if SubItem<0 then Exit;
  If IsSubSound(Item.Index) then Color := clSkyBlue
                            else Color := clWhite;
  (Sender as TCustomListView).Canvas.Brush.Color := Color;
end;



//-------------------------------------------------------

procedure TfSoundPacker.FillListItem(var LI: TListItem);
begin
  if LI=nil then Exit;
  if LI.Data=nil then Exit;
  with PWolfSoundData(LI.Data)^ do begin
    // vsay naam van het geluid
    LI.Caption := Name;
    // naar welk team
    LI.SubItems.Add(Wolf.StrTeam(Team));
    // chat-tekst
    LI.SubItems.Add(PlainChatText);
    // wave filename
    LI.SubItems.Add(WaveFileName);
  end;
  // zojuist aangemaakte listitem selecteren
  lvSounds.Selected := LI;
  lvSounds.SetFocus;
end;


procedure TfSoundPacker.SoundToMenu(const LI: TListItem);
var MenuData: PWolfMenuData;
    Text,VoiceName,ExecVoice,ExecChat: string;
    Node: TTreeNode;
begin
  // toevoegen als losse node onderaan de tree..(in andere kleur getekend)
  if LI.Data=nil then Exit;
//  Text := PWolfSoundData(LI.Data).ChatText;
  Text := PWolfSoundData(LI.Data).PlainMenuText;
  VoiceName := PWolfSoundData(LI.Data).Name;
  if VoiceName='' then Exit; // geen subsounds toevoegen aan het menu..
  if GlobalTeam in PWolfSoundData(LI.Data).Team then begin
    ExecVoice := 'exec "VoiceChat '+ VoiceName +'"';
    ExecChat := 'vsay '+ VoiceName;
  end else begin
    ExecVoice := 'exec "VoiceTeamChat '+ VoiceName +'"';
    ExecChat := 'vsay_team '+ VoiceName;
  end;

  //	QM_MENU_ITEM_TEAM( "^w1. ^5Follow Me!", 	exec "VoiceTeamChat FollowMe"; 		close wm_quickcommand_alt, 	"1", 0 )
  new(MenuData);
  MenuData.Menu := '';
  MenuData.SubMenu := '';
  MenuData.Choice := chr(0);
  MenuData.Text := Text;
  MenuData.CleanText := Wolf.GetCleanText(MenuData.Text);
  MenuData.PlainText := Wolf.GetPlainText(MenuData.CleanText);
  MenuData.Cmd0 := ExecVoice;
  MenuData.Cmd1 := 'close '+ UJE_Prefix;
  MenuData.CmdLine := TAB+ MenuData.Cmd0 +';'+TAB+ MenuData.Cmd1;
  MenuData.ExecVoice := ExecVoice;
  MenuData.ExecChat := ExecChat;
  MenuData.VoiceName := VoiceName;

  // als losse node toevoegen aan de root-node
  if FindMenuNode('wm_quickmessageAlt',Node) then
    tvMenu.Items.AddObject(Node,MenuData.PlainText,MenuData);
end;


//------------------------------------------------------------------------------

function TfSoundPacker.IsMenu(Node: TTreeNode): boolean;
var MenuData: PWolfMenuData;
begin
  Result := false;
  if Node=nil then Exit;
  if Node.Data=nil then Exit;
  MenuData := Node.Data;
  if MenuData.VoiceName<>'' then Exit; // geen menu-items en/of losse Sounds..
  if MenuData.SubMenu<>'' then Exit; // geen submenu's..
  if MenuData.Menu='' then Exit; // geen ongeldige nodes..?!
  //
  Result := true;
end;

function TfSoundPacker.IsSubMenu(Node: TTreeNode): boolean;
var MenuData: PWolfMenuData;
begin
  Result := false;
  if Node=nil then Exit;
  if Node.Data=nil then Exit;
  if not IsMenu(Node.Parent) then Exit;
  MenuData := Node.Data;
  if MenuData.Menu<>'' then Exit; // geen menu-nodes..
  if MenuData.VoiceName<>'' then Exit; // geen losse Sounds..
  if MenuData.SubMenu='' then Exit; // geen ongeldige nodes..
  //
  Result := true;
end;

function TfSoundPacker.IsMenuItem(Node: TTreeNode): boolean;
var MenuData: PWolfMenuData;
begin
  Result := false;
  if Node=nil then Exit;
  if Node.Data=nil then Exit;
  if not IsMenu(Node.Parent) then Exit;
  MenuData := Node.Data;
  if MenuData.Menu<>'' then Exit; // geen menu-nodes..
  if MenuData.SubMenu<>'' then Exit; // geen submenu's..
  if MenuData.VoiceName='' then Exit; // geen ongeldige nodes..
  //
  Result := true;
end;

function TfSoundPacker.IsDefMenu(Node: TTreeNode): boolean;
var MenuData: PWolfMenuData;
    MenuName: string;
begin
  Result := false;
  if not IsMenu(Node) then Exit;
  MenuData := Node.Data;
  MenuName := MenuData.Menu;
  if Pos(UJE_Prefix,MenuName)=1 then
    if Length(MenuName)>Length(UJE_Prefix) then Exit;
  //
  Result := true;
end;

function TfSoundPacker.IsDefSubMenu(Node: TTreeNode): boolean;
var MenuData: PWolfMenuData;
    MenuName: string;
begin
  Result := false;
  if not IsSubMenu(Node) then Exit;
  if not IsDefMenu(Node.Parent) then Exit;
  MenuData := Node.Parent.Data; //de parent is een menu..
  MenuName := MenuData.Menu;
  if MenuName=UJE_Prefix then Exit;
  //
  Result := true;
end;

function TfSoundPacker.IsDefMenuItem(Node: TTreeNode): boolean;
var MenuData: PWolfMenuData;
    SoundName: string;
begin
  Result := false;
  if IsMenu(Node) then Exit;
  if IsSubMenu(Node) then Exit;
//  Result := IsDefMenu(Node.Parent); // parent is een menu..
//  if Result then Exit;
  MenuData := Node.Data;
  SoundName := MenuData.VoiceName;
  if Pos(Prefix,SoundName)=1 then Exit; //uWave
  //
  Result := true;
end;




//------------------------------------------------------------------------------


function TfSoundPacker.hasSoundData(index: integer; var SoundData: PWolfSoundData): boolean;
var LI: TListItem;
begin
  Result := false;
  SoundData := nil;
  if (index<0) or (index>=lvSounds.Items.Count) then Exit;
  LI := lvSounds.Items.Item[index];
  Result := hasSoundData(LI, SoundData);
end;

function TfSoundPacker.hasSoundData(var LI: TListItem; var SoundData: PWolfSoundData): boolean;
begin
  Result := false;
  SoundData := nil;
  if LI=nil then Exit;
  if LI.Data=nil then Exit;
  SoundData := LI.Data;
  Result := true;
end;

function TfSoundPacker.hasMenuData(index: integer; var MenuData: PWolfMenuData): boolean;
var Node: TTreeNode;
begin
  Result := false;
  MenuData := nil;
  if (index<0) or (index>=tvMenu.Items.Count) then Exit;
  Node := tvMenu.Items.Item[index];
  Result := hasMenuData(Node, MenuData);
end;

function TfSoundPacker.hasMenuData(const Node: TTreeNode; var MenuData: PWolfMenuData): boolean;
begin
  Result := false;
  MenuData := nil;
  if Node=nil then Exit;
  if Node.Data=nil then Exit;
  Result := true;
  MenuData := Node.Data;
end;


function TfSoundPacker.GetNrOfChildren(MenuNode: TTreeNode): integer;
var Node: TTreeNode;
begin
  Result := 0;
  if MenuNode=nil then Exit;
  Node := MenuNode.getFirstChild;
  if Node=nil then Exit;
  repeat
    inc(Result);
    Node := MenuNode.GetNextChild(Node);
  until Node=nil;
end;

function TfSoundPacker.GetNrOfChildren(MenuName: string): integer;
var Node: TTreeNode;
begin
  if FindMenuNode(MenuName,Node) then
    Result := GetNrOfChildren(Node)
  else
    Result := -1; //ongeldig
end;

function TfSoundPacker.DeleteNode(var Node: TTreeNode) : boolean;
var MenuData: PWolfMenuData;
begin
  ClearStatusBar;
  Result := true;
  if Node=nil then Exit;
  if hasMenuData(Node,MenuData) then dispose(MenuData);
  Node.Delete;
  //Node := nil;
end;

function TfSoundPacker.DeleteSound(var Item: TListItem): boolean;
var SoundData: PWolfSoundData;
    Node: TTreeNode;
    LI: TListItem;
begin
  ClearStatusBar;
  Result := true;
  if Item=nil then Exit;
  if hasSoundData(Item,SoundData) then begin
    if FindSoundRef(SoundData.Name,Node) then DeleteNode(Node);
//    dispose(SoundData);
  end;
  Item.Delete;
//  Item := nil;
end;

function TfSoundPacker.DeleteSubSound(Item: TListItem): boolean;
var SoundData: PWolfSoundData;
    Node: TTreeNode;
begin
  ClearStatusBar;
  Result := true;
  if Item=nil then Exit;
  if hasSoundData(Item,SoundData) then
    dispose(SoundData);
  Item.Delete;
  //Item := nil;
end;

// zoek de Menu-TreeNode op welke refereert naar de opgegeven SoundName
function TfSoundPacker.FindSoundRef(SoundName: string; var Node: TTreeNode): boolean;
var I: integer;
    MenuData: PWolfMenuData;
begin
  Result := true;
  // doorloop alle items van de menu-tree
  for I:=0 to tvMenu.Items.Count-1 do begin
    Node := tvMenu.Items.Item[I];
    if not hasMenuData(Node,MenuData) then continue;
    if MenuData.VoiceName<>SoundName then continue;
    // de menu-node met referentie naar SoundName is gevonden..
    result := true;
    Exit;
  end;
  Node := nil;
  Result := false;
end;

function TfSoundPacker.FindSoundItem(SoundName: string; var Item: TListItem) : boolean;
var I: integer;
    SoundData: PWolfSoundData;
begin
  Result := false;
  Item := nil;
  for I:=0 to lvSounds.Items.Count-1 do begin
    Item := lvSounds.Items.Item[I];
    if not hasSoundData(Item,SoundData) then continue;
    if SoundData.Name<>SoundName then continue;
    // gevonden..
    Result := true;
    Exit;
  end;
end;

function TfSoundPacker.FindSoundData(SoundName: string; var SoundData: PWolfSoundData) : boolean;
var LI: TListItem;
begin
  Result := false;
  SoundData := nil;
  if not FindSoundItem(SoundName,LI) then Exit;
  if not hasSoundData(LI,SoundData) then Exit;
  Result := true;
end;

function TfSoundPacker.FindMenuNode(MenuName: string;  var Node: TTreeNode): boolean;
var I: integer;
    MenuData: PWolfMenuData;
begin
  Result := false;
  for I:=0 to tvMenu.Items.Count-1 do begin
    Node := tvMenu.Items.Item[I];
    if not hasMenuData(Node,MenuData) then continue;
    if MenuData.Menu<>MenuName then continue;
    Result := true;
    Exit;
  end;
  Node := nil;
end;

function TfSoundPacker.FindMenuData(MenuName: string; var MenuData: PWolfMenuData): boolean;
var Node: TTreeNode;
begin
  Result := false;
  MenuData := nil;
  if not FindMenuNode(MenuName,Node) then Exit;
  if not hasMenuData(Node,MenuData) then Exit;
  Result := true;
end;

//------------------------------------------------------------------------------

procedure TfSoundPacker.RebuildSoundFiles;
var I: integer;
    B: boolean;
    LI: TListItem;
    SoundName,SoundWave,SoundText, SoundPath,PathWave: string;
    SoundData: PWolfSoundData;
  //-------------------------------
  procedure OpenEntry(const SoundName,Team,SoundWave,SoundText: string; var M: TMemo);
  var L: string;
  begin
    L := SoundName + CRLF;
    L := L +'{'+ CRLF;
    L := L + TAB +'sound/'+ Team +'/'+ SoundWave + TAB +'"'+ SoundText +'"' + CRLF;
    M.Lines.Add(L);
  end;
  //-------------------------------
  procedure CreateLine(const Team,SoundWave,SoundText: string; var M: TMemo);
  var L: string;
  begin
    L := TAB +'sound/'+ Team +'/'+ SoundWave + TAB +'"'+ SoundText +'"' + CRLF;
    M.Lines.Add(L);
  end;
  //-------------------------------
  procedure CloseEntry(var M: TMemo);
  var L: string;
  begin
    L := '}'+ CRLF + CRLF;
    M.Lines.Add(L);
  end;
  //-------------------------------
  procedure CreateEntry(const SoundName,Team,SoundWave,SoundText: string; var M: TMemo);
  var L: string;
  begin
    OpenEntry(SoundName,Team,SoundWave,SoundText,M);
    CloseEntry(M);
  end;
  //-------------------------------
  procedure WriteEntry(index: integer; const SoundName,Team,SoundWave,SoundText: string; var M: TMemo);
  var L: string;
  begin
    if IsSingleSound(index) then begin
      CreateEntry(SoundName,Team,SoundWave,SoundText,M);
    end else
    if IsParentSound(index) then begin
      OpenEntry(SoundName,Team,SoundWave,SoundText,M);
    end else
    if IsSubSound(index) then begin
      CreateLine(Team,SoundWave,SoundText,M);
      if IsLastSubSound(index) then CloseEntry(M);
    end
  end;
  //-------------------------------
begin
  LoadResource('VoiceAllies',mAllies);
  LoadResource('VoiceAxis',mAxis);

  for I:=0 to lvSounds.Items.Count-1 do begin
    LI := lvSounds.Items.Item[I];
    if not hasSoundData(LI,SoundData) then continue;

    If IsSubSound(I) then
      SoundName := PWolfSoundData(lvSounds.Items[GetParentItemIndex(I)].Data).Name
    else
      SoundName := SoundData.Name;
    SoundText := SoundData.ChatText;
    SoundWave := SoundData.WaveFileName;
    SoundPath := SoundData.WaveFilePath;
   {SoundDstPath := SoundData.DstFilePath;}

    B := (AlliesTeam in SoundData.Team) and (AxisTeam in SoundData.Team);
    // Global
    if GlobalTeam in SoundData.Team then begin
      WriteEntry(I, SoundName,'chat/UJE',SoundWave,SoundText, mAllies);
      WriteEntry(I, SoundName,'chat/UJE',SoundWave,SoundText, mAxis);
      PathWave := SoundDir+'\chat\UJE\'+SoundWave;
    end else
    // FireTeam
    if FireTeam in SoundData.Team then begin
    end else
    // both
    if B then begin
      WriteEntry(I, SoundName,'both',SoundWave,SoundText, mAllies);
      WriteEntry(I, SoundName,'both',SoundWave,SoundText, mAxis);
      PathWave := SoundDir+'\both\'+SoundWave;
    end else
    // Allies
    if AlliesTeam in SoundData.Team then begin
      WriteEntry(I, SoundName,'allies',SoundWave,SoundText, mAllies);
      PathWave := SoundDir+'\allies\'+SoundWave;
    end else
    // Axis
    if AxisTeam in SoundData.Team then begin
      WriteEntry(I, SoundName,'axis',SoundWave,SoundText, mAxis);
      PathWave := SoundDir+'\axis\'+SoundWave;
    end;

    // property overnemen.
    SoundData.DstFilePath := PathWave;
  end;
end;




// menu-tree -> file
procedure TfSoundPacker.RebuildMenuFile;
var I: integer;
    Node: TTreeNode;
    MenuData: PWolfMenuData;
  //--------------------------------------
  procedure Build1Menu(MenuNode: TTreeNode);
  const MenuChoices = '1234567890';
  var Node: TTreeNode;
      L,s, MenuName: string;
      N: integer;
  begin
(*
    // de afbeelding in de tree
    MenuNode.StateIndex := 0;
    MenuNode.ImageIndex := 0;
*)
    MenuName := PWolfMenuData(MenuNode.Data).Menu;
    L := 'QM_MENU_START( "'+ MenuName +'" )' + CRLF + CRLF;
    // doorloop alle children in dit menu
    N := 1;
    Node := MenuNode.getFirstChild;
    while Node<>nil do begin
      try
        try
          if N>10 then begin
            //showmessage('Meer dan 10 menu-items per menu is onmogelijk');
            Exit; //goto finally
          end;
          with PWolfMenuData(Node.Data)^ do begin
            // renumber
            Choice := MenuChoices[N];

            // controleer de cmdLine
//            if SubMenu<>'' then CmdLine := TAB+ 'close '+ MenuName +', '+ TAB +'open '+ SubMenu +';';
            if VoiceName<>'' then CmdLine := TAB + ExecVoice +'; '+ TAB+ 'close '+ MenuName;
            //

            L := L + TAB +'QM_MENU_ITEM( "^w'+ Choice +'. '+ CleanText +'",'+ CmdLine +','+ TAB +'"'+ Choice +'", '+ IntToStr((N-1) mod 10) +' )' + CRLF;
          end;
        except
        end;
      finally
        Inc(N);
        Node := MenuNode.GetNextChild(Node);
      end;
    end;
    L := L + CRLF +'QM_MENU_END'+ CRLF + CRLF;
    mMenu.Lines.Add(L);
  end;
  //--------------------------------------
begin
  RTF.Lines.Clear;
  RTFChat.Lines.Clear;
  // de .txt in de resource-file laden in de memo
  LoadResource('MsgAltShort',mMenu);
  // doorloop alle items, op zoek naar menus
  for I:=0 to tvMenu.Items.Count-1 do begin
    Node := tvMenu.Items.Item[I];
    if not hasMenuData(Node,MenuData) then continue;
(*
    Node.StateIndex := -1;
    Node.ImageIndex := -1;
*)
    if MenuData.Menu<>'' then Build1Menu(Node);
  end;
end;





// file -> menu-tree
procedure TfSoundPacker.BuildMenu;
var L, I: integer;
    MenuLine, MenuName, MenuText, SubMenuName: string;
    MenuData: PWolfMenuData;
    TPN,TCN,Node: TTreeNode;
  //--------------------------------------
  function LastLine(LineNr: integer) : boolean;
  begin
    Result := (LineNr>mMenu.Lines.Count-1); //low(L)==0
  end;
  //--------------------------------------
  function IsEmptyLine(const MenuLine: string): boolean;
  begin
    // compleet lege regel?.. danwel slechts TAB/CRLF op de regel?
    Result := (length(trim(MenuLine))=0);
  end;
  //--------------------------------------
  function IsMenuStart(const MenuLine: string): boolean;
  begin
    Result := (Pos('QM_MENU_START(',trim(MenuLine))=1);
  end;
  //--------------------------------------
  function IsMenuItem(const MenuLine: string): boolean;
  var Count, P0,P1: integer;
      Found: boolean;
  begin
    //  QM_MENU_ITEM( 		"^w5. ^2Global",	close wm_quickmessageAlt; 	open wm_quickglobal_alt, 	"5", 4 )
    //	QM_MENU_ITEM_TEAM( 	"^w1. ^5Statements", 	close wm_quickmessageAlt; 	open wm_quickstatements_alt, 	"1", 0 )
    //
    // een menuItem bevat 4 parameters, waarvan de 2e parameter 2 statements bevat (gescheiden door een ";")
    //----------------------------------------------

    Result := (Pos('QM_MENU_ITEM',trim(MenuLine))=1) or (Pos('QM_MENU_ITEM_TEAM',trim(MenuLine))=1);
    //----------------------------------------------
    if Result then begin
      // tel het aantal comma's die de regel bevat
      Count := 0;
      P0 := 1;
      repeat
        P1 := PosEx(',',MenuLine,P0);
        Found := (P1<>0);
        if Found then Inc(Count);
        P0 := P1+1;
      until not Found;
      // tenminste 3 comma's moeten er zijn gevonden..
      Result := (Count>=3);
      //----------------------------------------------
      if Result then begin
        // tel het aantal keer het teken ";" voorkomt in de regel
        Count := 0;
        P0 := 1;
        repeat
          P1 := PosEx(';',MenuLine,P0);
          Found := (P1<>0);
          if Found then Inc(Count);
          P0 := P1+1;
        until not Found;
        // tenminste 1 ";" moet er in de regel staan..
        Result := (Count>=1);
        //----------------------------------------------
        if Result then begin
          // tel het aantal keer het teken " voorkomt in de regel
          Count := 0;
          P0 := 1;
          repeat
            P1 := PosEx('"',MenuLine,P0);
            Found := (P1<>0);
            if Found then Inc(Count);
            P0 := P1+1;
          until not Found;
          // er moeten precies 4 OF 6 " tekens in  de regel bestaan
          Result := ((Count=4) or (Count=6));
          //----------------------------------------------
          if Result then begin
            // Een "open" statement in de regel?..
            // ..dan moet er ook een "close" statement in de regel staan.
            if Pos('open',MenuLine)>0 then Result := (Pos('close',MenuLine)>0);
            //----------------------------------------------
            if Result then begin
              // Een "close" statement in de regel?..
              // ..dan moet er ook een ("open" OF "exec") statement in de regel staan.
              if Pos('close',MenuLine)>0 then
                Result := ((Pos('open',MenuLine)>0) or (Pos('exec',MenuLine)>0));
            end;
          end;
        end;
      end;
    end;
  end;
  //--------------------------------------
  function IsMenuEnd(const MenuLine: string): boolean;
  begin
    Result := (Pos('QM_MENU_END',trim(MenuLine))=1);
  end;
  //--------------------------------------
  function GetMenuName(const MenuStartLine: string): string;
  var P0,P1: integer;
  begin
    Result := '';
    if not IsMenuStart(MenuStartLine) then Exit;
    P0 := Pos('"',MenuStartLine)+1;
    P1 := PosEx('"',MenuStartLine,P0)-1;
    Result := Copy(MenuStartLine,P0,P1-P0+1);
  end;
  //--------------------------------------
  procedure MenuLineToItem(const MenuLine: string; MenuData: PWolfMenuData);
  begin
    if MenuData=nil then Exit;
    MenuData.Choice := Wolf.GetChoice(MenuLine);
    MenuData.Text := Wolf.GetText(MenuLine);
    MenuData.CleanText := Wolf.GetCleanText(MenuData.Text);
    MenuData.PlainText := Wolf.GetPlainText(MenuData.CleanText);
    MenuData.Cmd0 := Wolf.GetCmd0(MenuLine);
    MenuData.Cmd1 := Wolf.GetCmd1(MenuLine);
    MenuData.CmdLine := Wolf.GetCmdLine(MenuLine);
    MenuData.Menu := '';
    MenuData.SubMenu := Wolf.GetSubMenuName(MenuLine);
    MenuData.ExecVoice := Wolf.GetExecVoice(MenuLine);
    MenuData.ExecChat := Wolf.GetVoiceChat(MenuLine);
    MenuData.VoiceName := Wolf.GetVoiceName(MenuLine);
  end;
  //--------------------------------------
begin
  tvMenu.Items.Clear;
  L:=0;
  if not LastLine(L) then
    repeat

      MenuLine := mMenu.Lines.Strings[L];
      if IsMenuStart(MenuLine) then begin
        MenuName := GetMenuName(MenuLine);
        // een menu-record aanmaken
        new(MenuData);
        with MenuData^ do begin
          Choice     := chr(0);                // een menu heeft geen toets toegewezen
          Text       := '';                    // een menu heeft geen ItemText
          PlainText  := '';                    // een menu heeft geen plain ItemText
          CleanText  := '';                    // de tekst zonder choice & kleuren
          Cmd0       := '';                    // een menu heeft geen 1e commando
          Cmd1       := '';                    // een menu heeft geen 2e commando
          CmdLine    := '';                    // een menu heeft dus ook geen commando-regel
          Menu       := MenuName;              // de naam van het menu
          SubMenu    := '';                    // alleen menu-items hebben een submenu
          ExecVoice  := '';                    // alleen menu-items hebben een voice-command
          ExecChat   := '';
          VoiceName  := '';
        end;
        // het menu aan de tree toevoegen
        TPN := tvMenu.Items.AddObject(nil,MenuName,MenuData);
        // de menu-items inlezen
        repeat
          inc(L);
          if LastLine(L) then break;
          MenuLine := mMenu.Lines.Strings[L];
          if IsMenuItem(MenuLine) then begin
            // een menu-item omzetten van een regel tekst naar een data-record
            new(MenuData);
            MenuLineToItem(MenuLine,MenuData);
            // en aan het menu hangen
            Node := tvMenu.Items.AddChildObject(TPN,MenuData.PlainText,MenuData);
          end;
        until IsMenuEnd(MenuLine) or LastLine(L);
      end;

      inc(L);
    until LastLine(L);

  // submenu's indelen:
  for I:=0 to tvMenu.Items.Count-1 do begin
    Node := tvMenu.Items.Item[I];
    if not hasMenuData(Node,MenuData) then continue;
    //
    SubMenuName := MenuData.SubMenu;
    if SubMenuName<>'' then begin
      // child = node waar submenu naar verwijst
      if not FindMenuNode(SubMenuName,TCN) then continue;

      TCN.MoveTo(Node, naAddChild);
      if not TCN.HasAsParent(Node) then showMessage('De child-node kan geen parent verkrijgen..');
      TCN.Expand(false);
      // menu bestand opnieuw genereren
      RebuildMenuFile;
    end;
  end;

  // menu's inklappen
//  tvMenu.Items.Item[0].Expand(false);
  if FindMenuNode('wm_quickmessageAlt',Node) then begin
    Node.Collapse(true);
    Node.Expand(false);
  end;
end;







//------------------------------------------------------------------------------

procedure TfSoundPacker.MenuToRTF(MenuName: string);
var Node: TTreeNode;
begin
  if FindMenuNode(MenuName,Node) then
    MenuToRTF(Node);
end;

procedure TfSoundPacker.MenuToRTF(MenuNode: TTreeNode);
var MenuName, SubMenuName, s, trimmed: string;
    MenuData: PWolfMenuData;
    Node: TTreeNode;
    L: integer;
    Choice: Char;
    WolfColor: TColor;
  //-------------------------
  function Strip1stColoredText(var Text: string; var Color: TColor) : string;
  var Len, P0,P1: integer;
  begin
    Color := Wolf.GetWolfColor('w');
    Result := Text; //de gestripte text
    Len := Length(Text);
    if Len=0 then Exit;
    P0 := Pos('^',Text);
    if P0=0 then begin //niet gevonden??
      Text := ''; //result na strip
      Exit;
    end;
    if P0+2>Len then begin //past er wel een kleurcode in van 2 chars??
      Text := ''; //result na strip
      Exit;
    end;
    Color := Wolf.GetWolfColor(Text[P0+1]); //de kleur
    inc(P0,2); // teken na de ^ en de kleurcode
    P1 := PosEx('^',Text,P0);
    if P1=0 then begin
      // maar 1 ^ gevonden..
      Result := Copy(Text,P0,Len-1);
      Text := ''; //result na strip
    end else begin
      Result := Copy(Text,P0,P1-P0); //de gestripte text
      Text := Copy(Text,P1,Len-P1+1); //result na strip
    end;
  end;
  //-------------------------
begin
  CurrentMenu := '';
  RTF.HideSelection := true;
  RTF.Lines.Clear;
  if MenuNode=nil then Exit;
  if not hasMenuData(MenuNode,MenuData) then Exit;
  MenuName := MenuData.Menu;
  if MenuName='' then begin //Exit;
    SubMenuName := MenuData.SubMenu;
    if SubMenuName<>'' then begin
      if not FindMenuNode(SubMenuName,MenuNode) then Exit;
    end else
      Exit;
  end;
  CurrentMenu := MenuName;

  Node := MenuNode.getFirstChild;
  while Node<>nil do begin
    // regel plaintext toevoegen
    RTF.Lines.Add(''); //Node.Text;
    // de caret op de eerste positie van de laatste, zojuist toegevoegde, regel
    RTF.CaretPos := Point(1,RTF.Lines.Count-1);
    s := PWolfMenuData(Node.Data).CleanText;
    L := 0; // totale lengte van de plaintext

    // de keuze ervoor plakken
    Choice := PWolfMenuData(Node.Data).Choice;
    trimmed := Choice +'. ';
    Inc(L, Length(trimmed));
    RTF.SelAttributes.Color := Wolf.GetWolfColor('w');
    RTF.SelText := trimmed;
    RTF.SelLength := 0;
    RTF.CaretPos := Point(L+1,RTF.Lines.Count-1);
    //
    repeat
      trimmed := Strip1stColoredText(s,WolfColor);
      if trimmed='' then continue;
      Inc(L, Length(trimmed));
      RTF.SelAttributes.Color := WolfColor;
      RTF.SelText := trimmed;
      RTF.SelLength := 0;
      RTF.CaretPos := Point(L+1,RTF.Lines.Count-1);
    until s='';
    Node := MenuNode.GetNextChild(Node);
  end;
end;


//------------------------------------------------------------------------------


// ongebruikte waves afbeelden in een andere kleur.
procedure TfSoundPacker.tvMenuCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var MenuData: PWolfMenuData;
    Color: TColor;
begin
  Color := clWhite;
  // een ongebruikte wave in een andere kleur tekenen..
  if Node=nil then Exit;
  if Node.Data=nil then Exit;
  // is het een sibling-node van de root-node??
  if Node.Level <> 0 then Exit;
  // is het een menu-item dat een ongebruikte wave bevat??
  if not hasMenuData(Node,MenuData) then Exit;
  if not ((MenuData.Menu='') and (MenuData.SubMenu='')) then Exit;
  // tekenen..
  if (MenuData.VoiceName<>'') then Color := $00C082FF //clMoneyGreen
                              else Color := clSkyBlue;
  (Sender as TCustomTreeView).Canvas.Brush.Color := Color;
end;


// een melding op de statusbalk, over wat je klikt op het menu.
procedure TfSoundPacker.tvMenuClick(Sender: TObject);
var MenuName,SubMenuName,VoiceName: string;
    I: integer;
    LI: TListItem;
    SoundData: PWolfSoundData;
    MenuData: PWolfMenuData;
begin
  RTFChat.Lines.Clear;
  if tvMenu.Selected=nil then Exit;
  // menu afbeelden in RTF
  MenuToRTF(tvMenu.Selected);
  // menudata afbeelden in statusbalk
  if not hasMenuData(tvMenu.Selected,MenuData) then Exit;

  MenuName := MenuData.Menu;
  if MenuName<>'' then begin
    // gefilterd: een menu
    SetStatusBar('Menu',MenuName);
    Exit;
  end;
  SubMenuName := MenuData.SubMenu;
  if SubMenuName<>'' then begin
    // gefilterd: een menuitem dat verwijst naar een submenu
    SetStatusBar('SubMenu',SubMenuName);
    Exit;
  end;
  // gefilterd: een los menuitem
  SetStatusBar('Item',MenuData.ExecChat);

  // de chattekst
  VoiceName := MenuData.VoiceName;
  if VoiceName='' then Exit;
  // sound erbij zoeken..
  if FindSoundData(VoiceName,SoundData) then
    RTFChat.Lines.Add(SoundData.ChatText);
end;

// de evt. onderliggende wave afspelen
procedure TfSoundPacker.tvMenuDblClick(Sender: TObject);
var P0, I: integer;
    VoiceName: string;
    LI: TListItem;
    SoundData: PWolfSoundData;
    MenuData: PWolfMenuData;
begin
  if tvMenu.Selected=nil then Exit;
  if not hasMenuData(tvMenu.Selected,MenuData) then Exit;

  VoiceName := MenuData.VoiceName;
  if VoiceName='' then Exit;
  // zoek de wave op
  if FindSoundData(VoiceName,SoundData) then
    Wave.Play(SoundData.WaveFilePath);
end;


//------------------------------------------------------------------------------

(*
procedure TfSoundPacker.bMenuMoveItemClick(Sender: TObject);
var I: integer;
begin
  SelectedNode := nil;
  // geen menus selecteren
  if tvMenu.Selected=nil then begin
    showmessage('Selecteer eerst het te verplaatsen MENU-ITEM');
    Exit;
  end else begin
    if PWolfMenuData(tvMenu.Selected.Data).Menu<>'' then begin
      showmessage('Selecteer een te verplaatsen MENU-ITEM ipv. een MENU');
      Exit;
    end;
  end;
  SelectedNode := tvMenu.Selected;
  gbMenuMoveItem.Color := cl3DDkShadow;
  tvMenu.SetFocus;

  // menu bestand opnieuw genereren
  RebuildMenuFile;
end;

procedure TfSoundPacker.bMenuLinkItemClick(Sender: TObject);
var TPN,TCN: TTreeNode;
begin
  if SelectedNode=nil then begin
    showmessage('Selecteer eerst het te verplaatsen MENU-ITEM');
    Exit;
  end;
  // alleen menus selecteren
  if tvMenu.Selected=nil then begin
    showmessage('Selecteer het MENU waaraan het MENU-ITEM moet hangen');
    Exit;
  end else begin
    if PWolfMenuData(tvMenu.Selected.Data).Menu='' then begin
      showmessage('Selecteer een MENU waaraan het MENU-ITEM moet hangen');
      Exit;
    end;
  end;
  TPN := tvMenu.Selected;
  TCN := SelectedNode;
  TCN.MoveTo(TPN,naAddChild);
  SelectedNode := nil;
  gbMenuMoveItem.Color := clBtnFace;
  tvMenu.Refresh;
  tvMenu.SetFocus;

  // menu bestand opnieuw genereren
  RebuildMenuFile;
end;
*)




//------------------------------------------------------------------------------


procedure TfSoundPacker.tvMenuStartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if tvMenu.Selected=nil then Exit;
  DraggingNode := tvMenu.Selected;
  DroppedOnNode := nil;
end;

procedure TfSoundPacker.tvMenuDragOver(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
var isItem, isMenu, isSubMenu,
    isItem2, isMenu2, isSubMenu2: boolean;
    HoverNode: TTreeNode;
begin
  Accept := false;
  DroppedOnNode := nil;

  if DraggingNode=nil then Exit;
  if DraggingNode.Data=nil then Exit;

  isMenu := (PWolfMenuData(DraggingNode.Data).Menu<>'');
  isSubMenu := (PWolfMenuData(DraggingNode.Data).SubMenu<>'');
  isItem := not (isMenu or isSubMenu);

  if isMenu then Exit;
  if isSubMenu then
    if isDefSubMenu(DraggingNode) then Exit;
  if isItem then
    if IsDefMenuItem(DraggingNode) then Exit;

  HoverNode := tvMenu.GetNodeAt(X,Y);
  if HoverNode=nil then Exit;
  if HoverNode.Data=nil then Exit;
  isMenu2 := (PWolfMenuData(HoverNode.Data).Menu<>'');
  isSubMenu2 := (PWolfMenuData(HoverNode.Data).SubMenu<>'');
  isItem2 := not (isMenu2 or isSubMenu2);

  // alleen naar een menu slepen:
  //     naar een standaard menu-node genaamd: UJE_Prefix
  // OF  naar een non-standaard menu-node met een naam die niet begint met UJE_Prefix
  if isMenu2 then
    if isDefMenu(HoverNode) then begin
      if PWolfMenuData(HoverNode.Data).Menu<>UJE_Prefix then Exit;
    end else begin
      if Pos(UJE_Prefix,PWolfMenuData(HoverNode.Data).Menu)<>1 then Exit;
    end;
  // alleen slepen naar een submenu:
  //     naar een non-standaard submenu-node
  if isSubMenu2 then
    if isDefSubMenu(HoverNode) then Exit;
  if isItem2 then
    if IsDefMenuItem(HoverNode) then Exit;

  if DraggingNode = HoverNode then Exit;

  //
  // DraggingNode == Item ??
  //   DroppedOnNode == Item ??
  //     DraggingNode.MoveTo(DroppedOnNode, naInsert);
  //   DroppedOnNode == SubMenu ??
  //     DraggingNode.MoveTo(DroppedOnNode, naInsert);
  //   DroppedOnNode == Menu ??
  //     DraggingNode.MoveTo(DroppedOnNode, naAddChild);
  //
  //
  // DraggingNode == SubMenu ??
  //   DroppedOnNode == Item ??
  //     DraggingNode.MoveTo(DroppedOnNode, naInsert);
  //   DroppedOnNode == SubMenu ??
  //     DraggingNode.MoveTo(DroppedOnNode, naInsert);
  //   DroppedOnNode == Menu ??
  //     DraggingNode.MoveTo(DroppedOnNode, naAddChild);
  //
  //
  // DraggingNode == Menu ??
  //   DroppedOnNode == Item ??
  //     nog niet.
  //   DroppedOnNode == SubMenu ??
  //     kan niet.
  //   DroppedOnNode == Menu ??
  //     mag niet.
  //
  if isItem or isSubMenu then begin
    if isItem2 or isSubMenu2 then begin
      if GetNrOfChildren(HoverNode.Parent)<10 then begin
        DroppedOnNode := HoverNode;
        NodeAttachMode := naInsert;
        Accept := true;
      end;
    end else
    if isMenu2 then begin
      if GetNrOfChildren(HoverNode)<10 then begin
        DroppedOnNode := HoverNode;
        NodeAttachMode := naAddChild;
        Accept := true;
      end;
    end;
  end else
  if isMenu then begin
    //
  end;
end;

procedure TfSoundPacker.tvMenuDragDrop(Sender, Source: TObject; X,Y: Integer);
var AttachMode: TNodeAttachMode;
    HT: THitTests;
begin
  if DraggingNode=nil then Exit;
  if DroppedOnNode=nil then Exit;
  //HT := tvMenu.GetHitTestInfoAt(X,Y);
  //DroppedOnNode := tvMenu.GetNodeAt(X,Y);
  //
  DraggingNode.MoveTo(DroppedOnNode, NodeAttachMode);
(*
  if (HT - [htOnItem, htOnIcon, htNowhere, htOnIndent] <> HT) then
  begin
    if (htOnItem in HT) or (htOnIcon in HT) then AttachMode := naAddChild
    else if htNowhere in HT then AttachMode := naAdd

    else if htOnIndent in HT then AttachMode := naInsert;
    TreeView1.Selected.MoveTo(AnItem, AttachMode);
  end;
*)
  //
  DraggingNode := nil;
  DroppedOnNode := nil;

  // menu bestand opnieuw genereren
  RebuildMenuFile;
end;



//------------------------------------------------------------------------------


procedure TfSoundPacker.OptimizeMenu;
var Node: TTreeNode;
    MenuData: PWolfMenuData;
    I,J: integer;
    LI: TListItem;
    Found: boolean;
begin
  // ongebruikte menu-entries verwijderen uit de menu-treeview.
  I:=0;
  while I<tvMenu.Items.Count do begin
    Node := tvMenu.Items.Item[I];
    inc(I);

    if Node=nil then continue; // de node moet wel bestaan..
    if Node.Level<>0 then continue; // moet level 0 hebben..
    if Node.getFirstChild<>nil then continue; //mag geen children hebben..
    if Node.Data=nil then continue; // moet menu-data hebben..
    if not hasMenuData(Node,MenuData) then continue;
    if (MenuData.Menu<>'') or (MenuData.SubMenu<>'') then continue;
    // een item gevonden..
    if (MenuData.VoiceName='') then continue; // mag geen menu of submenu zijn
    // Een losse wave gevonden..

    // Bestaat de wave nog in de sounds-list??
    if not FindSoundItem(MenuData.VoiceName,LI) then begin
      // node wissen,
      DeleteNode(Node);
      // menu-file opnieuw genereren
      RebuildMenuFile;
      // en loop opnieuw beginnen
      I := 0;
    end;
  end;
end;



procedure TfSoundPacker.bSoundPackCreateClick(Sender: TObject);
var I: integer;
    LI: TListItem;
    SoundData: PWolfSoundData;
    Steps, Step: integer;
{!  M: TMemo;}
begin
  // progress:
  //   werkmap
  //   wave bestanden copiëren
  //   4 text bestanden saven
  //   zippen
  Steps := 1 + lvSounds.Items.Count + 4;
  if cbOptiesPK3.Checked then Inc(Steps);
  Step := 0;
  StatusProgress();

  // de werkmap inrichten
  RemoveDir(WorkDir,true,'');
  if not CreateWorkDir(WorkDir) then begin
    showMessage('Error creating WorkDir: '+ WorkDir);
    Exit;
  end;
  // progress
  Inc(Step);  StatusProgress(Step/Steps);

(*
  // ongebruikte menu-entries verwijderen uit de menu-treeview.
  // losse geluiden mag wel...ie kunnen mbv. een vsay-commando worden gebruikt.
  OptimizeMenu;

  tegenwoordig komen ze niet in de menu-memo terrecht....
*)
  // de geluiden/wave-bestanden overnemen naar de werkmap
  for I:=0 to lvSounds.Items.Count-1 do begin
    // progress
    Inc(Step);  StatusProgress(Step/Steps);
    //
    LI := lvSounds.Items.Item[I];
    if not hasSoundData(LI,SoundData) then continue;
    // wave overnemen naar de juiste sound-map
    if not FileExists(SoundData.WaveFilePath) then begin
      showMessage('Error: Cannot find the .wav'+#13#10+SoundData.WaveFilePath);
      continue;
    end else
    if not DirectoryExists(ExtractFilePath(SoundData.DstFilePath)) then begin
      showMessage('Error: Cannot find destination-folder for .wav'+#13#10+ExtractFilePath(SoundData.DstFilePath));
      continue;
    end else
    if not CopyFile_(SoundData.WaveFilePath,SoundData.DstFilePath) then begin
//    if not CopyFile(PChar(SoundData.WaveFilePath),PChar(SoundData.DstFilePath),false) then begin
      showMessage('Error: Cannot copt the .wav'+#13#10+SoundData.DstFilePath);
      continue;
    end;
  end;

  // de memo-inhouden opslaan als tekst-bestanden in de werkmap
  mAllies.Lines.SaveToFile(ScriptsDir+'\wm_allies_chat.voice');
  Inc(Step);  StatusProgress(Step/Steps);  // progress
  mAxis.Lines.SaveToFile(ScriptsDir+'\wm_axis_chat.voice');
  Inc(Step);  StatusProgress(Step/Steps);  // progress
  mMenu.Lines.SaveToFile(UIDir+'\wm_quickmessageAlt.menu');
  Inc(Step);  StatusProgress(Step/Steps);  // progress

{!  M := TMemo.Create(nil);}
  try
    LoadResource('MsgMenu',M);
    try
      M.Lines.SaveToFile(UIDir+'\wm_quickmessage.menu');
    except
      on E: Exception do showMessage('Error: '+ E.Message);
    else
      showMessage('Error writing: '+ UIDir+'\wm_quickmessage.menu');
    end;
  finally
{!    M.Free;}
  end;
  Inc(Step);  StatusProgress(Step/Steps);  // progress

  // zippen / PK3-en
  if cbOptiesPK3.Checked then begin
    if not CreateDir(SoundPackPath) then Exit;
    (* Zip met delphi-control ZipForge *)
    with ZipForge do begin
      // Create a new archive file
      FileName := SoundPackPath+'\'+FileName_SoundPack;
      OpenArchive(fmCreate);
      // Add all files and directories from 'SOURCE_FOLDER' to the archive
      BaseDir := WorkDir;
      AddFiles('*.*');
      // Close the archive
      CloseArchive;
      //
      SetStatusBar('SoundPack',FileName);
    end;
    // progress
    Inc(Step);  StatusProgress(Step/Steps);
  end;

  // eventueel de werkmap opschonen/verwijderen..
  if cbWorkDirCleanUp.Checked then
    RemoveDir(WorkDir,true,'');

  StatusProgress();

  // open de map
  if cbOpenFolder.Checked then
    ShellExecute(Handle, 'explore', PChar(SoundPackPath), nil, nil, SW_SHOW);
end;

procedure TfSoundPacker.bSoundPackCreateMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  pSoundPackBottom.SetFocus;
end;

procedure TfSoundPacker.bSoundPackLoadClick(Sender: TObject);
begin
(*
  // de soundpack kiezen
  OpenDialog.InitialDir := AppPath;
  if not OpenDialog.Execute then Exit;

  // de werkmap opschonen
  RemoveDir(WorkDir,true,'');

{  // de soundpack uitpakken
  with ZipForge do begin
    // Create a new archive file
    FileName := OpenDialog.FileName;
    OpenArchive(fmCreate);
    // Add all files and directories from 'SOURCE_FOLDER' to the archive
    BaseDir := WorkDir;
    AddFiles('*.*');
    // Close the archive
    CloseArchive;
    //
    SetStatusBar('SoundPack',FileName);
  end;}


  // de soundpack bestanden voor sounds & menus naar memos
  mAllies.Lines.LoadFromFile('');
  mAxis.Lines.LoadFromFile('');
  mMenu.Lines.LoadFromFile('');

  // menu-tree genereren
  BuildMenu;
*)
end;


//------------------------------------------------------------------------------


procedure TfSoundPacker.ActionSoundDeleteExecute(Sender: TObject);
var Index: integer;
    LI, delLI: TListItem;
    SoundData: PWolfSoundData;
    Node: TTreeNode;
begin
  ClearStatusBar;
  if lvSounds.Selected=nil then Exit;

  LI := lvSounds.Selected;
  if IsSubSound(LI.Index) then
    DeleteSubSound(LI)
  else begin
    // eerst alle subsounds wissen..
    if not IsSingleSound(LI.Index) then begin
      Index := LI.Index;
      // van achter naar voren verwijderen..
      repeat
        inc(Index);
      until IsLastSubSound(Index);
      repeat
        if IsSubSound(Index) then begin
          delLI := lvSounds.Items.Item[Index];
          DeleteSubSound(delLI);
        end;
        dec(Index);
      until Index=LI.Index;
    end;
    // dan de sound zelf
    DeleteSound(LI);
  end;

  lvSounds.SetFocus;
  // de sounds bestanden opnieuw genereren
  RebuildSoundFiles;
  // menu bestand opnieuw genereren
  RebuildMenuFile;
end;


procedure TfSoundPacker.ActionSoundAddExecute(Sender: TObject);
var LI: TListItem;
    SoundData, SD: PWolfSoundData;
begin
  ClearStatusBar;

  fSelectWave.InitialSoundName := '';
  fSelectWave.InitialMenuText := '';
  fSelectWave.Tag := lvSounds.Items.Count;

  if fSelectWave.ShowModal = 1 then begin //OK
    if fSelectWave.OpenDialog.FileName='' then begin
      //Memo.Lines.Add('!'+TAB+'Er is geen WAVE bestand gekozen.');
      Exit;
    end;

    // controleer of een sound met deze naam nog niet bestaat..
    if FindSoundData(fSelectWave.eSoundName.Text, SD) then begin
      showmessage('A SOUND with this name already exists: '+ fSelectWave.eSoundName.Text);
      Exit;
    end;

    // een listitem toevoegen
    LI := lvSounds.Items.Add;
    if LI=nil then Exit;

    // SoundData
    new(SoundData);
    with SoundData^ do begin
      Name := fSelectWave.eSoundName.Text;

      WaveFilePath := fSelectWave.OpenDialog.FileName;
      WaveFileName := ExtractFileName(fSelectWave.OpenDialog.FileName);
      DstFilePath := '';

      ChatText := fSelectWave.eText.Text;
      PlainChatText := Wolf.TrimWolfColors(fSelectWave.eText.Text);

      MenuText := fSelectWave.eMenuText.Text;
      CleanMenuText := Wolf.GetCleanText(MenuText);
      PlainMenuText := Wolf.GetPlainText(CleanMenuText);

      Team := fSelectWave.Team;
    end;
    LI.Data := SoundData;
    FillListItem(LI);

    // sounds bestanden genereren.
    RebuildSoundFiles;

    // sound toevoegen aan het menu.
    SoundToMenu(LI);
  end;
end;

procedure TfSoundPacker.ActionAddSubSoundExecute(Sender: TObject);
var LI: TListItem;
    SoundData, SD: PWolfSoundData;
    index: integer;
    SoundName: string;
    L0,L1: integer;
    InsertIndex: integer;
begin
  ClearStatusBar;
  if lvSounds.Selected = nil then Exit;

  index := lvSounds.Selected.Index;
  InsertIndex := index;
  if IsParentSound(index) then
    LI := lvSounds.Selected
  else
    LI := lvSounds.Items.Item[GetParentItemIndex(index)];
  if LI.Data=nil then Exit;
  SoundName := PWolfSoundData(LI.Data).Name;
  L0 := Length(Prefix);
  L1 := Length(SoundName)-L0;
  fSelectWave.InitialSoundName := Copy(SoundName, L0+1, L1);
  {fSelectWave.Tag := lvSounds.Items.Count;}
  fSelectWave.InitialMenuText := PWolfSoundData(LI.Data).MenuText;

  if fSelectWave.ShowModal = 1 then begin //OK
    if fSelectWave.OpenDialog.FileName='' then begin
      //Memo.Lines.Add('!'+TAB+'Er is geen WAVE bestand gekozen.');
      Exit;
    end;

    // een listitem invoegen
    LI := lvSounds.Items.Insert(InsertIndex+1);
    if LI=nil then Exit;

    // SoundData
    new(SoundData);
    with SoundData^ do begin
      Name := '';
      WaveFilePath := fSelectWave.OpenDialog.FileName;
      WaveFileName := ExtractFileName(fSelectWave.OpenDialog.FileName);
      ChatText := fSelectWave.eText.Text;
      PlainChatText := Wolf.TrimWolfColors(fSelectWave.eText.Text);
      Team := [];
    end;
    LI.Data := SoundData;
    FillListItem(LI);

    // sounds bestanden genereren.
    RebuildSoundFiles;

    // sound toevoegen aan het menu.
    SoundToMenu(LI);
  end;
end;




procedure TfSoundPacker.ActionSoundEditExecute(Sender: TObject);
var SoundData: PWolfSoundData;
begin
  ClearStatusBar;
  if lvSounds.Selected = nil then Exit;

  SoundData := PWolfSoundData(lvSounds.Selected.Data);

  
end;





procedure TfSoundPacker.ActionMenuInsertSubMenuExecute(Sender: TObject);
var MenuName, SubMenuName, ItemText, ParentMenuName: string;
    MenuData: PWolfMenuData;
    TPN,TCN, Node: TTreeNode;
begin
  ClearStatusBar;
  if tvMenu.Selected=nil then begin
    showmessage('First select the MENU-ITEM to be replaced by the submenu');
    Exit;
  end;
  if not hasMenuData(tvMenu.Selected,MenuData) then Exit;

  MenuName := MenuData.Menu;
  SubMenuName := MenuData.SubMenu;

  if not IsMenuItem(tvMenu.Selected) then Exit;
  if IsDefMenuItem(tvMenu.Selected) then Exit;

  // vraag de tekst voor het nieuwe menu-item
  ItemText := InputBox('MENU-ITEM','The text for the new, replacement menu-item:', '');
  if ItemText='' then Exit;

  // maak een nieuwe submenu-naam
  MenuName := UJE_Prefix+ IntToStr(MenuNumber);
  Inc(MenuNumber);

  // hang het vervangende item in het menu op de plek van TV.Selected
  // Aan dit item komt het nieuwe submenu te hangen..
  MenuData := tvMenu.Selected.Parent.Data;
  ParentMenuName := MenuData.Menu;
  if ParentMenuName='' then Exit;

  new(MenuData);
  with MenuData^ do begin
    Choice := chr(0); //later hernummeren..
    Text := ItemText;
    CleanText := Wolf.GetCleanText(MenuData.Text);
    PlainText := Wolf.GetPlainText(MenuData.CleanText);
    Cmd0 := 'close '+ ParentMenuName;
    Cmd1 := 'open '+ MenuName;
    CmdLine := TAB+ MenuData.Cmd0 +';'+TAB+ MenuData.Cmd1;
    Menu := '';
    SubMenu := MenuName;
    ExecVoice := '';
    ExecChat := '';
    VoiceName := '';
  end;
  TPN := tvMenu.Items.InsertObject(tvMenu.Selected,ItemText,MenuData);

  // Een submenu tussenvoegen
  new(MenuData);
  with MenuData^ do begin
    Choice     := chr(0);                // een menu heeft geen toets toegewezen
    Text       := '';                    // een menu heeft geen ItemText
    PlainText  := '';                    // een menu heeft geen plain ItemText
    Cmd0       := '';                    // een menu heeft geen 1e commando
    Cmd1       := '';                    // een menu heeft geen 2e commando
    CmdLine    := '';                    // een menu heeft dus ook geen commando-regel
    Menu       := MenuName;              // de naam van het menu
    SubMenu    := '';                    // alleen menu-items hebben een submenu
    ExecVoice  := '';                    // alleen menu-items hebben een voice-command
    ExecChat   := '';
    VoiceName  := '';
  end;
  TCN := tvMenu.Items.AddChildObject(TPN,MenuName,MenuData);

  // TV.Selected komt te hangen aan het nieuwe submenu
  tvMenu.Selected.MoveTo(TCN,naAddChild);

  tvMenu.SetFocus;

  // menu bestand opnieuw genereren
  RebuildMenuFile;
end;

procedure TfSoundPacker.ActionMenuDeleteExecute(Sender: TObject);
var MenuData: PWolfMenuData;
    MenuName, SubMenuName: string;
    MenuNode, Node, selNode: TTreeNode;
begin
  ClearStatusBar;
  // menu/submenu/item wissen??
  if tvMenu.Selected=nil then Exit;
  // mag dit menu/submenu/item weg??
  if not hasMenuData(tvMenu.Selected,MenuData) then Exit;

  MenuName := MenuData.Menu;
  SubMenuName := MenuData.SubMenu;

  if MenuName<>'' then Exit; // geen menu's wissen

  // Het submenu 'wm_quickuje'n mag niet worden gewist..
  if IsDefSubMenu(tvMenu.Selected) then begin
    showmessage('This SUBMENU cannot be deleted');
    Exit;
  end;

  if SubMenuName<>'' then begin // een submenu??
    // Alleen wissen als er maar 1 (of minder) items in het (sub)menu hangen
    // Het onderliggende menu opvragen.
    selNode := tvMenu.Selected;
    MenuNode := tvMenu.Selected.getFirstChild;
    if MenuNode=nil then begin
      // Geen menu gevonden; tvMenu.Selected mag weg..
      DeleteNode(selNode);
    end else begin
      // MenuNode = menu(MenuName)
      // MenuNode verwijst dus naar een MENU.
      MenuName := PWolfMenuData(MenuNode.Data).Menu;
      if MenuName='' then Exit;
      if IsDefMenu(MenuNode) then begin
        showmessage('This SUBMENU cannot be deleted');
        Exit;
      end;
      // Het menu mag maar 1 (of minder) items bevatten
      Node := MenuNode.getFirstChild;
      if Node=nil then begin
        // MenuNode heeft geen items, en mag weg..
        DeleteNode(MenuNode);
        DeleteNode(selNode);
      end else begin
        if MenuNode.GetNextChild(Node)<>nil then begin
          showmessage('The MENU may consist of only 1 item');
          Exit;
        end;
        // Node komt in de plaats van tvMenu.Selected
        // MenuNode mag weg.
        // tvMenu.Selected gaat ook weg.
        Node.MoveTo(tvMenu.Selected, naInsert);
        DeleteNode(MenuNode);
        DeleteNode(selNode);
        tvMenu.Select(Node);
      end;
    end;
  end else begin
    // igv. een item, de naam controleren..
    // de node niet verwijderen, maar verplaatsen naar .Level 0
    // met de .Menu & .SubMenu eigenschappen gewist..
    if Pos('uje_',MenuData.VoiceName)<>1 then Exit;
    // ontkoppel het item uit de tree..
    MenuData.Menu := '';
    MenuData.SubMenu := '';
    if FindMenuNode('wm_quickmessageAlt',Node) then
      tvMenu.Selected.MoveTo(Node,naAdd);
  end;

  tvMenu.SetFocus;
  // menu bestand opnieuw genereren
  RebuildMenuFile;
end;





procedure TfSoundPacker.lvSoundsContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var P: TPoint;
begin
  P := ClientToScreen(MousePos);
  PopupMenu.Popup(P.X+16,P.Y+16);
end;

end.
