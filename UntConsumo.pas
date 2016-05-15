unit UntConsumo;

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
  TFrmConsumo = class(TFrmPadrao1)
    FDTabelaid: TFDAutoIncField;
    FDTabelaqtde: TIntegerField;
    FDTabelav_total: TBCDField;
    FDTabelaidcliente: TIntegerField;
    FDTabelaidchale: TIntegerField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabeladata_alt: TSQLTimeStampField;
    FDTabelaidproduto: TIntegerField;
    FDTabelav_unit: TBCDField;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQryCliente: TFDQuery;
    DSCliente: TDataSource;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    FDTabelastatus: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    FDQryChale: TFDQuery;
    DSChale: TDataSource;
    FDTableConsumo: TFDTable;
    FDTableConsumoidconsumo: TIntegerField;
    FDTableConsumoidproduto: TIntegerField;
    FDTableConsumoqtde: TSingleField;
    FDTableConsumov_unit: TBCDField;
    FDTableConsumov_total: TBCDField;
    DSItens: TDataSource;
    GroupBox1: TGroupBox;
    PnlItens: TPanel;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    FDQryProduto: TFDQuery;
    DSProduto: TDataSource;
    BtnExcluir: TBitBtn;
    BtnAdicionar: TBitBtn;
    BtnConfirmar: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    FDTableConsumoNomeProduto: TStringField;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure FDTableConsumoAfterPost(DataSet: TDataSet);
    procedure DBEdit8Exit(Sender: TObject);
    procedure FDTableConsumoNewRecord(DataSet: TDataSet);
    procedure FDTableConsumoAfterDelete(DataSet: TDataSet);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FDTableConsumoidprodutoValidate(Sender: TField);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsumo: TFrmConsumo;

implementation

{$R *.dfm}

uses UntDM, UntMenuPrincipal, UntCadCliente, UntCadChale, UntCadProduto,
  UntReserva, UntCadUsuario;

procedure TFrmConsumo.BtnAdicionarClick(Sender: TObject);
begin
  inherited;

  BtnAdicionar.Enabled:= False;
  BtnExcluir.Enabled:= False;
  BtnConfirmar.Enabled:= True;
  BtnCancelar.Enabled:= True;

  PnlItens.Enabled:= True;
  DBedit2.SetFocus;
  FDTableConsumo.Insert;

end;

procedure TFrmConsumo.BtnCancelarClick(Sender: TObject);
begin
  inherited;
BtnAdicionar.Enabled:= True;
BtnExcluir.Enabled:= true;
BtnConfirmar.Enabled:= false;
BtnCancelar.Enabled:= False;

PnlItens.Enabled:= False;

FDTableConsumo.Cancel;
end;

procedure TFrmConsumo.BtnConfirmarClick(Sender: TObject);
begin
  inherited;
if(DBEdit2.Text = '') then
  begin
      ShowMessage('O campo [Produto] não foi preenchido');
      DBEdit2.SetFocus;
      Abort
  end;

  if(DBEdit7.Text = '') then
  begin
      ShowMessage('O campo [Valor Unitário] não foi preenchido');
      DBEdit7.SetFocus;
      Abort
  end;

  if(DBEdit8.Text = '') then
  begin
      ShowMessage('O campo [Quantidade] não foi preenchido');
      DBEdit8.SetFocus;
      Abort
  end;

  if(DBLookupComboBox3.Text = '') then
  begin
      ShowMessage('O campo [Produto] não foi preenchido');
      DBLookupComboBox3.SetFocus;
      Abort
  end;

  BtnAdicionar.Enabled:= True;
  BtnExcluir.Enabled:= True;
  BtnConfirmar.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;

  FDTableConsumo.Post;
end;

procedure TFrmConsumo.BtnExcluirClick(Sender: TObject);
begin
  inherited;
BtnAdicionar.Enabled:= true;
BtnExcluir.Enabled:= true;
BtnConfirmar.Enabled:= false;
BtnCancelar.Enabled := false;

PnlItens.Enabled:= false;

FDTableConsumo.Delete;
end;

procedure TFrmConsumo.btn_inserirClick(Sender: TObject);
begin
  inherited;
FDTabela.Post;
FDTabela.Edit;
Executar:= exibePanels;

BtnAdicionar.Enabled:= true;
BtnExcluir.Enabled:= false;
BtnConfirmar.Enabled:= false;
BtnCancelar.Enabled:= false;

PnlItens.Enabled:= False;
end;

procedure TFrmConsumo.Button1Click(Sender: TObject);
begin
  inherited;
FrmCadUsuario.ShowModal;
end;

procedure TFrmConsumo.DBEdit8Exit(Sender: TObject);
begin
  inherited;
FDTableConsumov_total.AsFloat:= FDTableConsumov_unit.AsFloat*FDTableConsumoqtde.AsInteger;
end;

procedure TFrmConsumo.FDTableConsumoAfterDelete(DataSet: TDataSet);
var
  Bmk: TBookMark;
ValTotal: Real;
begin
  inherited;
  With FDTableConsumo do
  begin
      Bmk:= GetBookmark;
      DisableControls;
      try
        ValTotal:= 0;
        first;
      while not Eof do
        begin
          ValTotal:= ValTotal +
           FDTableConsumov_total.AsFloat;
           Next;
      end;
      finally
      EnableControls;
        if Bmk <> nil  then
        begin
          GotoBookmark(Bmk);
          FreeBookmark(Bmk);

      end;
     end;
      if not (FDTabela.State in [dsInsert, dsEdit]) then
        FDTabela.Edit;
        FDTabelav_unit.AsFloat:= ValTotal;
      end;

end;


procedure TFrmConsumo.FDTableConsumoAfterPost(DataSet: TDataSet);
var
  Bmk: TBookMark;
ValTotal: Real;
begin
  inherited;
  With FDTableConsumo do
  begin
      Bmk:= GetBookmark;
      DisableControls;
      try
        ValTotal:= 0;
        first;
      while not Eof do
        begin
          ValTotal:= ValTotal +
           FDTableConsumov_total.AsFloat;
           Next;
      end;
      finally
      EnableControls;
        if Bmk <> nil  then
        begin
          GotoBookmark(Bmk);
          FreeBookmark(Bmk);

      end;
     end;
      if not (FDTabela.State in [dsInsert, dsEdit]) then
        FDTabela.Edit;
        FDTabelav_unit.AsFloat:= ValTotal;
      end;

end;

procedure TFrmConsumo.FDTableConsumoidprodutoValidate(Sender: TField);
begin
  inherited;
   if (not FDQryProduto.Locate('id',FDTableConsumoidproduto.AsString,
  [])) then
  begin
      messageDlg('Produto não encontrado', mtError,[mbOK],0);
      Abort;

  end
  else
  begin
      FDTableConsumoqtde.AsInteger:= 1;
      FDTableConsumov_unit.AsFloat:= FDQryProduto.FieldByName(
      'preco').AsFloat;
      Dbedit8.SetFocus;
  end;
end;

procedure TFrmConsumo.FDTableConsumoNewRecord(DataSet: TDataSet);
begin
  inherited;
FDTableConsumoidconsumo.AsInteger:= FDTabelaid.AsInteger;
end;

procedure TFrmConsumo.FormActivate(Sender: TObject);
begin
FDTabela.TableName:= 'Consumo';
tipoID:= 0;
Executar:= exibeBotoes;
  inherited;
FDTabela.Open();
FDTableConsumo.Open();
Executar:= habilitaBotoes;
FDQryCliente.Open();
FDQryChale.Open();
FDQryProduto.Open();
end;

end.
