unit UntCadChale;

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
  TFrmCadChale = class(TFrmPadrao1)
    LabelNomeChale: TLabel;
    LabelValorDia: TLabel;
    LabelCapacChale: TLabel;
    DBEditNomeChale: TDBEdit;
    DBEditCapacChale: TDBEdit;
    DBEditValorDia: TDBEdit;
    FDTabelaid: TFDAutoIncField;
    FDTabelacapac: TStringField;
    FDTabelavalordiario: TStringField;
    FDTabelastatus: TStringField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabeladata_alt: TSQLTimeStampField;
    FDTabelacodcliente: TIntegerField;
    FDTabelanomechale: TStringField;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadChale: TFrmCadChale;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmCadChale.FormActivate(Sender: TObject);
begin
   FDTabela.TableName:= 'Chale';
tipoID:= 0;
Executar:= exibeBotoes;
  inherited;
FDTabela.Open();
Executar:= habilitaBotoes;

end;

end.
