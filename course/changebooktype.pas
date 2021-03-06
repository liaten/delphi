unit changebooktype;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tchangebooktypeform = class(TForm)
    changebooktypeformhidebtn: TButton;
    procedure changebooktypeformhidebtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changebooktypeform: Tchangebooktypeform;

implementation

{$R *.dfm}

uses main;

procedure Tchangebooktypeform.changebooktypeformhidebtnClick(Sender: TObject);
begin
  changebooktypeform.Hide;
  mainform.Show;
end;

procedure Tchangebooktypeform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  changebooktypeform.Hide;
  mainform.Show;
end;

procedure Tchangebooktypeform.FormCreate(Sender: TObject);
begin
  changebooktypeform.position:=podesktopcenter;
end;

end.
