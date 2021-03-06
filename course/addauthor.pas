unit addauthor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Taddauthorform = class(TForm)
    hideaddauthorform: TButton;
    procedure hideaddauthorformClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addauthorform: Taddauthorform;

implementation

{$R *.dfm}

uses main;

procedure Taddauthorform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  addauthorform.Hide;
  mainform.Show;
end;

procedure Taddauthorform.FormCreate(Sender: TObject);
begin
  addauthorform.position:=podesktopcenter;
end;

procedure Taddauthorform.hideaddauthorformClick(Sender: TObject);
begin
  addauthorform.Hide;
  mainform.Show;
end;

end.
