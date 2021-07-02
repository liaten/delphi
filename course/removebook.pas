unit removebook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tremovebookform = class(TForm)
    removebookformbtn: TButton;
    procedure removebookformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  removebookform: Tremovebookform;

implementation

{$R *.dfm}

uses main;

procedure Tremovebookform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  removebookform.Hide;
  mainform.show;
end;

procedure Tremovebookform.FormCreate(Sender: TObject);
begin
  removebookform.position:=podesktopcenter;
end;

procedure Tremovebookform.removebookformbtnClick(Sender: TObject);
begin
  removebookform.Hide;
  mainform.show;
end;

end.
