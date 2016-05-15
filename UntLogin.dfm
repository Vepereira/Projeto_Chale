object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 381
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 517
    Height = 365
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 128
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label2: TLabel
      Left = 136
      Top = 192
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object BitBtn1: TBitBtn
      Left = 168
      Top = 248
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 272
      Top = 248
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object NomeLogin: TEdit
    Left = 216
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = NomeLoginChange
  end
  object SenhaLogin: TEdit
    Left = 216
    Top = 197
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    OnChange = SenhaLoginChange
    OnKeyPress = SenhaLoginKeyPress
  end
end
