unit clientorder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, Vcl.ComCtrls;

type
  Tclientorderform = class(TForm)
    hideclientform: TButton;
    clientorderquery: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    creationdatelabel: TLabel;
    cdtp: TDateTimePicker;
    clientidlabel: TLabel;
    clientidedit: TEdit;
    clientnamelabel: TLabel;
    clientnameedit: TEdit;
    bookidlabel: TLabel;
    bookidedit: TEdit;
    booknamelabel: TLabel;
    booknameedit: TEdit;
    paymentmethodlabel: TLabel;
    paymentmethodedit: TEdit;
    surnamelabel: TLabel;
    clientsurnameedit: TEdit;
    quantitylabel: TLabel;
    quantityedit: TEdit;
    addcobtn: TButton;
    removecobtn: TButton;
    editcobtn: TButton;
    searchquery: TADOQuery;
    paymentmethodnamelabel: TLabel;
    paymentmethodnameedit: TEdit;
    dltp: TDateTimePicker;
    deadlinelabel: TLabel;
    clientorderlabel: TLabel;
    orderidedit: TEdit;
    clearbtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure hideclienordertformhidebtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clientideditChange(Sender: TObject);
    procedure bookideditChange(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure addcobtnClick(Sender: TObject);
    procedure paymentmethodeditChange(Sender: TObject);
    procedure editcobtnClick(Sender: TObject);
    procedure quantityeditChange(Sender: TObject);
    procedure removecobtnClick(Sender: TObject);
    procedure dltpChange(Sender: TObject);
    procedure cdtpChange(Sender: TObject);
    procedure clearbtnClick(Sender: TObject);
  private
  sortflag:boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clientorderform: Tclientorderform;

implementation

{$R *.dfm}

uses main,login;

function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X);
end;

