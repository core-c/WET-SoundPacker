unit uWaveDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls,
  uWolf, ComCtrls, ExtCtrls;

const
  Prefix = 'uje_';


type
  TfSelectWave = class(TForm)
    pBottom: TPanel;
    pTop: TPanel;
    PageControl: TPageControl;
    TabSheetSound: TTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    lInfo: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    eSoundName: TEdit;
    bSelectWave: TButton;
    eText: TEdit;
    gbTeam: TGroupBox;
    cbAxis: TCheckBox;
    cbAllies: TCheckBox;
    cbFireTeam: TCheckBox;
    cbGlobal: TCheckBox;
    eWaveFile: TEdit;
    eMenuText: TEdit;
    OpenDialog: TOpenDialog;
    gbSound: TGroupBox;
    bAfspelen: TButton;
    gbKnoppen: TGroupBox;
    bCancel: TButton;
    bOK: TButton;
    procedure FormShow(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure bSelectWaveClick(Sender: TObject);
    procedure cbAxisClick(Sender: TObject);
    procedure cbAlliesClick(Sender: TObject);
    procedure cbFireTeamClick(Sender: TObject);
    procedure cbGlobalClick(Sender: TObject);
    procedure bAfspelenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CheckTeams(var cb: TCheckBox);
  public
    InitialSoundName,
    InitialMenuText: string;
    Team: TWolfTeams;
    SoundData: PWolfSoundData;
  end;

var
  fSelectWave: TfSelectWave;

implementation
uses uWave;
{$R *.dfm}

// properties:
// InitialSound    = de naam van een subsound.
//                   Deze naam is gelijk aan de "parent" van de subsound,
//                   en kan niet worden veranderd.
// InitialMenuText = De tekst voor het uiteindelijke menu-item waartoe deze Sound
//                   wordt toegekend.
// Tag             = Het volgnummer van de sound.
//                   Dit nummer is het laatste deel van de soundName,
//                   en wordt slechts als hulpje aangeboden aan de gebruiker.
//                   De gebruiker kan de soundName gewoon aanpassen (alleen laatste deel ervan).
//                   De uiteindelijke naam van de Sound, begint altijd met de Prefix 'uje_'
//

procedure TfSelectWave.FormCreate(Sender: TObject);
begin
  InitialSoundName := '';
  InitialMenuText := '';
  Tag := 0;
end;

procedure TfSelectWave.FormShow(Sender: TObject);
begin
  if InitialSoundName<>'' then begin
    eSoundName.Text := InitialSoundName;
    eSoundName.ReadOnly := true;
    eSoundName.Cursor := crArrow;
    eSoundName.Color := clSilver;
    eMenuText.ReadOnly := true;
    eMenuText.Cursor := crArrow;
    eMenuText.Color := clSilver;
    eMenuText.Text := InitialMenuText;
    Label5.Visible := false;
    Label6.Visible := false;
    //Label1.Visible := false;
    //eText.Visible := false;
    gbTeam.Visible := false;
  end else begin
    eSoundName.Text := {Prefix +} IntToStr(Tag);
    eSoundName.ReadOnly := false;
    eSoundName.Cursor := crDefault;
    eSoundName.Color := clWindow;
    eMenuText.ReadOnly := false;
    eMenuText.Cursor := crDefault;
    eMenuText.Color := clWindow;
    eMenuText.Text := '';
    Label5.Visible := true;
    Label6.Visible := true;
    //Label1.Visible := true;
    //eText.Visible := true;
    gbTeam.Visible := true;
  end;
  eWaveFile.Text := '';
  eText.Text := '';
  lInfo.Caption := '';
  bAfspelen.Enabled := false;

  Team := [GlobalTeam];
  cbAxis.Checked := false;
  cbAllies.Checked := false;
  cbFireteam.Checked := false;
  cbGlobal.Checked := true;
end;

procedure TfSelectWave.bOKClick(Sender: TObject);
begin
  {if InitialSoundName<>'' then}
    if Pos(Prefix,eSoundName.Text)<>1 then eSoundName.Text := Prefix + eSoundName.Text;
  InitialSoundName := '';
  InitialMenuText := '';
  if (eWaveFile.Text='') or (eMenuText.Text='') or (Pos(' ',eSoundName.Text)>0) then begin
    // afbreken..
    eSoundName.Text := '';
    ModalResult := 2;
  end else begin
    // controleer de team-checkboxes
    if not (cbAllies.Checked or cbAxis.Checked or cbFireTeam.Checked or cbGlobal.Checked) then begin
      showMessage('Select a team!');
      Exit;
    end;
    eWaveFile.Text := '';
    ModalResult := 1;
  end;
end;

procedure TfSelectWave.bCancelClick(Sender: TObject);
begin
  // afbreken..
  InitialSoundName := '';
  InitialMenuText := '';
  eWaveFile.Text := '';
  eMenuText.Text := '';
  eText.Text := '';
  lInfo.Caption := '';
  bAfspelen.Enabled := false;
  ModalResult := 2;
end;

procedure TfSelectWave.bSelectWaveClick(Sender: TObject);
begin
  eWaveFile.Text := '';
  lInfo.Caption := '';
  bAfspelen.Enabled := false;
  if not OpenDialog.Execute then Exit;
  // test op spaties in de naam
  if Pos(' ',ExtractFilename(OpenDialog.FileName))>0 then begin
    showMessage('The name of a .wav may not contain spaces!');
    Exit;
  end;
  // test op geldigheid van de wave
  if not Wave.Valid(OpenDialog.FileName) then begin
    showMessage('The .wav is not valid!'+#13#10+'This .wav is: '+Wave.GetInfoStr(OpenDialog.FileName));
    Exit;
  end;
  // test op geldigheid van de Wolf-wave
  if not Wave.ValidWolfWave(OpenDialog.FileName) then begin
    showMessage('This .wav is not suitable for a Wolfenstein-soundpack!'+#13#10+'This .wav is: '+Wave.GetInfoStr(OpenDialog.FileName));
    Exit;
  end;
  //
  eWaveFile.Text := OpenDialog.FileName;
  lInfo.Caption := Wave.GetInfoStr(OpenDialog.FileName,5); //incl. duration
  bAfspelen.Enabled := true;
end;

procedure TfSelectWave.bAfspelenClick(Sender: TObject);
begin
  if eWaveFile.Text='' then Exit;
  Wave.Play(eWaveFile.Text);
end;






procedure TfSelectWave.CheckTeams(var cb: TCheckBox);
begin
  if not cb.Checked then Exit;
  if cb.Name = 'cbAllies' then begin
    cbFireTeam.Checked := false;
    cbGlobal.Checked := false;
  end else
  if cb.Name = 'cbAxis' then begin
    cbFireTeam.Checked := false;
    cbGlobal.Checked := false;
  end else
  if cb.Name = 'cbFireTeam' then begin
    cbAllies.Checked := false;
    cbAxis.Checked := false;
    cbGlobal.Checked := false;
  end else
  if cb.Name = 'cbGlobal' then begin
    cbAllies.Checked := false;
    cbAxis.Checked := false;
    cbFireTeam.Checked := false;
  end;
  //
  Team := [];
  if cbAxis.Checked then Team := Team + [AxisTeam];
  if cbAllies.Checked then Team := Team + [AlliesTeam];
  if cbFireTeam.Checked then Team := Team + [FireTeam];
  if cbGlobal.Checked then Team := Team + [GlobalTeam];
end;

procedure TfSelectWave.cbAxisClick(Sender: TObject);
begin
  CheckTeams(cbAxis);
end;

procedure TfSelectWave.cbAlliesClick(Sender: TObject);
begin
  CheckTeams(cbAllies);
end;

procedure TfSelectWave.cbFireTeamClick(Sender: TObject);
begin
  CheckTeams(cbFireTeam);
end;

procedure TfSelectWave.cbGlobalClick(Sender: TObject);
begin
  CheckTeams(cbGlobal);
end;




end.
