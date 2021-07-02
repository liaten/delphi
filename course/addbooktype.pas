unit addbooktype;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Taddbooktypeform = class(TForm)
    hideaddbooktypeformbtn: TButton;
    procedure hideaddbooktypeformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addbooktypeform: Taddbooktypeform;

implementation

{$R *.dfm}

uses main;

procedure Taddbooktypeform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  addbooktypeform.Hide;
  mainform.Show;
end;

procedure Taddbooktypeform.FormCreate(Sender: TObject);
begin
  addbooktypeform.position:=podesktopcenter;
end;

procedure Taddbooktypeform.hideaddbooktypeformbtnClick(Sender: TObject);
begin
  addbooktypeform.Hide;
  mainform.Show;
end;

end.
