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
    DataSource4: TDataSource;
    DBGrid4: TDBGrid;
    Label4: TLabel;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1Change(Sender: TObject);
begin
  //adoquery4.locate('iname',edit1.text,[lopartialkey]);
  adoquery4.Close;
  ADOQuery4.SQL.Text:='select * from individual where iName like'+
  #39+'%'+edit1.text+'%'+#39;
  ADOQuery4.Open;
end;

end.
