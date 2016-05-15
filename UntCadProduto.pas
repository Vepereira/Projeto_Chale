unit UntCadProduto;

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
  TFrmCadProduto = class(TFrmPadrao1)
    FDTabelaid: TFDAutoIncField;
    FDTabelanome: TStringField;
    FDTabelapreco: TSingleField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabeladata_alt: TSQLTimeStampField;
    FDTabelastatus: TStringField;
    LabelValorProduto: TLabel;
    LabelNomeProduto: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmCadProduto.FormActivate(Sender: TObject);
begin
  FDTabela.TableName:= 'Produto';
tipoID:= 0;
Executar:= exibeBotoes;
  inherited;
FDTabela.Open();
Executar:= habilitaBotoes;
end;

end.
