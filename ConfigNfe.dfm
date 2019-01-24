object Fm_ConfigNfe: TFm_ConfigNfe
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o NF-e'
  ClientHeight = 418
  ClientWidth = 481
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
  object PageControl1: TPageControl
    Left = 5
    Top = 8
    Width = 468
    Height = 377
    ActivePage = TabSheet4
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '1 - Geral'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 3
        Top = 111
        Width = 454
        Height = 50
        Caption = 'Logomarca'
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 427
          Top = 18
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object DbLogo: TDBEdit
          Left = 8
          Top = 19
          Width = 413
          Height = 21
          DataField = 'LOGOMARCA'
          DataSource = DsConfigNfe
          TabOrder = 0
        end
      end
      object GroupBox6: TGroupBox
        Left = 3
        Top = 193
        Width = 361
        Height = 57
        Caption = ' Path para arquivo '
        TabOrder = 1
        object SpeedButton2: TSpeedButton
          Left = 320
          Top = 16
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton2Click
        end
        object DbArqui: TDBEdit
          Left = 8
          Top = 17
          Width = 306
          Height = 21
          DataField = 'PATH_ARQUIVO'
          DataSource = DsConfigNfe
          TabOrder = 0
        end
      end
      object GroupBox7: TGroupBox
        Left = 3
        Top = 240
        Width = 361
        Height = 49
        Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
        TabOrder = 2
        object SpeedButton3: TSpeedButton
          Left = 320
          Top = 13
          Width = 23
          Height = 24
          Caption = '...'
          NumGlyphs = 2
          OnClick = SpeedButton3Click
        end
        object DbPathSchemas: TDBEdit
          Left = 8
          Top = 16
          Width = 306
          Height = 21
          DataField = 'PATHSCHEMAS'
          DataSource = DsConfigNfe
          TabOrder = 0
        end
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 3
        Top = 3
        Width = 454
        Height = 105
        Caption = 'Forma de Emiss'#227'o'
        Columns = 2
        DataField = 'FORMA_EMISSAO'
        DataSource = DsConfigNfe
        Items.Strings = (
          'Normal                '
          'EPEC                '
          'Conting'#234'ncia'
          'SVC'
          'FSDA')
        TabOrder = 3
        Values.Strings = (
          '0'
          '3'
          '1'
          '7'
          '4')
      end
      object ChArquivos: TDBCheckBox
        Left = 11
        Top = 170
        Width = 413
        Height = 17
        Caption = 'Salvar Arquivos de Envio e Resposta'
        DataField = 'ARQUI_ENVIO_RESPOSTA'
        DataSource = DsConfigNfe
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = '2 - Certificado'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lSSLLib: TLabel
        Left = 261
        Top = 81
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'SSLLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lXmlSign: TLabel
        Left = 261
        Top = 220
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'XMLSignLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lHttpLib: TLabel
        Left = 261
        Top = 173
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'HttpLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lCryptLib: TLabel
        Left = 261
        Top = 127
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'CryptLib'
        Color = clBtnFace
        ParentColor = False
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 20
        Width = 441
        Height = 53
        Caption = 'Path do Certificado'
        TabOrder = 0
        object SbCertificado: TSpeedButton
          Left = 404
          Top = 18
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SbCertificadoClick
        end
        object DbCertificado: TDBEdit
          Left = 8
          Top = 19
          Width = 390
          Height = 21
          DataField = 'CERTIFICADO'
          DataSource = DsConfigNfe
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 79
        Width = 241
        Height = 53
        Caption = 'Senha'
        TabOrder = 1
        object DbSenha: TDBEdit
          Left = 8
          Top = 21
          Width = 227
          Height = 21
          DataField = 'SENHA_CERTIFICADO'
          DataSource = DsConfigNfe
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 138
        Width = 241
        Height = 53
        Caption = 'Numero de Serie'
        TabOrder = 2
        object DbSerie: TDBEdit
          Left = 8
          Top = 19
          Width = 227
          Height = 21
          DataField = 'NUMERO_SERIE'
          DataSource = DsConfigNfe
          TabOrder = 0
        end
      end
      object cbSSLLib: TComboBox
        Left = 261
        Top = 100
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnChange = cbSSLLibChange
      end
      object cbCryptLib: TComboBox
        Left = 261
        Top = 146
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnChange = cbCryptLibChange
      end
      object cbHttpLib: TComboBox
        Left = 261
        Top = 193
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        OnChange = cbHttpLibChange
      end
      object cbXmlSignLib: TComboBox
        Left = 261
        Top = 239
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnChange = cbXmlSignLibChange
      end
    end
    object TabSheet3: TTabSheet
      Caption = '3 - Emitente'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LbRazao: TLabel
        Left = 3
        Top = 10
        Width = 60
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label2: TLabel
        Left = 252
        Top = 10
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label3: TLabel
        Left = 3
        Top = 52
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object Label5: TLabel
        Left = 3
        Top = 93
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label6: TLabel
        Left = 327
        Top = 93
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label7: TLabel
        Left = 159
        Top = 52
        Width = 49
        Height = 13
        Caption = 'I.Estadual'
      end
      object Label1: TLabel
        Left = 130
        Top = 135
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label8: TLabel
        Left = 259
        Top = 93
        Width = 12
        Height = 13
        Caption = 'N'#186
      end
      object Label9: TLabel
        Left = 3
        Top = 135
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label10: TLabel
        Left = 3
        Top = 180
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label11: TLabel
        Left = 277
        Top = 135
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label16: TLabel
        Left = 327
        Top = 135
        Width = 69
        Height = 13
        Caption = 'C'#243'd. Municipio'
      end
      object Label21: TLabel
        Left = 159
        Top = 180
        Width = 24
        Height = 13
        Caption = 'Email'
      end
      object DbRazao: TDBEdit
        Left = 3
        Top = 25
        Width = 243
        Height = 21
        DataField = 'RAZAO_SOCIAL'
        DataSource = DsConfigNfe
        TabOrder = 0
      end
      object DbNomeFan: TDBEdit
        Left = 252
        Top = 25
        Width = 205
        Height = 21
        DataField = 'NOME_FANTASIA'
        DataSource = DsConfigNfe
        TabOrder = 1
      end
      object DbCnpj: TDBEdit
        Left = 3
        Top = 66
        Width = 150
        Height = 21
        DataField = 'CNPJ'
        DataSource = DsConfigNfe
        TabOrder = 2
      end
      object DbIncEstadual: TDBEdit
        Left = 159
        Top = 66
        Width = 170
        Height = 21
        DataField = 'I_ESTADUAL'
        DataSource = DsConfigNfe
        TabOrder = 3
      end
      object DbEnd: TDBEdit
        Left = 3
        Top = 108
        Width = 250
        Height = 21
        DataField = 'ENDERECO'
        DataSource = DsConfigNfe
        TabOrder = 4
      end
      object DbNumero: TDBEdit
        Left = 259
        Top = 108
        Width = 62
        Height = 21
        DataField = 'END_NUMERO'
        DataSource = DsConfigNfe
        TabOrder = 5
      end
      object DbBairro: TDBEdit
        Left = 327
        Top = 108
        Width = 130
        Height = 21
        DataField = 'BAIRRO'
        DataSource = DsConfigNfe
        TabOrder = 6
      end
      object DbCep: TDBEdit
        Left = 3
        Top = 153
        Width = 121
        Height = 21
        DataField = 'CEP'
        DataSource = DsConfigNfe
        TabOrder = 7
      end
      object DbCidade: TDBEdit
        Left = 130
        Top = 153
        Width = 141
        Height = 21
        DataField = 'CIDADE'
        DataSource = DsConfigNfe
        TabOrder = 8
      end
      object DbUf: TDBEdit
        Left = 277
        Top = 153
        Width = 44
        Height = 21
        DataField = 'UF'
        DataSource = DsConfigNfe
        TabOrder = 9
      end
      object DbCodMun: TDBEdit
        Left = 327
        Top = 153
        Width = 114
        Height = 21
        DataField = 'COD_MUN'
        DataSource = DsConfigNfe
        TabOrder = 10
      end
      object DbTel: TDBEdit
        Left = 3
        Top = 199
        Width = 150
        Height = 21
        DataField = 'FONE'
        DataSource = DsConfigNfe
        TabOrder = 11
      end
      object DbEmail: TDBEdit
        Left = 159
        Top = 199
        Width = 282
        Height = 21
        DataField = 'EMAIL'
        DataSource = DsConfigNfe
        TabOrder = 12
      end
    end
    object TabSheet4: TTabSheet
      Caption = '4 - WebService'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 5
        Top = 21
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object GroupBox5: TGroupBox
        Left = 194
        Top = 18
        Width = 177
        Height = 199
        Caption = 'Conex'#227'o'
        TabOrder = 0
        object Label12: TLabel
          Left = 9
          Top = 22
          Width = 22
          Height = 13
          Caption = 'Host'
        end
        object Label13: TLabel
          Left = 9
          Top = 65
          Width = 26
          Height = 13
          Caption = 'Porta'
        end
        object Label14: TLabel
          Left = 9
          Top = 106
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label15: TLabel
          Left = 9
          Top = 149
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object DbHost: TDBEdit
          Left = 9
          Top = 38
          Width = 163
          Height = 21
          DataField = 'HOST_WS'
          DataSource = DsConfigNfe
          TabOrder = 0
        end
        object DbPorta: TDBEdit
          Left = 9
          Top = 80
          Width = 163
          Height = 21
          DataField = 'PORTA_WS'
          DataSource = DsConfigNfe
          TabOrder = 1
        end
        object DbUsu: TDBEdit
          Left = 9
          Top = 123
          Width = 163
          Height = 21
          DataField = 'USU_WS'
          DataSource = DsConfigNfe
          TabOrder = 2
        end
        object DbWsenha: TDBEdit
          Left = 9
          Top = 165
          Width = 163
          Height = 21
          DataField = 'SENHA_WS'
          DataSource = DsConfigNfe
          TabOrder = 3
        end
      end
      object DbUFWS: TDBEdit
        Left = 24
        Top = 18
        Width = 41
        Height = 21
        DataField = 'UFWS'
        DataSource = DsConfigNfe
        TabOrder = 1
      end
      object DbAmbiente: TDBRadioGroup
        Left = 12
        Top = 59
        Width = 185
        Height = 81
        Caption = 'Ambiente de Destino'
        DataField = 'AMBIENTE_WS'
        DataSource = DsConfigNfe
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Email'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label17: TLabel
        Left = 16
        Top = 16
        Width = 22
        Height = 13
        Caption = 'Host'
      end
      object Label18: TLabel
        Left = 16
        Top = 56
        Width = 26
        Height = 13
        Caption = 'Porta'
      end
      object Label19: TLabel
        Left = 16
        Top = 96
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object Label20: TLabel
        Left = 16
        Top = 136
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      object DbSMPTHost: TDBEdit
        Left = 16
        Top = 31
        Width = 289
        Height = 21
        DataField = 'EMAIL_HOST'
        DataSource = DsConfigNfe
        TabOrder = 0
      end
      object DbSMPTPorta: TDBEdit
        Left = 16
        Top = 72
        Width = 289
        Height = 21
        DataField = 'EMAIL_PORTA'
        DataSource = DsConfigNfe
        TabOrder = 1
      end
      object DbSMPTUsuario: TDBEdit
        Left = 16
        Top = 112
        Width = 121
        Height = 21
        DataField = 'EMAIL_USUARIO'
        DataSource = DsConfigNfe
        TabOrder = 2
      end
      object DbSMTPSenha: TDBEdit
        Left = 16
        Top = 155
        Width = 121
        Height = 21
        DataField = 'EMAIL_SENHA'
        DataSource = DsConfigNfe
        TabOrder = 3
      end
    end
  end
  object BtConfirmar: TButton
    Left = 158
    Top = 389
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = BtConfirmarClick
  end
  object BtCancelar: TButton
    Left = 253
    Top = 389
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 2
    OnClick = BtCancelarClick
  end
  object OpenDialog1: TOpenDialog
    Left = 356
    Top = 336
  end
  object DsConfigNfe: TDataSource
    DataSet = DataModule1.CdConfigNfe
    Left = 424
    Top = 328
  end
end
