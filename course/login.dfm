object loginform: Tloginform
  Left = 0
  Top = 0
  Caption = #1042#1093#1086#1076' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' "'#1050#1085#1080#1078#1085#1099#1081' '#1084#1072#1075#1072#1079#1080#1085'"'
  ClientHeight = 289
  ClientWidth = 919
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object loginlabel: TLabel
    Left = 32
    Top = 96
    Width = 35
    Height = 16
    Caption = #1051#1086#1075#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object passlabel: TLabel
    Left = 32
    Top = 152
    Width = 43
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object authmsg: TLabel
    Left = 24
    Top = 0
    Width = 669
    Height = 21
    Caption = 
      #1063#1090#1086#1073#1099' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1085#1086#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077' '#1082#1085#1080#1078#1085#1086#1075#1086' '#1084#1072#1075#1072#1079#1080#1085#1072', '#1074#1099 +
      #1087#1086#1083#1085#1080#1090#1077' '#1074#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbmsg: TLabel
    Left = 24
    Top = 271
    Width = 148
    Height = 13
    Caption = #1059#1089#1087#1077#1096#1085#1086#1089#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1089' '#1073#1076
    Color = clBlack
    ParentColor = False
  end
  object loginbtn: TButton
    Left = 24
    Top = 240
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = loginbtnClick
  end
  object terminatebtn: TButton
    Left = 560
    Top = 240
    Width = 133
    Height = 25
    Caption = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = terminatebtnClick
  end
  object loginedit: TEdit
    Left = 136
    Top = 91
    Width = 557
    Height = 21
    TabOrder = 2
  end
  object clearbtn: TButton
    Left = 296
    Top = 240
    Width = 97
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = clearbtnClick
  end
  object passedit: TEdit
    Left = 136
    Top = 147
    Width = 557
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
  end
  object loginquery: TADOQuery
    Connection = mainform.conn
    Parameters = <>
    Left = 760
    Top = 224
  end
  object chooseuser: TADOQuery
    Connection = mainform.conn
    Parameters = <>
    Left = 832
    Top = 224
  end
  object usertypequery: TADOQuery
    Connection = mainform.conn
    Parameters = <>
    Left = 840
    Top = 144
  end
  object MainMenu1: TMainMenu
    Left = 768
    Top = 64
    object help: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100' '#1089' '#1072#1074#1090#1086#1088#1080#1079#1072#1094#1080#1077#1081
      OnClick = helpClick
    end
  end
end
