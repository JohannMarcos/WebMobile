program projetoPrincipal;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {Principal},
  uPermissoes in 'uPermissoes.pas',
  uAplicacao in 'uAplicacao.pas' {frmAplicacao},
  uDM in 'uDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
