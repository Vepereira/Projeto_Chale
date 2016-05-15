unit UntLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    NomeLogin: TEdit;
    SenhaLogin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure NomeLoginChange(Sender: TObject);
    procedure SenhaLoginChange(Sender: TObject);
    procedure SenhaLoginKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UntMenuPrincipal;



procedure TFrmLogin.BitBtn1Click(Sender: TObject);
var
  StrSqlLog, mensagem: String;
begin
  strSqlLog:= 'select u.*, p.* '+
  'from usuario u inner join perfil p '+
  'on u.usu_nivel = p.id '+
  'where u.nome = '+#39+
  NomeLogin.Text+
  #39 + ' and u.senha = ' +
  #39 + SenhaLogin.Text + #39;

  FrmMenuPrincipal.QueryLogin.Close;
  FrmMenuPrincipal.QueryLogin.SQL.Clear;
  FrmMenuPrincipal.QueryLogin.SQL.Add(strSqlLog);
  FrmMenuPrincipal.QueryLogin.Open();


  if FrmMenuPrincipal.QueryLogin.
  RecordCount = 1 then
  begin
      FrmLogin.Close;
  end;

  if FrmMenuPrincipal.QueryLogin.
  RecordCount = 0 then
  begin
    mensagem:= 'Nome ou senha do usuário '+
    'inválidos.' + #13 + #13 +
    'Se você esqueceu sua '+
    'senha, consulte ' + #13 +
    'o administrador do sistema.';

    Application.MessageBox(PChar
    (mensagem),
    'Login não autorizado',
    MB_OK+MB_IconError);

    BitBtn1.Enabled:= True;
    NomeLogin.Enabled:= True;
    SenhaLogin.Enabled:= True;
    NomeLogin.Clear;
    SenhaLogin.Clear;
    NomeLogin.SetFocus;


end;
end;

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
NomeLoginChange(sender);
end;

procedure TFrmLogin.NomeLoginChange(Sender: TObject);
begin
 Bitbtn1.Enabled:= (Length(NomeLogin.Text) > 0) and
 (Length(SenhaLogin.Text) > 0 ) ;
end;

procedure TFrmLogin.SenhaLoginChange(Sender: TObject);
begin
Bitbtn1.Enabled:= (Length(NomeLogin.Text) > 0) and
 (Length(SenhaLogin.Text) > 0 ) ;
end;

procedure TFrmLogin.SenhaLoginKeyPress(Sender: TObject; var Key: Char);
begin
if key= #13 then
    BitBtn1.Click;
end;

end.
