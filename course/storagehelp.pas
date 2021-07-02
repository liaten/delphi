unit storagehelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tstoragehelpform = class(TForm)
    storagehelpmemo: TMemo;
    hidebtn: TButton;
    procedure hidebtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure storagehelpmemoEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  storagehelpform: Tstoragehelpform;

implementation

{$R *.dfm}

procedure Tstoragehelpform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  storagehelpform.Hide;
end;

procedure Tstoragehelpform.FormCreate(Sender: TObject);
begin
  hidebtn.Left:=(storagehelpform.ClientWidth div 2) - (hidebtn.Width div 2);
  hidebtn.Top:=storagehelpform.ClientHeight - hidebtn.Height - 8;
  storagehelpmemo.Top:=8;
  storagehelpmemo.Left:=8;
  storagehelpmemo.Width:=storagehelpform.ClientWidth - 16;
  storagehelpmemo.Height:=storagehelpform.ClientHeight-24-hidebtn.Height;
end;

procedure Tstoragehelpform.FormResize(Sender: TObject);
begin
  storagehelpform.Width:=767;
  storagehelpform.Height:=413;
end;

procedure Tstoragehelpform.hidebtnClick(Sender: TObject);
begin
  storagehelpform.Hide;
end;

procedure Tstoragehelpform.storagehelpmemoEnter(Sender: TObject);
begin
    storagehelpform.ActiveControl:=nil;
end;

end.
