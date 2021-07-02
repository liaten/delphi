unit changepublisher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tchangepublisherform = class(TForm)
    changepublisherformbtn: TButton;
    procedure changepublisherformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changepublisherform: Tchangepublisherform;

implementation

{$R *.dfm}

uses main;

procedure Tchangepublisherform.changepublisherformbtnClick(Sender: TObject);
begin
  mainform.Show;
  changepublisherform.Hide;
end;

procedure Tchangepublisherform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  mainform.Show;
  changepublisherform.Hide;
end;

procedure Tchangepublisherform.FormCreate(Sender: TObject);
begin
  changepublisherform.position:=podesktopcenter;
end;

end.
