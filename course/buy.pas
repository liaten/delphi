unit buy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids;

type
  Tbuyform = class(TForm)
    hidebuy: TButton;
    makebuy: TButton;
    buyquery: TADOQuery;
    storagegrid: TDBGrid;
    buysource: TDataSource;
    idbplabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    booknameedit: TEdit;
    quantityedit: TEdit;
    booknumedit: TEdit;
    Label3: TLabel;
    catalogsearchedit: TEdit;
    clearbtn: TButton;
    searchquery: TADOQuery;
    ordergrid: TDBGrid;
    coquery: TADOQuery;
    cosource: TDataSource;
    paymentmethodlabel: TLabel;
    paymentmethodnamelabel: TLabel;
    paymentmethodedit: TEdit;
    paymentmethodnameedit: TEdit;
    clientidlabel: TLabel;
    clientnamelabel: TLabel;
    surnamelabel: TLabel;
    clientidedit: TEdit;
    clientnameedit: TEdit;
    clientsurnameedit: TEdit;
    newclient: TButton;
    storagelbl: TLabel;
    orderlbl: TLabel;
    clearorder: TButton;
    procedure FormCreate(Sender: TObject);
    procedure hidebuyClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure catalogsearcheditChange(Sender: TObject);
    procedure clearbtnClick(Sender: TObject);
    procedure booknumeditChange(Sender: TObject);
    procedure quantityeditChange(Sender: TObject);
    procedure makebuyClick(Sender: TObject);
    procedure paymentmethodeditChange(Sender: TObject);
    procedure clientideditChange(Sender: TObject);
    procedure newclientClick(Sender: TObject);
    procedure clearorderClick(Sender: TObject);
    procedure storagegridTitleClick(Column: TColumn);
    procedure storagegridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  buyform: Tbuyform;

implementation

{$R *.dfm}

uses main,login,clients;

function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X);
end;

procedure Tbuyform.booknumeditChange(Sender: TObject);
var bp:integer;
bname:string;
begin
  if isinteger(booknumedit.text) then
  begin

    searchquery.Close;
    searchquery.sql.Clear;
    searchquery.SQL.Add('select distinct booksinstore.book from booksinstore where booksinstore.book=:bok and organization=:orgg');
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.Parameters.ParamByName('bok').Value:=booknumedit.text;
    searchquery.Open;
    if not searchquery.Recordset.EOF then
    begin
      searchquery.Close;
      searchquery.sql.Clear;
      bp:=strtoint(booknumedit.text);
      searchquery.SQL.Add('select books.bookname as bname from bookpublisher,books where bookpublisher.id_book_publisher=:bp and bookpublisher.book=books.id_book');
      searchquery.Parameters.ParamByName('bp').Value:=bp;
      searchquery.Open;
      bname:=searchquery.FieldByName('bname').AsString;
      booknameedit.Text:=bname;
    end
    else
    begin
      Application.MessageBox('????? ????? ??? ? ????????','??????',MB_OK OR MB_ICONWARNING);
      booknameedit.Text:='';
    end;



  end
  else
  begin
    booknameedit.Text:='';
    booknumedit.text:='';
  end;
end;

