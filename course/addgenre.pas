unit addgenre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Taddgenreform = class(TForm)
    hidegenreformbtn: TButton;
    procedure hidegenreformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addgenreform: Taddgenreform;

implementation

{$R *.dfm}

uses main;

procedure Taddgenreform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  addgenreform.Hide;
  mainform.Show;
end;

procedure Taddgenreform.FormCreate(Sender: TObject);
begin
  addgenreform.position:=podesktopcenter;
end;

procedure Taddgenreform.hidegenreformbtnClick(Sender: TObject);
begin
  addgenreform.Hide;
  mainform.Show;
end;

end.
