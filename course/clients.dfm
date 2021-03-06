object clientsform: Tclientsform
  Left = 0
  Top = 0
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 540
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object clnlbl: TLabel
    Left = 8
    Top = 330
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object clsnlbl: TLabel
    Left = 8
    Top = 360
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object pnlbl: TLabel
    Left = 8
    Top = 387
    Width = 84
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
  end
  object addresslbl: TLabel
    Left = 8
    Top = 414
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object dbrlbl: TLabel
    Left = 8
    Top = 441
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object clientidlbl: TLabel
    Left = 8
    Top = 306
    Width = 56
    Height = 13
    Caption = 'ID '#1082#1083#1080#1077#1085#1090#1072
  end
  object hideclients: TButton
    Left = 8
    Top = 506
    Width = 75
    Height = 25
    Caption = #1057#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = hideclientsClick
  end
  object clientsgrid: TDBGrid
    Left = 8
    Top = 8
    Width = 993
    Height = 289
    DataSource = clientsource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = clientsgridCellClick
    OnTitleClick = clientsgridTitleClick
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'ID_CLIENT'
        Title.Caption = 'ID '#1082#1083#1080#1077#1085#1090#1072
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CName'
        Title.Caption = #1048#1084#1103
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSurname'
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Width = 70
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'PhoneNum'
        Title.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 574
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateOfBirth'
        Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Width = 88
        Visible = True
      end>
  end
  object nameedit: TEdit
    Left = 98
    Top = 330
    Width = 263
    Height = 21
    TabOrder = 2
  end
  object surnameedit: TEdit
    Left = 98
    Top = 357
    Width = 263
    Height = 21
    TabOrder = 3
  end
  object pnedit: TEdit
    Left = 98
    Top = 384
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object addressedit: TEdit
    Left = 98
    Top = 411
    Width = 439
    Height = 21
    TabOrder = 5
  end
  object bdtp: TDateTimePicker
    Left = 98
    Top = 438
    Width = 121
    Height = 21
    Date = 44352.000000000000000000
    Time = 0.793083032403956200
    TabOrder = 6
    OnChange = bdtpChange
  end
  object add: TButton
    Left = 8
    Top = 475
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 7
    OnClick = addClick
  end
  object clear: TButton
    Left = 98
    Top = 475
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 8
    OnClick = clearClick
  end
  object delete: TButton
    Left = 286
    Top = 475
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 9
    OnClick = deleteClick
  end
  object change: TButton
    Left = 192
    Top = 475
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 10
    OnClick = changeClick
  end
  object clientidedit: TEdit
    Left = 98
    Top = 303
    Width = 263
    Height = 21
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 11
  end
  object clientsquery: TADOQuery
    Active = True
    Connection = mainform.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from client')
    Left = 808
    Top = 320
  end
  object clientsource: TDataSource
    DataSet = clientsquery
    Left = 744
    Top = 320
  end
  object searchquery: TADOQuery
    Connection = mainform.conn
    Parameters = <>
    Left = 424
    Top = 336
  end
end
