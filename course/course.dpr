program course;

uses
  Vcl.Forms,
  login in 'login.pas' {loginform},
  main in 'main.pas' {mainform},
  loginhelp in 'loginhelp.pas' {loginhelpform},
  mainhelp in 'mainhelp.pas' {mainhelpform},
  storage in 'storage.pas' {storageform},
  logpasses in 'logpasses.pas' {logpassesform},
  buy in 'buy.pas' {buyform},
  clientorder in 'clientorder.pas' {clientorderform},
  puborder in 'puborder.pas' {puborderform},
  cassir_reports in 'cassir_reports.pas' {cassirreportsform},
  shopreports in 'shopreports.pas' {shopreportsform},
  addbook in 'addbook.pas' {addbookform},
  addauthor in 'addauthor.pas' {addauthorform},
  addpublisher in 'addpublisher.pas' {addpublisherform},
  addgenre in 'addgenre.pas' {addgenreform},
  addbooktype in 'addbooktype.pas' {addbooktypeform},
  addcover in 'addcover.pas' {addcoverform},
  changebook in 'changebook.pas' {changebookform},
  changewriter in 'changewriter.pas' {changewriterform},
  changepublisher in 'changepublisher.pas' {changepublisherform},
  changegenre in 'changegenre.pas' {changegenreform},
  changebooktype in 'changebooktype.pas' {changebooktypeform},
  changecover in 'changecover.pas' {changecoverform},
  removebook in 'removebook.pas' {removebookform},
  removeauthor in 'removeauthor.pas' {removeauthorform},
  removepublisher in 'removepublisher.pas' {removepublisherform},
  removegenre in 'removegenre.pas' {removegenreform},
  removebooktype in 'removebooktype.pas' {removebooktypeform},
  removecover in 'removecover.pas' {removecoverform},
  clients in 'clients.pas' {clientsform},
  storagehelp in 'storagehelp.pas' {storagehelpform};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tloginform, loginform);
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(Tloginhelpform, loginhelpform);
  Application.CreateForm(Tmainhelpform, mainhelpform);
  Application.CreateForm(Tstorageform, storageform);
  Application.CreateForm(Tlogpassesform, logpassesform);
  Application.CreateForm(Tbuyform, buyform);
  Application.CreateForm(Tclientorderform, clientorderform);
  Application.CreateForm(Tpuborderform, puborderform);
  Application.CreateForm(Tcassirreportsform, cassirreportsform);
  Application.CreateForm(Tshopreportsform, shopreportsform);
  Application.CreateForm(Taddbookform, addbookform);
  Application.CreateForm(Taddauthorform, addauthorform);
  Application.CreateForm(Taddpublisherform, addpublisherform);
  Application.CreateForm(Taddgenreform, addgenreform);
  Application.CreateForm(Taddbooktypeform, addbooktypeform);
  Application.CreateForm(Taddcoverform, addcoverform);
  Application.CreateForm(Tchangebookform, changebookform);
  Application.CreateForm(Tchangewriterform, changewriterform);
  Application.CreateForm(Tchangepublisherform, changepublisherform);
  Application.CreateForm(Tchangegenreform, changegenreform);
  Application.CreateForm(Tchangebooktypeform, changebooktypeform);
  Application.CreateForm(Tchangecoverform, changecoverform);
  Application.CreateForm(Tremovebookform, removebookform);
  Application.CreateForm(Tremoveauthorform, removeauthorform);
  Application.CreateForm(Tremovepublisherform, removepublisherform);
  Application.CreateForm(Tremovegenreform, removegenreform);
  Application.CreateForm(Tremovebooktypeform, removebooktypeform);
  Application.CreateForm(Tremovecoverform, removecoverform);
  Application.CreateForm(Tclientsform, clientsform);
  Application.CreateForm(Tstoragehelpform, storagehelpform);
  Application.Run;
end.
