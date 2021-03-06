unit addpublisher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Taddpublisherform = class(TForm)
    hideaddpubformbtn: TButton;
    procedure hideaddpubformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addpublisherform: Taddpublisherform;

implementation

{$R *.dfm}

uses main;

procedure Taddpublisherform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  addpublisherform.Hide;
  mainform.Show;
end;

procedure Taddpublisherform.FormCreate(Sender: TObject);
begin
  addpublisherform.position:=podesktopcenter;
end;

procedure Taddpublisherform.hideaddpubformbtnClick(Sender: TObject);
begin
  addpublisherform.Hide;
  mainform.Show;
end;

end.
