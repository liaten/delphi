unit changebook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tchangebookform = class(TForm)
    hidechangebookbtn: TButton;
    procedure hidechangebookbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  changebookform: Tchangebookform;

implementation

{$R *.dfm}

uses main;

procedure Tchangebookform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  changebookform.Hide;
  mainform.Show;
end;

procedure Tchangebookform.FormCreate(Sender: TObject);
begin
  changebookform.position:=podesktopcenter;
end;

procedure Tchangebookform.hidechangebookbtnClick(Sender: TObject);
begin
  changebookform.Hide;
  mainform.Show;
end;

end.
