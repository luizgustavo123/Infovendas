unit Rel_ContaPagaAvista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rel_Exemplo, RLReport, Data_Module,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient;

type
  TFm_RelContaPagaAvista = class(TFm_Rel_Exemplo)
    DsTabela: TDataSource;
    CdTabela: TClientDataSet;
    DpTabela: TDataSetProvider;
    SQLTabela: TSQLQuery;
    SQLTabelaCOP_COD: TIntegerField;
    SQLTabelaCOP_DESC: TStringField;
    SQLTabelaCOP_VALOR: TFloatField;
    SQLTabelaCOP_DATA_PAG: TDateField;
    SQLTabelaCOP_N_PARCELAS: TIntegerField;
    SQLTabelaCOP_FORN_FK: TIntegerField;
    SQLTabelaCOP_OBS: TStringField;
    SQLTabelaCOP_PARCELA: TStringField;
    SQLTabelaCOP_SITUACAO: TStringField;
    SQLTabelaCOP_VALOR_PARCELA: TFloatField;
    CdTabelaCOP_COD: TIntegerField;
    CdTabelaCOP_DESC: TStringField;
    CdTabelaCOP_VALOR: TFloatField;
    CdTabelaCOP_DATA_PAG: TDateField;
    CdTabelaCOP_N_PARCELAS: TIntegerField;
    CdTabelaCOP_FORN_FK: TIntegerField;
    CdTabelaCOP_OBS: TStringField;
    CdTabelaCOP_PARCELA: TStringField;
    CdTabelaCOP_SITUACAO: TStringField;
    CdTabelaCOP_VALOR_PARCELA: TFloatField;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLLabel3: TRLLabel;
    RLDBMemo4: TRLDBMemo;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBMemo5: TRLDBMemo;
    RLLabel10: TRLLabel;
    RLDBMemo7: TRLDBMemo;
    SQLTabelaCOP_DATA_PAG_EFETUADO: TDateField;
    CdTabelaCOP_DATA_PAG_EFETUADO: TDateField;
    RLLabel11: TRLLabel;
    RLDBResult2: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_RelContaPagaAvista: TFm_RelContaPagaAvista;

implementation

{$R *.dfm}

end.
