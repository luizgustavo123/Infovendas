unit RelContaRecebe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rel_Exemplo, RLReport, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls;

type
  TFm_RelContaRecebe = class(TFm_Rel_Exemplo)
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLDBMemo2: TRLDBMemo;
    RLDBMemo3: TRLDBMemo;
    RLDBMemo5: TRLDBMemo;
    RLDBMemo6: TRLDBMemo;
    DsTabela: TDataSource;
    CdTabela: TClientDataSet;
    DpTabela: TDataSetProvider;
    SQLTabela: TSQLQuery;
    CdTabelaCONR_COD: TIntegerField;
    CdTabelaCLI_NOME: TStringField;
    CdTabelaCONR_PARCELA: TStringField;
    CdTabelaCONR_VALOR_PARCELA: TFloatField;
    CdTabelaCONR_DATA_RECEBER: TDateField;
    CdTabelaCONR_SITUACAO: TStringField;
    SQLTabelaCONR_COD: TIntegerField;
    SQLTabelaCLI_NOME: TStringField;
    SQLTabelaCONR_PARCELA: TStringField;
    SQLTabelaCONR_VALOR_PARCELA: TFloatField;
    SQLTabelaCONR_DATA_RECEBER: TDateField;
    SQLTabelaCONR_SITUACAO: TStringField;
    RLDBResult1: TRLDBResult;
    RLLabel9: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBMemo4: TRLDBMemo;
    SQLTabelaCONR_DATA_PAGO: TDateField;
    CdTabelaCONR_DATA_PAGO: TDateField;
    RLLabel10: TRLLabel;
    LbaStatus: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_RelContaRecebe: TFm_RelContaRecebe;

implementation

{$R *.dfm}

procedure TFm_RelContaRecebe.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if (CdTabelaCONR_DATA_RECEBER.AsDateTime < Date) AND (CdTabelaCONR_SITUACAO.AsString = 'A receber') then
  begin
    LbaStatus.Caption := 'Vencida'
  end
  else
  if (CdTabelaCONR_DATA_RECEBER.AsDateTime > Date) AND (CdTabelaCONR_SITUACAO.AsString = 'A receber') then
  begin
    LbaStatus.Caption := 'A  vencer'
  end
  else
  begin
    LbaStatus.Caption := '  OK'
  end;

end;

end.
