inherited FrmPadraoRel1: TFrmPadraoRel1
  Caption = 'FrmPadraoRel1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited SpeedButton1: TSpeedButton
      Left = 24
      ExplicitLeft = 24
    end
  end
  inherited BitBtn1: TBitBtn
    Top = 272
    ExplicitTop = 272
  end
  inherited BitBtn2: TBitBtn
    Top = 272
    ExplicitTop = 272
  end
  inherited StatusBar1: TStatusBar
    ExplicitLeft = 0
    ExplicitTop = 335
    ExplicitWidth = 599
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'SELECT        Consumo.*, Cliente.nomecliente'
      'FROM            Consumo INNER JOIN'
      
        '                         Cliente ON Consumo.idcliente = Cliente.' +
        'id')
    Left = 16
    Top = 88
  end
  inherited frxReport1: TfrxReport
    Left = 376
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  inherited frxPDFExport1: TfrxPDFExport
    Left = 448
  end
  inherited frxDBDataset1: TfrxDBDataset
    Left = 80
    Top = 88
  end
  object FDQuery2: TFDQuery
    Left = 16
    Top = 192
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 80
    Top = 192
  end
end
