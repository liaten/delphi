unit storage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, Vcl.Menus;

type
  Tstorageform = class(TForm)
    hidestorage: TButton;
    storagequery: TADOQuery;
    storagedatasource: TDataSource;
    storagegrid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    booknumedit: TEdit;
    booknameedit: TEdit;
    quantityedit: TEdit;
    searchquery: TADOQuery;
    addbtn: TButton;
    changebtn: TButton;
    removebtn: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure hidestorageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure booknumeditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure storagegridCellClick(Column: TColumn);
    procedure addbtnClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure changebtnClick(Sender: TObject);
    procedure quantityeditChange(Sender: TObject);
    procedure removebtnClick(Sender: TObject);
    procedure storagegridTitleClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
  sortflag:boolean;
    { Public declarations }
  end;

var
  storageform: Tstorageform;

implementation

{$R *.dfm}
uses main,login,storagehelp;

function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X);
end;

procedure Tstorageform.booknumeditChange(Sender: TObject);
var bp:integer;
bname:string;
begin
  if isinteger(booknumedit.text) then
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
    booknameedit.Text:='';
    booknumedit.text:='';
  end;
end;

procedure Tstorageform.changebtnClick(Sender: TObject);
var bookinstore:bool;
begin
  if booknumedit.Text<>'' then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from booksinstore where book=:edbook and organization=:orgg');
    searchquery.Parameters.ParamByName('edbook').Value:=strtoint(booknumedit.Text);
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
      if (quantityedit.Text<>'') then
      begin
        if strtoint(quantityedit.text)>0 then
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
        searchquery.Parameters.ParamByName('quant').Value:=strtoint(quantityedit.text);
        searchquery.Parameters.ParamByName('pres').Value:=bookinstore;
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.execsql;
        storagequery.close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        storagequery.Open;
      end
      else
      begin
        Application.MessageBox('?? ??????? ???????? ? ???? ??????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
      end;
    end
    else
    begin
      Application.MessageBox('?????? ?? ??????????, ?????????????? ??????? ???????','?????? ?????????',MB_OK OR MB_ICONWARNING);
    end;
  end
  else
  begin
    Application.MessageBox('?? ??????? ???????? ? ???? ????? ????? ? ????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
  end;
end;

procedure Tstorageform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
begin
  storageform.Hide;
  mainform.show;
  for i := 0 to storageform.controlcount-1 do
  begin
    if storageform.controls[i] is tedit then
      (storageform.controls[i] as tedit).text:='';
  end;
end;

procedure Tstorageform.FormCreate(Sender: TObject);
begin
  sortflag:=true;
  storageform.position:=podesktopcenter;
  storageform.Width:=1050;
end;

procedure Tstorageform.FormHide(Sender: TObject);
begin
  storagequery.Close;
  searchquery.Close;
end;

procedure Tstorageform.FormResize(Sender: TObject);
begin
  ;
end;

procedure Tstorageform.FormShow(Sender: TObject);
begin
  storagequery.Connection:=mainform.conn;
  searchquery.Connection:=mainform.conn;
  storagequery.close;
  storagequery.SQL.Clear;
  storagequery.SQL.Add('select distinct bookpublisher.id_book_publisher, books.bookname, booksinstore.Quantity, booksinstore.Present from booksinstore, books, organization, bookpublisher');
  storagequery.SQL.Add(' where books.id_book=bookpublisher.book and bookpublisher.id_book_publisher=booksinstore.book and organization=:orgg');
  storagequery.Parameters.ParamByName('orgg').Value:=login.org;
  storagequery.Open;
end;

procedure Tstorageform.hidestorageClick(Sender: TObject);
var i:integer;
begin
  storageform.Hide;
  mainform.show;
  for i := 0 to storageform.controlcount-1 do
  begin
    if storageform.controls[i] is tedit then
      (storageform.controls[i] as tedit).text:='';
  end;
end;

procedure Tstorageform.N1Click(Sender: TObject);
begin
  storagehelpform.Show;
end;

procedure Tstorageform.quantityeditChange(Sender: TObject);
begin
  if not isinteger(quantityedit.text) then
  begin
    quantityedit.Text:='';
  end;
end;

procedure Tstorageform.removebtnClick(Sender: TObject);
begin
  if booknumedit.Text<>'' then
  begin
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('select * from booksinstore where book=:edbook and organization=:orgg');
    searchquery.Parameters.ParamByName('edbook').Value:=strtoint(booknumedit.Text);
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.open;
    if not searchquery.Recordset.EOF then
    begin
        searchquery.Close;
        searchquery.SQL.Clear;
        searchquery.SQL.Add('delete from booksinstore');
        searchquery.SQL.Add(' where book=:bok and organization=:orgg');
        searchquery.Parameters.ParamByName('bok').Value:=strtoint(booknumedit.Text);
        searchquery.Parameters.ParamByName('orgg').Value:=login.org;
        searchquery.execsql;
        storagequery.close;
        mainform.conn.Connected:=false;
        mainform.conn.Connected:=true;
        storagequery.Open;
      end
    else
    begin
      Application.MessageBox('?????? ?? ??????????, ?????? ??????? ?? ?????','?????? ????????',MB_OK OR MB_ICONWARNING);
    end;
  end
  else
  begin
    Application.MessageBox('?? ??????? ???????? ? ???? ????? ????? ? ????????','?????? ?????????',MB_OK OR MB_ICONWARNING);
  end;
end;

procedure Tstorageform.storagegridCellClick(Column: TColumn);
begin
  booknumedit.Text:=storagequery['id_book_publisher'];
  quantityedit.Text:=storagequery['quantity'];
end;

procedure Tstorageform.storagegridTitleClick(Column: TColumn);
var
   S:string;
begin
  s:=column.FieldName;
  storagequery.Close;
  if
    sortflag=true
  then
  begin
    storagequery.SQL.Clear;
    storagequery.SQL.Add('select distinct bookpublisher.id_book_publisher, books.bookname, booksinstore.Quantity, booksinstore.Present from booksinstore, books, organization, bookpublisher');
    storagequery.SQL.Add(' where books.id_book=bookpublisher.book and bookpublisher.id_book_publisher=booksinstore.book and organization=:orgg');
    storagequery.Parameters.ParamByName('orgg').Value:=login.org;
    storagequery.SQL.Add('order by '+s+' asc');
  end
  else
    begin
      storagequery.SQL.Clear;
      storagequery.SQL.Add('select distinct bookpublisher.id_book_publisher, books.bookname, booksinstore.Quantity, booksinstore.Present from booksinstore, books, organization, bookpublisher');
      storagequery.SQL.Add(' where books.id_book=bookpublisher.book and bookpublisher.id_book_publisher=booksinstore.book and organization=:orgg');
      storagequery.Parameters.ParamByName('orgg').Value:=login.org;
      storagequery.SQL.Add('order by '+s+' desc');
    end;

  sortflag:=not(sortflag);
  storagequery.Open;
end;

procedure Tstorageform.addbtnClick(Sender: TObject);
var bookinstore:bool;
begin
  searchquery.Close;
  searchquery.SQL.Clear;
  searchquery.SQL.Add('select * from booksinstore where book=:edbook and organization=:orgg');
  searchquery.Parameters.ParamByName('edbook').Value:=strtoint(booknumedit.Text);
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
      bookinstore:=true;
    end
    else
    begin
      bookinstore:=false;
    end;
    searchquery.Close;
    searchquery.SQL.Clear;
    searchquery.SQL.Add('insert into booksinstore (book,quantity,present,organization)');
    searchquery.SQL.Add('values (:bok,:quant,:pres,:orgg)');
    searchquery.Parameters.ParamByName('bok').Value:=strtoint(booknumedit.Text);
    searchquery.Parameters.ParamByName('quant').Value:=strtoint(quantityedit.text);
    searchquery.Parameters.ParamByName('pres').Value:=bookinstore;
    searchquery.Parameters.ParamByName('orgg').Value:=login.org;
    searchquery.execsql;
    storagequery.close;
    mainform.conn.Connected:=false;
    mainform.conn.Connected:=true;
    storagequery.Open;
  end;
end;


end.
