object fSoundPacker: TfSoundPacker
  Left = 255
  Top = 111
  Width = 554
  Height = 540
  Caption = 'SoundPacker'
  Color = clBtnFace
  Constraints.MinHeight = 540
  Constraints.MinWidth = 554
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000088877778888000000000000000000877666666666667780000000000
    0087666666666777766666678000000007666666778800000000887667000008
    6666667800000000000000008778008666666780000000000000000000880066
    6666600000000000000000000000076666668000000000000000000000000666
    6668000000000000000000000000866666680000000000000000000000008666
    6668000000000000000000000000076666670000000000000000000000000866
    6666800000000000000000000000007666666000000000000000000000000007
    6666678000000000000000000088000076666678800000000000000087700000
    0876666677788800000888767800000000087666666666676666667800000000
    0000088776666666667788000000000000000000008888888000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF001FFFF80
    003FFC000007F800FF03E00FFFF0C01FFFFCC07FFFFF807FFFFF80FFFFFF00FF
    FFFF00FFFFFF80FFFFFF807FFFFFC07FFFFFE01FFFFCF007FFF1F8003E03FE00
    000FFF80003FFFFC07FFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    8877777780000087666788877780086668000000088886668000000000007667
    0000000000008667000000000000066670000000000008666800000000880008
    66677777778000000887777880000000000000000000FFFF0000FFFF0000FFFF
    0000FFFF0000FFFF0000F0070000C001000083F8000007FF00000FFF00000FFF
    000087FF000083FC0000E0010000F8070000FFFF0000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 546
    Height = 487
    ActivePage = TabSounds
    Align = alClient
    TabOrder = 0
    OnChange = PageControlChange
    object TabOpties: TTabSheet
      Caption = 'Options'
      object pOptiesTop: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 459
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 0
        object gbWorkDir: TGroupBox
          Left = 8
          Top = 8
          Width = 522
          Height = 97
          Align = alTop
          Caption = 'WorkDir'
          TabOrder = 0
          object Panel1: TPanel
            Left = 2
            Top = 15
            Width = 518
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            BorderWidth = 8
            TabOrder = 1
            object eWorkDir: TEdit
              Left = 16
              Top = 0
              Width = 481
              Height = 14
              Cursor = crArrow
              AutoSize = False
              BevelInner = bvNone
              BorderStyle = bsNone
              HideSelection = False
              ReadOnly = True
              TabOrder = 0
              Text = '<standaard werkmap>'
            end
          end
          object bWorkDir: TButton
            Left = 16
            Top = 40
            Width = 153
            Height = 25
            Caption = 'Select different WorkDir'
            TabOrder = 0
            OnClick = bWorkDirClick
          end
          object cbWorkDirCleanUp: TCheckBox
            Left = 16
            Top = 72
            Width = 169
            Height = 17
            Caption = 'Clean-up after use'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object gbFolder: TGroupBox
          Left = 8
          Top = 169
          Width = 522
          Height = 49
          Align = alTop
          Caption = 'General'
          TabOrder = 2
          object cbOpenFolder: TCheckBox
            Left = 16
            Top = 24
            Width = 345
            Height = 17
            Caption = 'Open SoundPack-folder after creation'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object gbCreate: TGroupBox
          Left = 8
          Top = 105
          Width = 522
          Height = 64
          Align = alTop
          Caption = 'Generate'
          TabOrder = 1
          object cbOptiesMenu: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Menu'
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 0
          end
          object cbOptiesPK3: TCheckBox
            Left = 16
            Top = 40
            Width = 97
            Height = 17
            Caption = 'PK3'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object gbHelp: TGroupBox
          Left = 8
          Top = 218
          Width = 522
          Height = 231
          Align = alTop
          Caption = 'Help'
          TabOrder = 3
          object Label1: TLabel
            Left = 16
            Top = 24
            Width = 26
            Height = 13
            Caption = 'Keys:'
          end
          object Label2: TLabel
            Left = 32
            Top = 56
            Width = 18
            Height = 13
            Caption = 'INS'
          end
          object Label3: TLabel
            Left = 32
            Top = 88
            Width = 21
            Height = 13
            Caption = 'DEL'
          end
          object Label4: TLabel
            Left = 32
            Top = 72
            Width = 23
            Height = 13
            Caption = 'KP +'
          end
          object Label5: TLabel
            Left = 104
            Top = 56
            Width = 83
            Height = 13
            Caption = 'Add a new sound'
          end
          object Label6: TLabel
            Left = 104
            Top = 88
            Width = 124
            Height = 13
            Caption = 'Delete the selected sound'
          end
          object Label7: TLabel
            Left = 104
            Top = 72
            Width = 188
            Height = 13
            Caption = 'Add a sub-sound for the selected sound'
          end
          object Label8: TLabel
            Left = 32
            Top = 40
            Width = 36
            Height = 13
            Caption = 'Sounds'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 32
            Top = 112
            Width = 27
            Height = 13
            Caption = 'Menu'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 32
            Top = 128
            Width = 18
            Height = 13
            Caption = 'INS'
          end
          object Label11: TLabel
            Left = 32
            Top = 144
            Width = 21
            Height = 13
            Caption = 'DEL'
          end
          object Label13: TLabel
            Left = 104
            Top = 128
            Width = 286
            Height = 13
            Caption = 'Insert a new sub-menu (on the selected menu-item'#39's position)'
          end
          object Label14: TLabel
            Left = 104
            Top = 144
            Width = 141
            Height = 13
            Caption = 'Delete the selected sub-menu'
          end
          object ShapeSubSound: TShape
            Left = 16
            Top = 176
            Width = 73
            Height = 14
            Brush.Color = clSkyBlue
            Pen.Style = psClear
            Pen.Width = 0
          end
          object Label12: TLabel
            Left = 104
            Top = 176
            Width = 180
            Height = 13
            Caption = 'Color of sub-sounds (like Hi, Hello, Hi!)'
          end
          object Shape1: TShape
            Left = 16
            Top = 192
            Width = 73
            Height = 14
            Brush.Color = 12616447
            Pen.Style = psClear
          end
          object Label15: TLabel
            Left = 104
            Top = 192
            Width = 203
            Height = 13
            Caption = 'Color of sounds not yet assigned to a menu'
          end
          object ImageMenu: TImage
            Left = 16
            Top = 208
            Width = 8
            Height = 8
            Picture.Data = {
              07544269746D617076040000424D760400000000000036040000280000000800
              0000080000000100080000000000400000000000000000000000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00FFFFFFFFFFFFFFFFFFFFFFF9F9FFFFFFFFFFFFF9F9FFFFFFFFFFFFF9F9FF
              FFFFFFF9F9F9F9F9F9FFF9F9F9F9F9F9F9F9FFFFFFF9F9FFFFFFFFFFFFFFFFFF
              FFFF}
            Visible = False
          end
          object Label16: TLabel
            Left = 104
            Top = 208
            Width = 78
            Height = 13
            Caption = 'Image for menus'
            Visible = False
          end
        end
      end
    end
    object TabSounds: TTabSheet
      Caption = 'Sounds'
      ImageIndex = 1
      object pSoundsTop: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 400
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PageControlSounds: TPageControl
          Left = 0
          Top = 0
          Width = 538
          Height = 400
          ActivePage = TabSoundsSelector
          Align = alClient
          TabOrder = 0
          TabPosition = tpBottom
          object TabSoundsSelector: TTabSheet
            BorderWidth = 4
            Caption = 'Selector'
            object lvSounds: TListView
              Left = 0
              Top = 0
              Width = 522
              Height = 366
              Align = alClient
              Columns = <
                item
                  Caption = 'Name'
                  Width = 150
                end
                item
                  Caption = 'Team'
                  Width = 40
                end
                item
                  Caption = 'Chat text'
                  Width = 228
                end
                item
                  Caption = 'Wave'
                  Width = 100
                end>
              ReadOnly = True
              RowSelect = True
              StateImages = ImageList
              TabOrder = 0
              ViewStyle = vsReport
              OnContextPopup = lvSoundsContextPopup
              OnCustomDrawItem = lvSoundsCustomDrawItem
              OnCustomDrawSubItem = lvSoundsCustomDrawSubItem
              OnDblClick = lvSoundsDblClick
              OnKeyDown = lvSoundsKeyDown
              OnResize = lvSoundsResize
              OnSelectItem = lvSoundsSelectItem
            end
          end
        end
      end
      object pSoundsBottom: TPanel
        Left = 0
        Top = 400
        Width = 538
        Height = 59
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object pSoundsBottomRight: TPanel
          Left = 288
          Top = 0
          Width = 250
          Height = 59
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object gbSound: TGroupBox
            Left = 32
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
            object bSoundAdd: TButton
              Left = 8
              Top = 16
              Width = 90
              Height = 25
              Action = ActionSoundAdd
              Caption = 'Add'
              TabOrder = 0
            end
          end
          object gbSubSound: TGroupBox
            Left = 136
            Top = 0
            Width = 106
            Height = 52
            Caption = 'SubSound'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object bSoundAddSub: TButton
              Left = 8
              Top = 16
              Width = 90
              Height = 25
              Action = ActionAddSubSound
              Caption = 'Add'
              TabOrder = 0
            end
          end
        end
      end
    end
    object TabMenu: TTabSheet
      Caption = 'Menu'
      ImageIndex = 2
      object pMenuTop: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 400
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PageControlMenu: TPageControl
          Left = 0
          Top = 0
          Width = 538
          Height = 400
          ActivePage = TabMenuEditor
          Align = alClient
          TabOrder = 0
          TabPosition = tpBottom
          object TabMenuEditor: TTabSheet
            BorderWidth = 4
            Caption = 'Editor'
            object tvMenu: TTreeView
              Left = 0
              Top = 0
              Width = 305
              Height = 306
              Align = alClient
              Color = clWhite
              DragMode = dmAutomatic
              HideSelection = False
              Indent = 19
              ReadOnly = True
              RowSelect = True
              ShowRoot = False
              TabOrder = 0
              OnChange = tvMenuChange
              OnClick = tvMenuClick
              OnCollapsing = tvMenuCollapsing
              OnCustomDrawItem = tvMenuCustomDrawItem
              OnDblClick = tvMenuDblClick
              OnDragDrop = tvMenuDragDrop
              OnDragOver = tvMenuDragOver
              OnKeyDown = tvMenuKeyDown
              OnStartDrag = tvMenuStartDrag
            end
            object RTF: TRichEdit
              Left = 305
              Top = 0
              Width = 217
              Height = 306
              Cursor = crArrow
              TabStop = False
              Align = alRight
              BorderWidth = 10
              Color = cl3DDkShadow
              ReadOnly = True
              TabOrder = 1
              WantReturns = False
              WordWrap = False
            end
            object RTFChat: TRichEdit
              Left = 0
              Top = 306
              Width = 522
              Height = 60
              Cursor = crArrow
              TabStop = False
              Align = alBottom
              Color = cl3DDkShadow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 2
            end
          end
        end
      end
      object pMenuBottom: TPanel
        Left = 0
        Top = 400
        Width = 538
        Height = 59
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object M: TMemo
          Left = 24
          Top = 13
          Width = 49
          Height = 36
          TabOrder = 0
          Visible = False
        end
        object pMenuBottomRight: TPanel
          Left = 288
          Top = 0
          Width = 250
          Height = 59
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object gbMenuSubMenu: TGroupBox
            Left = 32
            Top = 0
            Width = 210
            Height = 52
            Caption = 'SubMenu'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object bMenuInsertSubMenu: TButton
              Left = 8
              Top = 16
              Width = 90
              Height = 25
              Action = ActionMenuInsertSubMenu
              Caption = 'Add'
              TabOrder = 0
            end
            object bMenuDeleteSubMenu: TButton
              Left = 112
              Top = 16
              Width = 90
              Height = 25
              Action = ActionMenuDelete
              Caption = 'Remove'
              TabOrder = 1
            end
          end
        end
      end
    end
    object TabSoundPack: TTabSheet
      Caption = 'SoundPack'
      ImageIndex = 3
      object pSoundPackBottom: TPanel
        Left = 0
        Top = 400
        Width = 538
        Height = 59
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object pSoundPackBottomRight: TPanel
          Left = 288
          Top = 0
          Width = 250
          Height = 59
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object gbSoundPack: TGroupBox
            Left = 32
            Top = 0
            Width = 210
            Height = 52
            Caption = 'SoundPack'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object bSoundPackCreate: TBitBtn
              Left = 112
              Top = 16
              Width = 90
              Height = 25
              Caption = '&Generate'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = bSoundPackCreateClick
              OnMouseUp = bSoundPackCreateMouseUp
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFF0000000FF
                FFFFF07087700707770FF78770777078887FF78770877078887FF78777F78087
                887FF78770000007787FF78778888877787FF78887999977887FF78887988977
                887FF77007988970077FF07888988988870F0788888778888870788899988999
                88870777708998077770F07777077077770FFFFFFFFFFFFFFFFF}
            end
            object bSoundPackLoad: TButton
              Left = 8
              Top = 16
              Width = 90
              Height = 25
              Caption = 'Load'
              TabOrder = 1
              OnClick = bSoundPackLoadClick
            end
          end
        end
      end
      object pSoundPackTop: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 400
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PageControlSoundPack: TPageControl
          Left = 0
          Top = 0
          Width = 538
          Height = 400
          Cursor = crArrow
          ActivePage = TabSoundPackAllies
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiLine = True
          ParentFont = False
          TabOrder = 0
          TabPosition = tpBottom
          object TabSoundPackAllies: TTabSheet
            BorderWidth = 4
            Caption = 'Allies'
            object mAllies: TMemo
              Left = 0
              Top = 0
              Width = 522
              Height = 366
              Cursor = crArrow
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
              WantTabs = True
              WordWrap = False
            end
          end
          object TabSoundPackAxis: TTabSheet
            BorderWidth = 4
            Caption = 'Axis'
            ImageIndex = 1
            object mAxis: TMemo
              Left = 0
              Top = 0
              Width = 522
              Height = 374
              Cursor = crArrow
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
              WantTabs = True
              WordWrap = False
            end
          end
          object TabSoundPackMenu: TTabSheet
            BorderWidth = 4
            Caption = 'Menu'
            ImageIndex = 2
            object mMenu: TMemo
              Left = 0
              Top = 0
              Width = 522
              Height = 374
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
              WantTabs = True
              WordWrap = False
            end
          end
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 487
    Width = 546
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end>
    OnResize = StatusBarResize
  end
  object ImageList: TImageList
    BkColor = clWhite
    Height = 8
    Masked = False
    Width = 8
    Left = 208
    Top = 8
    Bitmap = {
      494C010101000400040008000800FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000200000000800000001002000000000000004
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000020000000080000000100010000000000200000000000000000000000
      000000000000000000000000FFFFFF00FF000000E7000000E7000000E7000000
      8100000000000000E7000000FF00000000000000000000000000000000000000
      000000000000}
  end
  object ZipForge: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clMax
    CompressionMode = 9
    CurrentVersion = '2.70 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = True
    SpanningOptions.VolumeSize = vsAutoDetect
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    Zip64Mode = zmDisabled
    Left = 240
    Top = 8
  end
  object ActionList: TActionList
    Left = 272
    Top = 8
    object ActionSoundDelete: TAction
      Category = 'Sound'
      Caption = '&Verwijderen'
      OnExecute = ActionSoundDeleteExecute
    end
    object ActionSoundAdd: TAction
      Category = 'Sound'
      Caption = '&Toevoegen'
      OnExecute = ActionSoundAddExecute
    end
    object ActionAddSubSound: TAction
      Category = 'Sound'
      Caption = 'Toevoegen'
      OnExecute = ActionAddSubSoundExecute
    end
    object ActionMenuInsertSubMenu: TAction
      Category = 'Menu'
      Caption = '&Tussenvoegen'
      OnExecute = ActionMenuInsertSubMenuExecute
    end
    object ActionMenuDelete: TAction
      Category = 'Menu'
      Caption = '&Verwijderen'
      OnExecute = ActionMenuDeleteExecute
    end
    object ActionSoundEdit: TAction
      Category = 'Sound'
      Caption = '&Wijzigen'
      OnExecute = ActionSoundEditExecute
    end
  end
  object PopupMenu: TPopupMenu
    AutoPopup = False
    Left = 304
    Top = 8
    object PopupEdit: TMenuItem
      Action = ActionSoundEdit
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'pk3'
    Filter = 'PK3 Bestanden|*.pk3'
    Options = [ofNoChangeDir, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 336
    Top = 8
  end
end
