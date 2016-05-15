unit UntPadrao1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TExecutar = (navegacao, sentencaSQL, exibePanels,
              desabilitaBotoes, habilitaBotoes, exibeBotoes);
  TFrmPadrao1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ToolBar1: TToolBar;
    btn_pesquisa: TToolButton;
    btn_ordenar: TToolButton;
    Separador1: TToolButton;
    btn_primeiro: TToolButton;
    btn_anterior: TToolButton;
    btn_proximo: TToolButton;
    btn_ultimo: TToolButton;
    Separador2: TToolButton;
    btn_inserir: TToolButton;
    btn_alterar: TToolButton;
    btn_excluir: TToolButton;
    Separador3: TToolButton;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    Separador4: TToolButton;
    btn_sair: TToolButton;
    StatusBar1: TStatusBar;
    PanelEntrada: TPanel;
    Label1: TLabel;
    LabelStatus: TLabel;
    ValorCampo: TEdit;
    btnOk: TSpeedButton;
    CheckHabilita: TDBCheckBox;
    PanelFicha: TPanel;
    FDTabela: TFDTable;
    DSPadrao: TDataSource;
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_anteriorClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
    FEXecutar: TExecutar;
    procedure SetExecutar(const Value: TExecutar);
  public
    { Public declarations }
    property Executar: TExecutar read FEXecutar
                                 write SetExecutar;
  end;

var
  FrmPadrao1: TFrmPadrao1;
  //Armazena a sentença SQL atual
  strSqlAtual: String;
  //Define o tipo do campo ID
  tipoID: integer;
  //Armazena a senteça SQL
  strSQL: String;
  //Define o nome da tabela em uso
  nomeTabela: String;
  //Define operação de inclusão
  operacaoIncluir: Integer;
  //Define as ações de inclusão, alteração e exlcusão
  modoEdicao: String;
  //Define o titulo da Janelas Filhas
  nomeJanela: String;
  //Armazena datas no formato String
  valdata1, valdata2, val1, val2: String;
  //Armazena o nome de uma tarefa em Andamento
  tarefa: String;
  //Contole do botão pesquisar da Janela PesqData
  tarefaClick: integer;
  //Montagem da mensagem de informação
  mensagem: String;

implementation

{$R *.dfm}

uses UntDM;

{ TFrmPadrao1 }

procedure TFrmPadrao1.btn_alterarClick(Sender: TObject);
begin
  FDTabela.Edit;

  //Habilita a exibição de Objetos
  ValorCampo.Enabled:= False;
  btnOk.Enabled:= False;
  checkHabilita.Enabled:= True;
  PanelFicha.Enabled:= True;

  //Alteração de registro
  FDTabela.FieldByName('DATA_ALT').AsDateTime:= Date;

  //Botões e barra de status
  Executar:= desabilitaBotoes;
  StatusBar1.Panels[2].Text:= 'Alterçaõ de registro';

  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_AnteriorClick(Sender: TObject);
begin
  FDTabela.Prior;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_cancelarClick(Sender: TObject);
begin
  FDTabela.Cancel;

  mensagem:= 'A inclusão ou alteração deste ' +
             'registro foi abortada.';
  Application.MessageBox(PChar(mensagem),
            'Atenção',MB_OK+MB_ICONERROR);

  Executar:= habilitaBotoes;

  //Habilita a exibição de objetos
  ValorCampo.Text:= '';
  ValorCampo.Enabled:= True;
  btnOk.Visible:= True;
  checkHabilita.Enabled:= False;
  PanelFicha.Enabled:= False;

  if FDTabela.FieldByName('STATUS').AsString = 'N' then
    labelStatus.Visible:= True
    else
    labelStatus.Visible:= False;
end;

