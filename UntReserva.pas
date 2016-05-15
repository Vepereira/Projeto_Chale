unit UntReserva;

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
  TFrmReserva = class(TFrmPadrao1)
    LabelNomeChale: TLabel;
    LabelCodChale: TLabel;
    LabelCodCliente: TLabel;
    LabelNomeCliente: TLabel;
    LabelDataInicio: TLabel;
    LabelDataFim: TLabel;
    LabelValorTotal: TLabel;
    LabelValorDiario: TLabel;
    DBEditCodChaleR: TDBEdit;
    DBLookupNomeChaleR: TDBLookupComboBox;
    DBEditCodClienteR: TDBEdit;
    DBLookupNomeClienteR: TDBLookupComboBox;
    DBEditValorDiaR: TDBEdit;
    DBEditDataInicioR: TDBEdit;
    DBEditDataFimR: TDBEdit;
    DBEditTotalR: TDBEdit;
    FDQryChaleR: TFDQuery;
    FDQryClienteR: TFDQuery;
    DSChaleR: TDataSource;
    DSClienteR: TDataSource;
    FDTabelaid: TFDAutoIncField;
    FDTabeladatainicio: TSQLTimeStampField;
    FDTabeladatafim: TSQLTimeStampField;
    FDTabelavalortotreserva: TStringField;
    FDTabelacodchale: TIntegerField;
    FDTabelacodcliente: TIntegerField;
    FDTabelastatus: TStringField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabeladata_alt: TSQLTimeStampField;
    LabelCpf: TLabel;
    DBEditCpf: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReserva: TFrmReserva;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmReserva.FormActivate(Sender: TObject);
begin
  FDTabela.TableName:= 'Reserva';
tipoID:= 0;
Executar:= exibeBotoes;
  inherited;
FDTabela.Open();
FDQryChaleR.Open();
FDQryClienteR.Open();
Executar:= habilitaBotoes;

end;

end.
