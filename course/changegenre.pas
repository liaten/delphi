unit changegenre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tchangegenreform = class(TForm)
    changegenreformhidebtn: TButton;
    procedure changegenreformhidebtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changegenreform: Tchangegenreform;

implementation

{$R *.dfm}

uses main;

procedure Tchangegenreform.changegenreformhidebtnClick(Sender: TObject);
begin
  mainform.Show;
  changegenreform.Hide;
end;

procedure Tchangegenreform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  mainform.Show;
  changegenreform.Hide;
end;

procedure Tchangegenreform.FormCreate(Sender: TObject);
begin
  changegenreform.position:=podesktopcenter;
end;

end.
