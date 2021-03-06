unit addcover;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Taddcoverform = class(TForm)
    hideaddcoverbtn: TButton;
    procedure hideaddcoverbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addcoverform: Taddcoverform;

implementation

{$R *.dfm}

uses main;

procedure Taddcoverform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  addcoverform.Hide;
  mainform.Show;
end;

procedure Taddcoverform.FormCreate(Sender: TObject);
begin
  addcoverform.position:=podesktopcenter;
end;

procedure Taddcoverform.hideaddcoverbtnClick(Sender: TObject);
begin
  addcoverform.Hide;
  mainform.Show;
end;

end.
