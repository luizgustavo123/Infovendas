unit Data_Module;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr, Data.DBXFirebird, IniFiles, pcnConversao, ACBrNFe,
  ACBrBase, ACBrDFe, Vcl.Forms, ACBrDFeSSL, ACBrMail, ACBrNFeDANFeESCPOS,
  ACBrDANFCeFortesFr, ACBrNFeDANFEClass, ACBrNFeDANFeRLClass;

type
  TDataModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    ACBrNFe1: TACBrNFe;
    ACBrMail1: TACBrMail;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    CdUsuario: TClientDataSet;
    DpUsuario: TDataSetProvider;
    SQLUsuario: TSQLQuery;
    SQLUsuarioUSU_USUARIO: TStringField;
    SQLUsuarioUSU_SENHA: TStringField;
    SQLUsuarioUSU_PRIVILEGIO: TStringField;
    CdUsuarioUSU_USUARIO: TStringField;
    CdUsuarioUSU_SENHA: TStringField;
    CdUsuarioUSU_PRIVILEGIO: TStringField;
    SQLUsuarioUSU_COMISSAO: TFloatField;
    CdUsuarioUSU_COMISSAO: TFloatField;
    SQLSis: TSQLQuery;
    CdSis: TClientDataSet;
    DpSis: TDataSetProvider;
    SQLSisSIS_SERIAL: TStringField;
    SQLSisSIS_STATUS: TStringField;
    CdSisSIS_SERIAL: TStringField;
    CdSisSIS_STATUS: TStringField;
    CdConfigNfe: TClientDataSet;
    CdConfigNfeFORMA_EMISSAO: TIntegerField;
    CdConfigNfeLOGOMARCA: TStringField;
    CdConfigNfePATH_ARQUIVO: TStringField;
    CdConfigNfeARQUI_ENVIO_RESPOSTA: TStringField;
    CdConfigNfePATHSCHEMAS: TStringField;
    CdConfigNfeCERTIFICADO: TStringField;
    CdConfigNfeSENHA_CERTIFICADO: TStringField;
    CdConfigNfeNUMERO_SERIE: TStringField;
    CdConfigNfeSSLLIB: TIntegerField;
    CdConfigNfeCRYPTLIB: TIntegerField;
    CdConfigNfeHTTPLIB: TIntegerField;
    CdConfigNfeXMLSIGN: TIntegerField;
    CdConfigNfeRAZAO_SOCIAL: TStringField;
    CdConfigNfeNOME_FANTASIA: TStringField;
    CdConfigNfeCNPJ: TStringField;
    CdConfigNfeI_ESTADUAL: TStringField;
    CdConfigNfeENDERECO: TStringField;
    CdConfigNfeEND_NUMERO: TStringField;
    CdConfigNfeBAIRRO: TStringField;
    CdConfigNfeCEP: TIntegerField;
    CdConfigNfeCIDADE: TStringField;
    CdConfigNfeUF: TStringField;
    CdConfigNfeCOD_MUN: TIntegerField;
    CdConfigNfeFONE: TStringField;
    CdConfigNfeEMAIL: TStringField;
    CdConfigNfeUFWS: TStringField;
    CdConfigNfeAMBIENTE_WS: TIntegerField;
    CdConfigNfeHOST_WS: TStringField;
    CdConfigNfePORTA_WS: TStringField;
    CdConfigNfeUSU_WS: TStringField;
    CdConfigNfeSENHA_WS: TStringField;
    CdConfigNfeEMAIL_HOST: TStringField;
    CdConfigNfeEMAIL_PORTA: TStringField;
    CdConfigNfeEMAIL_USUARIO: TStringField;
    CdConfigNfeEMAIL_SENHA: TStringField;
    DpConfigNfe: TDataSetProvider;
    SQLConfigNfe: TSQLQuery;
    SQLConfigNfeFORMA_EMISSAO: TIntegerField;
    SQLConfigNfeLOGOMARCA: TStringField;
    SQLConfigNfePATH_ARQUIVO: TStringField;
    SQLConfigNfeARQUI_ENVIO_RESPOSTA: TStringField;
    SQLConfigNfePATHSCHEMAS: TStringField;
    SQLConfigNfeCERTIFICADO: TStringField;
    SQLConfigNfeSENHA_CERTIFICADO: TStringField;
    SQLConfigNfeNUMERO_SERIE: TStringField;
    SQLConfigNfeSSLLIB: TIntegerField;
    SQLConfigNfeCRYPTLIB: TIntegerField;
    SQLConfigNfeHTTPLIB: TIntegerField;
    SQLConfigNfeXMLSIGN: TIntegerField;
    SQLConfigNfeRAZAO_SOCIAL: TStringField;
    SQLConfigNfeNOME_FANTASIA: TStringField;
    SQLConfigNfeCNPJ: TStringField;
    SQLConfigNfeI_ESTADUAL: TStringField;
    SQLConfigNfeENDERECO: TStringField;
    SQLConfigNfeEND_NUMERO: TStringField;
    SQLConfigNfeBAIRRO: TStringField;
    SQLConfigNfeCEP: TIntegerField;
    SQLConfigNfeCIDADE: TStringField;
    SQLConfigNfeUF: TStringField;
    SQLConfigNfeCOD_MUN: TIntegerField;
    SQLConfigNfeFONE: TStringField;
    SQLConfigNfeEMAIL: TStringField;
    SQLConfigNfeUFWS: TStringField;
    SQLConfigNfeAMBIENTE_WS: TIntegerField;
    SQLConfigNfeHOST_WS: TStringField;
    SQLConfigNfePORTA_WS: TStringField;
    SQLConfigNfeUSU_WS: TStringField;
    SQLConfigNfeSENHA_WS: TStringField;
    SQLConfigNfeEMAIL_HOST: TStringField;
    SQLConfigNfeEMAIL_PORTA: TStringField;
    SQLConfigNfeEMAIL_USUARIO: TStringField;
    SQLConfigNfeEMAIL_SENHA: TStringField;
    SQLUsuarioUSU_COD: TIntegerField;
    CdUsuarioUSU_COD: TIntegerField;
    SQLSisSISTEMA: TStringField;
    CdSisSISTEMA: TStringField;
    SQLEmp: TSQLQuery;
    CdEmp: TClientDataSet;
    DpEmp: TDataSetProvider;
    SQLEmpEMP_COD: TIntegerField;
    SQLEmpEMP_NOME_FANTASIA: TStringField;
    SQLEmpEMP_RAZAO_SOCIAL: TStringField;
    SQLEmpEMP_CNPJ: TStringField;
    SQLEmpEMP_ENDERECO: TStringField;
    SQLEmpEMP_CEP: TStringField;
    SQLEmpEMP_CIDADE: TStringField;
    SQLEmpEMP_TELEFONE: TStringField;
    SQLEmpEMP_OBS: TStringField;
    SQLEmpEMP_NUMERO: TIntegerField;
    SQLEmpEMP_CELULAR: TStringField;
    SQLEmpEMP_INC_ESTADUAL: TStringField;
    CdEmpEMP_COD: TIntegerField;
    CdEmpEMP_NOME_FANTASIA: TStringField;
    CdEmpEMP_RAZAO_SOCIAL: TStringField;
    CdEmpEMP_CNPJ: TStringField;
    CdEmpEMP_ENDERECO: TStringField;
    CdEmpEMP_CEP: TStringField;
    CdEmpEMP_CIDADE: TStringField;
    CdEmpEMP_TELEFONE: TStringField;
    CdEmpEMP_OBS: TStringField;
    CdEmpEMP_NUMERO: TIntegerField;
    CdEmpEMP_CELULAR: TStringField;
    CdEmpEMP_INC_ESTADUAL: TStringField;
    SQLEmpEMP_LOGO: TStringField;
    CdEmpEMP_LOGO: TStringField;
    SQLSisSIS_IMG_FUNDO: TStringField;
    CdSisSIS_IMG_FUNDO: TStringField;
    SQLSisSIS_DATA_DEMO: TDateField;
    CdSisSIS_DATA_DEMO: TDateField;
    SQLEmpEMP_DESCONTO_AVISTA: TSmallintField;
    SQLEmpEMP_ACRESCIMO_APRAZO: TSingleField;
    CdEmpEMP_DESCONTO_AVISTA: TSmallintField;
    CdEmpEMP_ACRESCIMO_APRAZO: TSingleField;
    SQLSisSIS_IP_SERVIDOR: TStringField;
    CdSisSIS_IP_SERVIDOR: TStringField;
    SQLEmpEMP_SERV_DESCONTO_AVISTA: TSingleField;
    SQLEmpEMP_SERV_ACRESCIMO_APRAZO: TSingleField;
    CdEmpEMP_SERV_DESCONTO_AVISTA: TSingleField;
    CdEmpEMP_SERV_ACRESCIMO_APRAZO: TSingleField;
    SQLEmpEMP_IMP_A4: TSmallintField;
    CdEmpEMP_IMP_A4: TSmallintField;
    procedure CdUsuarioAfterDelete(DataSet: TDataSet);
    procedure CdUsuarioAfterPost(DataSet: TDataSet);
    procedure CdEmpAfterPost(DataSet: TDataSet);
    procedure CdSisAfterPost(DataSet: TDataSet);
    procedure SQLConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
    sControleReg : String;
    Procedure FormataCampos;
  public
    { Public declarations }
    sNumItem : Integer;
    sSSLLib, sCryptLib, sHttpLib, sXmlSignLib     : Integer;
    sTipoConta   : Integer;
    sProcessoQui : Integer;
    sArquivo     : TextFile;
    sTotalReg    : Integer;
    sLBloco,sLArquivo,sLRegistro : Integer;
    // configurações do AcBr
    sFormas, sAmbiente : Integer;
    sSalvaArq : Boolean;
    sLogoMarca, sPathArq, sPathSchemas, sCertificado, sSenha, sSerial,
    sRazao, sFantasia, sCNPJ, sIE, sEndereco, sNum,
    sBairro, sCidade, sCEP, sUF, sCodMun, sUFWS, sHost,
    sPorta, sUsuario, sSenhaWS, sFone, sEmailEmitente : String;
    sSMPTHost,sSMTPPort,sSMTPUsu,sSMTPPass : String;
    //
    function VerificaCampos:Boolean;
    procedure PreencheDadosCliente(pTipo:Integer);
    function VerificaDadosProduto:Boolean;
    procedure LeArqIni;
    procedure GravaArqIni;
    procedure AtualizaConfigAcBr;
    procedure GravaChaveNFEPedido(pChaveNFe, pNumPed: String);

  end;


