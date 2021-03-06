object storageform: Tstorageform
  Left = 0
  Top = 0
  Caption = #1057#1082#1083#1072#1076
  ClientHeight = 595
  ClientWidth = 1034
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
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 624
    Top = 11
    Width = 122
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1085#1080#1075#1080' '#1074' '#1082#1072#1090#1072#1083#1086#1075#1077
  end
  object Label2: TLabel
    Left = 624
    Top = 51
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 624
    Top = 91
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object hidestorage: TButton
    Left = 8
    Top = 563
    Width = 75
    Height = 25
    Caption = #1053#1072' '#1075#1083#1072#1074#1085#1091#1102
    TabOrder = 0
    OnClick = hidestorageClick
  end
  object storagegrid: TDBGrid
    Left = 8
    Top = 8
    Width = 609
    Height = 549
    DataSource = storagedatasource
    ReadOnly = True
    TabOrder = 1
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
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 411
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'Quantity'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Present'
        Title.Caption = #1053#1072#1083#1080#1095#1080#1077
        Width = 46
        Visible = True
      end>
  end
  object booknumedit: TEdit
    Left = 756
    Top = 8
    Width = 270
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    OnChange = booknumeditChange
  end
  object booknameedit: TEdit
    Left = 756
    Top = 48
    Width = 270
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object quantityedit: TEdit
    Left = 756
    Top = 88
    Width = 270
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    OnChange = quantityeditChange
  end
  object addbtn: TButton
    Left = 624
    Top = 131
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = addbtnClick
  end
  object changebtn: TButton
    Left = 784
    Top = 131
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = changebtnClick
  end
  object removebtn: TButton
    Left = 951
    Top = 131
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 7
    OnClick = removebtnClick
  end
  object storagequery: TADOQuery
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
    Left = 696
    Top = 424
  end
  object storagedatasource: TDataSource
    DataSet = storagequery
    Left = 696
    Top = 472
  end
  object searchquery: TADOQuery
    Connection = mainform.conn
    Parameters = <>
    Left = 872
    Top = 208
  end
  object MainMenu1: TMainMenu
    Left = 816
    Top = 288
    object N1: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = N1Click
    end
  end
end
