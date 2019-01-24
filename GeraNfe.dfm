object FM_Geranfe: TFM_Geranfe
  Left = 0
  Top = 0
  Caption = 'Gerar NFe'
  ClientHeight = 385
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 11
    Top = 120
    Width = 670
    Height = 257
    DataSource = DataNFe
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VEN_DATA'
        Title.Caption = 'Data Venda'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_COD'
        Title.Caption = 'Cod Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_VALOR_TOTAL'
        Title.Caption = 'Valor Total'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_NOME'
        Title.Caption = 'Cliente'
        Width = 390
        Visible = True
      end>
  end
  object RadioOpcao: TRadioGroup
    Left = 11
    Top = 10
    Width = 129
    Height = 59
    ItemIndex = 0
    Items.Strings = (
      'N'#250'mero Pedido'
      'C'#243'digo Cliente'
      'Nome Cliente')
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 147
    Top = 10
    Width = 185
    Height = 59
    Caption = ' Per'#237'odo '
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 13
      Height = 13
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 8
      Top = 38
      Width = 6
      Height = 13
      Caption = #224
    end
    object DataIni: TDateTimePicker
      Left = 48
      Top = 13
      Width = 118
      Height = 21
      Date = 43276.295889930550000000
      Time = 43276.295889930550000000
      TabOrder = 0
    end
    object DataFim: TDateTimePicker
      Left = 48
      Top = 35
      Width = 118
      Height = 21
      Date = 43276.295906932870000000
      Time = 43276.295906932870000000
      TabOrder = 1
    end
  end
  object EdtDados: TEdit
    Left = 10
    Top = 76
    Width = 321
    Height = 21
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 352
    Top = 72
    Width = 113
    Height = 25
    Caption = 'Localizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 472
    Top = 72
    Width = 97
    Height = 25
    Caption = 'Gerar NFe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object BitBtn2: TBitBtn
    Left = 576
    Top = 72
    Width = 105
    Height = 25
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object QryNFe: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT VEN_COD,'
      'VEN_DATA,'
      'VEN_VALOR_TOTAL,'
      'CLI_NOME,'
      'CLI_COD,'
      'ITV_PRODUTOS_FK,'
      'PRO_DESCRICAO,'
      'CLI_TELEFONE, '
      'PRO_CODIGO_EAN13, '
      'CLI_CPF,'
      'PRO_VALOR_SAIDA,'
      'CLI_ENDERECO, '
      'CLI_NUMERO, '
      'CLI_END_COMPLEMENTO,'
      'CLI_BAIRRO,'
      'CLI_RG,'
      'CLI_CIDADE,'
      'CLI_UF,'
      'CLI_CEP,'
      'CLI_END_ENTREGA,'
      'CLI_NUMERO_ENTREGA,'
      'CLI_END_COMPL_ENTREGA, '
      'CLI_BAIRRO_ENTREGA, '
      'CLI_CIDADE_ENTREGA, '
      'CLI_UF_ENTREGA,'
      'PRO_NCM,'
      'PRO_TIPO_CFOP,'
      'PRO_UNIDADE,'
      'ITV_QTD,'
      'PRO_BASE_ST,'
      'ITV_DESCONTO,'
      'PRO_ALIQUOTA_ICMS'
      'FROM VENDAS'
      'INNER JOIN  clientes'
      'ON VEN_CLIENTES_FK = CLI_COD'
      'INNER JOIN itens_vendas'
      'ON VEN_COD = ITV_VENDAS_FK'
      'INNER JOIN produtos'
      'ON PRO_COD = ITV_PRODUTOS_FK'
      'WHERE VEN_COD = 0')
    SQLConnection = DataModule1.SQLConnection1
    Left = 320
    Top = 169
    object QryNFeVEN_COD: TIntegerField
      FieldName = 'VEN_COD'
      Required = True
    end
    object QryNFeVEN_DATA: TDateField
      FieldName = 'VEN_DATA'
    end
    object QryNFeVEN_VALOR_TOTAL: TFloatField
      FieldName = 'VEN_VALOR_TOTAL'
    end
    object QryNFeCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object QryNFeCLI_COD: TIntegerField
      FieldName = 'CLI_COD'
      Required = True
    end
    object QryNFeITV_PRODUTOS_FK: TLargeintField
      FieldName = 'ITV_PRODUTOS_FK'
    end
    object QryNFePRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 150
    end
    object QryNFeCLI_TELEFONE: TStringField
      FieldName = 'CLI_TELEFONE'
      Size = 15
    end
    object QryNFePRO_CODIGO_EAN13: TLargeintField
      FieldName = 'PRO_CODIGO_EAN13'
    end
    object QryNFeCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 30
    end
    object QryNFePRO_VALOR_SAIDA: TFloatField
      FieldName = 'PRO_VALOR_SAIDA'
    end
    object QryNFeCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 100
    end
    object QryNFeCLI_NUMERO: TStringField
      FieldName = 'CLI_NUMERO'
      Size = 50
    end
    object QryNFeCLI_END_COMPLEMENTO: TStringField
      FieldName = 'CLI_END_COMPLEMENTO'
      Size = 100
    end
    object QryNFeCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 50
    end
    object QryNFeCLI_RG: TStringField
      FieldName = 'CLI_RG'
      Size = 30
    end
    object QryNFeCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 50
    end
    object QryNFeCLI_UF: TStringField
      FieldName = 'CLI_UF'
      Size = 10
    end
    object QryNFeCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Size = 30
    end
    object QryNFeCLI_END_ENTREGA: TStringField
      FieldName = 'CLI_END_ENTREGA'
      Size = 100
    end
    object QryNFeCLI_NUMERO_ENTREGA: TIntegerField
      FieldName = 'CLI_NUMERO_ENTREGA'
    end
    object QryNFeCLI_END_COMPL_ENTREGA: TStringField
      FieldName = 'CLI_END_COMPL_ENTREGA'
      Size = 100
    end
    object QryNFeCLI_BAIRRO_ENTREGA: TStringField
      FieldName = 'CLI_BAIRRO_ENTREGA'
      Size = 50
    end
    object QryNFeCLI_CIDADE_ENTREGA: TStringField
      FieldName = 'CLI_CIDADE_ENTREGA'
      Size = 50
    end
    object QryNFeCLI_UF_ENTREGA: TStringField
      FieldName = 'CLI_UF_ENTREGA'
      Size = 5
    end
    object QryNFePRO_NCM: TIntegerField
      FieldName = 'PRO_NCM'
    end
    object QryNFePRO_TIPO_CFOP: TIntegerField
      FieldName = 'PRO_TIPO_CFOP'
    end
    object QryNFePRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
    end
    object QryNFeITV_QTD: TIntegerField
      FieldName = 'ITV_QTD'
    end
    object QryNFePRO_BASE_ST: TFloatField
      FieldName = 'PRO_BASE_ST'
    end
    object QryNFeITV_DESCONTO: TFloatField
      FieldName = 'ITV_DESCONTO'
    end
    object QryNFePRO_ALIQUOTA_ICMS: TFloatField
      FieldName = 'PRO_ALIQUOTA_ICMS'
    end
  end
  object CdsNFe: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspNFe'
    Left = 376
    Top = 169
    object CdsNFeVEN_COD: TIntegerField
      FieldName = 'VEN_COD'
      Required = True
    end
    object CdsNFeVEN_DATA: TDateField
      FieldName = 'VEN_DATA'
    end
    object CdsNFeVEN_VALOR_TOTAL: TFloatField
      FieldName = 'VEN_VALOR_TOTAL'
    end
    object CdsNFeCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object CdsNFeCLI_COD: TIntegerField
      FieldName = 'CLI_COD'
      Required = True
    end
    object CdsNFeITV_PRODUTOS_FK: TLargeintField
      FieldName = 'ITV_PRODUTOS_FK'
    end
    object CdsNFePRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 150
    end
    object CdsNFeCLI_TELEFONE: TStringField
      FieldName = 'CLI_TELEFONE'
      Size = 15
    end
    object CdsNFePRO_CODIGO_EAN13: TLargeintField
      FieldName = 'PRO_CODIGO_EAN13'
    end
    object CdsNFeCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 30
    end
    object CdsNFePRO_VALOR_SAIDA: TFloatField
      FieldName = 'PRO_VALOR_SAIDA'
    end
    object CdsNFeCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 100
    end
    object CdsNFeCLI_NUMERO: TStringField
      FieldName = 'CLI_NUMERO'
      Size = 50
    end
    object CdsNFeCLI_END_COMPLEMENTO: TStringField
      FieldName = 'CLI_END_COMPLEMENTO'
      Size = 100
    end
    object CdsNFeCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 50
    end
    object CdsNFeCLI_RG: TStringField
      FieldName = 'CLI_RG'
      Size = 30
    end
    object CdsNFeCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 50
    end
    object CdsNFeCLI_UF: TStringField
      FieldName = 'CLI_UF'
      Size = 10
    end
    object CdsNFeCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Size = 30
    end
    object CdsNFeCLI_END_ENTREGA: TStringField
      FieldName = 'CLI_END_ENTREGA'
      Size = 100
    end
    object CdsNFeCLI_NUMERO_ENTREGA: TIntegerField
      FieldName = 'CLI_NUMERO_ENTREGA'
    end
    object CdsNFeCLI_END_COMPL_ENTREGA: TStringField
      FieldName = 'CLI_END_COMPL_ENTREGA'
      Size = 100
    end
    object CdsNFeCLI_BAIRRO_ENTREGA: TStringField
      FieldName = 'CLI_BAIRRO_ENTREGA'
      Size = 50
    end
    object CdsNFeCLI_CIDADE_ENTREGA: TStringField
      FieldName = 'CLI_CIDADE_ENTREGA'
      Size = 50
    end
    object CdsNFeCLI_UF_ENTREGA: TStringField
      FieldName = 'CLI_UF_ENTREGA'
      Size = 5
    end
    object CdsNFePRO_NCM: TIntegerField
      FieldName = 'PRO_NCM'
    end
    object CdsNFePRO_TIPO_CFOP: TIntegerField
      FieldName = 'PRO_TIPO_CFOP'
    end
    object CdsNFePRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
    end
    object CdsNFeITV_QTD: TIntegerField
      FieldName = 'ITV_QTD'
    end
    object CdsNFePRO_BASE_ST: TFloatField
      FieldName = 'PRO_BASE_ST'
    end
    object CdsNFeITV_DESCONTO: TFloatField
      FieldName = 'ITV_DESCONTO'
    end
    object CdsNFePRO_ALIQUOTA_ICMS: TFloatField
      FieldName = 'PRO_ALIQUOTA_ICMS'
    end
    object CdsNFeTOTAL_ITENS: TAggregateField
      FieldName = 'TOTAL_ITENS'
      Active = True
      DisplayName = ''
      Expression = 'sum(PRO_VALOR_SAIDA * ITV_QTD)'
    end
  end
  object DataNFe: TDataSource
    DataSet = CdsNFe
    Left = 376
    Top = 225
  end
  object DspNFe: TDataSetProvider
    DataSet = QryNFe
    UpdateMode = upWhereKeyOnly
    Left = 320
    Top = 225
  end
end
