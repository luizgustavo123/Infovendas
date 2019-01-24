inherited Fm_RelContaRecebe: TFm_RelContaRecebe
  Caption = 'Frm_RelContaRecebe'
  ClientWidth = 1009
  ExplicitWidth = 1025
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    Left = 48
    DataSource = DsTabela
    ExplicitLeft = 48
    inherited RLBand1: TRLBand
      inherited RLLabel1: TRLLabel
        Left = 272
        Width = 174
        Caption = 'Contas a Receber'
        ExplicitLeft = 272
        ExplicitWidth = 174
      end
    end
    inherited RLBand2: TRLBand
      object RLDBText1: TRLDBText
        Left = 3
        Top = 1
        Width = 47
        Height = 15
        DataField = 'CONR_COD'
        DataSource = DsTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBMemo1: TRLDBMemo
        Left = 58
        Top = 1
        Width = 185
        Height = 15
        Behavior = [beSiteExpander]
        DataField = 'CLI_NOME'
        DataSource = DsTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBMemo2: TRLDBMemo
        Left = 249
        Top = 1
        Width = 54
        Height = 15
        Alignment = taCenter
        Behavior = [beSiteExpander]
        DataField = 'CONR_PARCELA'
        DataSource = DsTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBMemo3: TRLDBMemo
        Left = 308
        Top = 1
        Width = 80
        Height = 15
        Alignment = taCenter
        Behavior = [beSiteExpander]
        DataField = 'CONR_DATA_RECEBER'
        DataSource = DsTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBMemo5: TRLDBMemo
        Left = 394
        Top = 1
        Width = 80
        Height = 15
        Behavior = [beSiteExpander]
        DataField = 'CONR_SITUACAO'
        DataSource = DsTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBMemo6: TRLDBMemo
        Left = 622
        Top = 1
        Width = 92
        Height = 15
        Alignment = taCenter
        Behavior = [beSiteExpander]
        DataField = 'CONR_VALOR_PARCELA'
        DataSource = DsTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDBMemo4: TRLDBMemo
        Left = 558
        Top = 1
        Width = 62
        Height = 15
        Behavior = [beSiteExpander]
        DataField = 'CONR_DATA_PAGO'
        DataSource = DsTabela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LbaStatus: TRLLabel
        Left = 484
        Top = 1
        Width = 68
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited RLBand3: TRLBand
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 648
        Top = 4
        Width = 65
        Height = 16
        DataField = 'CONR_VALOR_PARCELA'
        DataSource = DsTabela
        DisplayMask = '#,,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 606
        Top = 4
        Width = 40
        Height = 16
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited RLBand4: TRLBand
      object RLLabel2: TRLLabel
        Left = 1
        Top = -1
        Width = 49
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 56
        Top = -1
        Width = 49
        Height = 16
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 247
        Top = -1
        Width = 53
        Height = 16
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 308
        Top = -1
        Width = 80
        Height = 16
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 393
        Top = -1
        Width = 58
        Height = 16
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 644
        Top = -1
        Width = 38
        Height = 16
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 558
        Top = -1
        Width = 62
        Height = 16
        Caption = 'Data Pag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 483
        Top = 0
        Width = 69
        Height = 16
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object DsTabela: TDataSource
    DataSet = CdTabela
    Left = 552
    Top = 16
  end
  object CdTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpTabela'
    Left = 608
    Top = 16
    object CdTabelaCONR_COD: TIntegerField
      FieldName = 'CONR_COD'
      Required = True
    end
    object CdTabelaCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object CdTabelaCONR_PARCELA: TStringField
      FieldName = 'CONR_PARCELA'
    end
    object CdTabelaCONR_VALOR_PARCELA: TFloatField
      FieldName = 'CONR_VALOR_PARCELA'
      DisplayFormat = '#,,0.00'
    end
    object CdTabelaCONR_DATA_RECEBER: TDateField
      FieldName = 'CONR_DATA_RECEBER'
    end
    object CdTabelaCONR_SITUACAO: TStringField
      FieldName = 'CONR_SITUACAO'
      Size = 50
    end
    object CdTabelaCONR_DATA_PAGO: TDateField
      FieldName = 'CONR_DATA_PAGO'
    end
  end
  object DpTabela: TDataSetProvider
    DataSet = SQLTabela
    Left = 664
    Top = 16
  end
  object SQLTabela: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'CONR_COD,'
      'CLI_NOME,'
      'CONR_DATA_PAGO,'
      'CONR_PARCELA,'
      'CONR_VALOR_PARCELA,'
      'CONR_DATA_RECEBER,'
      'CONR_SITUACAO'
      'FROM CONTAS_RECEBER'
      'INNER JOIN vendas'
      'ON VEN_COD = CONR_VENDAS_FK'
      'LEFT OUTER JOIN CLIENTES'
      'ON VEN_CLIENTES_FK = CLI_COD')
    SQLConnection = DataModule1.SQLConnection1
    Left = 720
    Top = 16
    object SQLTabelaCONR_COD: TIntegerField
      FieldName = 'CONR_COD'
      Required = True
    end
    object SQLTabelaCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object SQLTabelaCONR_PARCELA: TStringField
      FieldName = 'CONR_PARCELA'
    end
    object SQLTabelaCONR_VALOR_PARCELA: TFloatField
      FieldName = 'CONR_VALOR_PARCELA'
    end
    object SQLTabelaCONR_DATA_RECEBER: TDateField
      FieldName = 'CONR_DATA_RECEBER'
    end
    object SQLTabelaCONR_SITUACAO: TStringField
      FieldName = 'CONR_SITUACAO'
      Size = 50
    end
    object SQLTabelaCONR_DATA_PAGO: TDateField
      FieldName = 'CONR_DATA_PAGO'
    end
  end
end
