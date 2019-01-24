unit RelFluxoCaixaSer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, RLReport, Data.SqlExpr,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, Data_Module;

type
  TFrmRelFluxoCaixaSer = class(TForm)
    DsVenda: TDataSource;
    CdVenda: TClientDataSet;
    DpVenda: TDataSetProvider;
    SQLVenda: TSQLQuery;
    RlrFluxoCaixa: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand4: TRLBand;
    SQLVendaDESC: TStringField;
    SQLVendaVEN_DATA: TDateField;
    SQLVendaVEN_COD: TIntegerField;
    SQLVendaVEN_VALOR_TOTAL: TFloatField;
    SQLVendaMyColumn5: TFloatField;
    SQLVendaVEN_LUCRO_TOTAL: TFloatField;
    CdVendaDESC: TStringField;
    CdVendaVEN_DATA: TDateField;
    CdVendaVEN_COD: TIntegerField;
    CdVendaVEN_VALOR_TOTAL: TFloatField;
    CdVendaMyColumn5: TFloatField;
    CdVendaVEN_LUCRO_TOTAL: TFloatField;
    SQLContaPagParcela: TSQLQuery;
    SQLContasPaga: TSQLQuery;
    SQLContaRecebida: TSQLQuery;
    SQLVendaavista: TSQLQuery;
    SQLContasPagaSUM: TFloatField;
    SQLContaPagParcelaSUM: TFloatField;
    SQLVendaavistaSUM: TFloatField;
    SQLContaRecebidaSUM: TFloatField;
    SQLContaParcelaApagar: TSQLQuery;
    FloatField1: TFloatField;
    SQLContaAreceber: TSQLQuery;
    FloatField2: TFloatField;
    DsContasPaga: TDataSource;
    CdContasPaga: TClientDataSet;
    DpContasPaga: TDataSetProvider;
    DsVendaavista: TDataSource;
    CdVendaavista: TClientDataSet;
    DpVendaavista: TDataSetProvider;
    DsContaPagParcela: TDataSource;
    CdContaPagParcela: TClientDataSet;
    DpContaPagParcela: TDataSetProvider;
    DsContaRecebida: TDataSource;
    CdContaRecebida: TClientDataSet;
    DpContaRecebida: TDataSetProvider;
    DsContaAreceber: TDataSource;
    CdContaAreceber: TClientDataSet;
    DpContaAreceber: TDataSetProvider;
    DsContaParcelaApagar: TDataSource;
    CdContaParcelaApagar: TClientDataSet;
    DpContaParcelaApagar: TDataSetProvider;
    CdContasPagaSUM: TFloatField;
    CdVendaavistaSUM: TFloatField;
    CdContaPagParcelaSUM: TFloatField;
    CdContaRecebidaSUM: TFloatField;
    CdContaAreceberSUM: TFloatField;
    CdContaParcelaApagarSUM: TFloatField;
    RLLabel18: TRLLabel;
    RLDBText12: TRLDBText;
    SQLVendaSITU: TStringField;
    CdVendaSITU: TStringField;
    DsLucroBruto: TDataSource;
    CdLucroBruto: TClientDataSet;
    DpLucroBruto: TDataSetProvider;
    SQLLucroBruto: TSQLQuery;
    SQLLucroBrutoLUCRO: TFloatField;
    CdLucroBrutoLUCRO: TFloatField;
    DsLucroBrutoAreceber: TDataSource;
    CdLucroBrutoAreceber: TClientDataSet;
    DpLucroBrutoAreceber: TDataSetProvider;
    SQLLucroBrutoAreceber: TSQLQuery;
    SQLLucroBrutoAreceberLUCROARECEBER: TFloatField;
    CdLucroBrutoAreceberLUCROARECEBER: TFloatField;
    DsLucroBrutoAvista: TDataSource;
    CdLucroBrutoAvista: TClientDataSet;
    DpLucroBrutoAvista: TDataSetProvider;
    SQLLucroBrutoAvista: TSQLQuery;
    SQLLucroBrutoAvistaLUCROAVISTA: TFloatField;
    CdLucroBrutoAvistaLUCROAVISTA: TFloatField;
    DsLucroBrutoSer: TDataSource;
    CdLucroBrutoSer: TClientDataSet;
    DpLucroBrutoSer: TDataSetProvider;
    SQLLucroBrutoSer: TSQLQuery;
    CdLucroBrutoSerLUCROSER2: TAggregateField;
    SQLLucroBrutoSerCASE_COD_SERVICO: TIntegerField;
    SQLLucroBrutoSerCASE_LUCRO: TFloatField;
    CdLucroBrutoSerCASE_COD_SERVICO: TIntegerField;
    CdLucroBrutoSerCASE_LUCRO: TFloatField;
    SQLServTotal: TSQLQuery;
    DpServTotal: TDataSetProvider;
    CdServTotal: TClientDataSet;
    DsServTotal: TDataSource;
    SQLServTotalSUM: TFloatField;
    CdServTotalSUM: TFloatField;
    RLLabel21: TRLLabel;
    RLLabel20: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel2: TRLPanel;
    RLLabel15: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText9: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel16: TRLLabel;
    RLDBText14: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel8: TRLLabel;
    RLLabel19: TRLLabel;
    RllLucroBruto: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel9: TRLLabel;
    RllLucro: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RllLucroAreceber: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel17: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel14: TRLLabel;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFluxoCaixaSer: TFrmRelFluxoCaixaSer;

implementation

{$R *.dfm}

procedure TFrmRelFluxoCaixaSer.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if CdVendaMyColumn5.AsFloat <> 0  then
  begin
    CdVenda.Edit;
    CdVendaVEN_VALOR_TOTAL.AsFloat := 0;
  end;

  if CdVendaMyColumn5.AsString = '' then
  begin
    CdVenda.Edit;
    CdVendaMyColumn5.AsFloat := 0;
  end;

end;

procedure TFrmRelFluxoCaixaSer.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
  var LucroBruto : Double;
begin
  if CdLucroBrutoSerLUCROSER2.Value <> NULL then
  begin
    RllLucroBruto.Caption := FormatFloat('#,,0.00',CdLucroBrutoLUCRO.AsFloat + CdLucroBrutoAvistaLUCROAVISTA.AsFloat + CdLucroBrutoSerLUCROSER2.Value);
    LucroBruto := (CdLucroBrutoLUCRO.AsFloat + CdLucroBrutoAvistaLUCROAVISTA.AsFloat + CdLucroBrutoSerLUCROSER2.Value);
  end
  else
  begin
    RllLucroBruto.Caption := FormatFloat('#,,0.00',CdLucroBrutoLUCRO.AsFloat + CdLucroBrutoAvistaLUCROAVISTA.AsFloat);
    LucroBruto := (CdLucroBrutoLUCRO.AsFloat + CdLucroBrutoAvistaLUCROAVISTA.AsFloat);
  end;



  RllLucro.Caption := FormatFloat('#,,0.00', LucroBruto - CdContasPagaSUM.AsFloat - CdContaPagParcelaSUM.AsFloat);

  RllLucroAreceber.Caption := FormatFloat('#,,0.00',CdLucroBrutoAreceberLUCROARECEBER.AsFloat - CdContaParcelaApagarSUM.AsFloat);
end;

end.
