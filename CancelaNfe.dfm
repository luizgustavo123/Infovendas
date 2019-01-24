object Fm_CancelaNfe: TFm_CancelaNfe
  Left = 0
  Top = 0
  Caption = 'Cancelamento de NFe'
  ClientHeight = 370
  ClientWidth = 670
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
  object Label3: TLabel
    Left = 16
    Top = 240
    Width = 90
    Height = 13
    Caption = 'Numero do Procolo'
  end
  object Label4: TLabel
    Left = 304
    Top = 240
    Width = 57
    Height = 13
    Caption = 'Justificativa'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 649
    Height = 177
    Caption = ' Notas Fiscais Eletr'#244'nicas'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 645
      Height = 160
      Align = alClient
      DataSource = DataNFe
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'VEN_COD'
          Title.Alignment = taCenter
          Title.Caption = 'Cod. Venda'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Cliente'
          Width = 239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEN_DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEN_VALOR_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEN_CHAVE_NFE'
          Title.Alignment = taCenter
          Title.Caption = 'Chave NFe'
          Width = 153
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 45
    Caption = 'Periodo'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 13
      Height = 13
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 160
      Top = 20
      Width = 6
      Height = 13
      Caption = #224
    end
    object Datai: TDateTimePicker
      Left = 32
      Top = 16
      Width = 120
      Height = 21
      Date = 40598.310679606480000000
      Time = 40598.310679606480000000
      TabOrder = 0
    end
    object Dataf: TDateTimePicker
      Left = 176
      Top = 16
      Width = 120
      Height = 21
      Date = 40598.310700590280000000
      Time = 40598.310700590280000000
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 352
    Top = 24
    Width = 97
    Height = 25
    Caption = 'Localizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object EdtProtocolo: TEdit
    Left = 16
    Top = 256
    Width = 257
    Height = 21
    TabOrder = 3
  end
  object EdtJustifica: TEdit
    Left = 304
    Top = 256
    Width = 345
    Height = 21
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 308
    Width = 670
    Height = 62
    Align = alBottom
    TabOrder = 5
    ExplicitTop = 296
    ExplicitWidth = 673
    object BitBtn2: TBitBtn
      Left = 192
      Top = 12
      Width = 128
      Height = 38
      Action = ActCancelar
      Caption = 'F2 - Cancelar NFe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 336
      Top = 12
      Width = 128
      Height = 38
      Action = ActFechar
      Caption = 'F3 - Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object DataNFe: TDataSource
    DataSet = CdsNFe
    Left = 184
    Top = 88
  end
  object QryNFe: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDatai'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDataf'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT CLI_CPF,VEN_COD,CLI_NOME,VEN_DATA,VEN_VALOR_TOTAL,VEN_CHA' +
        'VE_NFE FROM VENDAS'
      'INNER JOIN clientes'
      'ON CLI_COD = VEN_CLIENTES_FK'
      'WHERE VEN_DATA BETWEEN :pDatai AND :pDataf'
      'AND VEN_CHAVE_NFE is not null')
    SQLConnection = DataModule1.SQLConnection1
    Left = 248
    Top = 96
    object QryNFeVEN_COD: TIntegerField
      FieldName = 'VEN_COD'
      Required = True
    end
    object QryNFeCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object QryNFeVEN_DATA: TDateField
      FieldName = 'VEN_DATA'
    end
    object QryNFeVEN_VALOR_TOTAL: TSingleField
      FieldName = 'VEN_VALOR_TOTAL'
    end
    object QryNFeVEN_CHAVE_NFE: TStringField
      FieldName = 'VEN_CHAVE_NFE'
      Size = 200
    end
    object QryNFeCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 30
    end
  end
  object DspNFe: TDataSetProvider
    DataSet = QryNFe
    Left = 304
    Top = 96
  end
  object CdsNFe: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDatai'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDataf'
        ParamType = ptInput
      end>
    ProviderName = 'DspNFe'
    Left = 360
    Top = 96
    object CdsNFeVEN_COD: TIntegerField
      FieldName = 'VEN_COD'
      Required = True
    end
    object CdsNFeCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 100
    end
    object CdsNFeVEN_DATA: TDateField
      FieldName = 'VEN_DATA'
    end
    object CdsNFeVEN_VALOR_TOTAL: TSingleField
      FieldName = 'VEN_VALOR_TOTAL'
    end
    object CdsNFeVEN_CHAVE_NFE: TStringField
      FieldName = 'VEN_CHAVE_NFE'
      Size = 200
    end
    object CdsNFeCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 30
    end
  end
  object ActionList1: TActionList
    Left = 464
    Top = 120
    object ActCancelar: TAction
      Caption = 'F2 - Cancelar NFe'
      ShortCut = 113
      OnExecute = ActCancelarExecute
    end
    object ActFechar: TAction
      Caption = 'F3 - Fechar'
      ShortCut = 114
      OnExecute = ActFecharExecute
    end
  end
end
