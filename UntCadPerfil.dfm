inherited FrmCadPerfil: TFrmCadPerfil
  Caption = 'Manute'#231#227'o no Cadastro de Perfil'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFicha: TPanel
    object PanelSup: TPanel
      Left = 1
      Top = 1
      Width = 631
      Height = 59
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 74
        Height = 13
        Caption = 'N'#237'vel de acesso'
      end
      object Label5: TLabel
        Left = 215
        Top = 8
        Width = 86
        Height = 13
        Caption = 'Descri'#231#227'o do n'#237'vel'
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 8
        Width = 69
        Height = 21
        DataField = 'ID'
        DataSource = DSPadrao
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 307
        Top = 8
        Width = 305
        Height = 21
        DataField = 'PER_DESCRICAO'
        DataSource = DSPadrao
        TabOrder = 1
      end
      object DBCheckBox9: TDBCheckBox
        Left = 16
        Top = 32
        Width = 149
        Height = 17
        Caption = 'Ocultar campos restritos'
        DataField = 'OCULTAR'
        DataSource = DSPadrao
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 60
      Width = 631
      Height = 168
      ActivePage = Ferramentas
      Align = alClient
      TabOrder = 1
      ExplicitTop = 42
      ExplicitHeight = 186
      object TabSheet1: TTabSheet
        Caption = 'Cadastro'
        ExplicitHeight = 158
      end
      object TabSheet2: TTabSheet
        Caption = 'Atendimento'
        ImageIndex = 1
        ExplicitHeight = 158
      end
      object Relatório: TTabSheet
        Caption = 'Relat'#243'rio'
        ImageIndex = 2
        ExplicitHeight = 158
      end
      object Ferramentas: TTabSheet
        Caption = 'Ferramentas'
        ImageIndex = 3
        ExplicitHeight = 158
        object Label2: TLabel
          Left = 9
          Top = 8
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label3: TLabel
          Left = 9
          Top = 31
          Width = 24
          Height = 13
          Caption = 'Perfil'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 192
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Habilitar Menu'
          DataField = 'PER_USUARIO'
          DataSource = DSPadrao
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 316
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Inserir'
          DataField = 'PER_USUARIO_I'
          DataSource = DSPadrao
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 414
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Alterar'
          DataField = 'PER_USUARIO_A'
          DataSource = DSPadrao
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 511
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Excluir'
          DataField = 'PER_USUARIO_E'
          DataSource = DSPadrao
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 193
          Top = 31
          Width = 97
          Height = 17
          Caption = 'Habilitar Menu'
          DataField = 'PER_PERFIL'
          DataSource = DSPadrao
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox6: TDBCheckBox
          Left = 317
          Top = 31
          Width = 97
          Height = 17
          Caption = 'Inserir'
          DataField = 'PER_PERFIL_I'
          DataSource = DSPadrao
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox7: TDBCheckBox
          Left = 415
          Top = 31
          Width = 97
          Height = 17
          Caption = 'Alterar'
          DataField = 'PER_PERFIL_A'
          DataSource = DSPadrao
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 512
          Top = 31
          Width = 97
          Height = 17
          Caption = 'Excluir'
          DataField = 'PER_PERFIL_E'
          DataSource = DSPadrao
          TabOrder = 7
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  inherited FDTabela: TFDTable
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'CONSULTORIO.dbo.Perfil'
    TableName = 'CONSULTORIO.dbo.Perfil'
    Left = 128
    Top = 232
  end
  inherited DSPadrao: TDataSource
    Left = 184
    Top = 232
  end
  inherited ImageList1: TImageList
    Left = 256
    Top = 232
  end
  inherited ImageList2: TImageList
    Left = 320
    Top = 232
  end
  inherited ImageList3: TImageList
    Top = 232
  end
end