var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Clientes, ControleUsuario, Funcoes;

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.AtualizaConfigAcBr;
var OK : Boolean;
begin
  // realiza a leidura dos dados do arquivo de configuração
  LeArqIni;
  // Repassa Dados para componente AcBrNFe
  {$IFDEF AcBrMFeOpenSSL}
    ACBrNFe1.configuracoes.Certificados.Certificado := sCertificado;
    AcBrNFe1.Configuracoes.Certificados.Senha       := sSenha;
  {$ELSE}
    AcBrNFe1.Configuracoes.Certificados.NumeroSerie := sSerial;
  {$ENDIF}
  // Geral
  ACBrNFe1.Configuracoes.Geral.FormaEmissao         := StrToTpEmis(OK,IntToStr(sFormas));
  ACBrNFe1.Configuracoes.Geral.Salvar               := sSalvaArq;
  ACBrNFe1.Configuracoes.Arquivos.PathSalvar        := sPathArq;
  ACBrNFe1.Configuracoes.Arquivos.PathSchemas       := sPathSchemas;
  ACBrNFe1.Configuracoes.Geral.SSLLib               := TSSLLib (sSSLLib);
  ACBrNFe1.Configuracoes.Geral.SSLCryptLib          := TSSLCryptLib(sCryptLib);
  ACBrNFe1.Configuracoes.Geral.SSLHttpLib           := TSSLHttpLib (sHttpLib);
  ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib        := TSSLXmlSignLib (sXmlSignLib);


  // WebServices
  ACBrNFe1.Configuracoes.WebServices.UF             := sUFWS;
  ACBrNFe1.Configuracoes.WebServices.Ambiente       := StrToTpAmb(OK,IntToStr(sAmbiente));
  ACBrNFe1.Configuracoes.WebServices.Visualizar     := True;
  ACBrNFe1.Configuracoes.WebServices.ProxyHost      := sHost;
  ACBrNFe1.Configuracoes.WebServices.ProxyPort      := sPorta;
  ACBrNFe1.Configuracoes.WebServices.ProxyUser      := sUsuario;
  ACBrNFe1.Configuracoes.WebServices.ProxyPass      := sSenhaWS;
  //
  if ACBrNFe1.DANFE <> nil then
  begin
    ACBrNFe1.DANFE.TipoDANFE := StrToTpImp(OK,'1');
    ACBrNFe1.DANFE.Logo      := sLogoMarca;
  end;

