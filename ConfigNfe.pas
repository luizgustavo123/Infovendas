unit ConfigNfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, IniFiles, Data_Module, pcnConversao, ACBrNFe,
  ACBrBase, ACBrDFe, Vcl.DBCtrls, Vcl.Mask, Data.DB;

type
  TFm_ConfigNfe = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    SbCertificado: TSpeedButton;
    LbRazao: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    BtConfirmar: TButton;
    GroupBox6: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label16: TLabel;
    BtCancelar: TButton;
    GroupBox7: TGroupBox;
    SpeedButton3: TSpeedButton;
    Label21: TLabel;
    TabSheet5: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lSSLLib: TLabel;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    lXmlSign: TLabel;
    lHttpLib: TLabel;
    lCryptLib: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DbLogo: TDBEdit;
    ChArquivos: TDBCheckBox;
    DbPathSchemas: TDBEdit;
    DbArqui: TDBEdit;
    DbCertificado: TDBEdit;
    DbSenha: TDBEdit;
    DbSerie: TDBEdit;
    DbRazao: TDBEdit;
    DbNomeFan: TDBEdit;
    DbCnpj: TDBEdit;
    DbIncEstadual: TDBEdit;
    DbEnd: TDBEdit;
    DbNumero: TDBEdit;
    DbBairro: TDBEdit;
    DbCep: TDBEdit;
    DbCidade: TDBEdit;
    DbUf: TDBEdit;
    DbCodMun: TDBEdit;
    DbTel: TDBEdit;
    DbEmail: TDBEdit;
    DbUFWS: TDBEdit;
    DbAmbiente: TDBRadioGroup;
    DbHost: TDBEdit;
    DbPorta: TDBEdit;
    DbUsu: TDBEdit;
    DbWsenha: TDBEdit;
    DbSMPTHost: TDBEdit;
    DbSMPTPorta: TDBEdit;
    DbSMPTUsuario: TDBEdit;
    DbSMTPSenha: TDBEdit;
    DsConfigNfe: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SbCertificadoClick(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbCryptLibChange(Sender: TObject);
    procedure cbHttpLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaSSLLibsCombo;
  public
    { Public declarations }
  end;

var
  Fm_ConfigNfe: TFm_ConfigNfe;

implementation

uses
  strutils, math, TypInfo, DateUtils, synacode, blcksock, pcnNFe,
  pcnConversaoNFe, ACBrDFeConfiguracoes, pcnAuxiliar, ACBrDFeSSL, pcnNFeRTXT,
  FileCtrl,ACBrNFeNotasFiscais, ACBrDFeOpenSSL, Grids,
  ACBrNFeConfiguracoes;

{$R *.dfm}

procedure TFm_ConfigNfe.AtualizaSSLLibsCombo;
begin
 cbSSLLib.ItemIndex := Integer( Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLLib );
 cbCryptLib.ItemIndex := Integer( Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLCryptLib );
 cbHttpLib.ItemIndex := Integer( Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLHttpLib );
 cbXmlSignLib.ItemIndex := Integer( Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib );
end;

procedure TFm_ConfigNfe.BtCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFm_ConfigNfe.BtConfirmarClick(Sender: TObject);
begin
  try
    DataModule1.CdConfigNfe.Edit;
    DataModule1.CdConfigNfeSSLLIB.AsInteger := cbSSLLib.ItemIndex;
    DataModule1.CdConfigNfeCryptLib.AsInteger    := cbCryptLib.ItemIndex;
    DataModule1.CdConfigNfeHTTPLIB.AsInteger     := cbHttpLib.ItemIndex;
    DataModule1.CdConfigNfeXMLSIGN.AsInteger  := cbXmlSignLib.ItemIndex;
    DataModule1.CdConfigNfe.Post;

    MessageDlg('Arquivo Gravado com sucesso!', mtInformation, [mbOK], 0);
  except
    MessageDlg('Erro ao gravar arquivo de configuração!', mtError, [mbOK], 0);
  end;

end;

procedure TFm_ConfigNfe.cbCryptLibChange(Sender: TObject);
begin
  try
    if cbCryptLib.ItemIndex <> -1 then
      Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFm_ConfigNfe.cbHttpLibChange(Sender: TObject);
begin
  try
    if cbHttpLib.ItemIndex <> -1 then
      Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFm_ConfigNfe.cbSSLLibChange(Sender: TObject);
begin
  try
    if cbSSLLib.ItemIndex <> -1 then
      Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFm_ConfigNfe.cbXmlSignLibChange(Sender: TObject);
begin
  try
    if cbXmlSignLib.ItemIndex <> -1 then
      Datamodule1.ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TFm_ConfigNfe.FormCreate(Sender: TObject);
var
   T : TSSLLib;
   I : TpcnTipoEmissao;
   J : TpcnModeloDF;
   K : TpcnVersaoDF;
   U: TSSLCryptLib;
   V: TSSLHttpLib;
   X: TSSLXmlSignLib;
   Y: TSSLType;
   aux : integer;
begin

  DataModule1.CdConfigNfe.Close;
  DataModule1.CdConfigNfe.Open;

  For T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) );
  cbSSLLib.ItemIndex := DataModule1.CdConfigNfeSSLLIB.AsInteger;

  cbCryptLib.Items.Clear;
  For U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) );
  cbCryptLib.ItemIndex := DataModule1.CdConfigNfeCRYPTLIB.AsInteger;

  cbHttpLib.Items.Clear;
  For V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) );
  cbHttpLib.ItemIndex := DataModule1.CdConfigNfeHTTPLIB.AsInteger;

  cbXmlSignLib.Items.Clear;
  For X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) );
  cbXmlSignLib.ItemIndex := DataModule1.CdConfigNfeXMLSIGN.AsInteger;
