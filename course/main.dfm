object mainform: Tmainform
  Left = 0
  Top = 0
  Caption = #1050#1085#1080#1078#1085#1099#1081' '#1084#1072#1075#1072#1079#1080#1085
  ClientHeight = 578
  ClientWidth = 1290
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainmenu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object useridlabel: TLabel
    Left = 8
    Top = 46
    Width = 152
    Height = 13
    Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' ID '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object orglabel: TLabel
    Left = 8
    Top = 8
    Width = 131
    Height = 13
    Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
  end
  object label_fio: TLabel
    Left = 8
    Top = 27
    Width = 141
    Height = 13
    Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1077#1090' '#1092#1072#1084#1080#1083#1080#1103' '#1080' '#1080#1084#1103
  end
  object cataloglabel: TLabel
    Left = 8
    Top = 65
    Width = 72
    Height = 13
    Caption = #1050#1072#1090#1072#1083#1086#1075' '#1082#1085#1080#1075':'
  end
  object catalogsearch: TLabel
    Left = 616
    Top = 46
    Width = 99
    Height = 13
    Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1072#1090#1072#1083#1086#1075#1091':'
  end
  object logoutbtn: TButton
    Left = 8
    Top = 547
    Width = 129
    Height = 25
    Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    TabOrder = 0
    OnClick = logoutbtnClick
  end
  object terminatebtn: TButton
    Left = 143
    Top = 547
    Width = 118
    Height = 25
    Caption = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    TabOrder = 1
    OnClick = terminatebtnClick
  end
  object booksgrid: TDBGrid
    Left = 8
    Top = 84
    Width = 1265
    Height = 457
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = booksgridTitleClick
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'ID_BOOK_PUBLISHER'
        Title.Caption = 'ID '#1082#1085#1080#1075#1080
        Width = 52
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'ISBN'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Book'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1085#1080#1075#1080
        Width = 623
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Publisher'
        Title.Caption = #1048#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1086
        Width = 162
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'cost'
        Title.Caption = #1062#1077#1085#1072
        Width = 40
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'year_of_publication'
        Title.Caption = #1043#1086#1076
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BookTypeName'
        Title.Caption = #1058#1080#1087' '#1082#1085#1080#1075#1080
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CoverName'
        Title.Caption = #1058#1080#1087' '#1086#1073#1083#1086#1078#1082#1080
        Width = 110
        Visible = True
      end>
  end
  object catalogsearchedit: TEdit
    Left = 721
    Top = 38
    Width = 480
    Height = 21
    TabOrder = 3
    OnChange = catalogsearcheditChange
  end
  object dropbtn: TButton
    Left = 1207
    Top = 36
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 4
    OnClick = dropbtnClick
  end
  object catalogquery: TADOQuery
    Active = True
    Connection = conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select bookpublisher.ID_BOOK_PUBLISHER, bookpublisher.ISBN, Book' +
        's.BookName as Book, publisher.pname as Publisher, bookpublisher.' +
        'cost, bookpublisher.year_of_publication, booktype.booktypename a' +
        's BookTypeName, cover.covername as CoverName '
      
        'from bookpublisher,books,publisher,booktype,cover where bookpubl' +
        'isher.book=books.id_book and publisher.id_publisher=bookpublishe' +
        'r.publisher and bookpublisher.booktype=booktype.id_booktype and ' +
        'bookpublisher.cover=cover.id_cover')
    Left = 192
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = catalogquery
    Left = 264
    Top = 8
  end
  object mainmenu: TMainMenu
    Left = 336
    Top = 8
    object menuhelp: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = menuhelpClick
    end
    object buy: TMenuItem
      Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077' '#1087#1086#1082#1091#1087#1082#1080' '#1074' '#1084#1072#1075#1072#1079#1080#1085#1077
      OnClick = buyClick
    end
    object orderchoose: TMenuItem
      Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
      object clientorder: TMenuItem
        Caption = #1050#1083#1080#1077#1085#1090#1072' '#1084#1072#1075#1072#1079#1080#1085#1091
        OnClick = clientorderClick
      end
      object publisher_order: TMenuItem
        Caption = #1052#1072#1075#1072#1079#1080#1085#1072' '#1080#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1091
        OnClick = publisher_orderClick
      end
    end
    object storage: TMenuItem
      Caption = #1057#1082#1083#1072#1076
      OnClick = storageClick
    end
    object add: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = False
      object addbook: TMenuItem
        Caption = #1050#1085#1080#1075#1091
        OnClick = addbookClick
      end
      object addauthor: TMenuItem
        Caption = #1055#1080#1089#1072#1090#1077#1083#1103
        OnClick = addauthorClick
      end
      object addpublisher: TMenuItem
        Caption = #1048#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1086
        OnClick = addpublisherClick
      end
      object addgenre: TMenuItem
        Caption = #1046#1072#1085#1088
        OnClick = addgenreClick
      end
      object addbooktype: TMenuItem
        Caption = #1058#1080#1087' '#1082#1085#1080#1075#1080
        OnClick = addbooktypeClick
      end
      object addcover: TMenuItem
        Caption = #1054#1073#1083#1086#1078#1082#1091
        OnClick = addcoverClick
      end
    end
    object change: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = False
      object changebook: TMenuItem
        Caption = #1050#1085#1080#1075#1091
        OnClick = changebookClick
      end
      object changeauthor: TMenuItem
        Caption = #1055#1080#1089#1072#1090#1077#1083#1103
        OnClick = changeauthorClick
      end
      object changepublisher: TMenuItem
        Caption = #1048#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1086
        OnClick = changepublisherClick
      end
      object changegenre: TMenuItem
        Caption = #1046#1072#1085#1088
        OnClick = changegenreClick
      end
      object changebooktype: TMenuItem
        Caption = #1058#1080#1087' '#1082#1085#1080#1075#1080
        OnClick = changebooktypeClick
      end
      object changecover: TMenuItem
        Caption = #1054#1073#1083#1086#1078#1082#1091
        OnClick = changecoverClick
      end
    end
    object remove: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Visible = False
      object removebook: TMenuItem
        Caption = #1050#1085#1080#1075#1091
        OnClick = removebookClick
      end
      object removeauthor: TMenuItem
        Caption = #1055#1080#1089#1072#1090#1077#1083#1103
        OnClick = removeauthorClick
      end
      object removepublisher: TMenuItem
        Caption = #1048#1079#1076#1072#1090#1077#1083#1100#1089#1090#1074#1086
        OnClick = removepublisherClick
      end
      object removegenre: TMenuItem
        Caption = #1046#1072#1085#1088
        OnClick = removegenreClick
      end
      object removebooktype: TMenuItem
        Caption = #1058#1080#1087' '#1082#1085#1080#1075#1080
        OnClick = removebooktypeClick
      end
      object removecover: TMenuItem
        Caption = #1054#1073#1083#1086#1078#1082#1091
        OnClick = removecoverClick
      end
    end
    object reports: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      Visible = False
      object cassir_reports: TMenuItem
        Caption = #1055#1086' '#1082#1072#1089#1089#1080#1088#1072#1084
        OnClick = cassir_reportsClick
      end
      object shop_reports: TMenuItem
        Caption = #1055#1086' '#1084#1072#1075#1072#1079#1080#1085#1091
        OnClick = shop_reportsClick
      end
    end
    object createlogins: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1083#1086#1075#1080#1085#1086#1074' '#1080' '#1087#1072#1088#1086#1083#1077#1081' '#1076#1083#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      Visible = False
      OnClick = createloginsClick
    end
    object clientsmenu: TMenuItem
      Caption = #1050#1083#1080#1077#1085#1090
      OnClick = clientsmenuClick
    end
  end
  object conn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=bookstore.mdb;Persi' +
      'st Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 408
    Top = 8
  end
end
