unit changecover;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tchangecoverform = class(TForm)
    changecoverformbtn: TButton;
    procedure changecoverformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changecoverform: Tchangecoverform;

implementation

{$R *.dfm}

uses main;

procedure Tchangecoverform.changecoverformbtnClick(Sender: TObject);
begin
  mainform.Show;
  changecoverform.Hide;
end;

procedure Tchangecoverform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  mainform.Show;
  changecoverform.Hide;
end;

procedure Tchangecoverform.FormCreate(Sender: TObject);
begin
  changecoverform.position:=podesktopcenter;
end;

end.
