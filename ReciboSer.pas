unit ReciboSer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data_Module,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Vcl.Imaging.jpeg;

type
  TFrmReciboSer = class(TForm)
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
    RLDBText13: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel24: TRLLabel;
    RLDBMemo10: TRLDBMemo;
    RLLabel25: TRLLabel;
    RLDBText15: TRLDBText;
    RLDBMemo11: TRLDBMemo;
    RLDBMemo12: TRLDBMemo;
    SQLReciboCASE_SERVICOS_FK: TIntegerField;
    SQLReciboCASE_COD_SERVICO: TIntegerField;
    SQLReciboCASE_DATA: TDateField;
    SQLReciboCASE_SERVICO_VALOR: TFloatField;
    SQLReciboCASE_FORMA_PAGAMENTO: TStringField;
    SQLReciboCASE_STATUS: TSmallintField;
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
    SQLReciboCASE_SERVICO_DESC: TStringField;
    CdReciboCASE_SERVICOS_FK: TIntegerField;
    CdReciboCASE_COD_SERVICO: TIntegerField;
    CdReciboCASE_DATA: TDateField;
    CdReciboCASE_SERVICO_VALOR: TFloatField;
    CdReciboCASE_FORMA_PAGAMENTO: TStringField;
    CdReciboCASE_STATUS: TSmallintField;
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
    CdReciboCASE_SERVICO_DESC: TStringField;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLDBText11: TRLDBText;
    SQLReciboCASE_STATUSSERVICO: TStringField;
    CdReciboCASE_STATUSSERVICO: TStringField;
    SQLReciboCASE_OBS: TStringField;
    CdReciboCASE_OBS: TStringField;
    RLDBMemo9: TRLDBMemo;
    RLLabel1: TRLLabel;
    SQLReciboUSU_USUARIO: TStringField;
    CdReciboUSU_USUARIO: TStringField;
    RLLabel2: TRLLabel;
    RLDBText12: TRLDBText;
    RLLabel22: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    SQLReciboSERV_VALOR: TFloatField;
    CdReciboSERV_VALOR: TFloatField;
    CdReciboTOTAL_BRUTO: TAggregateField;
    RLDBResult2: TRLDBResult;
    RLLabel20: TRLLabel;
    RLLabel23: TRLLabel;
    SQLReciboCASE_DESCONTO: TSingleField;
    SQLReciboCASE_ACRESCIMO: TSingleField;
    CdReciboCASE_DESCONTO: TSingleField;
    CdReciboCASE_ACRESCIMO: TSingleField;
    procedure RlrReciboBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReciboSer: TFrmReciboSer;

implementation

uses PdvCaixa;

{$R *.dfm}

procedure TFrmReciboSer.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RlaDatEmi.Caption := DateToStr(date);
end;

procedure TFrmReciboSer.RLBand2BeforePrint(Sender: TObject;
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

procedure TFrmReciboSer.RlrReciboBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  CdRecibo.Close;
  CdRecibo.Open;

  DataModule1.CdEmp.Close;
  DataModule1.CdEmp.Open;
end;

end.
