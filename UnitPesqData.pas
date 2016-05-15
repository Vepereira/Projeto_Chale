unit UnitPesqData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TpesqData = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    pesqData1: TDateTimePicker;
    pesqData2: TDateTimePicker;
    Label3: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pesqData: TpesqData;

implementation

{$R *.dfm}

uses UntPadrao1;

procedure TpesqData.BitBtn1Click(Sender: TObject);
begin
tarefaClick := 0;
close;
end;

procedure TpesqData.BitBtn2Click(Sender: TObject);
begin
tarefaClick := 1;

valdata1 := DateToStr(pesqData1.Date);
valdata2 := DateToStr(pesqData2.Date);

val1:= copy(valData1,1,2) + '/' + copy(valData1,4,2) + '/' + copy(valData1,7,4);
val2:= copy(valData1,1,2) + '/' + copy(valData1,4,2) + '/' + copy(valData1,7,4);

end;

procedure TpesqData.FormActivate(Sender: TObject);
begin
pesqData.Caption := tarefa;
Label1.Caption := nomeJanela;
pesqData1.Date := date;
pesqData2.Date := date;
pesqData1.Setfocus;
end;

end.
