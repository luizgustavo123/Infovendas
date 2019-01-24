object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 389
  Width = 467
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver220.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=22.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver220.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=22.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=C:\Program Files\SoftPop\Banco\BANCOSISTEMA.FDB'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    BeforeConnect = SQLConnection1BeforeConnect
    Connected = True
    Left = 184
    Top = 24
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = ACBrNFeDANFeRL1
    Left = 40
    Top = 24
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 40
    Top = 144
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    ACBrNFe = ACBrNFe1
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    AgruparNumCopias = False
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 4
    CasasDecimais._vUnCom = 4
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    LarguraCodProd = 54
    ExibirEAN = False
    QuebraLinhaEmDetalhamentoEspecifico = True
    ExibeCampoFatura = False
    ImprimirUnQtVlComercial = iuComercial
    ImprimirDadosDocReferenciados = True
    Left = 39
    Top = 85
  end
  object CdUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpUsuario'
    AfterPost = CdUsuarioAfterPost
    AfterDelete = CdUsuarioAfterDelete
    Left = 384
    Top = 168
    object CdUsuarioUSU_USUARIO: TStringField
      FieldName = 'USU_USUARIO'
      Size = 50
    end
    object CdUsuarioUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
      Size = 50
    end
    object CdUsuarioUSU_PRIVILEGIO: TStringField
      FieldName = 'USU_PRIVILEGIO'
      Size = 50
    end
    object CdUsuarioUSU_COMISSAO: TFloatField
      FieldName = 'USU_COMISSAO'
    end
    object CdUsuarioUSU_COD: TIntegerField
      FieldName = 'USU_COD'
    end
  end
  object DpUsuario: TDataSetProvider
    DataSet = SQLUsuario
    Left = 384
    Top = 112
  end
  object SQLUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'USU_COD,'
      'USU_USUARIO,'
      'USU_COMISSAO,'
      'USU_SENHA,'
      'USU_PRIVILEGIO'
      'FROM USUARIO')
    SQLConnection = SQLConnection1
    Left = 384
    Top = 64
    object SQLUsuarioUSU_USUARIO: TStringField
      FieldName = 'USU_USUARIO'
      Size = 50
    end
    object SQLUsuarioUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
      Size = 50
    end
    object SQLUsuarioUSU_PRIVILEGIO: TStringField
      FieldName = 'USU_PRIVILEGIO'
      Size = 50
    end
    object SQLUsuarioUSU_COMISSAO: TFloatField
      FieldName = 'USU_COMISSAO'
    end
    object SQLUsuarioUSU_COD: TIntegerField
      FieldName = 'USU_COD'
    end
  end
  object SQLSis: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SISTEMA')
    SQLConnection = SQLConnection1
    Left = 384
    Top = 264
    object SQLSisSIS_SERIAL: TStringField
      FieldName = 'SIS_SERIAL'
      Size = 150
    end
    object SQLSisSIS_STATUS: TStringField
      FieldName = 'SIS_STATUS'
      Size = 80
    end
    object SQLSisSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 50
    end
    object SQLSisSIS_IMG_FUNDO: TStringField
      FieldName = 'SIS_IMG_FUNDO'
      Size = 150
    end
    object SQLSisSIS_DATA_DEMO: TDateField
      FieldName = 'SIS_DATA_DEMO'
    end
    object SQLSisSIS_IP_SERVIDOR: TStringField
      FieldName = 'SIS_IP_SERVIDOR'
      Size = 100
    end
  end
  object CdSis: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpSis'
    AfterPost = CdSisAfterPost
    Left = 288
    Top = 264
    object CdSisSIS_SERIAL: TStringField
      FieldName = 'SIS_SERIAL'
      Size = 150
    end
    object CdSisSIS_STATUS: TStringField
      FieldName = 'SIS_STATUS'
      Size = 80
    end
    object CdSisSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 50
    end
    object CdSisSIS_IMG_FUNDO: TStringField
      FieldName = 'SIS_IMG_FUNDO'
      Size = 150
    end
    object CdSisSIS_DATA_DEMO: TDateField
      FieldName = 'SIS_DATA_DEMO'
    end
    object CdSisSIS_IP_SERVIDOR: TStringField
      FieldName = 'SIS_IP_SERVIDOR'
      Size = 100
    end
  end
  object DpSis: TDataSetProvider
    DataSet = SQLSis
    Left = 336
    Top = 264
  end
  object CdConfigNfe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpConfigNfe'
    Left = 288
    Top = 168
    object CdConfigNfeFORMA_EMISSAO: TIntegerField
      FieldName = 'FORMA_EMISSAO'
    end
    object CdConfigNfeLOGOMARCA: TStringField
      FieldName = 'LOGOMARCA'
      Size = 150
    end
    object CdConfigNfePATH_ARQUIVO: TStringField
      FieldName = 'PATH_ARQUIVO'
      Size = 150
    end
    object CdConfigNfeARQUI_ENVIO_RESPOSTA: TStringField
      FieldName = 'ARQUI_ENVIO_RESPOSTA'
    end
    object CdConfigNfePATHSCHEMAS: TStringField
      FieldName = 'PATHSCHEMAS'
      Size = 150
    end
    object CdConfigNfeCERTIFICADO: TStringField
      FieldName = 'CERTIFICADO'
      Size = 150
    end
    object CdConfigNfeSENHA_CERTIFICADO: TStringField
      FieldName = 'SENHA_CERTIFICADO'
      Size = 150
    end
    object CdConfigNfeNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Size = 150
    end
    object CdConfigNfeSSLLIB: TIntegerField
      FieldName = 'SSLLIB'
    end
    object CdConfigNfeCRYPTLIB: TIntegerField
      FieldName = 'CRYPTLIB'
    end
    object CdConfigNfeHTTPLIB: TIntegerField
      FieldName = 'HTTPLIB'
    end
    object CdConfigNfeXMLSIGN: TIntegerField
      FieldName = 'XMLSIGN'
    end
    object CdConfigNfeRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object CdConfigNfeNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object CdConfigNfeCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 50
    end
    object CdConfigNfeI_ESTADUAL: TStringField
      FieldName = 'I_ESTADUAL'
      Size = 50
    end
    object CdConfigNfeENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 150
    end
    object CdConfigNfeEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 50
    end
    object CdConfigNfeBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object CdConfigNfeCEP: TIntegerField
      FieldName = 'CEP'
    end
    object CdConfigNfeCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object CdConfigNfeUF: TStringField
      FieldName = 'UF'
      Size = 50
    end
    object CdConfigNfeCOD_MUN: TIntegerField
      FieldName = 'COD_MUN'
    end
    object CdConfigNfeFONE: TStringField
      FieldName = 'FONE'
      Size = 50
    end
    object CdConfigNfeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object CdConfigNfeUFWS: TStringField
      FieldName = 'UFWS'
      Size = 50
    end
    object CdConfigNfeAMBIENTE_WS: TIntegerField
      FieldName = 'AMBIENTE_WS'
    end
    object CdConfigNfeHOST_WS: TStringField
      FieldName = 'HOST_WS'
      Size = 100
    end
    object CdConfigNfePORTA_WS: TStringField
      FieldName = 'PORTA_WS'
      Size = 100
    end
    object CdConfigNfeUSU_WS: TStringField
      FieldName = 'USU_WS'
      Size = 100
    end
    object CdConfigNfeSENHA_WS: TStringField
      FieldName = 'SENHA_WS'
      Size = 100
    end
    object CdConfigNfeEMAIL_HOST: TStringField
      FieldName = 'EMAIL_HOST'
      Size = 100
    end
    object CdConfigNfeEMAIL_PORTA: TStringField
      FieldName = 'EMAIL_PORTA'
      Size = 100
    end
    object CdConfigNfeEMAIL_USUARIO: TStringField
      FieldName = 'EMAIL_USUARIO'
      Size = 100
    end
    object CdConfigNfeEMAIL_SENHA: TStringField
      FieldName = 'EMAIL_SENHA'
      Size = 100
    end
  end
  object DpConfigNfe: TDataSetProvider
    DataSet = SQLConfigNfe
    Left = 288
    Top = 112
  end
  object SQLConfigNfe: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from config_nfe')
    SQLConnection = SQLConnection1
    Left = 288
    Top = 64
    object SQLConfigNfeFORMA_EMISSAO: TIntegerField
      FieldName = 'FORMA_EMISSAO'
    end
    object SQLConfigNfeLOGOMARCA: TStringField
      FieldName = 'LOGOMARCA'
      Size = 150
    end
    object SQLConfigNfePATH_ARQUIVO: TStringField
      FieldName = 'PATH_ARQUIVO'
      Size = 150
    end
    object SQLConfigNfeARQUI_ENVIO_RESPOSTA: TStringField
      FieldName = 'ARQUI_ENVIO_RESPOSTA'
    end
    object SQLConfigNfePATHSCHEMAS: TStringField
      FieldName = 'PATHSCHEMAS'
      Size = 150
    end
    object SQLConfigNfeCERTIFICADO: TStringField
      FieldName = 'CERTIFICADO'
      Size = 150
    end
    object SQLConfigNfeSENHA_CERTIFICADO: TStringField
      FieldName = 'SENHA_CERTIFICADO'
      Size = 150
    end
    object SQLConfigNfeNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Size = 150
    end
    object SQLConfigNfeSSLLIB: TIntegerField
      FieldName = 'SSLLIB'
    end
    object SQLConfigNfeCRYPTLIB: TIntegerField
      FieldName = 'CRYPTLIB'
    end
    object SQLConfigNfeHTTPLIB: TIntegerField
      FieldName = 'HTTPLIB'
    end
    object SQLConfigNfeXMLSIGN: TIntegerField
      FieldName = 'XMLSIGN'
    end
    object SQLConfigNfeRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object SQLConfigNfeNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object SQLConfigNfeCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 50
    end
    object SQLConfigNfeI_ESTADUAL: TStringField
      FieldName = 'I_ESTADUAL'
      Size = 50
    end
    object SQLConfigNfeENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 150
    end
    object SQLConfigNfeEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 50
    end
    object SQLConfigNfeBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object SQLConfigNfeCEP: TIntegerField
      FieldName = 'CEP'
    end
    object SQLConfigNfeCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object SQLConfigNfeUF: TStringField
      FieldName = 'UF'
      Size = 50
    end
    object SQLConfigNfeCOD_MUN: TIntegerField
      FieldName = 'COD_MUN'
    end
    object SQLConfigNfeFONE: TStringField
      FieldName = 'FONE'
      Size = 50
    end
    object SQLConfigNfeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object SQLConfigNfeUFWS: TStringField
      FieldName = 'UFWS'
      Size = 50
    end
    object SQLConfigNfeAMBIENTE_WS: TIntegerField
      FieldName = 'AMBIENTE_WS'
    end
    object SQLConfigNfeHOST_WS: TStringField
      FieldName = 'HOST_WS'
      Size = 100
    end
    object SQLConfigNfePORTA_WS: TStringField
      FieldName = 'PORTA_WS'
      Size = 100
    end
    object SQLConfigNfeUSU_WS: TStringField
      FieldName = 'USU_WS'
      Size = 100
    end
    object SQLConfigNfeSENHA_WS: TStringField
      FieldName = 'SENHA_WS'
      Size = 100
    end
    object SQLConfigNfeEMAIL_HOST: TStringField
      FieldName = 'EMAIL_HOST'
      Size = 100
    end
    object SQLConfigNfeEMAIL_PORTA: TStringField
      FieldName = 'EMAIL_PORTA'
      Size = 100
    end
    object SQLConfigNfeEMAIL_USUARIO: TStringField
      FieldName = 'EMAIL_USUARIO'
      Size = 100
    end
    object SQLConfigNfeEMAIL_SENHA: TStringField
      FieldName = 'EMAIL_SENHA'
      Size = 100
    end
  end
  object SQLEmp: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM EMPRESA')
    SQLConnection = SQLConnection1
    Left = 384
    Top = 320
    object SQLEmpEMP_COD: TIntegerField
      FieldName = 'EMP_COD'
    end
    object SQLEmpEMP_NOME_FANTASIA: TStringField
      FieldName = 'EMP_NOME_FANTASIA'
      Size = 150
    end
    object SQLEmpEMP_RAZAO_SOCIAL: TStringField
      FieldName = 'EMP_RAZAO_SOCIAL'
      Size = 150
    end
    object SQLEmpEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Size = 50
    end
    object SQLEmpEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      Size = 150
    end
    object SQLEmpEMP_CEP: TStringField
      FieldName = 'EMP_CEP'
      Size = 50
    end
    object SQLEmpEMP_CIDADE: TStringField
      FieldName = 'EMP_CIDADE'
      Size = 50
    end
    object SQLEmpEMP_TELEFONE: TStringField
      FieldName = 'EMP_TELEFONE'
      Size = 50
    end
    object SQLEmpEMP_OBS: TStringField
      FieldName = 'EMP_OBS'
      Size = 250
    end
    object SQLEmpEMP_NUMERO: TIntegerField
      FieldName = 'EMP_NUMERO'
    end
    object SQLEmpEMP_CELULAR: TStringField
      FieldName = 'EMP_CELULAR'
      Size = 50
    end
    object SQLEmpEMP_INC_ESTADUAL: TStringField
      FieldName = 'EMP_INC_ESTADUAL'
      Size = 50
    end
    object SQLEmpEMP_LOGO: TStringField
      FieldName = 'EMP_LOGO'
      Size = 150
    end
    object SQLEmpEMP_DESCONTO_AVISTA: TSmallintField
      FieldName = 'EMP_DESCONTO_AVISTA'
    end
    object SQLEmpEMP_ACRESCIMO_APRAZO: TSingleField
      FieldName = 'EMP_ACRESCIMO_APRAZO'
    end
    object SQLEmpEMP_SERV_DESCONTO_AVISTA: TSingleField
      FieldName = 'EMP_SERV_DESCONTO_AVISTA'
    end
    object SQLEmpEMP_SERV_ACRESCIMO_APRAZO: TSingleField
      FieldName = 'EMP_SERV_ACRESCIMO_APRAZO'
    end
    object SQLEmpEMP_IMP_A4: TSmallintField
      FieldName = 'EMP_IMP_A4'
    end
  end
  object CdEmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpEmp'
    AfterPost = CdEmpAfterPost
    Left = 288
    Top = 320
    object CdEmpEMP_COD: TIntegerField
      FieldName = 'EMP_COD'
    end
    object CdEmpEMP_NOME_FANTASIA: TStringField
      FieldName = 'EMP_NOME_FANTASIA'
      Size = 150
    end
    object CdEmpEMP_RAZAO_SOCIAL: TStringField
      FieldName = 'EMP_RAZAO_SOCIAL'
      Size = 150
    end
    object CdEmpEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Size = 50
    end
    object CdEmpEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      Size = 150
    end
    object CdEmpEMP_CEP: TStringField
      FieldName = 'EMP_CEP'
      Size = 50
    end
    object CdEmpEMP_CIDADE: TStringField
      FieldName = 'EMP_CIDADE'
      Size = 50
    end
    object CdEmpEMP_TELEFONE: TStringField
      FieldName = 'EMP_TELEFONE'
      Size = 50
    end
    object CdEmpEMP_OBS: TStringField
      FieldName = 'EMP_OBS'
      Size = 250
    end
    object CdEmpEMP_NUMERO: TIntegerField
      FieldName = 'EMP_NUMERO'
    end
    object CdEmpEMP_CELULAR: TStringField
      FieldName = 'EMP_CELULAR'
      Size = 50
    end
    object CdEmpEMP_INC_ESTADUAL: TStringField
      FieldName = 'EMP_INC_ESTADUAL'
      Size = 50
    end
    object CdEmpEMP_LOGO: TStringField
      FieldName = 'EMP_LOGO'
      Size = 150
    end
    object CdEmpEMP_DESCONTO_AVISTA: TSmallintField
      FieldName = 'EMP_DESCONTO_AVISTA'
    end
    object CdEmpEMP_ACRESCIMO_APRAZO: TSingleField
      FieldName = 'EMP_ACRESCIMO_APRAZO'
    end
    object CdEmpEMP_SERV_DESCONTO_AVISTA: TSingleField
      FieldName = 'EMP_SERV_DESCONTO_AVISTA'
    end
    object CdEmpEMP_SERV_ACRESCIMO_APRAZO: TSingleField
      FieldName = 'EMP_SERV_ACRESCIMO_APRAZO'
    end
    object CdEmpEMP_IMP_A4: TSmallintField
      FieldName = 'EMP_IMP_A4'
    end
  end
  object DpEmp: TDataSetProvider
    DataSet = SQLEmp
    Left = 336
    Top = 320
  end
end
