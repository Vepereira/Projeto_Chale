unit UntCadUsuario;

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
  TFrmCadUsuario = class(TFrmPadrao1)
    FDTabelaID: TFDAutoIncField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    FDTabelaOCULTAR: TStringField;
    FDTabelaUSU_NOME: TStringField;
    FDTabelaUSU_SENHA: TStringField;
    FDTabelaUSU_NIVEL: TIntegerField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DSPerfil: TDataSource;
    FDQryPerfil: TFDQuery;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.dfm}

uses UntDM, UntMenuPrincipal;

procedure TFrmCadUsuario.FormActivate(Sender: TObject);
begin
  FDTabela.TableName:= 'Usuario';
  tipoID:= 0;

  //Captura o Modo de edição do usuário
  modoEdicao:=
    FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_I').AsString +
    FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_A').AsString +
    FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_E').AsString;

  Executar:= exibeBotoes;
  inherited;
  FDTabela.Open();
  Executar:= habilitaBotoes;
  FDQryPerfil.Close;
  FDQryPerfil.SQL.Clear;
  FDQryPerfil.SQL.Add('select ID, '+
      'PER_DESCRICAO from PERFIL '+
      'where STATUS = '+#39+'S'+#39 +
      'order by PER_DESCRICAO ');
  FDQryPerfil.Open();
end;

end.
