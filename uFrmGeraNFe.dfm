inherited FrmGeraNFe: TFrmGeraNFe
  Left = 220
  Top = 155
  Caption = 'Gerar NFe'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 688
    Height = 105
    Align = alTop
    TabOrder = 0
    object RadioOpcao: TRadioGroup
      Left = 11
      Top = 10
      Width = 129
      Height = 59
      ItemIndex = 2
      Items.Strings = (
        'N'#250'mero Pedido'
        'C'#243'digo Cliente'
        'Nome Cliente')
      TabOrder = 0
    end
    object EdtDados: TEdit
      Left = 10
      Top = 72
      Width = 321
      Height = 21
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
        Width = 14
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
        Date = 40556.295889930550000000
        Time = 40556.295889930550000000
        TabOrder = 0
      end
      object DataFim: TDateTimePicker
        Left = 48
        Top = 35
        Width = 118
        Height = 21
        Date = 40556.295906932870000000
        Time = 40556.295906932870000000
        TabOrder = 1
      end
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
      TabOrder = 3
      OnClick = BitBtn1Click
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
      TabOrder = 4
      OnClick = BitBtn2Click
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
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 105
    Width = 688
    Height = 341
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 684
      Height = 324
      Align = alClient
      DataSource = DataNFe
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA_PEDIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Pedido'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO_NUM'
          Title.Alignment = taCenter
          Title.Caption = 'Num. Pedido'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Cliente'
          Visible = True
        end>
    end
  end
  object QryNFe: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from pedido'
      'where pedido.id = 0')
    SQLConnection = DmConexao.ConexaoDBX
    Left = 320
    Top = 169
    object QryNFeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QryNFePEDIDO_NUM: TStringField
      FieldName = 'PEDIDO_NUM'
      Size = 10
    end
    object QryNFeIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object QryNFeID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
      Required = True
    end
    object QryNFeDATA_PEDIDO: TSQLTimeStampField
      FieldName = 'DATA_PEDIDO'
    end
    object QryNFeHORA_PEDIDO: TSQLTimeStampField
      FieldName = 'HORA_PEDIDO'
    end
    object QryNFeDATA_ENTREGA: TSQLTimeStampField
      FieldName = 'DATA_ENTREGA'
    end
    object QryNFeHORA_ENTREGA: TSQLTimeStampField
      FieldName = 'HORA_ENTREGA'
    end
    object QryNFeID_CLASSIFICACAO: TIntegerField
      FieldName = 'ID_CLASSIFICACAO'
      Required = True
    end
    object QryNFeCONFIRMADA: TStringField
      FieldName = 'CONFIRMADA'
      FixedChar = True
      Size = 1
    end
    object QryNFeENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      FixedChar = True
      Size = 1
    end
    object QryNFeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object QryNFeDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object QryNFeACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object QryNFeOUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Precision = 18
      Size = 2
    end
    object QryNFeVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object QryNFeCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object QryNFeID_FORMAPAG: TIntegerField
      FieldName = 'ID_FORMAPAG'
    end
    object QryNFeEND_ENTREGA: TStringField
      FieldName = 'END_ENTREGA'
      Size = 30
    end
    object QryNFeNUM_END_ENTREGA: TStringField
      FieldName = 'NUM_END_ENTREGA'
      Size = 10
    end
    object QryNFeCOMPL_END_ENTREGA: TStringField
      FieldName = 'COMPL_END_ENTREGA'
    end
    object QryNFeBAIRRO_END_ENTREGA: TStringField
      FieldName = 'BAIRRO_END_ENTREGA'
    end
    object QryNFeCID_END_ENTREGA: TStringField
      FieldName = 'CID_END_ENTREGA'
    end
    object QryNFeUF_END_ENTREGA: TStringField
      FieldName = 'UF_END_ENTREGA'
      FixedChar = True
      Size = 2
    end
    object QryNFeCEP_END_ENTREGA: TStringField
      FieldName = 'CEP_END_ENTREGA'
      Size = 10
    end
    object QryNFeCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object QryNFeTIPODOC: TIntegerField
      FieldName = 'TIPODOC'
    end
    object QryNFeTIPO_PEDIDO: TIntegerField
      FieldName = 'TIPO_PEDIDO'
    end
    object QryNFeVALOR_REAL: TFMTBCDField
      FieldName = 'VALOR_REAL'
      Precision = 18
      Size = 2
    end
    object QryNFeMARGEM_VENDA: TBCDField
      FieldName = 'MARGEM_VENDA'
      Precision = 9
      Size = 3
    end
    object QryNFeVALOR_COMISSAO: TFMTBCDField
      FieldName = 'VALOR_COMISSAO'
      Precision = 18
      Size = 2
    end
    object QryNFeTOTAL_GERAL: TFMTBCDField
      FieldName = 'TOTAL_GERAL'
      Precision = 18
      Size = 2
    end
    object QryNFeCOO: TIntegerField
      FieldName = 'COO'
    end
    object QryNFeCCF: TIntegerField
      FieldName = 'CCF'
    end
    object QryNFeGNF: TIntegerField
      FieldName = 'GNF'
    end
    object QryNFeDAV: TStringField
      FieldName = 'DAV'
      Size = 1
    end
    object QryNFeCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object QryNFeINSCEST: TStringField
      FieldName = 'INSCEST'
      Size = 18
    end
    object QryNFeVALOR_TROCO: TFMTBCDField
      FieldName = 'VALOR_TROCO'
      Precision = 18
      Size = 2
    end
    object QryNFeCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 3
    end
    object QryNFeIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
  end
  object DspNFe: TDataSetProvider
    DataSet = QryNFe
    UpdateMode = upWhereKeyOnly
    Left = 320
    Top = 225
  end
  object CdsNFe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspNFe'
    Left = 376
    Top = 169
    object CdsNFeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CdsNFePEDIDO_NUM: TStringField
      FieldName = 'PEDIDO_NUM'
      Size = 10
    end
    object CdsNFeIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object CdsNFeID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
      Required = True
    end
    object CdsNFeDATA_PEDIDO: TSQLTimeStampField
      FieldName = 'DATA_PEDIDO'
    end
    object CdsNFeHORA_PEDIDO: TSQLTimeStampField
      FieldName = 'HORA_PEDIDO'
    end
    object CdsNFeDATA_ENTREGA: TSQLTimeStampField
      FieldName = 'DATA_ENTREGA'
    end
    object CdsNFeHORA_ENTREGA: TSQLTimeStampField
      FieldName = 'HORA_ENTREGA'
    end
    object CdsNFeID_CLASSIFICACAO: TIntegerField
      FieldName = 'ID_CLASSIFICACAO'
      Required = True
    end
    object CdsNFeCONFIRMADA: TStringField
      FieldName = 'CONFIRMADA'
      FixedChar = True
      Size = 1
    end
    object CdsNFeENTREGUE: TStringField
      FieldName = 'ENTREGUE'
      FixedChar = True
      Size = 1
    end
    object CdsNFeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object CdsNFeDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object CdsNFeACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object CdsNFeOUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Precision = 18
      Size = 2
    end
    object CdsNFeVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object CdsNFeCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object CdsNFeID_FORMAPAG: TIntegerField
      FieldName = 'ID_FORMAPAG'
    end
    object CdsNFeEND_ENTREGA: TStringField
      FieldName = 'END_ENTREGA'
      Size = 30
    end
    object CdsNFeNUM_END_ENTREGA: TStringField
      FieldName = 'NUM_END_ENTREGA'
      Size = 10
    end
    object CdsNFeCOMPL_END_ENTREGA: TStringField
      FieldName = 'COMPL_END_ENTREGA'
    end
    object CdsNFeBAIRRO_END_ENTREGA: TStringField
      FieldName = 'BAIRRO_END_ENTREGA'
    end
    object CdsNFeCID_END_ENTREGA: TStringField
      FieldName = 'CID_END_ENTREGA'
    end
    object CdsNFeUF_END_ENTREGA: TStringField
      FieldName = 'UF_END_ENTREGA'
      FixedChar = True
      Size = 2
    end
    object CdsNFeCEP_END_ENTREGA: TStringField
      FieldName = 'CEP_END_ENTREGA'
      Size = 10
    end
    object CdsNFeCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object CdsNFeTIPODOC: TIntegerField
      FieldName = 'TIPODOC'
    end
    object CdsNFeTIPO_PEDIDO: TIntegerField
      FieldName = 'TIPO_PEDIDO'
    end
    object CdsNFeVALOR_REAL: TFMTBCDField
      FieldName = 'VALOR_REAL'
      Precision = 18
      Size = 2
    end
    object CdsNFeMARGEM_VENDA: TBCDField
      FieldName = 'MARGEM_VENDA'
      Precision = 9
      Size = 3
    end
    object CdsNFeVALOR_COMISSAO: TFMTBCDField
      FieldName = 'VALOR_COMISSAO'
      Precision = 18
      Size = 2
    end
    object CdsNFeTOTAL_GERAL: TFMTBCDField
      FieldName = 'TOTAL_GERAL'
      Precision = 18
      Size = 2
    end
    object CdsNFeCOO: TIntegerField
      FieldName = 'COO'
    end
    object CdsNFeCCF: TIntegerField
      FieldName = 'CCF'
    end
    object CdsNFeGNF: TIntegerField
      FieldName = 'GNF'
    end
    object CdsNFeDAV: TStringField
      FieldName = 'DAV'
      Size = 1
    end
    object CdsNFeCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object CdsNFeINSCEST: TStringField
      FieldName = 'INSCEST'
      Size = 18
    end
    object CdsNFeVALOR_TROCO: TFMTBCDField
      FieldName = 'VALOR_TROCO'
      Precision = 18
      Size = 2
    end
    object CdsNFeCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 3
    end
    object CdsNFeIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
  end
  object DataNFe: TDataSource
    DataSet = CdsNFe
    Left = 376
    Top = 225
  end
end
