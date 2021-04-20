unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    ADOQuery4: TADOQuery;
    DBGrid4: TDBGrid;
    DataSource4: TDataSource;
    ADOQuery5: TADOQuery;
    DataSource5: TDataSource;
    DBGrid5: TDBGrid;
    ADOQuery5IDI: TAutoIncField;
    ADOQuery5IName: TWideStringField;
    ADOQuery5idS: TIntegerField;
    ADOQuery5Numb: TIntegerField;
    ADOQuery5BDate: TDateTimeField;
    ADOQuery5Gender: TWideStringField;
    ADOQuery5sName: TStringField;
    DBGrid6: TDBGrid;
    ADOQuery6: TADOQuery;
    DataSource6: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


end.
