object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 646
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Individual ('#1086#1089#1086#1073#1100')'
  end
  object Label2: TLabel
    Left = 352
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Species ('#1074#1080#1076')'
  end
  object Label3: TLabel
    Left = 688
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Genius ('#1088#1086#1076')'
  end
  object Label4: TLabel
    Left = 16
    Top = 328
    Width = 81
    Height = 13
    Caption = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082':'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 27
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 352
    Top = 27
    Width = 320
    Height = 120
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 688
    Top = 27
    Width = 320
    Height = 120
    DataSource = DataSource3
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 8
    Top = 184
    Width = 377
    Height = 120
    DataSource = DataSource4
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDI'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IName'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idS'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numb'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDate'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gender'
        Width = 42
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 103
    Top = 325
    Width = 282
    Height = 21
    TabOrder = 4
    OnChange = Edit1Change
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=zoo.mdb' +
      ';Persist Security Info=True'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 152
    Top = 3
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from individual')
    Left = 192
    Top = 3
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
    Top = 3
  end
  object ADOQuery2: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select* from species')
    Left = 584
    Top = 3
  end
  object ADOQuery3: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from genius')
    Left = 824
    Top = 65531
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 632
    Top = 3
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 864
    Top = 65531
  end
  object ADOQuery4: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from individual')
    Left = 784
    Top = 144
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 840
    Top = 144
  end
end
