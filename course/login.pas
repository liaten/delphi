unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Menus;

type
  Tloginform = class(TForm)
    loginbtn: TButton;
    terminatebtn: TButton;
    loginlabel: TLabel;
    passlabel: TLabel;
    authmsg: TLabel;
    loginedit: TEdit;
    clearbtn: TButton;
    passedit: TEdit;
    loginquery: TADOQuery;
    chooseuser: TADOQuery;
    usertypequery: TADOQuery;
    MainMenu1: TMainMenu;
    help: TMenuItem;
    dbmsg: TLabel;
    procedure loginbtnClick(Sender: TObject);
    procedure terminatebtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure clearbtnClick(Sender: TObject);
    procedure helpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  //org:integer;
    { Public declarations }
  end;

var
//????? ???????????? ? ?????? ????? ??????????, ??????? ?? ??????????, ? ????? ?????????? ? ???, ??? ? ???????? ?????
  loginform: Tloginform;
  usertype:integer;
  username:string;
  orgname:string;
  surname:string;
  name:string;
  idstaff:integer;
  org:integer;

implementation

{$R *.dfm}
uses main,loginhelp,storage,puborder;

procedure Tloginform.clearbtnClick(Sender: TObject);
var i:integer;
begin
  for i := 0 to loginform.controlcount-1 do
  begin
    if loginform.controls[i] is tedit then
      (loginform.controls[i] as tedit).text:='';
  end;

end;

procedure Tloginform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  halt;
end;

procedure Tloginform.FormCreate(Sender: TObject);
begin
  loginform.position:=podesktopcenter;
  loginform.Width:=734;
  loginform.Height:=348;
  authmsg.Left:=loginform.clientwidth div 2-(authmsg.width div 2);
  clearbtn.Left:=loginform.clientwidth div 2-(clearbtn.width div 2);
  loginlabel.Left:=authmsg.Left;
  passlabel.left:=authmsg.Left;
end;

procedure Tloginform.FormResize(Sender: TObject);
begin
  loginform.Width:=734;
  loginform.Height:=348;
end;

procedure Tloginform.FormShow(Sender: TObject);
begin
  usertypequery.Connection:=mainform.conn;
  chooseuser.Connection:=mainform.conn;
  loginquery.Connection:=mainform.conn;
end;

procedure Tloginform.helpClick(Sender: TObject);
begin
  loginhelpform.Show;
//  loginform.Hide;
end;

procedure Tloginform.loginbtnClick(Sender: TObject);
var i:integer;
begin
  if (loginedit.text<>'') and (passedit.text<>'') then
  begin
    loginquery.Close;
    loginquery.SQL.Clear;
    loginquery.SQL.Add('SELECT * FROM Logins WHERE login=' +#39 + loginedit.Text + #39+'AND password=' + #39 + passedit.Text + #39);
    loginquery.Open;
    if not loginquery.Recordset.EOF then
      begin
        mainform.useridlabel.Caption:='';
        chooseuser.Close;
        chooseuser.SQL.Clear;
        chooseuser.SQL.Add('select staff.sposition as pos,staff.organization as org, staff.id_staff as idstaff from staff,logins where logins.login='+ #39+loginedit.Text+ #39+'and logins.staff=staff.id_staff');
        chooseuser.Open;
        usertype:=chooseuser.FieldByName('pos').AsInteger;  //??? ?????, ?????, ????????, 5 - ?????????????
        idstaff:=chooseuser.FieldByName('idstaff').AsInteger;  //?????????? id ???????????? ? ??????? ????
        org:=chooseuser.FieldByName('org').AsInteger;
        main.org:=org;
        //showmessage(inttostr(org));

        if usertype=5 then
        begin
           mainform.useridlabel.Caption:='??? ID ????????????: '+inttostr(usertype)+'. ';
           mainform.createlogins.Visible:=true;
           mainform.reports.Visible:=true;
           mainform.add.Visible:=true;
           mainform.change.Visible:=true;
           mainform.remove.Visible:=true;
        end
        else if usertype=1 then
        begin
           mainform.reports.Visible:=true;
           mainform.add.Visible:=true;
           mainform.change.Visible:=true;
           mainform.remove.Visible:=true;
        end
        else if usertype=2 then
        begin
           mainform.reports.Visible:=true;
        end
        else if usertype=3 then
        begin
           mainform.add.Visible:=true;
           mainform.change.Visible:=true;
           mainform.remove.Visible:=true;
        end;

        usertypequery.Close;
        usertypequery.sql.Clear;
        usertypequery.SQL.Add('select staffpositions.positionname as posname from staffpositions where staffpositions.id_position=:username_int');
        usertypequery.Parameters.ParamByName('username_int').Value:=usertype;
        usertypequery.Open;
        username:=usertypequery.FieldByName('posname').AsString;
        //mainform.useridlabel.Caption:=mainform.useridlabel.Caption+'???? ?????????: '+username+'.';
        usertypequery.Close;
        usertypequery.SQL.Clear;
        usertypequery.SQL.add('select organization.orgname as org from organization, staff where id_organization=staff.organization and staff.id_staff=:username_int');
        usertypequery.Parameters.ParamByName('username_int').Value:=idstaff;
        usertypequery.Open;
        orgname:=usertypequery.FieldByName('org').AsString;
        mainform.orglabel.Caption:='???? ???????????: '+orgname+'.';
        usertypequery.Close;
        usertypequery.SQL.Clear;
        usertypequery.SQL.add('select staff.sname as name, staff.ssurname as surname from staff where staff.id_staff=:username_int');
        usertypequery.Parameters.ParamByName('username_int').Value:=idstaff;
        usertypequery.Open;
        name:=usertypequery.FieldByName('name').AsString;
        surname:=usertypequery.FieldByName('surname').AsString;
        mainform.label_fio.Caption:='??? ?????: '+name+' '+surname+'.';
        for i := 0 to loginform.controlcount-1 do
        begin
          if loginform.controls[i] is tedit then
          begin
            (loginform.controls[i] as tedit).text:='';
          end;
        end;
        mainform.show;
        loginform.Hide;
      end
    else
      Application.MessageBox('????????? ??? ???????????? ??? ??????','?????? ?????',MB_OK OR MB_ICONWARNING);
  end
  else
  begin
    if (loginedit.text='') and (passedit.text='') then
    begin
      Application.MessageBox('????????? ???? ?????? ? ???? ??????','?????? ?????',MB_OK OR MB_ICONWARNING);
    end
    else if (loginedit.text='') then
    begin
      Application.MessageBox('????????? ???? ??????','?????? ?????',MB_OK OR MB_ICONWARNING);
    end
    else
    begin
      Application.MessageBox('????????? ???? ??????','?????? ?????',MB_OK OR MB_ICONWARNING);
    end;
  end;

end;

procedure Tloginform.terminatebtnClick(Sender: TObject);
begin
  halt;    //????????? ?????????
end;

end.