end;

procedure TDataModule1.CdEmpAfterPost(DataSet: TDataSet);
begin
  CdEmp.ApplyUpdates(0);
  CdEmp.Refresh;
end;

procedure TDataModule1.CdSisAfterPost(DataSet: TDataSet);
begin
  CdSis.ApplyUpdates(0);
  CdSis.Refresh;
end;

procedure TDataModule1.CdUsuarioAfterDelete(DataSet: TDataSet);
begin
 Cdusuario.ApplyUpdates(0);
 Cdusuario.Refresh;
end;

procedure TDataModule1.CdUsuarioAfterPost(DataSet: TDataSet);
begin
 Cdusuario.ApplyUpdates(0);
 Cdusuario.Refresh;
end;

procedure TDataModule1.FormataCampos;
begin

end;

procedure TDataModule1.GravaArqIni;
var ArqINI : TIniFile;
begin
  inherited;
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
  // GERAL
  ArqINI.WriteInteger('GERAL','FORMA_EMISSAO',sFormas);
  ArqINI.WriteString('GERAL','LOGOMARCA',sLogoMarca);
  ArqINI.WriteBool('GERAL','SALVA_ARQUIVO',sSalvaArq);
  ArqINI.WriteString('GERAL','PATH_ARQUIVO',sPathArq);
  ArqINI.WriteString('GERAL','PathSchemas',sPathSchemas);
  ArqINI.WriteInteger( 'Certificado','SSLLib' , sSSLLib);
  ArqINI.WriteInteger( 'Certificado','CryptLib' , sCryptLib);
  ArqINI.WriteInteger( 'Certificado','HttpLib' , sHttpLib);
  ArqINI.WriteInteger( 'Certificado','XmlSignLib' , sXmlSignLib);
  // CERTIFICADO
  ArqINI.WriteString('CERTIFICADO','PATH_CERTIFICADO',sCertificado);
  ArqINI.WriteString('CERTIFICADO','SENHA_CERT',sSenha);
  ArqINI.WriteString('CERTIFICADO','NUM_SERIE',sSerial);
  // emitente
  ArqINI.WriteString('EMITENTE','RAZAO',sRazao);
  ArqINI.WriteString('EMITENTE','FANTASIA',sFantasia);
  ArqINI.WriteString('EMITENTE','CNPJ',sCNPJ);
  ArqINI.WriteString('EMITENTE','I_ESTADUAL',sIE);
  ArqINI.WriteString('EMITENTE','ENDERECO',sEndereco);
  ArqINI.WriteString('EMITENTE','NUMERO',sNum);
  ArqINI.WriteString('EMITENTE','BAIRRO',sBairro);
  ArqINI.WriteString('EMITENTE','CIDADE',sCidade);
  ArqINI.WriteString('EMITENTE','CEP',sCEP);
  ArqINI.WriteString('EMITENTE','UF',sUF);
  ArqINI.WriteString('EMITENTE','MUNICIPIO',sCodMun);
  ArqINI.WriteString('EMITENTE','TELEFONE',sFone);
  ArqINI.WriteString('EMITENTE','EMAIL',sEmailEmitente);
  // WebService
  ArqINI.WriteString('WS','UFWS',sUFWS);
  ArqINI.WriteInteger('WS','AMBIENTE',sAmbiente);
  ArqINI.WriteString('WS','HOST',sHost);
  ArqINI.WriteString('WS','PORTA',sPorta);
  ArqINI.WriteString('WS','USUARIO',sUsuario);
  ArqINI.WriteString('WS','SENHA',sSenhaWS);
  // email
  ArqINI.WriteString('EMAIL','SMTPHOST',sSMPTHost);
  ArqINI.WriteString('EMAIL','SMTPPORT',sSMTPPort);
  ArqINI.WriteString('EMAIL','SMTPUSU',sSMTPUsu);
  ArqINI.WriteString('EMAIL','SMTPPASS',sSMTPPass);
  ArqINI.Free;
