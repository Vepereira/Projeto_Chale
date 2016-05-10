unit UntCadPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.ImageList, Vcl.ImgList, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask;

type
  TFrmCadPerfil = class(TFrmPadrao1)
    PanelSup: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Relatório: TTabSheet;
    Ferramentas: TTabSheet;
    Label2: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPerfil: TFrmCadPerfil;

implementation

{$R *.dfm}

uses UntMenuPrincipal;

procedure TFrmCadPerfil.FormActivate(Sender: TObject);
begin
  FDTabela.TableName:= 'PERFIL';

  //Captura o Modo de edição do usuário
  modoEdicao:=
    FrmMenuPrincipal.QueryLogin.FieldByName('PER_PERFIL_I').AsString +
    FrmMenuPrincipal.QueryLogin.FieldByName('PER_PERFIL_A').AsString +
    FrmMenuPrincipal.QueryLogin.FieldByName('PER_PERFIL_E').AsString;

  Executar:= exibeBotoes;
  inherited;
  FDTabela.Open();
  Executar:= habilitaBotoes;
end;

end.
