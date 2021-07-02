unit removecover;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tremovecoverform = class(TForm)
    removecoverformhidebtn: TButton;
    procedure removecoverformhidebtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  removecoverform: Tremovecoverform;

implementation

{$R *.dfm}

uses main;

procedure Tremovecoverform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  removecoverform.Hide;
  mainform.Show;
end;

procedure Tremovecoverform.FormCreate(Sender: TObject);
begin
  removecoverform.position:=podesktopcenter;
end;

procedure Tremovecoverform.removecoverformhidebtnClick(Sender: TObject);
begin
  removecoverform.Hide;
  mainform.Show;
end;

end.
