unit shopreports;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tshopreportsform = class(TForm)
    hideshopreportsbtn: TButton;
    procedure hideshopreportsbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  shopreportsform: Tshopreportsform;

implementation

{$R *.dfm}

uses main;

procedure Tshopreportsform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  shopreportsform.Hide;
  mainform.Show;
end;

procedure Tshopreportsform.FormCreate(Sender: TObject);
begin
  shopreportsform.position:=podesktopcenter;
end;

procedure Tshopreportsform.hideshopreportsbtnClick(Sender: TObject);
begin
  shopreportsform.Hide;
  mainform.Show;
end;

end.
