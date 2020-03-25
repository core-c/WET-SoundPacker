object fSelectWave: TfSelectWave
  Left = 255
  Top = 131
  BorderStyle = bsSingle
  Caption = 'Select Wave'
  ClientHeight = 310
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    000001000200101010000000000028010000260000002020100000000000E802
    00004E0100002800000010000000200000000100040000000000C00000000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000999
    0009900999999909909999099990900090900909000090009000090900009000
    9000090999909000900009090000900090000909000090009000090999990000
    0000000000000000000009000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
    0000FFFF00008E6000002421000075AF000077AF000077A1000077AF000077AF
    000077A00000FFFF0000FFBF0000280000002000000040000000010004000000
    0000800200000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000099900000000000000000
    0000000009999000000000000000000000000000000990009999990009999990
    0999999990099009900009909900009909000000000990090000009090000009
    0900000000099009000000909000000909000000000990090000009000000009
    0900000000099009000000900000000909000000000990090000009000000009
    0900000000099009000000900000000909999990000990090000009000000009
    0900000000099009000000900000000909000000000990090000009000000009
    0900000000099009000000900000000909000000000990090000009000000009
    0999999990099000000000000000000000000000000999900000000000000000
    0000000009990000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FFF
    FFF87FFFFFFE703818066793CBFE6FD7EBFE6FD7EBFE6FDFEBFE6FDFEBFE6FDF
    EBFE6FDFE81E6FDFEBFE6FDFEBFE6FDFEBFE6FDFEBFE6FDFE8067FFFFFFE1FFF
    FFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 251
    Width = 747
    Height = 59
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object gbSound: TGroupBox
      Left = 8
      Top = 0
      Width = 106
      Height = 52
      Caption = 'Sound'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object bAfspelen: TButton
        Left = 7
        Top = 18
        Width = 90
        Height = 25
        Caption = 'Play'
        Enabled = False
        TabOrder = 0
        OnClick = bAfspelenClick
      end
    end
    object gbKnoppen: TGroupBox
      Left = 528
      Top = 0
      Width = 210
      Height = 52
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object bCancel: TButton
        Left = 7
        Top = 18
        Width = 90
        Height = 25
        Caption = 'Cancel'
        TabOrder = 0
        OnClick = bCancelClick
      end
      object bOK: TButton
        Left = 111
        Top = 18
        Width = 90
        Height = 25
        Caption = '&OK'
        TabOrder = 1
        OnClick = bOKClick
      end
    end
  end
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 251
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object PageControl: TPageControl
      Left = 4
      Top = 4
      Width = 739
      Height = 243
      ActivePage = TabSheetSound
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object TabSheetSound: TTabSheet
        Caption = 'Wolf'
        object Label2: TLabel
          Left = 58
          Top = 12
          Width = 33
          Height = 13
          Hint = 
            'De naam van het geluid, zoals gebruikt met een VSAY, VSAY_TEAM o' +
            'f VSAY_BUDDY commando'
          Caption = 'Name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label1: TLabel
          Left = 37
          Top = 62
          Width = 56
          Height = 13
          Hint = 'De chatmelding'
          Caption = 'Chat Text'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label3: TLabel
          Left = 118
          Top = 12
          Width = 32
          Height = 13
          Caption = 'uje_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
        end
        object lInfo: TLabel
          Left = 120
          Top = 104
          Width = 58
          Height = 13
          Caption = '<wave info>'
        end
        object Label4: TLabel
          Left = 32
          Top = 38
          Width = 61
          Height = 13
          Hint = 'De chatmelding'
          Caption = 'Menu Text'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label5: TLabel
          Left = 360
          Top = 38
          Width = 220
          Height = 12
          Caption = 'Supply only the text to be read in the menu..'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 360
          Top = 16
          Width = 280
          Height = 12
          Caption = 'Only use normal characters: Just a word without spaces'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -9
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object eSoundName: TEdit
          Left = 151
          Top = 13
          Width = 194
          Height = 16
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object bSelectWave: TButton
          Left = 51
          Top = 80
          Width = 48
          Height = 25
          Hint = 'De naam van het .WAV bestand'
          Caption = 'Wave'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = bSelectWaveClick
        end
        object eText: TEdit
          Left = 120
          Top = 61
          Width = 593
          Height = 16
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object gbTeam: TGroupBox
          Left = 52
          Top = 128
          Width = 165
          Height = 76
          Caption = 'Team'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object cbAxis: TCheckBox
            Left = 68
            Top = 8
            Width = 81
            Height = 17
            Hint = 'Een Axis teamchat'
            Caption = 'Axis'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = cbAxisClick
          end
          object cbAllies: TCheckBox
            Left = 68
            Top = 24
            Width = 81
            Height = 17
            Hint = 'Een Allies teamchat'
            Caption = 'Allies'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = cbAlliesClick
          end
          object cbFireTeam: TCheckBox
            Left = 68
            Top = 40
            Width = 81
            Height = 17
            Hint = 'Een Fireteam-chat'
            Caption = 'FireTeam'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = cbFireTeamClick
          end
          object cbGlobal: TCheckBox
            Left = 68
            Top = 56
            Width = 81
            Height = 17
            Hint = 'Een chat naar alle spelers'
            Caption = 'All (Global)'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 3
            OnClick = cbGlobalClick
          end
        end
        object eWaveFile: TEdit
          Left = 120
          Top = 85
          Width = 593
          Height = 16
          Cursor = crArrow
          BorderStyle = bsNone
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object eMenuText: TEdit
          Left = 120
          Top = 38
          Width = 225
          Height = 16
          BevelInner = bvNone
          BorderStyle = bsNone
          TabOrder = 1
        end
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'wav'
    Filter = 'Wave Files|*.wav'
    Options = [ofHideReadOnly, ofFileMustExist, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableSizing]
    Title = 'Select a .wav'
    Left = 160
    Top = 384
  end
end
