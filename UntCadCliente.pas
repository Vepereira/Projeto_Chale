unit UntCadCliente;

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
  TFrmCadastroCliente = class(TFrmPadrao1)
    DBEditNome: TDBEdit;
    DBEditRG: TDBEdit;
    Label_NomeCliente: TLabel;
    Label_Rg: TLabel;
    Label_Endereco: TLabel;
    Label_Bairro: TLabel;
    Label_Cidade: TLabel;
    Label_Estado: TLabel;
    Label_Cep: TLabel;
    Label_DataNasc: TLabel;
    Label_Tel: TLabel;
    DBEditEndereco: TDBEdit;
    DBEditBairro: TDBEdit;
    DBEditCidade: TDBEdit;
    DBEditCEP: TDBEdit;
    DBEditDataNasc: TDBEdit;
    DBEditTel: TDBEdit;
    DBLookupEstado: TDBLookupComboBox;
    LabelCpf: TLabel;
    DBEditCpf: TDBEdit;
    FDTabelaid: TFDAutoIncField;
    FDTabelanomecliente: TStringField;
    FDTabelarg: TStringField;
    FDTabelaendereco: TStringField;
    FDTabelabairro: TStringField;
    FDTabelacidade: TStringField;
    FDTabelaestado: TStringField;
    FDTabelacep: TStringField;
    FDTabelanascimento: TSQLTimeStampField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabelastatus: TStringField;
    FDTabeladata_alt: TSQLTimeStampField;
    FDTabelatelefone: TStringField;
    FDTabelacpf: TStringField;
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmCadastroCliente.btn_alterarClick(Sender: TObject);
begin
  inherited;
FDTabela.Post;
FDTabela.Edit;
Executar:= exibePanels;

end;

procedure TFrmCadastroCliente.btn_inserirClick(Sender: TObject);
begin
  inherited;
FDTabela.Post;
FDTabela.Edit;
Executar:= exibePanels;

end;

procedure TFrmCadastroCliente.FormActivate(Sender: TObject);
begin
FDTabela.TableName:= 'Cliente';
tipoID:= 0;
Executar:= exibeBotoes;
  inherited;
FDTabela.Open();
Executar:= habilitaBotoes;
end;

end.
