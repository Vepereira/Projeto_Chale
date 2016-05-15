unit UntCadPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask;

type
  TFrmCadPerfil = class(TFrmPadrao1)
    PanelSup: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    FDTabelaid: TFDAutoIncField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabeladata_alt: TSQLTimeStampField;
    FDTabelastatus: TStringField;
    FDTabelaocultar: TStringField;
    FDTabelaper_descricao: TStringField;
    FDTabelaper_usuario: TStringField;
    FDTabelaper_usuario_i: TStringField;
    FDTabelaper_usuario_a: TStringField;
    FDTabelaper_usuario_e: TStringField;
    FDTabelaperfil: TStringField;
    FDTabelaperfil_i: TStringField;
    FDTabelaperfil_a: TStringField;
    FDTabelaperfil_e: TStringField;
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

uses UntDM, UntMenuPrincipal;

procedure TFrmCadPerfil.FormActivate(Sender: TObject);
begin
  inherited;
FDTabela.TableName:= 'perfil';

  //Captura o Modo de edição do usuário
  modoEdicao:=
    FrmMenuPrincipal.QueryLogin.FieldByName('perfil_i').AsString +
    FrmMenuPrincipal.QueryLogin.FieldByName('perfil_a').AsString +
    FrmMenuPrincipal.QueryLogin.FieldByName('perfil_e').AsString;

  Executar:= exibeBotoes;
  inherited;
  FDTabela.Open();
  Executar:= habilitaBotoes;


end;

end.