end;

procedure TDataModule1.GravaChaveNFEPedido(pChaveNFe, pNumPed: String);
var Query : TSQLQuery;
begin
  Query := TSQLQuery.Create(nil);
  try
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('update VENDAS set');
    Query.SQL.Add('VEN_CHAVE_NFE = :pChave');
    Query.SQL.Add('where VEN_COD = :pNumped');
    Query.Params.ParamByName('pChave').AsString  := pChaveNFe;
    Query.Params.ParamByName('pNumped').AsString := pNumPed;
    Query.ExecSQL(false);
  finally
    FreeAndNil(Query);
  end;

end;

procedure TDataModule1.LeArqIni;
var ArqINI : TIniFile;
    aux : String;
begin
  aux := ExtractFilePath(Application.ExeName)+'config.ini';
  ArqINI := TIniFile.Create(aux);
  // GERAL
  sFormas      := ArqINI.ReadInteger('GERAL','FORMA_EMISSAO',0);
  sLogoMarca   := ArqINI.ReadString('GERAL','LOGOMARCA','C:\logo.jpg');
  sSalvaArq    := ArqINI.ReadBool('GERAL','SALVA_ARQUIVO',true);
  sPathArq     := ArqINI.ReadString('GERAL','PATH_ARQUIVO','C:\');
  sPathSchemas := ArqINI.ReadString('GERAL','PathSchemas','C:\');
  // CERTIFICADO
  sCertificado := ArqINI.ReadString('CERTIFICADO','PATH_CERTIFICADO','');
  sSenha       := ArqINI.ReadString('CERTIFICADO','SENHA_CERT','');
  sSerial      := ArqINI.ReadString('CERTIFICADO','NUM_SERIE','');
  sSSLLib      := ArqINI.ReadInteger( 'Certificado','SSLLib' ,0);
  sCryptLib    := ArqINI.ReadInteger( 'Certificado','CryptLib' , 0);
  sHttpLib     := ArqINI.ReadInteger( 'Certificado','HttpLib' , 0);
  sXmlSignLib  := ArqINI.ReadInteger( 'Certificado','XmlSignLib' , 0);
  // emitente
  sRazao       := ArqINI.ReadString('EMITENTE','RAZAO','');
  sFantasia    := ArqINI.ReadString('EMITENTE','FANTASIA','');
  sCNPJ        := ArqINI.ReadString('EMITENTE','CNPJ','');
  sIE          := ArqINI.ReadString('EMITENTE','I_ESTADUAL','');
  sEndereco    := ArqINI.ReadString('EMITENTE','ENDERECO','');
  sNum         := ArqINI.ReadString('EMITENTE','NUMERO','');
  sBairro      := ArqINI.ReadString('EMITENTE','BAIRRO','');
  sCidade      := ArqINI.ReadString('EMITENTE','CIDADE','');
  sCEP         := ArqINI.ReadString('EMITENTE','CEP','');
  sUF          := ArqINI.ReadString('EMITENTE','UF','');
  sCodMun      := ArqINI.ReadString('EMITENTE','MUNICIPIO','');
  sFone        := ArqINI.ReadString('EMITENTE','TELEFONE','');
  sEmailEmitente := ArqINI.ReadString('EMITENTE','EMAIL','');
  // WebService
  sUFWS        := ArqINI.ReadString('WS','UFWS','');
  sAmbiente    := ArqINI.ReadInteger('WS','AMBIENTE',0);
  sHost        := ArqINI.ReadString('WS','HOST','');
  sPorta       := ArqINI.ReadString('WS','PORTA','');
  sUsuario     := ArqINI.ReadString('WS','USUARIO','');
  sSenhaWS     := ArqINI.ReadString('WS','SENHA','');
  // email
  sSMPTHost    := ArqINI.ReadString('EMAIL','SMTPHOST','');
  sSMTPPort    := ArqINI.ReadString('EMAIL','SMTPPORT','');
  sSMTPUsu     := ArqINI.ReadString('EMAIL','SMTPUSU','');
  sSMTPPass    := ArqINI.ReadString('EMAIL','SMTPPASS','');
  //
  ArqINI.Free;
end;

procedure TDataModule1.PreencheDadosCliente(pTipo: Integer);
begin

end;

procedure TDataModule1.SQLConnection1BeforeConnect(Sender: TObject);
var
  ArquivoINI: TmemIniFile;
  usu, IP : String;
begin
  usu :=  funcoes.GetNetUserName;
  ArquivoINI := TmemIniFile.Create('C:\Users\'+ usu + '\Documents\ConexaoSistemaSoftPop.ini');
  IP := ArquivoINI.ReadString('IP', 'SERVIDOR', '');
  ArquivoINI.UpdateFile;
  ArquivoINI.Free;

  if IP <> '' then
  begin
    SQLConnection1.Params.Add('DataBase=' + IP + ':C:\Program Files\SoftPop\Banco\BANCOSISTEMA.FDB');
  end
  else
  begin
    SQLConnection1.Params.Add('DataBase=C:\Program Files\SoftPop\Banco\BANCOSISTEMA.FDB');
  end;
    //SQLConnection1.Connected := True;
end;

function TDataModule1.VerificaCampos: Boolean;
begin

end;

function TDataModule1.VerificaDadosProduto: Boolean;
begin

end;

end.
