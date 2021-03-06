unit clients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, Vcl.ComCtrls;

type
  Tclientsform = class(TForm)
    hideclients: TButton;
    clientsquery: TADOQuery;
    clientsgrid: TDBGrid;
    clientsource: TDataSource;
    clnlbl: TLabel;
    clsnlbl: TLabel;
    pnlbl: TLabel;
    addresslbl: TLabel;
    dbrlbl: TLabel;
    nameedit: TEdit;
    surnameedit: TEdit;
    pnedit: TEdit;
    addressedit: TEdit;
    bdtp: TDateTimePicker;
    add: TButton;
    clear: TButton;
    delete: TButton;
    change: TButton;
    clientidlbl: TLabel;
    clientidedit: TEdit;
    searchquery: TADOQuery;
    procedure hideclientsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure bdtpChange(Sender: TObject);
    procedure clearClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure clientsgridTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure clientsgridCellClick(Column: TColumn);
    procedure deleteClick(Sender: TObject);
    procedure changeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clientsform: Tclientsform;
  mainornot:boolean;
  sortflag:boolean;

implementation

{$R *.dfm}

uses main,buy;

procedure Tclientsform.addClick(Sender: TObject);
begin
  if (nameedit.Text<>'') and (surnameedit.Text<>'') and (pnedit.Text<>'') and (addressedit.Text<>'') then
  begin
    if clientidedit.text<>'' then
    begin
      searchquery.Close;
      searchquery.SQL.Clear;
      searchquery.SQL.Add('select * from client where id_client=:idc');
      searchquery.Parameters.ParamByName('idc').Value:=strtoint(clientidedit.Text);
      searchquery.open;
      if not searchquery.Recordset.EOF then
      begin
        Application.MessageBox('?????? ??? ??????????, ?????????????? ??????? ????????','?????? ??????????',MB_OK OR MB_ICONWARNING);
      end
      else
      begin
          searchquery.Close;
          searchquery.SQL.Clear;
          searchquery.SQL.Add('insert into client (CName, CSurname, PhoneNum, Address, DateOfBirth)');
          searchquery.SQL.Add('values (:name, :surname, :pn, :addr, :dob)');
          searchquery.Parameters.ParamByName('name').Value:=nameedit.Text;
          searchquery.Parameters.ParamByName('surname').Value:=surnameedit.Text;
          searchquery.Parameters.ParamByName('pn').Value:=pnedit.Text;
          searchquery.Parameters.ParamByName('addr').Value:=addressedit.Text;
          searchquery.Parameters.ParamByName('dob').Value:=DateToStr(bdtp.date);
          searchquery.ExecSQL;
          clientsquery.Close;
          mainform.conn.Connected:=false;
          mainform.conn.Connected:=true;
          clientsquery.Open;
      end;
    end
    else
    begin
          searchquery.Close;
          searchquery.SQL.Clear;
          searchquery.SQL.Add('insert into client (CName, CSurname, PhoneNum, Address, DateOfBirth)');
          searchquery.SQL.Add('values (:name, :surname, :pn, :addr, :dob)');
          searchquery.Parameters.ParamByName('name').Value:=nameedit.Text;
          searchquery.Parameters.ParamByName('surname').Value:=surnameedit.Text;
          searchquery.Parameters.ParamByName('pn').Value:=pnedit.Text;
          searchquery.Parameters.ParamByName('addr').Value:=addressedit.Text;
          searchquery.Parameters.ParamByName('dob').Value:=DateToStr(bdtp.date);
          searchquery.ExecSQL;
          clientsquery.Close;
          mainform.conn.Connected:=false;
          mainform.conn.Connected:=true;
          clientsquery.Open;
    end;
    

  end
  else
  begin
    if nameedit.Text='' then
    begin
      Application.MessageBox('?? ??????? ???','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;
    if surnameedit.Text='' then
    begin
      Application.MessageBox('?? ??????? ???????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;
    if pnedit.Text='' then
    begin
      Application.MessageBox('?? ?????? ????? ????????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;
    if addressedit.Text='' then
    begin
      Application.MessageBox('?? ?????? ?????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;
  end;
end;

procedure Tclientsform.bdtpChange(Sender: TObject);
begin
  if bdtp.Date>now() then
  begin
    Application.MessageBox('???? ???????? ?? ????? ???? ????? ?????????? ???????','??????',MB_OK OR MB_ICONWARNING);
    bdtp.Date:=now();
  end;
end;

procedure Tclientsform.changeClick(Sender: TObject);
begin
  if (clientidedit.Text<>'') and (nameedit.Text<>'') and (surnameedit.Text<>'') and (pnedit.Text<>'') and (addressedit.Text<>'') then
  begin
      searchquery.Close;
      searchquery.SQL.Clear;
      searchquery.SQL.Add('select * from client where id_client=:idc');
      searchquery.Parameters.ParamByName('idc').Value:=clientidedit.Text;
      searchquery.open;
      if not searchquery.Recordset.EOF then
      begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('update client set cname=:cn, csurname=:cs, phonenum=:pn, address=:ad, dateofbirth=:dob');
        searchquery.SQL.Add('where id_client=:idc');
        searchquery.Parameters.ParamByName('idc').Value:=clientidedit.Text;
        searchquery.Parameters.ParamByName('cn').Value:=nameedit.Text;        
        searchquery.Parameters.ParamByName('cs').Value:=surnameedit.Text; 
        searchquery.Parameters.ParamByName('pn').Value:=pnedit.Text;
        searchquery.Parameters.ParamByName('ad').Value:=addressedit.Text;
        searchquery.Parameters.ParamByName('dob').Value:=datetostr(bdtp.Date); 
        searchquery.execsql;
        clientsquery.close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        clientsquery.Open;
      end;
  end
  else
  begin
    if clientidedit.Text='' then
    begin
      Application.MessageBox('?? ?????? ??????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
    if nameedit.Text='' then
    begin
      Application.MessageBox('?? ??????? ???','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
    if surnameedit.Text='' then
    begin
      Application.MessageBox('?? ??????? ???????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
    if pnedit.Text='' then
    begin
      Application.MessageBox('?? ?????? ????? ????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
    if addressedit.Text='' then
    begin
      Application.MessageBox('?? ?????? ?????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
  end;
  
end;

procedure Tclientsform.clearClick(Sender: TObject);
var i: integer;
begin
  bdtp.Date:=now();
  for i := 0 to clientsform.controlcount-1 do
  begin
    if clientsform.controls[i] is tedit then
    begin
      (clientsform.controls[i] as tedit).text:='';
    end;
  end;
end;

procedure Tclientsform.clientsgridCellClick(Column: TColumn);
begin
  clientidedit.Text:=clientsquery['id_client'];
  nameedit.Text:=clientsquery['cname'];
  surnameedit.Text:=clientsquery['csurname'];
  pnedit.Text:=clientsquery['phonenum'];
  addressedit.Text:=clientsquery['address'];
  bdtp.Date:=clientsquery['dateofbirth'];
end;

procedure Tclientsform.clientsgridTitleClick(Column: TColumn);
var
  s:string;
begin
  s:=column.FieldName;
  clientsquery.Close;
  if
    sortflag=true
  then
  begin
      clientsquery.SQL.Clear;
      clientsquery.SQL.Add('select * from client');
      clientsquery.SQL.Add(' order by '+s+' asc');
  end
  else
    begin
      clientsquery.SQL.Clear;
      clientsquery.SQL.Add('select * from client');
      clientsquery.SQL.Add(' order by '+s+' desc');
    end;
  sortflag:=not(sortflag);
  clientsquery.Open;
end;

procedure Tclientsform.deleteClick(Sender: TObject);
begin
  if clientidedit.Text<>'' then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from client where id_client=:idc');
    searchquery.Parameters.ParamByName('idc').Value:=clientidedit.Text;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
      searchquery.Close;
      searchquery.SQL.Clear;
      searchquery.SQL.Add('delete from client');
      searchquery.SQL.Add('where id_client=:idc');
      searchquery.Parameters.ParamByName('idc').Value:=clientidedit.Text;
      searchquery.execsql;
      clientsquery.close;
      mainform.conn.Connected:=false;
      mainform.conn.Connected:=true;
      clientsquery.open;
    end
    else
    begin
      Application.MessageBox('? ??????? ?? ?????? ????? ??? ????????','?????? ????????',MB_OK OR MB_ICONWARNING);
    end;
  end
  else
  begin
    Application.MessageBox('??????? ???????? ??????? ? ???????','?????? ????????',MB_OK OR MB_ICONWARNING);
  end;
end;

procedure Tclientsform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if mainornot=true then
  begin
    mainform.Show;
  end;
  clientsform.Hide;
end;

procedure Tclientsform.FormCreate(Sender: TObject);
begin
  bdtp.Date:=now();
end;

procedure Tclientsform.FormShow(Sender: TObject);
begin
  sortflag:=true;
  clientsquery.Open;
end;

procedure Tclientsform.hideclientsClick(Sender: TObject);
begin
  if mainornot=true then
  begin
    mainform.Show;
    clientsform.Hide;  
  end
  else
  begin
    clientsform.Hide;
    buyform.buyquery.Open;
    buyform.coquery.Open; 
  end;
end;

end.
