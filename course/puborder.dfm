object puborderform: Tpuborderform
  Left = 0
  Top = 0
  Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077' '#1079#1072#1082#1072#1079#1072' '#1080#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1091
  ClientHeight = 581
  ClientWidth = 1132
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object idsolbl: TLabel
    Left = 608
    Top = 8
    Width = 48
    Height = 13
    Caption = 'ID '#1079#1072#1082#1072#1079#1072
  end
  object cdtlbl: TLabel
    Left = 608
    Top = 35
    Width = 63
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
  end
  object ddlbl: TLabel
    Left = 608
    Top = 62
    Width = 83
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
  end
  object publbl: TLabel
    Left = 608
    Top = 92
    Width = 85
    Height = 13
    Caption = 'ID '#1080#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1072
  end
  object pubnamelbl: TLabel
    Left = 608
    Top = 119
    Width = 122
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1072
  end
  object dclbl: TLabel
    Left = 608
    Top = 146
    Width = 77
    Height = 13
    Caption = #1062#1077#1085#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
  end
  object booklabel: TLabel
    Left = 608
    Top = 176
    Width = 43
    Height = 13
    Caption = 'ID '#1082#1085#1080#1075#1080
  end
  object booknamelbl: TLabel
    Left = 608
    Top = 208
    Width = 80
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
  end
  object cilbl: TLabel
    Left = 608
    Top = 240
    Width = 32
    Height = 13
    Caption = #1058#1080#1088#1072#1078
  end
  object hidepuborderbtn: TButton
    Left = 8
    Top = 548
    Width = 81
    Height = 25
    Caption = #1053#1072' '#1075#1083#1072#1074#1085#1091#1102
    TabOrder = 0
    OnClick = hidepuborderbtnClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 585
    Height = 529
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'ID_STORE_ORDER'
        Title.Caption = 'ID '#1079#1072#1082#1072#1079#1072' '#1084#1072#1075#1072#1079#1080#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreationDate'
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Deadline'
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
        Width = 89
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Publisher'
        Title.Caption = 'ID '#1080#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1072
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'CostOfDelivery'
        Title.Caption = #1062#1077#1085#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
        Width = 83
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Book'
        Title.Caption = 'ID '#1082#1085#1080#1075#1080
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Circulation'
        Title.Caption = #1058#1080#1088#1072#1078
        Width = 43
        Visible = True
      end>
  end
  object idsoedit: TEdit
    Left = 736
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object cdtp: TDateTimePicker
    Left = 736
    Top = 35
    Width = 121
    Height = 21
    Date = 44349.000000000000000000
    Time = 0.607956099534931100
    TabOrder = 3
    OnChange = cdtpChange
  end
  object ddltp: TDateTimePicker
    Left = 736
    Top = 62
    Width = 121
    Height = 21
    Date = 44349.000000000000000000
    Time = 0.609067500001401600
    TabOrder = 4
    OnChange = cdtpChange
  end
  object pubedit: TEdit
    Left = 736
    Top = 89
    Width = 121
    Height = 21
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 5
    OnChange = pubeditChange
  end
  object pubnameedit: TEdit
    Left = 736
    Top = 116
    Width = 388
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object dcedit: TEdit
    Left = 736
    Top = 143
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 7
  end
  object bookidedit: TEdit
    Left = 736
    Top = 176
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 8
    OnChange = bookideditChange
  end
  object booknameedit: TEdit
    Left = 736
    Top = 203
    Width = 388
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object ciedit: TEdit
    Left = 736
    Top = 237
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 10
  end
  object add: TButton
    Left = 608
    Top = 264
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 11
    OnClick = addClick
  end
  object change: TButton
    Left = 840
    Top = 264
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 12
    OnClick = changeClick
  end
  object remove: TButton
    Left = 1049
    Top = 264
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 13
    OnClick = removeClick
  end
  object cancelbtn: TButton
    Left = 1049
    Top = 80
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 14
    OnClick = cancelbtnClick
  end
  object pubquery: TADOQuery
    Active = True
    Connection = mainform.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from storeorder'
      'where organization=1')
    Left = 832
    Top = 496
  end
  object DataSource1: TDataSource
    DataSet = pubquery
    Left = 760
    Top = 504
  end
  object searchquery: TADOQuery
    Connection = mainform.conn
    DataSource = DataSource1
    Parameters = <>
    Left = 624
    Top = 368
  end
end
