unit UntAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.ImageList, Vcl.ImgList, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TFrmAtendimento = class(TFrmPadrao1)
    FDTabelaID: TFDAutoIncField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    FDTabelaAT_ID_PACIENTE: TIntegerField;
    FDTabelaAT_DATA: TSQLTimeStampField;
    FDTabelaAT_HORA: TSQLTimeStampField;
    FDTabelaAT_ID_MEDICO: TIntegerField;
    FDTabelaAT_VALOR_MEDICO: TBCDField;
    FDTabelaAT_VALOR_MEDICAMENTO: TBCDField;
    FDTabelaAT_VALOR_TOTAL: TBCDField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DSPaciente: TDataSource;
    FDQryPaciente: TFDQuery;
    FDQryMedico: TFDQuery;
    DSMedico: TDataSource;
    GroupBox1: TGroupBox;
    PnlItens: TPanel;
    DBEdit8: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    BtnExcluir: TBitBtn;
    BtnAdcionar: TBitBtn;
    BtnConfirma: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    FDTblItens: TFDTable;
    FDTblItensATI_ID_ATENDIMENTO: TIntegerField;
    FDTblItensATI_ID_MEDICAMENTO: TIntegerField;
    FDTblItensATI_ID_FUNCIONARIO: TIntegerField;
    FDTblItensATI_VALOR_MEDICAMENTO: TBCDField;
    FDTblItensATI_QUANTIDADE: TBCDField;
    FDTblItensATI_VALOR_TOTAL: TBCDField;
    FDTblItensATI_ID: TFDAutoIncField;
    DSItens: TDataSource;
    DSMedicamento: TDataSource;
    DSFuncionario: TDataSource;
    FDQryMedicamento: TFDQuery;
    FDQryFuncionario: TFDQuery;
    FDTblItensNomeMedicamento: TStringField;
    FDTblItensNomeFuncionario: TStringField;
    EdtEstoque: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FDTabelaAT_ID_PACIENTEValidate(Sender: TField);
    procedure FDTabelaAT_ID_MEDICOValidate(Sender: TField);
    procedure BtnAdcionarClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure FDTblItensNewRecord(DataSet: TDataSet);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure FDTblItensATI_ID_MEDICAMENTOValidate(Sender: TField);
    procedure DBEdit10Exit(Sender: TObject);
    procedure FDTblItensAfterPost(DataSet: TDataSet);
    procedure FDTblItensAfterDelete(DataSet: TDataSet);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtendimento: TFrmAtendimento;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmAtendimento.BtnAdcionarClick(Sender: TObject);
begin
  inherited;
  BtnAdcionar.Enabled:= False;
  BtnExcluir.Enabled:= False;
  BtnConfirma.Enabled:= True;
  BtnCancelar.Enabled:= True;

  PnlItens.Enabled:= True;
  //Apontando para ID do Medicamento
  DBEdit8.SetFocus;
  EdtEstoque.Text:= '';

  FDTblItens.Insert;
end;

procedure TFrmAtendimento.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  BtnAdcionar.Enabled:= True;
  BtnExcluir.Enabled:= True;
  BtnConfirma.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;

  EdtEstoque.Text:= '';

  FDTblItens.Cancel;
end;

procedure TFrmAtendimento.BtnConfirmaClick(Sender: TObject);
begin
  inherited;
if DBEdit8.Text = '' then
  begin
    ShowMessage('O campo [Medicamento]' +
                ' não foi preenchido');
    DBEdit8.SetFocus;
    Abort;
  end;

if DBEdit9.Text = '' then
  begin
    ShowMessage('O campo [Valor Unit.]' +
                ' não foi preenchido');
    DBEdit9.SetFocus;
    Abort;
  end;

if DBEdit10.Text = '' then
  begin
    ShowMessage('O campo [Quantidade]' +
                ' não foi preenchido');
    DBEdit10.SetFocus;
    Abort;
  end;

if DBLookupComboBox4.Text = '' then
  begin
    ShowMessage('O campo [Funcionario]' +
                ' não foi preenchido');
    DBLookupComboBox4.SetFocus;
    Abort;
  end;

  BtnAdcionar.Enabled:= True;
  BtnExcluir.Enabled:= True;
  BtnConfirma.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;

  //Baixa do Medicamento do estoque
  DM.FDTblEstoque.Open();
DM.FDTblEstoque.Filter:= 'ID = ' +
  FDTblItensATI_ID_MEDICAMENTO.AsString;
  DM.FDTblEstoque.Filtered:= True;
  DM.FDTblEstoque.Edit;
  DM.FDTblEstoqueMED_QTDE_ESTOQUE.AsInteger:=
   DM.FDTblEstoqueMED_QTDE_ESTOQUE.AsInteger -
   FDTblItensATI_QUANTIDADE.AsInteger;
  DM.FDTblEstoque.Post;
  ShowMessage('A quantidade em estoque foi baixada'+
  'com sucesso.');

  EdtEstoque.Text:= '';
  FDQryMedicamento.Close;
  FDQryMedicamento.Open();

  FDTblItens.Post;
end;

procedure TFrmAtendimento.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  BtnAdcionar.Enabled:= True;
  BtnExcluir.Enabled:= True;
  BtnConfirma.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;

  //Baixa do Medicamento do estoque
  DM.FDTblEstoque.Open();
DM.FDTblEstoque.Filter:= 'ID = ' +
  FDTblItensATI_ID_MEDICAMENTO.AsString;
  DM.FDTblEstoque.Filtered:= True;
  DM.FDTblEstoque.Edit;
  DM.FDTblEstoqueMED_QTDE_ESTOQUE.AsInteger:=
   DM.FDTblEstoqueMED_QTDE_ESTOQUE.AsInteger +
   FDTblItensATI_QUANTIDADE.AsInteger;
  DM.FDTblEstoque.Post;
  ShowMessage('A quantidade em estoque foi atualizada '+
  'com sucesso.');

  EdtEstoque.Text:= '';
  FDQryMedicamento.Close;
  FDQryMedicamento.Open();

  FDTblItens.Delete;
