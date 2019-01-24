unit Rel_ProCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rel_Exemplo, RLReport, Data_Module,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient;

type
  TFm_Rel_ProCad = class(TFm_Rel_Exemplo)
    DsProduto: TDataSource;
    CdProduto: TClientDataSet;
    DpProduto: TDataSetProvider;
    SQLProduto: TSQLQuery;
    RlCodPro: TRLDBText;
    RLDBText2: TRLDBText;
    RlQtd: TRLDBText;
    RlCusto: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RlForn: TRLDBMemo;
    RlValor: TRLDBText;
    RlVenci: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    SQLProdutoPRO_COD: TLargeintField;
    SQLProdutoPRO_DESCRICAO: TStringField;
    SQLProdutoPRO_FORNECEDOR_FK: TIntegerField;
    SQLProdutoPRO_VALOR_ENTRADA: TFloatField;
    SQLProdutoPRO_VALOR_SAIDA: TFloatField;
    SQLProdutoPRO_VENCI: TDateField;
    SQLProdutoPRO_QUANTIDADE: TIntegerField;
    SQLProdutoFORN_RAZAO_SOCIAL: TStringField;
    CdProdutoPRO_COD: TLargeintField;
    CdProdutoPRO_DESCRICAO: TStringField;
    CdProdutoPRO_FORNECEDOR_FK: TIntegerField;
    CdProdutoPRO_VALOR_ENTRADA: TFloatField;
    CdProdutoPRO_VALOR_SAIDA: TFloatField;
    CdProdutoPRO_VENCI: TDateField;
    CdProdutoPRO_QUANTIDADE: TIntegerField;
    CdProdutoFORN_RAZAO_SOCIAL: TStringField;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Rel_ProCad: TFm_Rel_ProCad;

implementation

{$R *.dfm}

procedure TFm_Rel_ProCad.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if CdProdutoPRO_QUANTIDADE.AsInteger < 1 then
  begin
    RlQtd.Font.Color := clRed;
  end
  else
  begin
    RlQtd.Font.Color := clBlack;
  end;

end;

end.