procedure Tbuyform.catalogsearcheditChange(Sender: TObject);
begin
  buyquery.Close;
  buyquery.SQL.Clear;
  buyquery.SQL.Add('select distinct bookpublisher.id_book_publisher, books.bookname, booksinstore.Quantity, booksinstore.Present');
  buyquery.SQL.Add('from booksinstore, books, organization, bookpublisher');
  buyquery.SQL.Add('where books.id_book=bookpublisher.book and bookpublisher.id_book_publisher=booksinstore.book and organization=:orgg');
  buyquery.SQL.Add(' and (bookpublisher.id_book_publisher like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  buyquery.SQL.Add(' or books.bookname like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  buyquery.SQL.Add(' or booksinstore.Quantity like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  buyquery.SQL.Add(' or booksinstore.Present like'+#39+'%'+catalogsearchedit.text+'%'+#39+')');
  buyquery.Parameters.ParamByName('orgg').Value:=login.org;
  buyquery.Open;
end;

procedure Tbuyform.clearbtnClick(Sender: TObject);
begin
  catalogsearchedit.Text:='';
end;

procedure Tbuyform.clearorderClick(Sender: TObject);
var i:integer;
BUF:string;
begin
  BUF:=catalogsearchedit.Text;
  for i := 0 to buyform.controlcount-1 do
  begin
    if buyform.controls[i] is tedit then
    begin
      (buyform.controls[i] as tedit).text:='';
    end;
  end;
  catalogsearchedit.Text:=BUF;
end;

procedure Tbuyform.clientideditChange(Sender: TObject);
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
      clientnameedit.Text:='';
      clientsurnameedit.Text:='';
    end;

  end
  else
  begin
    clientidedit.Text:='';
    clientnameedit.text:='';
    clientsurnameedit.Text:='';
  end;
end;

procedure Tbuyform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  buyform.Hide;
  mainform.Show;
end;

procedure Tbuyform.FormCreate(Sender: TObject);
begin
  buyform.position:=podesktopcenter;
  storagelbl.Left:=storagegrid.left+(storagegrid.Width div 2);
  orderlbl.Left:=ordergrid.Left+(ordergrid.width div 2);
  orderlbl.Top:=8;
  storagelbl.Top:=orderlbl.Top;
  ordergrid.Top:=orderlbl.Top+orderlbl.Height+8;
  storagegrid.Top:=ordergrid.Top;
end;

procedure Tbuyform.FormShow(Sender: TObject);
begin
  buyquery.Open;
  coquery.Open;
end;

procedure Tbuyform.hidebuyClick(Sender: TObject);
begin
  buyform.Hide;
  mainform.Show;
end;

procedure Tbuyform.makebuyClick(Sender: TObject);
var bookinstore:boolean;
quanbefore:integer;
quanafter:integer;
i:integer;
BUF:string;
begin
  if (booknameedit.Text<>'') and (strtoint(quantityedit.text)>0) and (paymentmethodnameedit.Text<>'') and (clientnameedit.Text<>'') and (clientsurnameedit.Text<>'') then
  begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('insert into clientorder (creationdate,deadline,client,staff,book,methodofpayment,quantity,organization)');
        searchquery.SQL.Add('values (:crdate,:ddln,:client,:staff,:bok,:met,:quan,:orgg)');
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Parameters.ParamByName('crdate').Value:=DateToStr(now());
        searchquery.Parameters.ParamByName('ddln').Value:=DateToStr(now());
        searchquery.Parameters.ParamByName('client').Value:=clientidedit.Text;
        searchquery.Parameters.ParamByName('staff').Value:=login.idstaff;
        searchquery.Parameters.ParamByName('bok').Value:=booknumedit.Text;
        searchquery.Parameters.ParamByName('met').Value:=paymentmethodedit.Text;
        searchquery.Parameters.ParamByName('quan').Value:=quantityedit.Text;
        searchquery.ExecSQL;

        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('select booksinstore.quantity as quan from booksinstore');
        searchquery.SQL.Add('where book=:bok and organization=:orgg');
        searchquery.Parameters.ParamByName('bok').Value:=strtoint(booknumedit.Text);
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Open;
        quanbefore:=searchquery.FieldByName('quan').AsInteger;
        quanafter:=quanbefore-strtoint(quantityedit.text);
        if quanafter>0 then
        begin
          bookinstore:=true;
        end
        else
        begin
          bookinstore:=false;
        end;

        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('update booksinstore set quantity=:quant, present=:pres');
        searchquery.SQL.Add('where book=:bok and organization=:orgg');
        searchquery.Parameters.ParamByName('bok').Value:=strtoint(booknumedit.Text);
        searchquery.Parameters.ParamByName('quant').Value:=quanafter;
        searchquery.Parameters.ParamByName('pres').Value:=bookinstore;
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.execsql;
        coquery.Close;
        buyquery.Close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        coquery.Open;
        buyquery.Open;

        BUF:=catalogsearchedit.Text;
        for i := 0 to buyform.controlcount-1 do
        begin
          if buyform.controls[i] is tedit then
          begin
            (buyform.controls[i] as tedit).text:='';
          end;
        end;
        catalogsearchedit.Text:=BUF;
  end
  else
  begin
    if (booknameedit.Text='') then
    begin
      Application.MessageBox('??????? ??????? ID ?????','?????? ???????? ??????',MB_OK OR MB_ICONWARNING);
    end;
    if (not(strtoint(quantityedit.text)>0)) then
    begin
      Application.MessageBox('??????? ??????? ?????????? ????','?????? ???????? ??????',MB_OK OR MB_ICONWARNING);
    end;
    if (paymentmethodnameedit.Text='') then
    begin
      Application.MessageBox('??????? ??????? ID ??????? ??????','?????? ???????? ??????',MB_OK OR MB_ICONWARNING);
    end;
    if (clientnameedit.Text='') or (clientsurnameedit.Text='') then
    begin
      Application.MessageBox('??????? ??????? ID ???????','?????? ???????? ??????',MB_OK OR MB_ICONWARNING);
    end;


  end;
end;

procedure Tbuyform.newclientClick(Sender: TObject);
begin
    clientsform.Show;
    clients.mainornot:=false;
end;

procedure Tbuyform.paymentmethodeditChange(Sender: TObject);
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

procedure Tbuyform.quantityeditChange(Sender: TObject);
var quan:integer;
begin
  if (booknameedit.text='') and (quantityedit.text<>'') then
  begin
    Application.MessageBox('??????? ??????? ????? ?????','??????',MB_OK OR MB_ICONWARNING);
    quantityedit.text:='';
  end
  else
  begin
    if not isinteger(quantityedit.text) then
    begin
      quantityedit.Text:='';
    end
    else
    begin
      searchquery.Close;
      searchquery.SQL.Clear;
      searchquery.SQL.Add('select distinct booksinstore.quantity as quan from booksinstore');
      searchquery.SQL.Add('where booksinstore.book=:bok and organization=:orgg');
      searchquery.Parameters.ParamByName('bok').Value:=booknumedit.Text;
      searchquery.Parameters.ParamByName('orgg').Value:=login.org;
      searchquery.Open;
      quan:=searchquery.FieldByName('quan').AsInteger;
      if strtoint(quantityedit.text)>quan then
      begin
        Application.MessageBox('??????? ?????? ????, ??? ? ????????','??????',MB_OK OR MB_ICONWARNING);
        quantityedit.text:='';
      end;
    end;
  end;

end;

procedure Tbuyform.storagegridCellClick(Column: TColumn);
begin
  booknumedit.Text:=buyquery['id_book_publisher'];
  quantityedit.Text:=buyquery['quantity'];
end;

procedure Tbuyform.storagegridTitleClick(Column: TColumn);
var
  s:string;
begin
  s:=column.FieldName;
  buyquery.Close;
  if
    sortflag=true
  then
  begin
    buyquery.SQL.Clear;
    buyquery.SQL.Add('select distinct bookpublisher.id_book_publisher, books.bookname, booksinstore.Quantity, booksinstore.Present from booksinstore, books, organization, bookpublisher');
    buyquery.SQL.Add(' where books.id_book=bookpublisher.book and bookpublisher.id_book_publisher=booksinstore.book and organization=:orgg');
    buyquery.Parameters.ParamByName('orgg').Value:=login.org;
    buyquery.SQL.Add('order by '+s+' asc');
  end
  else
    begin
      buyquery.SQL.Clear;
      buyquery.SQL.Add('select distinct bookpublisher.id_book_publisher, books.bookname, booksinstore.Quantity, booksinstore.Present from booksinstore, books, organization, bookpublisher');
      buyquery.SQL.Add(' where books.id_book=bookpublisher.book and bookpublisher.id_book_publisher=booksinstore.book and organization=:orgg');
      buyquery.Parameters.ParamByName('orgg').Value:=login.org;
      buyquery.SQL.Add('order by '+s+' desc');
    end;

  sortflag:=not(sortflag);
  buyquery.Open;
end;

end.
