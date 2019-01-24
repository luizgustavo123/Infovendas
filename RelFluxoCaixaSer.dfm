object FrmRelFluxoCaixaSer: TFrmRelFluxoCaixaSer
  Left = 0
  Top = 0
  Caption = 'FrmRelFluxoCaixaSer'
  ClientHeight = 553
  ClientWidth = 1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RlrFluxoCaixa: TRLReport
    Left = -7
    Top = 32
    Width = 1123
    Height = 794
    DataSource = DsVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 45
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 452
        Top = 10
        Width = 142
        Height = 24
        Align = faCenter
        Alignment = taCenter
        Caption = 'Fluxo de caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 83
      Width = 1047
      Height = 22
      BandType = btHeader
      object RLLabel2: TRLLabel
        Left = 3
        Top = 2
        Width = 71
        Height = 18
        Caption = 'Data Pag.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 99
        Top = 2
        Width = 206
        Height = 18
        Caption = 'Tipo de movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 311
        Top = 2
        Width = 55
        Height = 18
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 375
        Top = 2
        Width = 81
        Height = 18
        Caption = 'Pag '#224' vista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 568
        Top = 2
        Width = 88
        Height = 18
        Caption = 'Pag Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 729
        Top = 1
        Width = 88
        Height = 18
        Alignment = taCenter
        Caption = 'Lucro bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 877
        Top = 2
        Width = 66
        Height = 18
        Alignment = taCenter
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 105
      Width = 1047
      Height = 24
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = RLBand3BeforePrint
      object RLDBText1: TRLDBText
        Left = 3
        Top = 6
        Width = 90
        Height = 18
        DataField = 'VEN_DATA'
        DataSource = DsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 99
        Top = 6
        Width = 210
        Height = 18
        DataField = 'DESC'
        DataSource = DsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 311
        Top = 6
        Width = 55
        Height = 16
        Alignment = taCenter
        DataField = 'VEN_COD'
        DataSource = DsVenda
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 375
        Top = 6
        Width = 86
        Height = 16
        Alignment = taCenter
        DataField = 'VEN_VALOR_TOTAL'
        DataSource = DsVenda
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 568
        Top = 6
        Width = 73
        Height = 16
        Alignment = taCenter
        DataField = 'MyColumn5'
        DataSource = DsVenda
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 739
        Top = 6
        Width = 67
        Height = 15
        DataField = 'VEN_LUCRO_TOTAL'
        DataSource = DsVenda
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 877
        Top = 6
        Width = 66
        Height = 16
        DataField = 'SITU'
        DataSource = DsVenda
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 129
      Width = 1047
      Height = 104
      BandType = btSummary
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      BeforePrint = RLBand4BeforePrint
      object RLLabel21: TRLLabel
        Left = 804
        Top = 4
        Width = 182
        Height = 19
        Caption = 'Previsto para o periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel20: TRLLabel
        Left = 267
        Top = 4
        Width = 38
        Height = 19
        Caption = 'Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLPanel1: TRLPanel
        Left = 714
        Top = 23
        Width = 327
        Height = 77
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Transparent = False
      end
      object RLPanel2: TRLPanel
        Left = 40
        Top = 23
        Width = 558
        Height = 77
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Transparent = False
      end
      object RLLabel15: TRLLabel
        Left = 51
        Top = 81
        Width = 89
        Height = 14
        Caption = 'Parcelas pagas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText13: TRLDBText
        Left = 141
        Top = 81
        Width = 27
        Height = 14
        DataField = 'SUM'
        DataSource = DsContaPagParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBText9: TRLDBText
        Left = 161
        Top = 64
        Width = 27
        Height = 14
        DataField = 'SUM'
        DataSource = DsContaRecebida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel11: TRLLabel
        Left = 51
        Top = 64
        Width = 111
        Height = 14
        Caption = 'Parcelas recebidas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel16: TRLLabel
        Left = 51
        Top = 47
        Width = 92
        Height = 14
        Caption = 'Servi'#231'os '#224' vista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText14: TRLDBText
        Left = 143
        Top = 47
        Width = 60
        Height = 14
        DataField = 'SUM'
        DataSource = DsServTotal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBText7: TRLDBText
        Left = 135
        Top = 30
        Width = 60
        Height = 14
        DataField = 'SUM'
        DataSource = DsVendaavista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 51
        Top = 30
        Width = 86
        Height = 14
        Caption = 'Vendas '#224' vista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel19: TRLLabel
        Left = 365
        Top = 64
        Width = 71
        Height = 14
        Caption = 'Lucro bruto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RllLucroBruto: TRLLabel
        Left = 435
        Top = 64
        Width = 72
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText11: TRLDBText
        Left = 485
        Top = 47
        Width = 64
        Height = 14
        DataField = 'SUM'
        DataSource = DsContasPaga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 365
        Top = 47
        Width = 119
        Height = 14
        Caption = 'Contas pagas '#224' vista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RllLucro: TRLLabel
        Left = 447
        Top = 30
        Width = 78
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel10: TRLLabel
        Left = 365
        Top = 30
        Width = 82
        Height = 14
        Caption = 'Lucro l'#237'quido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel13: TRLLabel
        Left = 728
        Top = 81
        Width = 87
        Height = 14
        Caption = 'Lucro previsto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RllLucroAreceber: TRLLabel
        Left = 816
        Top = 81
        Width = 100
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText15: TRLDBText
        Left = 856
        Top = 64
        Width = 95
        Height = 14
        DataField = 'LUCROARECEBER'
        DataSource = DsLucroBrutoAreceber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel17: TRLLabel
        Left = 728
        Top = 64
        Width = 127
        Height = 14
        Caption = 'Lucro bruto a receber:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 728
        Top = 47
        Width = 109
        Height = 14
        Caption = 'Parcelas '#224' receber:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBText8: TRLDBText
        Left = 837
        Top = 47
        Width = 27
        Height = 14
        DataField = 'SUM'
        DataSource = DsContaAreceber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBText10: TRLDBText
        Left = 825
        Top = 30
        Width = 27
        Height = 14
        DataField = 'SUM'
        DataSource = DsContaParcelaApagar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLLabel14: TRLLabel
        Left = 728
        Top = 30
        Width = 96
        Height = 14
        Caption = 'Parcelas '#224' pagar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
  end
  object DsVenda: TDataSource
    DataSet = CdVenda
    Left = 408
    Top = 8
  end
  object CdVenda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DpVenda'
    Left = 464
    Top = 8
    object CdVendaDESC: TStringField
      FieldName = 'DESC'
      Required = True
      FixedChar = True
      Size = 14
    end
    object CdVendaVEN_DATA: TDateField
      FieldName = 'VEN_DATA'
    end
    object CdVendaVEN_COD: TIntegerField
      FieldName = 'VEN_COD'
      Required = True
    end
    object CdVendaVEN_VALOR_TOTAL: TFloatField
      FieldName = 'VEN_VALOR_TOTAL'
      DisplayFormat = '#,,0.00'
    end
    object CdVendaMyColumn5: TFloatField
      FieldName = 'MyColumn5'
      DisplayFormat = '#,,0.00'
    end
    object CdVendaVEN_LUCRO_TOTAL: TFloatField
      FieldName = 'VEN_LUCRO_TOTAL'
      DisplayFormat = '#,,0.00'
    end
    object CdVendaSITU: TStringField
      FieldName = 'SITU'
      Size = 50
    end
  end
  object DpVenda: TDataSetProvider
    DataSet = SQLVenda
    Left = 520
    Top = 8
  end
  object SQLVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select '#39'Venda '#224' vista'#39' as desc, VEN_DATA, VEN_COD, VEN_VALOR_TOT' +
        'AL, CAST('#39'0'#39' as float), VEN_LUCRO_TOTAL, '#39#39' as situ'
      'from VENDAS'
      'where VEN_STATUS = 1'
      'union all'
      
        'select '#39'Servi'#231'os '#224' vista'#39' as desc, CASE_DATA, CASE_COD_SERVICO, ' +
        'SUM(CASE_SERVICO_VALOR), CAST('#39'0'#39' as float), CASE_LUCRO, '#39#39' as s' +
        'itu'
      'from CAIXASERVICOS'
      'where CASE_STATUS = 1'
      'GROUP by'
      'CASE_COD_SERVICO,'
      'CASE_DATA,'
      'CASE_LUCRO'
      'union all'
      
        'select '#39'Conta Recebida'#39' as desc, CONR_DATA_PAGO, CONR_COD, CAST(' +
        #39'0'#39' as float), CONR_VALOR_PARCELA, CONR_LUCRO, CONR_SITUACAO'
      'from CONTAS_RECEBER'
      'union all'
      
        'select '#39'Conta Paga'#39' as desc, COP_DATA_PAG_EFETUADO, COP_COD,COP_' +
        'VALOR, COP_VALOR_PARCELA, CAST('#39'0'#39' as float), COP_SITUACAO'
      'from CONTAS_PAGAR')
    SQLConnection = DataModule1.SQLConnection1
    Left = 576
    Top = 8
    object SQLVendaDESC: TStringField
      FieldName = 'DESC'
      Required = True
      FixedChar = True
      Size = 14
    end
    object SQLVendaVEN_DATA: TDateField
      FieldName = 'VEN_DATA'
    end
    object SQLVendaVEN_COD: TIntegerField
      FieldName = 'VEN_COD'
      Required = True
    end
    object SQLVendaVEN_VALOR_TOTAL: TFloatField
      FieldName = 'VEN_VALOR_TOTAL'
    end
    object SQLVendaMyColumn5: TFloatField
      FieldName = 'MyColumn5'
    end
    object SQLVendaVEN_LUCRO_TOTAL: TFloatField
      FieldName = 'VEN_LUCRO_TOTAL'
    end
    object SQLVendaSITU: TStringField
      FieldName = 'SITU'
      Size = 50
    end
  end
  object SQLContaPagParcela: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(COP_VALOR_PARCELA) FROM CONTAS_PAGAR WHERE COP_SITUAC' +
        'AO = '#39'Pago'#39)
    SQLConnection = DataModule1.SQLConnection1
    Left = 568
    Top = 264
    object SQLContaPagParcelaSUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object SQLContasPaga: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(COP_VALOR) FROM CONTAS_PAGAR WHERE COP_VALOR_PARCELA ' +
        'is null')
    SQLConnection = DataModule1.SQLConnection1
    Left = 304
    Top = 272
    object SQLContasPagaSUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object SQLContaRecebida: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(CONR_VALOR_PARCELA) FROM CONTAS_RECEBER WHERE CONR_SI' +
        'TUACAO = '#39'Pago'#39)
    SQLConnection = DataModule1.SQLConnection1
    Left = 680
    Top = 264
    object SQLContaRecebidaSUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object SQLVendaavista: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT SUM(VEN_VALOR_TOTAL) FROM VENDAS WHERE VEN_STATUS = 1')
    SQLConnection = DataModule1.SQLConnection1
    Left = 400
    Top = 272
    object SQLVendaavistaSUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object SQLContaParcelaApagar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(COP_VALOR_PARCELA) FROM CONTAS_PAGAR WHERE COP_SITUAC' +
        'AO = '#39'N'#227'o Pago'#39)
    SQLConnection = DataModule1.SQLConnection1
    Left = 928
    Top = 272
    object FloatField1: TFloatField
      FieldName = 'SUM'
    end
  end
  object SQLContaAreceber: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(CONR_VALOR_PARCELA) FROM CONTAS_RECEBER WHERE CONR_SI' +
        'TUACAO = '#39'A receber'#39)
    SQLConnection = DataModule1.SQLConnection1
    Left = 824
    Top = 264
    object FloatField2: TFloatField
      FieldName = 'SUM'
    end
  end
  object DsContasPaga: TDataSource
    DataSet = CdContasPaga
    Left = 304
    Top = 408
  end
  object CdContasPaga: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpContasPaga'
    Left = 304
    Top = 360
    object CdContasPagaSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpContasPaga: TDataSetProvider
    DataSet = SQLContasPaga
    Left = 304
    Top = 320
  end
  object DsVendaavista: TDataSource
    DataSet = CdVendaavista
    Left = 400
    Top = 408
  end
  object CdVendaavista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpVendaavista'
    Left = 400
    Top = 360
    object CdVendaavistaSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpVendaavista: TDataSetProvider
    DataSet = SQLVendaavista
    Left = 400
    Top = 320
  end
  object DsContaPagParcela: TDataSource
    DataSet = CdContaPagParcela
    Left = 576
    Top = 400
  end
  object CdContaPagParcela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpContaPagParcela'
    Left = 576
    Top = 352
    object CdContaPagParcelaSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpContaPagParcela: TDataSetProvider
    DataSet = SQLContaPagParcela
    Left = 576
    Top = 312
  end
  object DsContaRecebida: TDataSource
    DataSet = CdContaRecebida
    Left = 680
    Top = 408
  end
  object CdContaRecebida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpContaRecebida'
    Left = 680
    Top = 352
    object CdContaRecebidaSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpContaRecebida: TDataSetProvider
    DataSet = SQLContaRecebida
    Left = 680
    Top = 312
  end
  object DsContaAreceber: TDataSource
    DataSet = CdContaAreceber
    Left = 824
    Top = 400
  end
  object CdContaAreceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpContaAreceber'
    Left = 824
    Top = 352
    object CdContaAreceberSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpContaAreceber: TDataSetProvider
    DataSet = SQLContaAreceber
    Left = 824
    Top = 312
  end
  object DsContaParcelaApagar: TDataSource
    DataSet = CdContaParcelaApagar
    Left = 928
    Top = 400
  end
  object CdContaParcelaApagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpContaParcelaApagar'
    Left = 928
    Top = 352
    object CdContaParcelaApagarSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpContaParcelaApagar: TDataSetProvider
    DataSet = SQLContaParcelaApagar
    Left = 928
    Top = 312
  end
  object DsLucroBruto: TDataSource
    DataSet = CdLucroBruto
    Left = 128
    Top = 416
  end
  object CdLucroBruto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpLucroBruto'
    Left = 128
    Top = 368
    object CdLucroBrutoLUCRO: TFloatField
      FieldName = 'LUCRO'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpLucroBruto: TDataSetProvider
    DataSet = SQLLucroBruto
    Left = 128
    Top = 328
  end
  object SQLLucroBruto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(CONR_LUCRO) AS LUCRO FROM CONTAS_RECEBER WHERE CONR_S' +
        'ITUACAO = '#39'Pago'#39)
    SQLConnection = DataModule1.SQLConnection1
    Left = 128
    Top = 280
    object SQLLucroBrutoLUCRO: TFloatField
      FieldName = 'LUCRO'
    end
  end
  object DsLucroBrutoAreceber: TDataSource
    DataSet = CdLucroBrutoAreceber
    Left = 32
    Top = 424
  end
  object CdLucroBrutoAreceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpLucroBrutoAreceber'
    Left = 32
    Top = 376
    object CdLucroBrutoAreceberLUCROARECEBER: TFloatField
      FieldName = 'LUCROARECEBER'
      DisplayFormat = '#,,0.00'
    end
  end
  object DpLucroBrutoAreceber: TDataSetProvider
    DataSet = SQLLucroBrutoAreceber
    Left = 32
    Top = 336
  end
  object SQLLucroBrutoAreceber: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(CONR_LUCRO) AS LUCROaReceber FROM CONTAS_RECEBER WHER' +
        'E CONR_SITUACAO = '#39'A receber'#39)
    SQLConnection = DataModule1.SQLConnection1
    Left = 32
    Top = 288
    object SQLLucroBrutoAreceberLUCROARECEBER: TFloatField
      FieldName = 'LUCROARECEBER'
    end
  end
  object DsLucroBrutoAvista: TDataSource
    DataSet = CdLucroBrutoAvista
    Left = 216
    Top = 424
  end
  object CdLucroBrutoAvista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpLucroBrutoAvista'
    Left = 216
    Top = 376
    object CdLucroBrutoAvistaLUCROAVISTA: TFloatField
      FieldName = 'LUCROAVISTA'
    end
  end
  object DpLucroBrutoAvista: TDataSetProvider
    DataSet = SQLLucroBrutoAvista
    Left = 216
    Top = 336
  end
  object SQLLucroBrutoAvista: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(VEN_LUCRO_TOTAL) AS LUCROAVISTA FROM VENDAS WHERE VEN' +
        '_STATUS = 1')
    SQLConnection = DataModule1.SQLConnection1
    Left = 216
    Top = 288
    object SQLLucroBrutoAvistaLUCROAVISTA: TFloatField
      FieldName = 'LUCROAVISTA'
    end
  end
  object DsLucroBrutoSer: TDataSource
    DataSet = CdLucroBrutoSer
    Left = 480
    Top = 456
  end
  object CdLucroBrutoSer: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DpLucroBrutoSer'
    Left = 480
    Top = 408
    object CdLucroBrutoSerCASE_COD_SERVICO: TIntegerField
      FieldName = 'CASE_COD_SERVICO'
      Required = True
    end
    object CdLucroBrutoSerCASE_LUCRO: TFloatField
      FieldName = 'CASE_LUCRO'
    end
    object CdLucroBrutoSerLUCROSER2: TAggregateField
      FieldName = 'LUCROSER'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,,0.00'
      Expression = 'sum(CASE_LUCRO)'
    end
  end
  object DpLucroBrutoSer: TDataSetProvider
    DataSet = SQLLucroBrutoSer
    Left = 480
    Top = 368
  end
  object SQLLucroBrutoSer: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT DISTINCT CASE_COD_SERVICO, CASE_LUCRO  FROM CAIXASERVICOS' +
        ' WHERE CASE_STATUS = 1'
      'GROUP by'
      'CASE_COD_SERVICO,'
      'CASE_LUCRO')
    SQLConnection = DataModule1.SQLConnection1
    Left = 480
    Top = 320
    object SQLLucroBrutoSerCASE_COD_SERVICO: TIntegerField
      FieldName = 'CASE_COD_SERVICO'
      Required = True
    end
    object SQLLucroBrutoSerCASE_LUCRO: TFloatField
      FieldName = 'CASE_LUCRO'
    end
  end
  object SQLServTotal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT SUM(CASE_SERVICO_VALOR) FROM CAIXASERVICOS WHERE CASE_STA' +
        'TUS = 1')
    SQLConnection = DataModule1.SQLConnection1
    Left = 352
    Top = 464
    object SQLServTotalSUM: TFloatField
      FieldName = 'SUM'
    end
  end
  object DpServTotal: TDataSetProvider
    DataSet = SQLServTotal
    Left = 352
    Top = 512
  end
  object CdServTotal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpServTotal'
    Left = 352
    Top = 552
    object CdServTotalSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '#,,0.00'
    end
  end
  object DsServTotal: TDataSource
    DataSet = CdServTotal
    Left = 352
    Top = 600
  end
end
