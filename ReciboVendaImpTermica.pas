unit ReciboVendaImpTermica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, RLReport, Data.SqlExpr,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, ACBrECF, ACBrBase,
  ACBrECFVirtual, ACBrECFVirtualBuffer, ACBrECFVirtualPrinter,
  ACBrECFVirtualNaoFiscal;

type
  TFrmReciboVendaImpTermica = class(TForm)
    RlrRecibo: TRLReport;
    RLBand2: TRLBand;
    RLLabel23: TRLLabel;
    RLDBMemo9: TRLDBMemo;
    RLBand1: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RlaDatEmi: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel21: TRLLabel;
    RLDBText14: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBMemo6: TRLDBMemo;
    RLLabel25: TRLLabel;
    RLDBText15: TRLDBText;
    RLDBMemo11: TRLDBMemo;
    RLDBMemo12: TRLDBMemo;
    RLBand3: TRLBand;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    DsRecibo: TDataSource;
    CdRecibo: TClientDataSet;
    CdReciboVEN_COD: TIntegerField;
    CdReciboVEN_DATA: TDateField;
    CdReciboVEN_VALOR_TOTAL: TFloatField;
    CdReciboVEN_FORMA_PAGAMENTO: TStringField;
    CdReciboVEN_STATUS: TSmallintField;
    CdReciboCLI_COD: TIntegerField;
    CdReciboCLI_NOME: TStringField;
    CdReciboCLI_ENDERECO: TStringField;
    CdReciboCLI_NUMERO: TStringField;
    CdReciboCLI_CIDADE: TStringField;
    CdReciboCLI_CPF: TStringField;
    CdReciboCLI_CNPJ: TStringField;
    CdReciboCLI_IE: TStringField;
    CdReciboCLI_TELEFONE: TStringField;
    CdReciboCLI_CELULAR: TStringField;
    CdReciboITV_PRODUTOS_FK: TLargeintField;
    CdReciboITV_PRO_DESCRICAO: TStringField;
    CdReciboITV_QTD: TIntegerField;
    CdReciboITV_DESCONTO: TFloatField;
    CdReciboITV_SUBTOTAL: TFloatField;
    CdReciboPRO_VALOR_SAIDA: TFloatField;
    CdReciboVEN_DESCONTO: TSingleField;
    CdReciboVEN_ACRESCIMO: TSingleField;
    CdReciboVEN_TOTALBRUTO: TFloatField;
    DpRecibo: TDataSetProvider;
    SQLRecibo: TSQLQuery;
    SQLReciboVEN_COD: TIntegerField;
    SQLReciboVEN_DATA: TDateField;
    SQLReciboVEN_VALOR_TOTAL: TFloatField;
    SQLReciboVEN_FORMA_PAGAMENTO: TStringField;
    SQLReciboVEN_STATUS: TSmallintField;
    SQLReciboCLI_COD: TIntegerField;
    SQLReciboCLI_NOME: TStringField;
    SQLReciboCLI_ENDERECO: TStringField;
    SQLReciboCLI_NUMERO: TStringField;
    SQLReciboCLI_CIDADE: TStringField;
    SQLReciboCLI_CPF: TStringField;
    SQLReciboCLI_CNPJ: TStringField;
    SQLReciboCLI_IE: TStringField;
    SQLReciboCLI_TELEFONE: TStringField;
    SQLReciboCLI_CELULAR: TStringField;
    SQLReciboITV_PRODUTOS_FK: TLargeintField;
    SQLReciboITV_PRO_DESCRICAO: TStringField;
    SQLReciboITV_QTD: TIntegerField;
    SQLReciboITV_DESCONTO: TFloatField;
    SQLReciboITV_SUBTOTAL: TFloatField;
    SQLReciboPRO_VALOR_SAIDA: TFloatField;
    SQLReciboVEN_DESCONTO: TSingleField;
    SQLReciboVEN_ACRESCIMO: TSingleField;
    SQLReciboVEN_TOTALBRUTO: TFloatField;
    DsEmp: TDataSource;
    RLDBText16: TRLDBText;
    RLGroup1: TRLGroup;
    RLBand6: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLBand7: TRLBand;
    RLLabel1: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLBand8: TRLBand;
    RLLabel24: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel22: TRLLabel;
    procedure RlrReciboBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReciboVendaImpTermica: TFrmReciboVendaImpTermica;

implementation

{$R *.dfm}

uses Data_Module;

procedure TFrmReciboVendaImpTermica.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RlaDatEmi.Caption := DateToStr(date);
end;

procedure TFrmReciboVendaImpTermica.RlrReciboBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  CdRecibo.Close;
  CdRecibo.Open;

  DataModule1.CdEmp.Close;
  DataModule1.CdEmp.Open;
end;

end.
