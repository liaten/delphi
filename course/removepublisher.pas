unit removepublisher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tremovepublisherform = class(TForm)
    removepublisherformbtn: TButton;
    procedure removepublisherformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  removepublisherform: Tremovepublisherform;

implementation

{$R *.dfm}

uses main;

procedure Tremovepublisherform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  removepublisherform.Hide;
  mainform.Show;
end;

procedure Tremovepublisherform.FormCreate(Sender: TObject);
begin
  removepublisherform.position:=podesktopcenter;
end;

procedure Tremovepublisherform.removepublisherformbtnClick(Sender: TObject);
begin
  removepublisherform.Hide;
  mainform.Show;
end;

end.
