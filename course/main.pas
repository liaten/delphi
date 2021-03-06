 unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  Tmainform = class(TForm)
    logoutbtn: TButton;
    terminatebtn: TButton;
    useridlabel: TLabel;
    catalogquery: TADOQuery;
    DataSource1: TDataSource;
    booksgrid: TDBGrid;
    orglabel: TLabel;
    label_fio: TLabel;
    mainmenu: TMainMenu;
    buy: TMenuItem;
    orderchoose: TMenuItem;
    clientorder: TMenuItem;
    publisher_order: TMenuItem;
    storage: TMenuItem;
    menuhelp: TMenuItem;
    cataloglabel: TLabel;
    createlogins: TMenuItem;
    catalogsearch: TLabel;
    catalogsearchedit: TEdit;
    add: TMenuItem;
    addbook: TMenuItem;
    addpublisher: TMenuItem;
    addgenre: TMenuItem;
    addbooktype: TMenuItem;
    addcover: TMenuItem;
    reports: TMenuItem;
    cassir_reports: TMenuItem;
    shop_reports: TMenuItem;
    change: TMenuItem;
    changebook: TMenuItem;
    changepublisher: TMenuItem;
    changegenre: TMenuItem;
    changecover: TMenuItem;
    changebooktype: TMenuItem;
    remove: TMenuItem;
    removebook: TMenuItem;
    removepublisher: TMenuItem;
    removegenre: TMenuItem;
    removebooktype: TMenuItem;
    removecover: TMenuItem;
    addauthor: TMenuItem;
    changeauthor: TMenuItem;
    removeauthor: TMenuItem;
    dropbtn: TButton;
    conn: TADOConnection;
    clientsmenu: TMenuItem;
    procedure terminatebtnClick(Sender: TObject);
    procedure logoutbtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure menuhelpClick(Sender: TObject);
    procedure storageClick(Sender: TObject);
    procedure createloginsClick(Sender: TObject);
    procedure namememoEnter(Sender: TObject);
    procedure buyClick(Sender: TObject);
    procedure clientorderClick(Sender: TObject);
    procedure publisher_orderClick(Sender: TObject);
    procedure booksgridTitleClick(Column: TColumn);
    procedure catalogsearcheditChange(Sender: TObject);
    procedure cassir_reportsClick(Sender: TObject);
    procedure shop_reportsClick(Sender: TObject);
    procedure addbookClick(Sender: TObject);
    procedure addauthorClick(Sender: TObject);
    procedure dropbtnClick(Sender: TObject);
    procedure addpublisherClick(Sender: TObject);
    procedure addgenreClick(Sender: TObject);
    procedure addbooktypeClick(Sender: TObject);
    procedure addcoverClick(Sender: TObject);
    procedure changebookClick(Sender: TObject);
    procedure changeauthorClick(Sender: TObject);
    procedure changepublisherClick(Sender: TObject);
    procedure changegenreClick(Sender: TObject);
    procedure changebooktypeClick(Sender: TObject);
    procedure changecoverClick(Sender: TObject);
    procedure removebookClick(Sender: TObject);
    procedure removeauthorClick(Sender: TObject);
    procedure removepublisherClick(Sender: TObject);
    procedure removegenreClick(Sender: TObject);
    procedure removebooktypeClick(Sender: TObject);
    procedure removecoverClick(Sender: TObject);
    procedure clientsmenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sortflag:boolean;
  end;

var
  mainform: Tmainform;
  org:integer;

implementation

{$R *.dfm}
uses  login,mainhelp,storage,logpasses,buy,clientorder,puborder,cassir_reports,
      shopreports,addbook,addauthor,addpublisher,addgenre,addbooktype,addcover,
      changebook,changewriter,changepublisher,changegenre,changebooktype,
      changecover,removebook, removeauthor,removepublisher,removegenre,
      removebooktype,removecover,clients;

procedure Tmainform.addauthorClick(Sender: TObject);
begin
  addauthorform.Show;
  mainform.Hide;
end;

procedure Tmainform.addbookClick(Sender: TObject);
begin
  addbookform.Show;
  mainform.Hide;
end;

procedure Tmainform.addbooktypeClick(Sender: TObject);
begin
  addbooktypeform.Show;
  mainform.Hide;
end;

procedure Tmainform.addcoverClick(Sender: TObject);
begin
  addcoverform.show;
  mainform.Hide;
end;

procedure Tmainform.addgenreClick(Sender: TObject);
begin
  addgenreform.Show;
  mainform.hide;
end;

procedure Tmainform.addpublisherClick(Sender: TObject);
begin
  addpublisherform.Show;
  mainform.Hide;
end;

procedure Tmainform.booksgridTitleClick(Column: TColumn);
var
  s:string;
