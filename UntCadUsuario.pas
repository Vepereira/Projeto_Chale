unit UntCadUsuario;

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
  TFrmCadUsuario = class(TFrmPadrao1)
    LabelNomeU: TLabel;
    LabelSenhaU: TLabel;
    LabelPerfilU: TLabel;
    DBEditNomeU: TDBEdit;
    DBEditSenhaU: TDBEdit;
    DBLookupPerfilU: TDBLookupComboBox;
    FDQryPerfil: TFDQuery;
    DSPerfil: TDataSource;
    FDTabelaid: TFDAutoIncField;
    FDTabelasenha: TStringField;
    FDTabelanome: TStringField;
    FDTabeladata_inc: TSQLTimeStampField;
    FDTabeladata_alt: TSQLTimeStampField;
    FDTabelastatus: TStringField;
    FDTabelausu_nivel: TIntegerField;
    FDTabelaocultar: TStringField;
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

uses UntDM;

procedure TFrmCadUsuario.FormActivate(Sender: TObject);
begin
FDTabela.TableName:= 'Usuario';
tipoID:= 0;
Executar:= exibeBotoes;
  inherited;
FDTabela.Open();
FDQryPerfil.Open();
Executar:= habilitaBotoes;

end;

end.
