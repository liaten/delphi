unit changewriter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tchangewriterform = class(TForm)
    hidechangewriterformbtn: TButton;
    procedure hidechangewriterformbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changewriterform: Tchangewriterform;

implementation

{$R *.dfm}

uses main;

procedure Tchangewriterform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  changewriterform.Hide;
  mainform.Show;
end;

procedure Tchangewriterform.FormCreate(Sender: TObject);
begin
  changewriterform.position:=podesktopcenter;
end;

procedure Tchangewriterform.hidechangewriterformbtnClick(Sender: TObject);
begin
  changewriterform.Hide;
  mainform.Show;
end;

end.
