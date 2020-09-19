object Mainform: TMainform
  Left = 0
  Top = 0
  Caption = 'TTS DELPHI DEMO'
  ClientHeight = 315
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 20
  Padding.Top = 20
  Padding.Right = 20
  Padding.Bottom = 20
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 68
    Width = 34
    Height = 13
    Caption = 'Volume'
  end
  object Label2: TLabel
    Left = 20
    Top = 105
    Width = 37
    Height = 13
    Caption = 'Velocit'#224
  end
  object Edit1: TEdit
    Left = 20
    Top = 28
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'buongiorno a tutto il mondo'
  end
  object BitBtn1: TBitBtn
    Left = 283
    Top = 26
    Width = 75
    Height = 25
    Caption = 'parla'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object tbVolume: TTrackBar
    Left = 76
    Top = 58
    Width = 282
    Height = 37
    Max = 100
    Position = 100
    PositionToolTip = ptBottom
    TabOrder = 2
    TickMarks = tmBoth
    TickStyle = tsManual
  end
  object tbRate: TTrackBar
    Left = 76
    Top = 93
    Width = 282
    Height = 35
    Min = -10
    TabOrder = 3
    TickMarks = tmBoth
    TickStyle = tsManual
  end
  object GroupBox1: TGroupBox
    Left = 379
    Top = 20
    Width = 426
    Height = 275
    Caption = 'Lingue presenti'
    TabOrder = 4
    object comboListaVoci: TListBox
      Left = 13
      Top = 20
      Width = 401
      Height = 242
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Consolas'
      Font.Style = []
      ItemHeight = 15
      ParentFont = False
      TabOrder = 0
      OnClick = comboListaVociClick
    end
  end
  object Memo1: TMemo
    Left = 20
    Top = 146
    Width = 338
    Height = 149
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
end
