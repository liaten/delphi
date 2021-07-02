unit removebooktype;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tremovebooktypeform = class(TForm)
    removebooktypehidebtn: TButton;
    procedure removebooktypehidebtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  removebooktypeform: Tremovebooktypeform;

implementation

{$R *.dfm}

uses main;

procedure Tremovebooktypeform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  removebooktypeform.Hide;
  mainform.Show;
end;

procedure Tremovebooktypeform.FormCreate(Sender: TObject);
begin
  removebooktypeform.position:=podesktopcenter;
end;

procedure Tremovebooktypeform.removebooktypehidebtnClick(Sender: TObject);
begin
  removebooktypeform.Hide;
  mainform.Show;
end;

end.
