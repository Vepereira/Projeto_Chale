program Chale;

uses
  Vcl.Forms,
  UntMenuPrincipal in 'UntMenuPrincipal.pas' {FrmMenuPrincipal},
  UntDM in 'UntDM.pas' {DM: TDataModule},
  UntPadrao1 in 'UntPadrao1.pas' {FrmPadrao1},
  Vcl.Themes,
  Vcl.Styles,
  UntConsumo in 'UntConsumo.pas' {FrmConsumo},
  UntCadCliente in 'UntCadCliente.pas' {FrmCadastroCliente},
  UntCadChale in 'UntCadChale.pas' {FrmCadChale},
  UntCadProduto in 'UntCadProduto.pas' {FrmCadProduto},
  UntReserva in 'UntReserva.pas' {FrmReserva},
  UntCadUsuario in 'UntCadUsuario.pas' {FrmCadUsuario},
  UntCadPerfil in 'UntCadPerfil.pas' {FrmCadPerfil},
  UntLogin in 'UntLogin.pas' {FrmLogin},
  UntPadraoRel in 'UntPadraoRel.pas' {FrmPadraoRel},
  UntRelConsumo in 'UntRelConsumo.pas' {FrmPadraoRel1},
  UnitPesqString in 'UnitPesqString.pas' {pesqString},
  UnitPesqData in 'UnitPesqData.pas' {pesqData};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenuPrincipal, FrmMenuPrincipal);
  Application.CreateForm(TFrmPadrao1, FrmPadrao1);
  Application.CreateForm(TFrmConsumo, FrmConsumo);
  Application.CreateForm(TFrmCadastroCliente, FrmCadastroCliente);
  Application.CreateForm(TFrmCadChale, FrmCadChale);
  Application.CreateForm(TFrmCadProduto, FrmCadProduto);
  Application.CreateForm(TFrmReserva, FrmReserva);
  Application.CreateForm(TFrmCadUsuario, FrmCadUsuario);
  Application.CreateForm(TFrmCadPerfil, FrmCadPerfil);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPadraoRel, FrmPadraoRel);
  Application.CreateForm(TFrmPadraoRel1, FrmPadraoRel1);
  Application.CreateForm(TpesqString, pesqString);
  Application.CreateForm(TpesqData, pesqData);
  Application.Run;
end.
