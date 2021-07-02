object buyform: Tbuyform
  Left = 0
  Top = 0
  Caption = #1055#1086#1082#1091#1087#1082#1072' '#1074' '#1084#1072#1075#1072#1079#1080#1085#1077
  ClientHeight = 588
  ClientWidth = 1136
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object idbplabel: TLabel
    Left = 614
    Top = 331
    Width = 102
    Height = 13
    Caption = 'ID '#1082#1085#1080#1075#1080' '#1074' '#1082#1072#1090#1072#1083#1086#1075#1077
  end
  object Label1: TLabel
    Left = 614
    Top = 361
    Width = 80
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
  end
  object Label2: TLabel
    Left = 614
    Top = 388
    Width = 86
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1085#1080#1075
  end
  object Label3: TLabel
    Left = 8
    Top = 330
    Width = 95
    Height = 13
    Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1072#1090#1072#1083#1086#1075#1091
  end
  object paymentmethodlabel: TLabel
    Left = 617
    Top = 418
    Width = 95
    Height = 13
    Caption = 'ID '#1089#1087#1086#1089#1086#1073#1072' '#1086#1087#1083#1072#1090#1099
  end
  object paymentmethodnamelabel: TLabel
    Left = 617
    Top = 445
    Width = 132
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1086#1089#1086#1073#1072' '#1086#1087#1083#1072#1090#1099
  end
  object clientidlabel: TLabel
    Left = 617
    Top = 475
    Width = 56
    Height = 13
    Caption = 'ID '#1082#1083#1080#1077#1085#1090#1072
  end
  object clientnamelabel: TLabel
    Left = 616
    Top = 502
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object surnamelabel: TLabel
    Left = 616
    Top = 529
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object storagelbl: TLabel
    Left = 296
    Top = 8
    Width = 45
    Height = 21
    Caption = #1057#1082#1083#1072#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object orderlbl: TLabel
    Left = 832
    Top = 8
    Width = 132
    Height = 21
    Caption = #1047#1072#1082#1072#1079#1099' '#1082#1083#1080#1077#1085#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object hidebuy: TButton
    Left = 7
    Top = 553
    Width = 75
    Height = 25
    Caption = #1053#1072' '#1075#1083#1072#1074#1085#1091#1102
    TabOrder = 0
    OnClick = hidebuyClick
  end
  object makebuy: TButton
    Left = 614
    Top = 555
    Width = 113
    Height = 25
    Caption = #1057#1086#1074#1077#1088#1096#1080#1090#1100' '#1087#1086#1082#1091#1087#1082#1091
    TabOrder = 1
    OnClick = makebuyClick
  end
  object storagegrid: TDBGrid
    Left = 7
    Top = 35
    Width = 602
    Height = 289
    DataSource = buysource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = storagegridCellClick
    OnTitleClick = storagegridTitleClick
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'id_book_publisher'
        Title.Caption = 'ID '#1082#1085#1080#1075#1080
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bookname'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
        Width = 373
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Quantity'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1085#1080#1075
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Present'
        Title.Caption = #1053#1072#1083#1080#1095#1080#1077
        Visible = True
      end>
  end
  object booknameedit: TEdit
    Left = 759
    Top = 361
    Width = 270
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object quantityedit: TEdit
    Left = 759
    Top = 388
    Width = 270
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    OnChange = quantityeditChange
  end
  object booknumedit: TEdit
    Left = 759
    Top = 334
    Width = 270
    Height = 21
    NumbersOnly = True
    TabOrder = 5
    OnChange = booknumeditChange
  end
  object catalogsearchedit: TEdit
    Left = 153
    Top = 330
    Width = 270
    Height = 21
    TabOrder = 6
    OnChange = catalogsearcheditChange
  end
  object clearbtn: TButton
    Left = 446
    Top = 330
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 7
    OnClick = clearbtnClick
  end
  object ordergrid: TDBGrid
    Left = 615
    Top = 35
    Width = 514
    Height = 289
    DataSource = cosource
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'ID_CLIENT_ORDER'
        Title.Caption = 'ID '#1079#1072#1082#1072#1079#1072' '#1082#1083#1080#1077#1085#1090#1072
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Client'
        Title.Caption = 'ID '#1082#1083#1080#1077#1085#1090#1072
        Width = 61
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Staff'
        Title.Caption = 'ID '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        Width = 83
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
        Title.Caption = 'ID '#1084#1077#1090#1086#1076#1072' '#1086#1087#1083#1072#1090#1099
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Quantity'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1085#1080#1075
        Width = 89
        Visible = True
      end>
  end
  object paymentmethodedit: TEdit
    Left = 760
    Top = 415
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 9
    OnChange = paymentmethodeditChange
  end
  object paymentmethodnameedit: TEdit
    Left = 759
    Top = 442
    Width = 370
    Height = 21
    ReadOnly = True
    TabOrder = 10
  end
  object clientidedit: TEdit
    Left = 760
    Top = 472
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 11
    OnChange = clientideditChange
  end
  object clientnameedit: TEdit
    Left = 759
    Top = 499
    Width = 370
    Height = 21
    ReadOnly = True
    TabOrder = 12
  end
  object clientsurnameedit: TEdit
    Left = 759
    Top = 526
    Width = 370
    Height = 21
    ReadOnly = True
    TabOrder = 13
  end
  object newclient: TButton
    Left = 887
    Top = 470
    Width = 90
    Height = 25
    Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090
    TabOrder = 14
    OnClick = newclientClick
  end
  object clearorder: TButton
    Left = 760
    Top = 553
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 15
    OnClick = clearorderClick
  end
  object buyquery: TADOQuery
    Active = True
    Connection = mainform.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select distinct bookpublisher.id_book_publisher, books.bookname,' +
        ' booksinstore.Quantity, booksinstore.Present from booksinstore, ' +
        'books, organization, bookpublisher'
      
        ' where books.id_book=bookpublisher.book and bookpublisher.id_boo' +
        'k_publisher=booksinstore.book and organization=1')
    Left = 89
    Top = 356
  end
  object buysource: TDataSource
    DataSet = buyquery
    Left = 25
    Top = 356
  end
  object searchquery: TADOQuery
    Connection = mainform.conn
    Parameters = <>
    Left = 529
    Top = 330
  end
  object coquery: TADOQuery
    Active = True
    Connection = mainform.conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from clientorder where organization=1')
    Left = 1063
    Top = 347
  end
  object cosource: TDataSource
    DataSet = coquery
    Left = 1063
    Top = 403
  end
end