procedure Tclientorderform.addcobtnClick(Sender: TObject);
begin
  if isinteger(orderidedit.text) then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from clientorder where id_client_order=:orderid and organization=:orgg');
    searchquery.Parameters.ParamByName('orderid').Value:=strtoint(orderidedit.Text);
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
      Application.MessageBox('?????? ??? ??????????, ?????????????? ??????? ????????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end
    else
    begin
      if strtoint(quantityedit.text)>0 then
      begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('insert into clientorder (creationdate,deadline,client,staff,book,methodofpayment,quantity,organization)');
        searchquery.SQL.Add('values (:crdate,:ddln,:client,:staff,:bok,:met,:quan,:orgg)');
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Parameters.ParamByName('crdate').Value:=DateToStr(cdtp.Date);
        searchquery.Parameters.ParamByName('ddln').Value:=DateToStr(dltp.Date);
        searchquery.Parameters.ParamByName('client').Value:=clientidedit.Text;
        searchquery.Parameters.ParamByName('staff').Value:=login.idstaff;
        searchquery.Parameters.ParamByName('bok').Value:=bookidedit.Text;
        searchquery.Parameters.ParamByName('met').Value:=paymentmethodedit.Text;
        searchquery.Parameters.ParamByName('quan').Value:=quantityedit.Text;
        searchquery.ExecSQL;
        clientorderquery.Close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        clientorderquery.Open;
      end
      else
      begin
        Application.MessageBox('?????????? ?????? ???? ?????? 0','?????? ??????????',MB_OK OR MB_ICONWARNING);
      end;
    end;
  end
  else
    begin
      if strtoint(quantityedit.text)>0 then
      begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('insert into clientorder (creationdate,deadline,client,staff,book,methodofpayment,quantity,organization)');
        searchquery.SQL.Add('values (:crdate,:ddln,:client,:staff,:bok,:met,:quan,:orgg)');
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Parameters.ParamByName('crdate').Value:=DateToStr(cdtp.Date);
        searchquery.Parameters.ParamByName('ddln').Value:=DateToStr(dltp.Date);
        searchquery.Parameters.ParamByName('client').Value:=clientidedit.Text;
        searchquery.Parameters.ParamByName('staff').Value:=login.idstaff;
        searchquery.Parameters.ParamByName('bok').Value:=bookidedit.Text;
        searchquery.Parameters.ParamByName('met').Value:=paymentmethodedit.Text;
        searchquery.Parameters.ParamByName('quan').Value:=quantityedit.Text;
        searchquery.ExecSQL;
        clientorderquery.Close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        clientorderquery.Open;
      end
      else
      begin
        Application.MessageBox('?????????? ?????? ???? ?????? 0','?????? ??????????',MB_OK OR MB_ICONWARNING);
      end;
    end;

end;

procedure Tclientorderform.bookideditChange(Sender: TObject);
var bp:integer;
bname:string;
begin
  if isinteger(bookidedit.text) then
  begin
    searchquery.Close;
    searchquery.sql.Clear;
    bp:=strtoint(bookidedit.text);
    searchquery.SQL.Add('select books.bookname as bname from bookpublisher,books');
    searchquery.SQL.Add('where bookpublisher.id_book_publisher=:bp and bookpublisher.book=books.id_book');
    searchquery.Parameters.ParamByName('bp').Value:=bp;
    searchquery.Open;
    bname:=searchquery.FieldByName('bname').AsString;
    booknameedit.Text:=bname;
  end
  else
  begin
    booknameedit.Text:='';
    bookidedit.text:='';
  end;
end;

procedure Tclientorderform.cdtpChange(Sender: TObject);
begin
  if dltp.Date<cdtp.date then
  begin
    Application.MessageBox('???? ?????? ?? ????? ???? ??????, ??? ???? ????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    dltp.Date:=cdtp.date;
  end;
end;

procedure Tclientorderform.clearbtnClick(Sender: TObject);
var i:integer;
begin
  for i := 0 to clientorderform.controlcount-1 do
  begin
    if clientorderform.controls[i] is tedit then
      (clientorderform.controls[i] as tedit).text:='';
  end;
  cdtp.Date:=now();
  dltp.Date:=cdtp.Date+20;
end;

procedure Tclientorderform.clientideditChange(Sender: TObject);
var cl:integer;
clname:string;
begin
  if isinteger(clientidedit.text) then
  begin
    searchquery.Close;
    searchquery.sql.Clear;
    cl:=strtoint(clientidedit.text);
    searchquery.SQL.Add('select cname, csurname from client where id_client=:cl');
    searchquery.Parameters.ParamByName('cl').Value:=cl;
    searchquery.Open;
    if not searchquery.Recordset.EOF then
    begin
      clname:=searchquery.FieldByName('cname').AsString;
      clientnameedit.Text:=clname;
      clname:=searchquery.FieldByName('csurname').AsString;
      clientsurnameedit.Text:=clname;
      end
    else
    begin
      Application.MessageBox('??? ????? ??????? ? ???? ?????? ??? ???????','?????? ????????',MB_OK OR MB_ICONWARNING);
    end;

  end
  else
  begin
    clientidedit.Text:='';
    clientnameedit.text:='';
    clientsurnameedit.Text:='';
  end;
end;

procedure Tclientorderform.DBGrid1CellClick(Column: TColumn);
begin
  clientidedit.Text:=clientorderquery['client'];              //id ???????
  cdtp.Date:=clientorderquery['creationdate'];                //???? ????????
  dltp.Date:=clientorderquery['deadline'];                    //???????
  bookidedit.Text:=clientorderquery['book'];                  //id ?????
  paymentmethodedit.Text:=clientorderquery['methodofpayment'];//?????? ?????? - ID
  quantityedit.Text:=clientorderquery['quantity'];            //??????????
  orderidedit.Text:=clientorderquery['id_client_order'];     //id ??????

end;

procedure Tclientorderform.DBGrid1TitleClick(Column: TColumn);
var
   S:string;
begin
  s:=column.FieldName;
  clientorderquery.Close;
  if
    sortflag=true
  then
  begin
    clientorderquery.SQL.Clear;
    clientorderquery.SQL.Add('select * from clientorder where organization=:orgg');
    clientorderquery.Parameters.ParamByName('orgg').Value:=login.org;
    clientorderquery.SQL.Add('order by '+s+' asc');
  end
  else
    begin
    clientorderquery.SQL.Clear;
    clientorderquery.SQL.Add('select * from clientorder where organization=:orgg');
    clientorderquery.Parameters.ParamByName('orgg').Value:=login.org;
    clientorderquery.SQL.Add('order by '+s+' desc');
    end;

  sortflag:=not(sortflag);
  clientorderquery.Open;
end;

procedure Tclientorderform.dltpChange(Sender: TObject);
begin
  if dltp.Date<cdtp.date then
  begin
    Application.MessageBox('???? ?????? ?? ????? ???? ??????, ??? ???? ????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    dltp.Date:=cdtp.date;
  end;

end;

procedure Tclientorderform.editcobtnClick(Sender: TObject);
begin
  if (clientnameedit.Text<>'') and (clientsurnameedit.Text<>'') and (booknameedit.Text<>'') and (paymentmethodnameedit.Text<>'') and (quantityedit.Text<>'')  then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from clientorder where organization=:orgg and id_client_order=:idco');
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.Parameters.ParamByName('idco').Value:=orderidedit.Text;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('update clientorder set creationdate=:cd, deadline=:ddln, client=:cl, book=:bok, methodofpayment=:mpmt, quantity=:quan');
        searchquery.SQL.Add('where organization=:orgg and id_client_order=:idco');
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Parameters.ParamByName('idco').Value:=orderidedit.Text;
        searchquery.Parameters.ParamByName('cd').Value:=datetostr(cdtp.Date);
        searchquery.Parameters.ParamByName('ddln').Value:=datetostr(dltp.Date);
        searchquery.Parameters.ParamByName('cl').Value:=clientidedit.Text;
        searchquery.Parameters.ParamByName('bok').Value:=bookidedit.Text;
        searchquery.Parameters.ParamByName('mpmt').Value:=paymentmethodedit.Text;
        searchquery.Parameters.ParamByName('quan').Value:=quantityedit.Text;
        searchquery.execsql;
        clientorderquery.close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        clientorderquery.Open;
    end
    else
    begin
      Application.MessageBox('??????? ?????? ?? ??????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
  end
  else
  begin
    if (clientnameedit.Text='') or (clientsurnameedit.Text='') then
    begin
      Application.MessageBox('?? ?????? ??????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;
    if (booknameedit.Text='') then
    begin
      Application.MessageBox('?? ??????? ?????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;
    if (paymentmethodnameedit.Text='') then
    begin
      Application.MessageBox('?? ?????? ??? ??????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;
    if (quantityedit.Text='') then
    begin
      Application.MessageBox('?? ??????? ?????????? ????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end;

  end;

end;

procedure Tclientorderform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  var i:integer;
begin
  clientorderform.Hide;
  mainform.Show;
  for i := 0 to clientorderform.controlcount-1 do
  begin
    if clientorderform.controls[i] is tedit then
      (clientorderform.controls[i] as tedit).text:='';
  end;
end;

procedure Tclientorderform.FormCreate(Sender: TObject);
begin
  clientorderform.position:=podesktopcenter;
  cdtp.Date:=now;
  dltp.Date:=now+20;
  editcobtn.Left:=(addcobtn.left+removecobtn.Left) div 2;
end;

procedure Tclientorderform.FormHide(Sender: TObject);
var i:integer;
begin
  clientorderquery.close;
  for i := 0 to clientorderform.controlcount-1 do
  begin
    if clientorderform.controls[i] is tedit then
      (clientorderform.controls[i] as tedit).text:='';
  end;
end;

procedure Tclientorderform.FormShow(Sender: TObject);
begin
  clientorderquery.Connection:=mainform.conn;
  searchquery.Connection:=mainform.conn;
  sortflag:=true;
  clientorderquery.SQL.Clear;
  clientorderquery.SQL.Add('select * from clientorder where organization=:orgg');
  clientorderquery.Parameters.ParamByName('orgg').Value:=login.org;
  clientorderquery.Open;
end;

procedure Tclientorderform.hideclienordertformhidebtnClick(Sender: TObject);
begin
  clientorderform.Hide;
  mainform.Show;
end;

procedure Tclientorderform.paymentmethodeditChange(Sender: TObject);
var pm:integer;
pmname:string;
begin
  if isinteger(paymentmethodedit.text) then
  begin
    searchquery.Close;
    searchquery.sql.Clear;
    pm:=strtoint(paymentmethodedit.text);
    searchquery.SQL.Add('select PaymentTypeName as pmname from MethodOfPayment where ID_Payment=:pm');
    searchquery.Parameters.ParamByName('pm').Value:=pm;
    searchquery.Open;
    pmname:=searchquery.FieldByName('pmname').AsString;
    paymentmethodnameedit.Text:=pmname;
  end
  else
  begin
    paymentmethodedit.Text:='';
    paymentmethodnameedit.text:='';
  end;
end;

procedure Tclientorderform.quantityeditChange(Sender: TObject);
begin
  if not(isinteger(quantityedit.Text)) then
  begin
    quantityedit.Text:='';
  end;

end;

procedure Tclientorderform.removecobtnClick(Sender: TObject);
begin
  if orderidedit.text<>'' then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from clientorder where organization=:orgg and id_client_order=:idco');
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.Parameters.ParamByName('idco').Value:=orderidedit.Text;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
      searchquery.Close;
      searchquery.SQL.Clear;
      searchquery.SQL.Add('delete from clientorder');
      searchquery.SQL.Add(' where organization=:orgg and id_client_order=:idco');
      searchquery.Parameters.ParamByName('orgg').Value:=login.org;
      searchquery.Parameters.ParamByName('idco').Value:=orderidedit.Text;
      searchquery.execsql;
      clientorderquery.close;
      mainform.conn.Connected:=false;
      mainform.conn.Connected:=true;
      clientorderquery.open;
    end
    else
    begin
      Application.MessageBox('? ??????? ?? ?????? ????? ??? ????????','?????? ????????',MB_OK OR MB_ICONWARNING);
    end;
  end
  else
  begin
    Application.MessageBox('??????? ???????? ????? ? ???????','?????? ????????',MB_OK OR MB_ICONWARNING);
  end;
end;

end.
