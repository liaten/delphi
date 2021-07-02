unit addbook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Taddbookform = class(TForm)
    hideaddbookform: TButton;
    procedure hideaddbookformClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addbookform: Taddbookform;

implementation

{$R *.dfm}

uses main;

procedure Taddbookform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  addbookform.Hide;
  mainform.Show;
end;

procedure Taddbookform.FormCreate(Sender: TObject);
begin
  addbookform.position:=podesktopcenter;
end;

procedure Taddbookform.hideaddbookformClick(Sender: TObject);
begin
  addbookform.Hide;
  mainform.Show;
end;

end.
