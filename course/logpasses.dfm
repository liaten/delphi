object logpassesform: Tlogpassesform
  Left = 0
  Top = 0
  Caption = 'logpassesform'
  ClientHeight = 622
  ClientWidth = 1055
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object hidelogpasses: TButton
    Left = 8
    Top = 578
    Width = 81
    Height = 25
    Caption = 'hidelogpasses'
    TabOrder = 0
    OnClick = hidelogpassesClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 617
    Height = 441
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADOQuery1: TADOQuery
    Connection = loginform.db
    Parameters = <>
    Left = 840
    Top = 304
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 840
    Top = 384
  end
end