begin
  s:=column.FieldName;
  catalogquery.Close;
  if
    sortflag=true
  then
  begin
      catalogquery.SQL.Clear;
      catalogquery.SQL.Add('select bookpublisher.ID_BOOK_PUBLISHER, bookpublisher.ISBN, Books.BookName as Book, publisher.pname as Publisher, bookpublisher.cost, bookpublisher.year_of_publication, booktype.booktypename as BookTypeName, cover.covername as CoverName ');
      catalogquery.SQL.Add('from bookpublisher,books,publisher,booktype,cover where bookpublisher.book=books.id_book and publisher.id_publisher=bookpublisher.publisher and bookpublisher.booktype=booktype.id_booktype and bookpublisher.cover=cover.id_cover ');
      catalogquery.SQL.Add('order by '+s+' asc');
  end
  else
    begin
      catalogquery.SQL.Clear;
      catalogquery.SQL.Add('select bookpublisher.ID_BOOK_PUBLISHER, bookpublisher.ISBN, Books.BookName as Book, publisher.pname as Publisher, bookpublisher.cost, bookpublisher.year_of_publication, booktype.booktypename as BookTypeName, cover.covername as CoverName ');
      catalogquery.SQL.Add('from bookpublisher,books,publisher,booktype,cover where bookpublisher.book=books.id_book and publisher.id_publisher=bookpublisher.publisher and bookpublisher.booktype=booktype.id_booktype and bookpublisher.cover=cover.id_cover ');
      catalogquery.SQL.Add('order by '+s+' desc');
    end;

  sortflag:=not(sortflag);
  catalogquery.Open;
end;

procedure Tmainform.buyClick(Sender: TObject);
begin
  buyform.Show;
  mainform.Hide;
end;

procedure Tmainform.cassir_reportsClick(Sender: TObject);
begin
  cassirreportsform.Show;
  mainform.Hide;
end;

