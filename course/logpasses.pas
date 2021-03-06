unit logpasses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB;

type
  Tlogpassesform = class(TForm)
    hidelogpasses: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure hidelogpassesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  logpassesform: Tlogpassesform;

implementation

{$R *.dfm}

uses main,login;
procedure Tlogpassesform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  logpassesform.Hide;
  mainform.Show;
end;

procedure Tlogpassesform.FormCreate(Sender: TObject);
begin
  logpassesform.position:=podesktopcenter;
end;

procedure Tlogpassesform.hidelogpassesClick(Sender: TObject);
begin
  logpassesform.Hide;
  mainform.Show;
end;

end.
