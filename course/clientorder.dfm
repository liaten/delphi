object clientorderform: Tclientorderform
  Left = 0
  Top = 0
  Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077' '#1079#1072#1082#1072#1079#1072' '#1082#1083#1080#1077#1085#1090#1072' '#1084#1072#1075#1072#1079#1080#1085#1091
  ClientHeight = 607
  ClientWidth = 1264
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object creationdatelabel: TLabel
    Left = 769
    Top = 8
    Width = 113
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
  end
  object clientidlabel: TLabel
    Left = 769
    Top = 70
    Width = 56
    Height = 13
    Caption = 'ID '#1082#1083#1080#1077#1085#1090#1072
  end
  object clientnamelabel: TLabel
    Left = 768
    Top = 97
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object bookidlabel: TLabel
    Left = 768
    Top = 151
    Width = 43
    Height = 13
    Caption = 'ID '#1082#1085#1080#1075#1080
  end
  object booknamelabel: TLabel
    Left = 767
    Top = 178
    Width = 80
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
  end
  object paymentmethodlabel: TLabel
    Left = 767
    Top = 205
    Width = 95
    Height = 13
    Caption = 'ID '#1089#1087#1086#1089#1086#1073#1072' '#1086#1087#1083#1072#1090#1099
  end
  object surnamelabel: TLabel
    Left = 768
    Top = 124
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object quantitylabel: TLabel
    Left = 767
    Top = 260
    Width = 86
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1085#1080#1075
  end
  object paymentmethodnamelabel: TLabel
    Left = 767
    Top = 232
    Width = 132
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1086#1089#1086#1073#1072' '#1086#1087#1083#1072#1090#1099
  end
  object deadlinelabel: TLabel
    Left = 769
    Top = 35
    Width = 100
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1082#1085#1080#1075#1080
  end
  object clientorderlabel: TLabel
    Left = 1039
    Top = 70
    Width = 48
    Height = 13
    Caption = 'ID '#1079#1072#1082#1072#1079#1072
  end
  object hideclientform: TButton
    Left = 8
    Top = 574
    Width = 75
    Height = 25
    Caption = #1053#1072' '#1075#1083#1072#1074#1085#1091#1102
    TabOrder = 0
    OnClick = hideclienordertformhidebtnClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 744
    Height = 560
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
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
        FieldName = 'ID_CLIENT_ORDER'
        Title.Caption = 'ID '#1079#1072#1082#1072#1079#1072' '#1082#1083#1080#1077#1085#1090#1072
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreationDate'
        Title.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Deadline'
        Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1082#1085#1080#1075#1080
        Width = 106
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Client'
        Title.Caption = 'ID '#1082#1083#1080#1077#1085#1090#1072
        Width = 63
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Staff'
        Title.Caption = 'ID '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Book'
        Title.Caption = 'ID '#1082#1085#1080#1075#1080
        Width = 46
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'MethodOfPayment'
        Title.Caption = 'ID '#1089#1087#1086#1089#1086#1073#1072' '#1086#1087#1083#1072#1090#1099
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Quantity'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1085#1080#1075
        Visible = True
      end>
  end
  object cdtp: TDateTimePicker
    Left = 912
    Top = 8
    Width = 121
    Height = 21
    Date = 44346.000000000000000000
    Time = 0.694619826390407900
    TabOrder = 2
    OnChange = cdtpChange
  end
  object clientidedit: TEdit
    Left = 912
    Top = 67
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    OnChange = clientideditChange
  end
  object clientnameedit: TEdit
    Left = 911
    Top = 94
    Width = 345
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object bookidedit: TEdit
    Left = 911
    Top = 148
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 5
    OnChange = bookideditChange
  end
  object booknameedit: TEdit
    Left = 910
    Top = 175
    Width = 346
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object paymentmethodedit: TEdit
    Left = 910
    Top = 202
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 7
    OnChange = paymentmethodeditChange
  end
  object clientsurnameedit: TEdit
    Left = 911
    Top = 121
    Width = 345
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object quantityedit: TEdit
    Left = 910
    Top = 257
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 9
    OnChange = quantityeditChange
  end
  object addcobtn: TButton
    Left = 758
    Top = 284
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 10
    OnClick = addcobtnClick
  end
  object removecobtn: TButton
    Left = 1181
    Top = 284
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 11
    OnClick = removecobtnClick
  end
  object editcobtn: TButton
    Left = 991
    Top = 284
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 12
    OnClick = editcobtnClick
  end
  object paymentmethodnameedit: TEdit
    Left = 909
    Top = 229
    Width = 347
    Height = 21
    ReadOnly = True
    TabOrder = 13
  end
  object dltp: TDateTimePicker
    Left = 912
    Top = 35
    Width = 121
    Height = 21
    Date = 44346.000000000000000000
    Time = 0.694619826390407900
    TabOrder = 14
    OnChange = dltpChange
  end
  object orderidedit: TEdit
    Left = 1135
    Top = 67
    Width = 121
    Height = 21
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 15
  end
  object clearbtn: TButton
    Left = 1181
    Top = 36
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089' '#1103#1095#1077#1077#1082
    TabOrder = 16
    OnClick = clearbtnClick
  end
  object clientorderquery: TADOQuery
    Active = True
    Connection = mainform.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from clientorder where organization=1')
    Left = 799
    Top = 480
  end
  object DataSource1: TDataSource
    DataSet = clientorderquery
    Left = 800
    Top = 528
  end
  object searchquery: TADOQuery
    Connection = mainform.conn
    Parameters = <>
    Left = 1109
    Top = 260
  end
end