procedure TFrmPadrao1.btn_excluirClick(Sender: TObject);
var confExcl: integer;
begin
  Beep;
  confExcl:= Application.MessageBox(
    'Confirma a exclusão desse registro?',
    'Atenção',
    MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

    if confExcl = IDYES then
    begin
      FDTabela.Delete;

      mensagem:= 'O registro foi excluido com sucesso.';
      Application.MessageBox(PChar(mensagem),
                'Informação',
                MB_OK+MB_ICONINFORMATION);
    end;

    if confExcl = IDNO then
    begin
      mensagem:= 'A exclusão desse registro foi abortada.';
      Application.MessageBox(PChar(mensagem),
                'Informação',
                MB_OK+MB_ICONINFORMATION);
    end;

    Executar:= habilitaBotoes;
    Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_inserirClick(Sender: TObject);
begin
  operacaoIncluir:= 1;

  if FDTabela.Active = False then
  begin
    FDTabela.Open();
  end;

  FDTabela.Insert;

  //Habilita a exibição de Objetos
  ValorCampo.Enabled:= False;
  btnOk.Enabled:= False;
  checkHabilita.Enabled:= False;
  labelStatus.Visible:= False;
  PanelFicha.Enabled:= True;

  //Inclusão de registro
  FDTabela.FieldByName('STATUS').AsString:= 'S';
  FDTabela.FieldByName('DATA_INC').AsDateTime:= Date;

  //Botões e barra de status
  Executar:= desabilitaBotoes;
  StatusBar1.Panels[2].Text:= 'Inclusão de novo registro';

  Executar:= exibePanels;
  operacaoIncluir:= 0;
end;

procedure TFrmPadrao1.btn_primeiroClick(Sender: TObject);
begin
  FDTabela.First;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_proximoClick(Sender: TObject);
begin
  FDTabela.Next;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.btn_sairClick(Sender: TObject);
begin
  FDTabela.Close;
  Close;
end;

procedure TFrmPadrao1.btn_salvarClick(Sender: TObject);
begin
  FDTabela.Post;

  mensagem:= 'O registro foi incluido ou alterado ' +
             'com sucesso.';
  Application.MessageBox(PChar(mensagem),
            'Informação',MB_OK+MB_ICONINFORMATION);

  Executar:= habilitaBotoes;

  //Habilita a exibição de objetos
  ValorCampo.Text:= '';
  ValorCampo.Enabled:= True;
  btnOk.Visible:= True;
  checkHabilita.Enabled:= False;
  PanelFicha.Enabled:= False;

  if FDTabela.FieldByName('STATUS').AsString = 'N' then
    labelStatus.Visible:= True
    else
    labelStatus.Visible:= False;
end;

procedure TFrmPadrao1.btn_ultimoClick(Sender: TObject);
begin
  FDTabela.Last;
  Executar:= navegacao;
  Executar:= exibePanels;
end;

procedure TFrmPadrao1.SetExecutar(const Value: TExecutar);
begin
     FEXecutar:= Value;
  case value of
    //Habilita botões de navegação
    navegacao:
    begin
      if FDTabela.Eof = True then
      begin
        btn_Proximo.Enabled:= False;
        btn_Ultimo.Enabled:= False;
      end
      else
      begin
        btn_Proximo.Enabled:= True;
        btn_Ultimo.Enabled:= True;
      end;

      if FDTabela.Bof = True then
      begin
        btn_Primeiro.Enabled:= False;
        btn_Anterior.Enabled:= False;
      end
      else
      begin
        btn_Primeiro.Enabled:= True;
        btn_Anterior.Enabled:= True;
      end;
    end;
    //Executar a sentença SQL
    sentencaSQL:
    begin
      FDTabela.Close;
      FDTabela.Open();

      if (FDTabela.RecordCount = 0) and (operacaoIncluir = 0) then
      begin
        mensagem:= 'Não foi encontrado nenhum registro que '
                 +#13 + 'satisfaça a sua pesquisa.';
        Application.MessageBox(PChar(mensagem),
          'Informação',MB_OK+MB_ICONINFORMATION);
      end;
    end;
    //Exibe os textos nos paineis da barra de status
    exibePanels:
    begin
      StatusBar1.Panels[0].Text:= 'INC: ' +
          FDTabela.FieldByName('DATA_INC').AsString;
      StatusBar1.Panels[1].Text:= 'ALT: ' +
          FDTabela.FieldByName('DATA_ALT').AsString;
      StatusBar1.Panels[3].Text:=
          FDTabela.FieldByName('ID').AsString;

    if (FDTabela.RecordCount = 0) and (operacaoIncluir = 0) then
    begin
      StatusBar1.Panels[0].Text:= '';
      StatusBar1.Panels[1].Text:= '';
      StatusBar1.Panels[2].Text:= '';
      StatusBar1.Panels[3].Text:= '';
    end;

    if FDTabela.FieldByName('STATUS').AsString = 'N' then
      labelStatus.Visible:= True
      else
      labelStatus.Visible:= False;

    end;

      //Desabilita botões ao incluir ou alterar um registro
    desabilitaBotoes:
    begin
      btn_Pesquisa.Enabled:= False;
      btn_Ordenar.Enabled:= False;
      btn_Primeiro.Enabled:= False;
      btn_Anterior.Enabled:= False;
      btn_Proximo.Enabled:= False;
      btn_Ultimo.Enabled:= False;
      btn_Inserir.Enabled:= False;
      btn_Alterar.Enabled:= False;
      btn_Excluir.Enabled:= False;
      btn_Salvar.Enabled:= True;
      btn_Cancelar.Enabled:= True;
      btn_Sair.Enabled:= False;
    end;
   //Habilita botões ao Salvar ou Cancelar uma inclusão ou alteração
    habilitaBotoes:
    begin
      if FDTabela.RecordCount > 0 then
      begin
        btn_Pesquisa.Enabled:= True;
        btn_Ordenar.Enabled:= True;
      end
      else
      begin
        btn_Pesquisa.Enabled:= False;
        btn_Ordenar.Enabled:= False;
      end;
      btn_Primeiro.Enabled:= True;
      btn_Anterior.Enabled:= True;
      btn_Proximo.Enabled:= True;
      btn_Ultimo.Enabled:= True;
      btn_Inserir.Enabled:= True;
      if FDTabela.RecordCount = 0 then
      begin
        btn_Alterar.Enabled:= False;
        btn_Excluir.Enabled:= False;
      end
      else
      begin
        btn_Alterar.Enabled:= True;
        btn_Excluir.Enabled:= True;
      end;
      btn_Salvar.Enabled:= False;
      btn_Cancelar.Enabled:= False;
      btn_Sair.Enabled:= True;
    end;
    //Exibe botôes de edição conforme o perfil do usuario
    exibeBotoes:
    begin
      if modoEdicao = 'NNN' then
      begin
        btn_Inserir.Visible:= False;
        btn_Alterar.Visible:= False;
        btn_Excluir.Visible:= False;
        btn_Salvar.Visible:= False;
        btn_Cancelar.Visible:= False;
        Separador3.Visible:= False;
        Separador4.Visible:= False;
      end;

      if modoEdicao = 'NNS' then
      begin
        btn_Inserir.Visible:= False;
        btn_Alterar.Visible:= False;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= False;
        btn_Cancelar.Visible:= False;
        Separador3.Visible:= True;
        Separador4.Visible:= False;
      end;

      if modoEdicao = 'NSN' then
      begin
        btn_Inserir.Visible:= False;
        btn_Alterar.Visible:= True;
        btn_Excluir.Visible:= False;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        Separador3.Visible:= True;
        Separador4.Visible:= True;
      end;

      if modoEdicao = 'NSS' then
      begin
        btn_Inserir.Visible:= False;
        btn_Alterar.Visible:= True;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        Separador3.Visible:= True;
        Separador4.Visible:= True;
      end;

      if modoEdicao = 'SNN' then
      begin
        btn_Inserir.Visible:= True;
        btn_Alterar.Visible:= False;
        btn_Excluir.Visible:= False;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        Separador3.Visible:= True;
        Separador4.Visible:= True;
      end;

      if modoEdicao = 'SSN' then
      begin
        btn_Inserir.Visible:= True;
        btn_Alterar.Visible:= True;
        btn_Excluir.Visible:= False;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        Separador3.Visible:= True;
        Separador4.Visible:= True;
      end;

      if modoEdicao = 'SNS' then
      begin
        btn_Inserir.Visible:= True;
        btn_Alterar.Visible:= False;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        Separador3.Visible:= True;
        Separador4.Visible:= True;
      end;

      if modoEdicao = 'SSS' then
      begin
        btn_Inserir.Visible:= True;
        btn_Alterar.Visible:= True;
        btn_Excluir.Visible:= True;
        btn_Salvar.Visible:= True;
        btn_Cancelar.Visible:= True;
        Separador3.Visible:= True;
        Separador4.Visible:= True;
      end;
    end;
  end;

end;
end.
