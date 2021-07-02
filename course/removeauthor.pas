unit removeauthor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tremoveauthorform = class(TForm)
    removeauthorformbtnhide: TButton;
    procedure removeauthorformbtnhideClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  removeauthorform: Tremoveauthorform;

implementation

{$R *.dfm}

uses main;

procedure Tremoveauthorform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  removeauthorform.Hide;
  mainform.show;
end;

procedure Tremoveauthorform.FormCreate(Sender: TObject);
begin
  removeauthorform.position:=podesktopcenter;
end;

procedure Tremoveauthorform.removeauthorformbtnhideClick(Sender: TObject);
begin
  removeauthorform.Hide;
  mainform.show;
end;

end.
