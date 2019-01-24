unit ReciboVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data_Module,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Vcl.Imaging.jpeg;

type
  TFrmReciboVenda = class(TForm)
    RlrRecibo: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLImage1: TRLImage;
    RLDBMemo1: TRLDBMemo;
    RLDBMemo2: TRLDBMemo;
    RLDBMemo3: TRLDBMemo;
    RLDBMemo4: TRLDBMemo;
    RLDBMemo5: TRLDBMemo;
    RLDBMemo7: TRLDBMemo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    DsEmp: TDataSource;
    RLDBMemo8: TRLDBMemo;
    RLLabel23: TRLLabel;
    RLDBMemo9: TRLDBMemo;
    DsRecibo: TDataSource;
    CdRecibo: TClientDataSet;
    DpRecibo: TDataSetProvider;
    SQLRecibo: TSQLQuery;
    RlaDatEmi: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel21: TRLLabel;
    RLDBText14: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBMemo6: TRLDBMemo;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLBand5: TRLBand;
    RLLabel20: TRLLabel;
    RLLabel22: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLBand6: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel24: TRLLabel;
    RLDBMemo10: TRLDBMemo;
    RLLabel25: TRLLabel;
    RLDBText15: TRLDBText;
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
    RLDBMemo11: TRLDBMemo;
    RLDBMemo12: TRLDBMemo;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    SQLReciboVEN_DESCONTO: TSingleField;
    SQLReciboVEN_ACRESCIMO: TSingleField;
    CdReciboVEN_DESCONTO: TSingleField;
    CdReciboVEN_ACRESCIMO: TSingleField;
    SQLReciboVEN_TOTALBRUTO: TFloatField;
    CdReciboVEN_TOTALBRUTO: TFloatField;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    procedure RlrReciboBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReciboVenda: TFrmReciboVenda;

implementation

uses PdvCaixa;

{$R *.dfm}

procedure TFrmReciboVenda.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RlaDatEmi.Caption := DateToStr(date);
end;

procedure TFrmReciboVenda.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
    DataModule1.CdEmp.Close;
    DataModule1.CdEmp.Open;
    RLImage1.Picture.LoadFromFile(DataModule1.CdEmpEMP_LOGO.AsString);
  except
    DataModule1.CdEmp.Edit;
    DataModule1.CdEmpEMP_LOGO.AsString := '';
    DataModule1.CdEmp.ApplyUpdates(0);
    DataModule1.CdEmp.Refresh;
  end;
end;

procedure TFrmReciboVenda.RlrReciboBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  CdRecibo.Close;
  CdRecibo.Open;

  DataModule1.CdEmp.Close;
  DataModule1.CdEmp.Open;
end;

end.