end;

procedure TFm_ConfigNfe.FormShow(Sender: TObject);
begin
  PageControl1.TabIndex := 0;

 { DataModule1.LeArqIni;
  // GERAL
  RadioFormas.ItemIndex   := DataModule1.sFormas;
  EdtLogoMarca.Text       := DataModule1.sLogoMarca;
  ChArquivos.Checked      := DataModule1.sSalvaArq;
  EdtArquivos.Text        := DataModule1.sPathArq;
  edtPathSchemas.Text     := DataModule1.sPathSchemas;
  cbSSLLib.ItemIndex      := DataModule1.sSSLLib;
  cbCryptLib.ItemIndex    := DataModule1.sCryptLib;
  cbHttpLib.ItemIndex     := DataModule1.sHttpLib;
  cbXmlSignLib.ItemIndex  := DataModule1.sXmlSignLib;
  // CERTIFICADO
  EdtCertificado.Text     := DataModule1.sCertificado;
  EdtSenha.Text           := DataModule1.sSenha;
  EdtSerial.Text          := DataModule1.sSerial;
  // emitente
  EdtRazao.Text           := DataModule1.sRazao;
  EdtFantasia.Text        := DataModule1.sFantasia;
  EdtCNPJ.Text            := DataModule1.sCNPJ;
  EdtIE.Text              := DataModule1.sIE;
  EdtEndereco.Text        := DataModule1.sEndereco;
  EdtNum.Text             := DataModule1.sNum;
  EdtBairro.Text          := DataModule1.sBairro;
  EdtCidade.Text          := DataModule1.sCidade;
  EdtCEP.Text             := DataModule1.sCEP;
  EdtUF.Text              := DataModule1.sUF;
  EdtCodMun.Text          := DataModule1.sCodMun;
  EdtTelefone.Text        := DataModule1.sFone;
  EdtEmailEmitente.Text   := DataModule1.sEmailEmitente;
  // WebService
  EdtUFWS.Text            := DataModule1.sUFWS;
  RadioAmbiente.ItemIndex := DataModule1.sAmbiente;
  EdtHost.Text            := DataModule1.sHost;
  EdtPorta.Text           := DataModule1.sPorta;
  EdtUsuario.Text         := DataModule1.sUsuario;
  EdtSenhaWS.Text         := DataModule1.sSenhaWS;
  // email
  EdtSMPTHost.Text        := DataModule1.sSMPTHost;
  EdtSMPTPorta.Text       := DataModule1.sSMTPPort;
  EdtSMPTUsuario.Text     := DataModule1.sSMTPUsu;
  EdtSMTPSenha.Text       := DataModule1.sSMTPPass;  }
end;

procedure TFm_ConfigNfe.SbCertificadoClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  DataModule1.CdConfigNfe.Edit;
  DbCertificado.Text := OpenDialog1.FileName;
end;

procedure TFm_ConfigNfe.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  DataModule1.CdConfigNfe.Edit;
  DataModule1.CdConfigNfeLOGOMARCA.AsString := OpenDialog1.FileName;
end;

procedure TFm_ConfigNfe.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  DataModule1.CdConfigNfe.Edit;
  DataModule1.CdConfigNfePATH_ARQUIVO.AsString := OpenDialog1.FileName;
end;

procedure TFm_ConfigNfe.SpeedButton3Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  DataModule1.CdConfigNfe.Edit;
  DataModule1.CdConfigNfePATHSCHEMAS.AsString := OpenDialog1.FileName;
end;

end.
