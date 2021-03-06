unit mainhelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tmainhelpform = class(TForm)
    hidehelp: TButton;
    mhmemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure hidehelpClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mhmemoEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainhelpform: Tmainhelpform;

implementation

{$R *.dfm}

procedure Tmainhelpform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  mainhelpform.Hide;
end;

procedure Tmainhelpform.FormCreate(Sender: TObject);
begin
  mainhelpform.Width:=730;
  mainhelpform.Height:=376;
  mainhelpform.position:=podesktopcenter;
  hidehelp.Left:=mainhelpform.ClientWidth div 2 - (hidehelp.Width div 2);
  hidehelp.Top:=mainhelpform.ClientHeight - hidehelp.Height-8;
  mhmemo.Top:=0;
  mhmemo.Left:=0;
  mhmemo.Width:=mainhelpform.ClientWidth;
  mhmemo.height:=mainhelpform.clientheight-hidehelp.Height-16;
end;

procedure Tmainhelpform.FormResize(Sender: TObject);
begin
  mainhelpform.Width:=730;
  mainhelpform.Height:=376;
end;

procedure Tmainhelpform.hidehelpClick(Sender: TObject);
begin
  mainhelpform.hide;
end;

procedure Tmainhelpform.mhmemoEnter(Sender: TObject);
begin
  mainhelpform.ActiveControl:=nil;
end;

end.