procedure Tmainform.catalogsearcheditChange(Sender: TObject);
begin
  catalogquery.Close;
  catalogquery.SQL.Clear;
  catalogquery.SQL.Add('select bookpublisher.ID_BOOK_PUBLISHER, bookpublisher.ISBN, Books.BookName as Book, publisher.pname as Publisher, bookpublisher.cost, bookpublisher.year_of_publication, booktype.booktypename as BookTypeName, cover.covername as CoverName ');
  catalogquery.SQL.Add('from bookpublisher,books,publisher,booktype,cover where bookpublisher.book=books.id_book and publisher.id_publisher=bookpublisher.publisher and bookpublisher.booktype=booktype.id_booktype and bookpublisher.cover=cover.id_cover ');
  catalogquery.SQL.Add('and (bookpublisher.ID_BOOK_PUBLISHER like'+#39+'%'+catalogsearchedit.text+'%'+#39+' or bookpublisher.ISBN like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  catalogquery.SQL.Add(' or Books.BookName like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  catalogquery.SQL.Add(' or publisher.pname like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  catalogquery.SQL.Add(' or bookpublisher.cost like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  catalogquery.SQL.Add(' or bookpublisher.year_of_publication like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  catalogquery.SQL.Add(' or booktype.booktypename like'+#39+'%'+catalogsearchedit.text+'%'+#39);
  catalogquery.SQL.Add(' or cover.covername like'+#39+'%'+catalogsearchedit.text+'%'+#39+')');
  catalogquery.Open;
end;

procedure Tmainform.changeauthorClick(Sender: TObject);
begin
  changewriterform.Show;
  mainform.Hide;
end;

procedure Tmainform.changebookClick(Sender: TObject);
begin
  changebookform.Show;
  mainform.Hide;
end;

procedure Tmainform.changebooktypeClick(Sender: TObject);
begin
  changebooktypeform.Show;
  mainform.Hide;
end;

procedure Tmainform.changecoverClick(Sender: TObject);
begin
  changecoverform.Show;
  mainform.Hide;
end;

procedure Tmainform.changegenreClick(Sender: TObject);
begin
  changegenreform.Show;
  mainform.Hide;
end;

procedure Tmainform.changepublisherClick(Sender: TObject);
begin
  changepublisherform.Hide;
  mainform.Show;
end;

procedure Tmainform.clientorderClick(Sender: TObject);
begin
  clientorderform.Show;
  mainform.Hide;
end;

procedure Tmainform.clientsmenuClick(Sender: TObject);
begin
  clientsform.Show;
  clients.mainornot:=true;
  mainform.Hide;
end;

procedure Tmainform.createloginsClick(Sender: TObject);
begin
   logpassesform.Show;
   mainform.Hide;
end;

procedure Tmainform.dropbtnClick(Sender: TObject);
begin
  catalogsearchedit.text:='';
end;

procedure Tmainform.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  halt;
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
  mainform.Height:=649;
  mainform.width:=1306;
  loginform.dbmsg.Enabled:=true;
  loginform.dbmsg.Font.Color:=clred;
  loginform.dbmsg.Caption:='????????? ?????????? ? ????? ??????';
  if conn.Connected=true then
  begin
    loginform.dbmsg.Enabled:=false;
    loginform.dbmsg.Caption:='??????? ?????????? ? ????? ??????';
  end;
  sortflag:=true;
  mainform.position:=podesktopcenter;
  logoutbtn.top:=mainform.clientHeight-logoutbtn.height-8;
  logoutbtn.Left:=useridlabel.Left;
  terminatebtn.top:=mainform.clientHeight-terminatebtn.height-8;
  terminatebtn.Left:=mainform.clientWidth-terminatebtn.Width-logoutbtn.Left;
  orglabel.Top:=8;
  label_fio.Top:=orglabel.Top+orglabel.Height+8;
  useridlabel.Top:=label_fio.Top+label_fio.Height+8;
  cataloglabel.Top:=useridlabel.Top+useridlabel.Height+8;
  booksgrid.Top:=cataloglabel.Top+cataloglabel.height+8;
  booksgrid.Height:=mainform.ClientHeight-logoutbtn.Height-16-booksgrid.Top;
  booksgrid.Left:=useridlabel.Left;
  booksgrid.Width:=mainform.ClientWidth-16;
  catalogquery.Close;
  catalogquery.SQL.Clear;
  catalogquery.SQL.Add('select bookpublisher.ID_BOOK_PUBLISHER, bookpublisher.ISBN, Books.BookName as Book, publisher.pname as Publisher, bookpublisher.cost, bookpublisher.year_of_publication, booktype.booktypename as BookTypeName, cover.covername as CoverName ');
  catalogquery.SQL.Add('from bookpublisher,books,publisher,booktype,cover where bookpublisher.book=books.id_book and publisher.id_publisher=bookpublisher.publisher and bookpublisher.booktype=booktype.id_booktype and bookpublisher.cover=cover.id_cover');
  catalogquery.Open;
  mainform.createlogins.Visible:=false;
  mainform.reports.Visible:=false;
  mainform.add.Visible:=false;
  mainform.change.Visible:=false;
  mainform.remove.Visible:=false;
end;

procedure Tmainform.FormHide(Sender: TObject);
begin
  useridlabel.Caption:='';
  catalogquery.Active:=false;
  mainform.createlogins.Visible:=false;
  mainform.reports.Visible:=false;
  mainform.add.Visible:=false;
  mainform.change.Visible:=false;
  mainform.remove.Visible:=false;
end;

procedure Tmainform.FormResize(Sender: TObject);
begin
  mainform.Height:=649;
  mainform.width:=1306;
end;

procedure Tmainform.FormShow(Sender: TObject);
begin
  mainform.createlogins.Visible:=false;
  mainform.reports.Visible:=false;
  mainform.add.Visible:=false;
  mainform.change.Visible:=false;
  mainform.remove.Visible:=false;
  if login.usertype=5 then
  begin
    mainform.useridlabel.Caption:='??? ID ????????????: '+inttostr(usertype)+'. ';
    mainform.createlogins.Visible:=true;
    mainform.reports.Visible:=true;
    mainform.add.Visible:=true;
    mainform.change.Visible:=true;
    mainform.remove.Visible:=true;
  end
  else if login.usertype=1 then
  begin
    mainform.reports.Visible:=true;
    mainform.add.Visible:=true;
    mainform.change.Visible:=true;
    mainform.remove.Visible:=true;
  end
  else if login.usertype=2 then
  begin
    mainform.reports.Visible:=true;
  end
  else if login.usertype=3 then
  begin
    mainform.add.Visible:=true;
    mainform.change.Visible:=true;
    mainform.remove.Visible:=true;
  end;
  useridlabel.Caption:=useridlabel.Caption+'???? ?????????: '+login.username+'.';
  catalogquery.Connection:=mainform.conn;
  catalogquery.Active:=true;
end;

procedure Tmainform.logoutbtnClick(Sender: TObject);
begin
  loginform.Show;
  mainform.Hide;
end;

procedure Tmainform.menuhelpClick(Sender: TObject);
begin
  mainhelpform.Show;
end;

procedure Tmainform.namememoEnter(Sender: TObject);
begin
  mainform.ActiveControl:=nil;
end;

procedure Tmainform.publisher_orderClick(Sender: TObject);
begin
  puborderform.Show;
  mainform.Hide;
end;

procedure Tmainform.removeauthorClick(Sender: TObject);
begin
  removeauthorform.show;
  mainform.Hide;
end;

procedure Tmainform.removebookClick(Sender: TObject);
begin
  removebookform.Show;
  mainform.Hide;
end;

procedure Tmainform.removebooktypeClick(Sender: TObject);
begin
  removebooktypeform.Show;
  mainform.Hide;
end;

procedure Tmainform.removecoverClick(Sender: TObject);
begin
    removecoverform.show;
    mainform.hide;
end;

procedure Tmainform.removegenreClick(Sender: TObject);
begin
  removegenreform.Show;
  mainform.Hide;
end;

procedure Tmainform.removepublisherClick(Sender: TObject);
begin
  removepublisherform.Show;
  mainform.Hide;
end;

procedure Tmainform.shop_reportsClick(Sender: TObject);
begin
  shopreportsform.Show;
  mainform.Hide;
end;

procedure Tmainform.storageClick(Sender: TObject);
begin
  storageform.Show;
  mainform.Hide;
end;

procedure Tmainform.terminatebtnClick(Sender: TObject);
begin
  halt;
end;

end.
