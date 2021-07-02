unit removegenre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tremovegenreform = class(TForm)
    removegenreformhidebtn: TButton;
    procedure removegenreformhidebtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  removegenreform: Tremovegenreform;

implementation

{$R *.dfm}

uses main;

procedure Tremovegenreform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  removegenreform.Hide;
  mainform.Show;
end;

procedure Tremovegenreform.FormCreate(Sender: TObject);
begin
  removegenreform.position:=podesktopcenter;
end;

procedure Tremovegenreform.removegenreformhidebtnClick(Sender: TObject);
begin
  removegenreform.Hide;
  mainform.Show;
end;

end.
