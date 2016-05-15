unit UntMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.AppEvnts, Vcl.ExtCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ToolWin, Vcl.ActnMenus, Vcl.Ribbon,
  Vcl.RibbonLunaStyleActnCtrls, Vcl.Imaging.pngimage;

type
  TFrmMenuPrincipal = class(TForm)
    Ribbon1: TRibbon;
    RibbonPage2: TRibbonPage;
    btnNovaReserva: TRibbonGroup;
    btnPrecoReserva: TRibbonGroup;
    btnHistorico: TRibbonGroup;
    RibbonPage3: TRibbonPage;
    btnPrecos: TRibbonGroup;
    btnConsProduto: TRibbonGroup;
    btnConsChale: TRibbonGroup;
    btnClientes: TRibbonGroup;
    btnMovimentacao: TRibbonGroup;
    RibbonPage4: TRibbonPage;
    btnRelChale: TRibbonGroup;
    btnRelClientes: TRibbonGroup;
    btnRelProdutos: TRibbonGroup;
    btnRelUsuario: TRibbonGroup;
    btnRelConsumo: TRibbonGroup;
    btnRelReservas: TRibbonGroup;
    RibbonPage1: TRibbonPage;
    btnCadChale: TRibbonGroup;
    btnCadProduto: TRibbonGroup;
    btnCadUsuario: TRibbonGroup;
    btnCadPerfil: TRibbonGroup;
    btnCadCliente: TRibbonGroup;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image7: TImage;
    Image8: TImage;
    Image6: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    QueryLogin: TFDQuery;
    Button1: TButton;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image5Update(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;

implementation

{$R *.dfm}

uses UntConsumo, UntPadrao1, UntDM, UntCadChale, UntCadCliente, UntCadProduto,
  UntCadUsuario, UntReserva, UntCadPerfil, UntLogin;


procedure TFrmMenuPrincipal.Button1Click(Sender: TObject);
begin
FrmConsumo.ShowModal;
end;

procedure TFrmMenuPrincipal.FormActivate(Sender: TObject);
begin
FrmLogin.ShowModal;
end;

procedure TFrmMenuPrincipal.Image1Click(Sender: TObject);
begin
  FrmCadastroCliente.ShowModal;
end;

procedure TFrmMenuPrincipal.Image2Click(Sender: TObject);
begin
  FrmCadChale.ShowModal;
end;

procedure TFrmMenuPrincipal.Image3Click(Sender: TObject);
begin
  FrmCadProduto.ShowModal;
end;

procedure TFrmMenuPrincipal.Image4Click(Sender: TObject);
begin
  FrmCadUsuario.ShowModal;
end;

procedure TFrmMenuPrincipal.Image5Click(Sender: TObject);
begin
 FrmCadPerfil.ShowModal;
end;

procedure TFrmMenuPrincipal.Image6Click(Sender: TObject);
begin
  FrmReserva.ShowModal;
end;

 procedure TFrmMenuPrincipal.Image5Update(Sender: TObject);
begin
  if QueryLogin.FieldByName
    ('per_usuario').AsString = 'S' then
    Image5.Enabled:= True
  else
    Image5.Enabled:= False;
end;
end.
