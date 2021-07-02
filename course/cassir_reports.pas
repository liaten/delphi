unit cassir_reports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tcassirreportsform = class(TForm)
    hidecassirreports: TButton;
    procedure hidecassirreportsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cassirreportsform: Tcassirreportsform;

implementation

{$R *.dfm}

uses main;
procedure Tcassirreportsform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  cassirreportsform.Hide;
  mainform.Show;
end;

procedure Tcassirreportsform.FormCreate(Sender: TObject);
begin
  cassirreportsform.position:=podesktopcenter;
end;

procedure Tcassirreportsform.hidecassirreportsClick(Sender: TObject);
begin
  cassirreportsform.Hide;
  mainform.Show;
end;

end.
