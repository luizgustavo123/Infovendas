unit Rel_Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Rel_Exemplo, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, RLReport,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, RLRichFilter, RLHTMLFilter, RLXLSFilter,
  RLXLSXFilter, RLFilters, RLPDFFilter;

type
  TFm_Rel_Vendas = class(TFm_Rel_Exemplo)
    DsVenda: TDataSource;
    CdVenda: TClientDataSet;
    DpVenda: TDataSetProvider;
    SQLVenda: TSQLQuery;
    SQLVendaCLI_NOME: TStringField;
    SQLVendaPRO_DESCRICAO: TStringField;
    SQLVendaITV_PRODUTOS_FK: TLargeintField;
    SQLVendaITV_VENDAS_FK: TIntegerField;
    SQLVendaITV_QTD: TIntegerField;
    SQLVendaPRO_VALOR_SAIDA: TFloatField;
    SQLVendaITV_LUCRO_ITEN: TFloatField;
    SQLVendaVEN_STATUS: TSmallintField;
    SQLVendaVEN_COD: TIntegerField;
    SQLVendaVEN_DATA: TDateField;
    SQLVendaVEN_VALOR_TOTAL: TFloatField;
    CdVendaCLI_NOME: TStringField;
    CdVendaPRO_DESCRICAO: TStringField;
    CdVendaITV_PRODUTOS_FK: TLargeintField;
    CdVendaITV_VENDAS_FK: TIntegerField;
    CdVendaITV_QTD: TIntegerField;
    CdVendaPRO_VALOR_SAIDA: TFloatField;
    CdVendaITV_LUCRO_ITEN: TFloatField;
    CdVendaVEN_STATUS: TSmallintField;
    CdVendaVEN_COD: TIntegerField;
    CdVendaVEN_DATA: TDateField;
    CdVendaVEN_VALOR_TOTAL: TFloatField;
    SQLVendaITV_SUBTOTAL: TFloatField;
    CdVendaITV_SUBTOTAL: TFloatField;
    RLLabel9: TRLLabel;
    SQLVendaVEN_FORMA_PAGAMENTO: TStringField;
    CdVendaVEN_FORMA_PAGAMENTO: TStringField;
    RLGroup2: TRLGroup;
    RLBand6: TRLBand;
    RLDBMemo1: TRLDBMemo;
    RLDBText3: TRLDBText;
    RLDBMemo3: TRLDBMemo;
    RLBand7: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBMemo2: TRLDBMemo;
    RLLabel10: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand5: TRLBand;
    RLDBResult3: TRLDBResult;
    RLLabel7: TRLLabel;
    RlbStatus: TRLLabel;
    RLLabel2: TRLLabel;
    SQLVendaUSU_USUARIO: TStringField;
    SQLVendaUSU_COMISSAO: TFloatField;
    CdVendaUSU_USUARIO: TStringField;
    CdVendaUSU_COMISSAO: TFloatField;
    SQLVendaVALOR_COMISSAO: TFloatField;
    CdVendaVALOR_COMISSAO: TFloatField;
    RLDBText4: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBResult5: TRLDBResult;
    SQLVendaVEN_DESCONTO: TSingleField;
    SQLVendaVEN_ACRESCIMO: TSingleField;
    CdVendaVEN_DESCONTO: TSingleField;
    CdVendaVEN_ACRESCIMO: TSingleField;
    RLLabel11: TRLLabel;
    RLDBResult6: TRLDBResult;
    RLLabel16: TRLLabel;
    RLDBResult7: TRLDBResult;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    CdVendaTOTAL: TAggregateField;
    RllTotal: TRLLabel;
    RLLabel19: TRLLabel;
    RLDinheiro: TRLLabel;
    RLLabel21: TRLLabel;
    RllCartao: TRLLabel;
    RllCheque: TRLLabel;
    RLLabel24: TRLLabel;
    procedure RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    Total, Soma, TotalDinheiro, SomaDinheiro, TotalCartao, SomaCartao, TotalCheque, SomaCheque : Double;
  public
    { Public declarations }
  end;

var
  Fm_Rel_Vendas: TFm_Rel_Vendas;

implementation

{$R *.dfm}

procedure TFm_Rel_Vendas.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  RllTotal.Caption := FormatFloat('#,,0.00',(Soma));
  RLDinheiro.Caption := FormatFloat('#,,0.00',(SomaDinheiro));
  RllCartao.Caption := FormatFloat('#,,0.00',(SomaCartao));
  RllCheque.Caption := FormatFloat('#,,0.00',(SomaCheque));
end;

procedure TFm_Rel_Vendas.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if CdVendaVEN_STATUS.AsInteger = 1 then
  begin
    RlbStatus.Caption := 'Venda á vista';
  end
  else
  begin
    RlbStatus.Caption := 'Venda a prazo';
  end;
end;

procedure TFm_Rel_Vendas.RLGroup1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
 { if RLGroup1.Color = ClSilver then
    RLGroup1.Color := clWhite
  else
    RLGroup1.Color := ClSilver;              }
end;

procedure TFm_Rel_Vendas.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  //TOTAL
  CdVenda.First;
  while not CdVenda.Eof do
  begin
    Total := CdVendaITV_SUBTOTAL.AsFloat - (CdVendaITV_SUBTOTAL.AsFloat * CdVendaVEN_DESCONTO.AsFloat / 100);
    Total := Total + (Total * CdVendaVEN_ACRESCIMO.AsFloat / 100);
    Soma := Soma + Total;
    CdVenda.Next;
  end;

  //DINHEIRO
  CdVenda.First;
  while not CdVenda.Eof do
  begin
    if CdVendaVEN_FORMA_PAGAMENTO.AsString = 'Dinheiro' then
    begin
      TotalDinheiro := CdVendaITV_SUBTOTAL.AsFloat - (CdVendaITV_SUBTOTAL.AsFloat * CdVendaVEN_DESCONTO.AsFloat / 100);
      TotalDinheiro := TotalDinheiro + (TotalDinheiro * CdVendaVEN_ACRESCIMO.AsFloat / 100);
      SomaDinheiro := SomaDinheiro + TotalDinheiro;
    end;
    CdVenda.Next;
  end;

  //Cartão
  CdVenda.First;
  while not CdVenda.Eof do
  begin
    if CdVendaVEN_FORMA_PAGAMENTO.AsString = 'Cartão' then
    begin
      TotalCartao := CdVendaITV_SUBTOTAL.AsFloat - (CdVendaITV_SUBTOTAL.AsFloat * CdVendaVEN_DESCONTO.AsFloat / 100);
      TotalCartao := TotalCartao + (TotalCartao * CdVendaVEN_ACRESCIMO.AsFloat / 100);
      SomaCartao := SomaCartao + TotalCartao;
    end;
    CdVenda.Next;
  end;

  //Cheque
  CdVenda.First;
  while not CdVenda.Eof do
  begin
    if CdVendaVEN_FORMA_PAGAMENTO.AsString = 'Cheque' then
    begin
      TotalCheque := CdVendaITV_SUBTOTAL.AsFloat - (CdVendaITV_SUBTOTAL.AsFloat * CdVendaVEN_DESCONTO.AsFloat / 100);
      TotalCheque := TotalCheque + (TotalCheque * CdVendaVEN_ACRESCIMO.AsFloat / 100);
      SomaCheque := SomaCheque + TotalCheque;
    end;
    CdVenda.Next;
  end;

end;

end.
