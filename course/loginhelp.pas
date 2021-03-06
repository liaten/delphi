unit loginhelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tloginhelpform = class(TForm)
    helpmemo: TMemo;
    tologin: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tologinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure helpmemoEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginhelpform: Tloginhelpform;

implementation

{$R *.dfm}

procedure Tloginhelpform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  loginhelpform.hide;
end;

procedure Tloginhelpform.FormCreate(Sender: TObject);
begin
  loginhelpform.Height:=338;
  loginhelpform.Width:=651;
  loginhelpform.position:=podesktopcenter;
  helpmemo.Left:=0;
  helpmemo.Width:=loginhelpform.ClientWidth;
  helpmemo.Top:=0;
  tologin.Left:=(loginhelpform.clientwidth div 2) - (tologin.Width div 2);
  tologin.Top:=loginhelpform.clientHeight-tologin.Height-8;
  helpmemo.Height:=loginhelpform.ClientHeight-tologin.Height-16;
end;

procedure Tloginhelpform.FormResize(Sender: TObject);
begin
  loginhelpform.Height:=338;
  loginhelpform.Width:=651;
end;

procedure Tloginhelpform.helpmemoEnter(Sender: TObject);
begin
  loginhelpform.ActiveControl:=nil;
end;

procedure Tloginhelpform.tologinClick(Sender: TObject);
begin
  loginhelpform.hide;
end;

end.