end;

procedure TFrmAtendimento.btn_AlterarClick(Sender: TObject);
begin
  inherited;
  BtnAdcionar.Enabled:= True;
  BtnExcluir.Enabled:= True;
  BtnConfirma.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;
end;

procedure TFrmAtendimento.btn_InserirClick(Sender: TObject);
begin
  inherited;
  FDTabela.Post;
  FDTabela.Edit;
  Executar:= exibePanels;

  BtnAdcionar.Enabled:= True;
  BtnExcluir.Enabled:= False;
  BtnConfirma.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;
end;

procedure TFrmAtendimento.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if (FDTblItensATI_QUANTIDADE.AsInteger
  <= StrToInt(EdtEstoque.Text)) then
 begin
  FDTblItensATI_VALOR_TOTAL.AsFloat:=
   FDTblItensATI_VALOR_MEDICAMENTO.AsFloat*
   FDTblItensATI_QUANTIDADE.AsInteger;
 end
 else
 begin
  MessageDlg('Não há quantidade '+
    'suficiente no estoque',
    mtError,[mbOK],0);
  DBEdit10.SetFocus;
  Abort;
 end;
end;

procedure TFrmAtendimento.FDTabelaAT_ID_MEDICOValidate(Sender: TField);
begin
  inherited;
  if not FDQryMedico.Locate('ID',
FDTabelaAT_ID_MEDICO.AsString,[]) then
  begin
    MessageDlg('Médico não encontrado',
     mtError,[mbOK],0);
    DBLookupComboBox2.SetFocus;
    Abort;
  end
  else
  FDTabelaAT_VALOR_MEDICO.AsFloat:=
    FDQryMedico.FieldByName
    ('FUN_SALARIO').AsFloat;
end;

procedure TFrmAtendimento.FDTabelaAT_ID_PACIENTEValidate(Sender: TField);
begin
  inherited;
  if not FDQryPaciente.Locate('ID',
FDTabelaAT_ID_PACIENTE.AsString,[]) then
  begin
    MessageDlg('Paciente não encontrado',
     mtError,[mbOK],0);
    DBLookupComboBox1.SetFocus;
    Abort;
  end;
end;

procedure TFrmAtendimento.FDTblItensAfterDelete(DataSet: TDataSet);
var
  Bmk: TBookmark;
  ValTot: Real;
begin
  inherited;
  with FDTblItens do
  begin
    Bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0;
      First;
      while not eof do
      begin
        ValTot:= ValTot +
    FDTblItensATI_VALOR_TOTAL.AsFloat;
        Next;
      end;
    finally
    EnableControls;
    if Bmk <> nil then
      begin
      GotoBookmark(bmk);
      FreeBookmark(bmk);
      end;
    end;
    if not (FDTabela.State in
        [dsInsert,dsEdit]) then
    FDTabela.Edit;
    FDTabelaAT_VALOR_MEDICAMENTO.AsFloat:=
      ValTot;
  end;
end;

procedure TFrmAtendimento.FDTblItensAfterPost(DataSet: TDataSet);
var
  Bmk: TBookmark;
  ValTot: Real;
begin
  inherited;
  with FDTblItens do
  begin
    Bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0;
      First;
      while not eof do
      begin
        ValTot:= ValTot +
    FDTblItensATI_VALOR_TOTAL.AsFloat;
        Next;
      end;
    finally
    EnableControls;
    if Bmk <> nil then
      begin
      GotoBookmark(bmk);
      FreeBookmark(bmk);
      end;
    end;
    if not (FDTabela.State in
        [dsInsert,dsEdit]) then
    FDTabela.Edit;
    FDTabelaAT_VALOR_MEDICAMENTO.AsFloat:=
      ValTot;
  end;
end;

procedure TFrmAtendimento.FDTblItensATI_ID_MEDICAMENTOValidate(Sender: TField);
begin
  inherited;
if not FDQryMedicamento.Locate('ID',
FDTblItensATI_ID_MEDICAMENTO.AsString,
[]) then
begin
  MessageDlg('Medicamento não encontrado',
  mtError,[mbOK],0);
  Abort;
end
else
begin
  FDTblItensATI_QUANTIDADE.AsInteger:= 1;
  FDTblItensATI_VALOR_MEDICAMENTO.AsFloat:=
    FDQryMedicamento.FieldByName
    ('MED_VALOR_VENDA').AsFloat;
  EdtEstoque.Text:=
    FDQryMedicamento.FieldByName
    ('MED_QTDE_ESTOQUE').AsString;
  DBEdit10.SetFocus;
end;
end;

procedure TFrmAtendimento.FDTblItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDTblItensATI_ID_ATENDIMENTO.AsInteger:=
    FDTabelaID.AsInteger;
end;

procedure TFrmAtendimento.FormActivate(Sender: TObject);
begin
  FDTabela.TableName:= 'Atendimento';
  tipoID:= 0;

  //Captura o Modo de edição do usuário
//  modoEdicao:=
//    FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_I').AsString +
//    FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_A').AsString +
//    FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_E').AsString;

  Executar:= exibeBotoes;
  inherited;
  FDTabela.Open();
  FDTblItens.Open();
  Executar:= habilitaBotoes;
  FDQryPaciente.Open();
  FDQryMedico.Open();
  FDQryMedicamento.Open();
  FDQryFuncionario.Open();
end;

end.
