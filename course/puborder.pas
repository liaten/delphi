unit puborder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls;

type
  Tpuborderform = class(TForm)
    hidepuborderbtn: TButton;
    DBGrid1: TDBGrid;
    pubquery: TADOQuery;
    DataSource1: TDataSource;
    idsolbl: TLabel;
    idsoedit: TEdit;
    cdtp: TDateTimePicker;
    cdtlbl: TLabel;
    ddltp: TDateTimePicker;
    ddlbl: TLabel;
    publbl: TLabel;
    pubedit: TEdit;
    pubnameedit: TEdit;
    pubnamelbl: TLabel;
    dclbl: TLabel;
    dcedit: TEdit;
    booklabel: TLabel;
    bookidedit: TEdit;
    booknamelbl: TLabel;
    booknameedit: TEdit;
    cilbl: TLabel;
    ciedit: TEdit;
    add: TButton;
    change: TButton;
    remove: TButton;
    searchquery: TADOQuery;
    cancelbtn: TButton;
    procedure hidepuborderbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure pubeditChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure cdtpChange(Sender: TObject);
    procedure bookideditChange(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure cancelbtnClick(Sender: TObject);
    procedure changeClick(Sender: TObject);
    procedure removeClick(Sender: TObject);
  private
    { Private declarations }
  public
  sortflag:boolean;
    { Public declarations }
  end;

var
  puborderform: Tpuborderform;

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

procedure Tpuborderform.addClick(Sender: TObject);
begin
  if isinteger(idsoedit.text) then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from StoreOrder where id_store_order=:orderid and organization=:orgg');
    searchquery.Parameters.ParamByName('orderid').Value:=strtoint(idsoedit.text);
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
      Application.MessageBox('?????? ??? ??????????, ?????????????? ??????? ????????','?????? ??????????',MB_OK OR MB_ICONWARNING);
    end
    else
    begin
      if strtoint(ciedit.text)>0 then
      begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('insert into StoreOrder (creationdate,deadline,publisher,costofdelivery,book,circulation,organization)');
        searchquery.SQL.Add('values (:crdate,:ddln,:pub,:cod,:bok,:cir,:orgg)');
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Parameters.ParamByName('crdate').Value:=DateToStr(cdtp.Date);
        searchquery.Parameters.ParamByName('ddln').Value:=DateToStr(ddltp.Date);
        searchquery.Parameters.ParamByName('pub').Value:=pubedit.Text;
        searchquery.Parameters.ParamByName('bok').Value:=bookidedit.Text;
        searchquery.Parameters.ParamByName('cir').Value:=ciedit.Text;
        searchquery.Parameters.ParamByName('cod').Value:=dcedit.Text;
        searchquery.ExecSQL;
        pubquery.Close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        pubquery.Open;
      end
      else
      begin
        Application.MessageBox('?????????? ?????? ???? ?????? 0','?????? ??????????',MB_OK OR MB_ICONWARNING);
      end;
    end;
  end
  else
  begin
      if strtoint(ciedit.text)>0 then
      begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('insert into StoreOrder (creationdate,deadline,publisher,costofdelivery,book,circulation,organization)');
        searchquery.SQL.Add('values (:crdate,:ddln,:pub,:cod,:bok,:cir,:orgg)');
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Parameters.ParamByName('crdate').Value:=DateToStr(cdtp.Date);
        searchquery.Parameters.ParamByName('ddln').Value:=DateToStr(ddltp.Date);
        searchquery.Parameters.ParamByName('pub').Value:=pubedit.Text;
        searchquery.Parameters.ParamByName('bok').Value:=bookidedit.Text;
        searchquery.Parameters.ParamByName('cir').Value:=ciedit.Text;
        searchquery.Parameters.ParamByName('cod').Value:=dcedit.Text;
        searchquery.ExecSQL;
        pubquery.Close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        pubquery.Open;
      end
      else
      begin
        Application.MessageBox('?????????? ?????? ???? ?????? 0','?????? ??????????',MB_OK OR MB_ICONWARNING);
      end;
  end;
end;


procedure Tpuborderform.bookideditChange(Sender: TObject);
var bp:integer;
bname:string;
idp:string;
begin
  if isinteger(bookidedit.text) then
  begin
    searchquery.Close;
    searchquery.sql.Clear;
    bp:=strtoint(bookidedit.text);
    searchquery.SQL.Add('select books.bookname as bname, bookpublisher.publisher as idp from bookpublisher,books where bookpublisher.id_book_publisher=:bp and bookpublisher.book=books.id_book');
    searchquery.Parameters.ParamByName('bp').Value:=bp;
    searchquery.Open;
    bname:=searchquery.FieldByName('bname').AsString;
    idp:=searchquery.FieldByName('idp').AsString;
    booknameedit.Text:=bname;
    pubedit.Text:=idp;
  end
  else
  begin
    booknameedit.Text:='';
    bookidedit.text:='';
    pubedit.Text:='';

  end;
end;

procedure Tpuborderform.cancelbtnClick(Sender: TObject);
var i:integer;
begin
  for i := 0 to puborderform.controlcount-1 do
  begin
    if puborderform.controls[i] is tedit then
      (puborderform.controls[i] as tedit).text:='';
  end;
  cdtp.Date:=now();
  ddltp.Date:=cdtp.Date+20;
end;

procedure Tpuborderform.cdtpChange(Sender: TObject);
begin
  if ddltp.Date<cdtp.date then
  begin
    Application.MessageBox('???? ????????? ?? ????? ???? ??????, ??? ???? ??????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    ddltp.Date:=cdtp.date;
  end;
end;

procedure Tpuborderform.changeClick(Sender: TObject);
begin
  if (idsoedit.Text<>'') and (pubnameedit.Text<>'') and (dcedit.Text<>'') and (booknameedit.Text<>'') and (ciedit.Text<>'') then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from storeorder where organization=:orgg and id_store_order=:idso');
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.Parameters.ParamByName('idso').Value:=idsoedit.Text;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('update storeorder set creationdate=:cd, deadline=:ddln, publisher=:pub, costofdelivery=:cod, book=:bok, circulation=:cir');
        searchquery.SQL.Add('where organization=:orgg and id_store_order=:idso');
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.Parameters.ParamByName('idso').Value:=idsoedit.Text;
        searchquery.Parameters.ParamByName('cd').Value:=datetostr(cdtp.Date);
        searchquery.Parameters.ParamByName('ddln').Value:=datetostr(ddltp.Date);
        searchquery.Parameters.ParamByName('bok').Value:=bookidedit.Text;
        searchquery.Parameters.ParamByName('pub').Value:=pubedit.Text;
        searchquery.Parameters.ParamByName('cod').Value:=dcedit.Text;
        searchquery.Parameters.ParamByName('cir').Value:=ciedit.Text;
        searchquery.execsql;
        pubquery.close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        pubquery.Open;
    end
    else
    begin
      Application.MessageBox('??????? ?????? ?? ??????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
  end
  else
  begin
    if idsoedit.Text='' then
    begin
      Application.MessageBox('?? ?????? ?????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
    if pubnameedit.Text='' then
    begin
      Application.MessageBox('?? ??????? ????????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
    if dcedit.Text='' then
    begin
      Application.MessageBox('?? ??????? ?????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
    if ciedit.Text='' then
    begin
      Application.MessageBox('?? ?????? ?????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
  end;

end;

procedure Tpuborderform.DBGrid1CellClick(Column: TColumn);
begin
  idsoedit.Text:=pubquery['id_store_order'];                  //id ??????
  cdtp.Date:=pubquery['creationdate'];                        //???? ????????
  ddltp.Date:=pubquery['deadline'];                           //???????
  bookidedit.Text:=pubquery['book'];                          //id ?????
  ciedit.Text:=pubquery['circulation'];                       //?????
  dcedit.Text:=pubquery['costofdelivery'];                    //???? ????????
  pubedit.Text:=pubquery['publisher'];                        //????????????
end;

procedure Tpuborderform.DBGrid1TitleClick(Column: TColumn);
var
   S:string;
begin
  s:=column.FieldName;
  pubquery.Close;
  if
    sortflag=true
  then
  begin
      pubquery.SQL.Clear;
      pubquery.SQL.Add('select * from storeorder');
      pubquery.SQL.Add('where organization=:orgg');
      pubquery.SQL.Add('order by '+s+' asc');
      pubquery.Parameters.ParamByName('orgg').Value:=login.org;
  end
  else
    begin
      pubquery.SQL.Clear;
      pubquery.SQL.Add('select * from storeorder');
      pubquery.SQL.Add('where organization=:orgg');
      pubquery.SQL.Add('order by '+s+' desc');
      pubquery.Parameters.ParamByName('orgg').Value:=login.org;
    end;

  sortflag:=not(sortflag);
  pubquery.Open;
end;

procedure Tpuborderform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  puborderform.Hide;
  mainform.Show;
end;

procedure Tpuborderform.FormCreate(Sender: TObject);
begin
  puborderform.position:=podesktopcenter;
  change.Left:=(add.left+remove.Left) div 2;
end;

procedure Tpuborderform.FormHide(Sender: TObject);
var i:integer;
begin
  puborderform.close;
  for i := 0 to puborderform.controlcount-1 do
  begin
    if puborderform.controls[i] is tedit then
      (puborderform.controls[i] as tedit).text:='';
  end;
end;

procedure Tpuborderform.FormShow(Sender: TObject);
begin
  searchquery.Connection:=mainform.conn;
  pubquery.Connection:=mainform.conn;
  sortflag:=true;
  cdtp.Date:=now();
  ddltp.Date:=cdtp.Date+20;
  pubquery.Close;
  pubquery.SQL.Clear;
  pubquery.SQL.Add('select * from storeorder');
  pubquery.SQL.Add(' where Organization=:orgg');
  pubquery.Parameters.ParamByName('orgg').Value:=login.org;
  pubquery.Open;
end;

procedure Tpuborderform.hidepuborderbtnClick(Sender: TObject);
begin
  puborderform.Hide;
  mainform.Show;
end;

procedure Tpuborderform.pubeditChange(Sender: TObject);
var bp:integer;
bname:string;
begin
  if isinteger(pubedit.text) then
  begin
    searchquery.Close;
    searchquery.sql.Clear;
    bp:=strtoint(pubedit.text);
    searchquery.SQL.Add('select publisher.pname as pname from bookpublisher,publisher where bookpublisher.id_book_publisher=:bp and bookpublisher.publisher=publisher.id_publisher');
    searchquery.Parameters.ParamByName('bp').Value:=bp;
    searchquery.Open;
    bname:=searchquery.FieldByName('pname').AsString;
    pubnameedit.Text:=bname;
  end
  else
  begin
    pubedit.text:='';
    pubnameedit.Text:='';
  end;
end;


procedure Tpuborderform.removeClick(Sender: TObject);
begin
  if idsoedit.text<>'' then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from storeorder where organization=:orgg and id_store_order=:idso');
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.Parameters.ParamByName('idso').Value:=idsoedit.Text;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
      searchquery.Close;
      searchquery.SQL.Clear;
      searchquery.SQL.Add('delete from storeorder');
      searchquery.SQL.Add(' where organization=:orgg and id_store_order=:idso');
      searchquery.Parameters.ParamByName('orgg').Value:=login.org;
      searchquery.Parameters.ParamByName('idso').Value:=idsoedit.Text;
      searchquery.execsql;
      pubquery.close;
      mainform.conn.Connected:=false;
      mainform.conn.Connected:=true;
      pubquery.open;
    end
    else
    begin
      Application.MessageBox('? ??????? ?? ?????? ????? ??? ????????','?????? ????????',MB_OK OR MB_ICONWARNING);
    end;
  end
  else
  begin
    Application.MessageBox('??? ?????? ??????','?????? ????????',MB_OK OR MB_ICONWARNING);
  end;
end;

end.
