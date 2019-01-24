unit Rel_Servicos_Realizados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Rel_Exemplo, Data.FMTBcd,
  Vcl.StdCtrls, RLReport, RLBarcode, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Data.SqlExpr;

type
  TFm_Rel_Servicos_Realizados = class(TFm_Rel_Exemplo)
    SQLSer: TSQLQuery;
    DsSer: TDataSource;
    CdSer: TClientDataSet;
    DpSer: TDataSetProvider;
    SQLSerCASE_COD: TIntegerField;
    SQLSerCASE_COD_SERVICO: TIntegerField;
    SQLSerUSU_USUARIO: TStringField;
    SQLSerSERV_DESCRICAO: TStringField;
    SQLSerSERV_TEMPO: TTimeField;
    SQLSerVALOR_COMISSAO: TFloatField;
    SQLSerUSU_COMISSAO: TFloatField;
    SQLSerSERV_VALOR: TFloatField;
    CdSerCASE_COD: TIntegerField;
    CdSerCASE_COD_SERVICO: TIntegerField;
    CdSerUSU_USUARIO: TStringField;
    CdSerSERV_DESCRICAO: TStringField;
    CdSerSERV_TEMPO: TTimeField;
    CdSerVALOR_COMISSAO: TFloatField;
    CdSerUSU_COMISSAO: TFloatField;
    CdSerSERV_VALOR: TFloatField;
    SQLSerCASE_DATA: TDateField;
    CdSerCASE_DATA: TDateField;
    RLGroup1: TRLGroup;
    RLBand5: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLBand6: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDBResult1: TRLDBResult;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLLabel5: TRLLabel;
    RLDBResult4: TRLDBResult;
    SQLSerCLI_NOME: TStringField;
    CdSerCLI_NOME: TStringField;
    SQLSerCASE_LUCRO: TFloatField;
    CdSerCASE_LUCRO: TFloatField;
    SQLSerCASE_STATUS: TSmallintField;
    SQLSerCASE_FORMA_PAGAMENTO: TStringField;
    CdSerCASE_STATUS: TSmallintField;
    CdSerCASE_FORMA_PAGAMENTO: TStringField;
    RLLabel8: TRLLabel;
    RLDBResult5: TRLDBResult;
    SQLSerCASE_STATUSSERVICO: TStringField;
    CdSerCASE_STATUSSERVICO: TStringField;
    RLBand8: TRLBand;
    RLDBText7: TRLDBText;
    RLLabel15: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBMemo2: TRLDBMemo;
    RLDBText2: TRLDBText;
    RlaPagamento: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel22: TRLLabel;
    SQLSerCASE_DESCONTO: TSingleField;
    SQLSerCASE_ACRESCIMO: TSingleField;
    CdSerCASE_DESCONTO: TSingleField;
    CdSerCASE_ACRESCIMO: TSingleField;
    SQLSerCASE_SERVICO_VALOR: TFloatField;
    CdSerCASE_SERVICO_VALOR: TFloatField;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    CdSerTOTAL_LIQUIDO: TAggregateField;
    RLDBResult6: TRLDBResult;
    RLLabel30: TRLLabel;
    RLLabel29: TRLLabel;
    RlData1: TRLLabel;
    RlUsuario1: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Rel_Servicos_Realizados: TFm_Rel_Servicos_Realizados;

implementation

{$R *.dfm}

procedure TFm_Rel_Servicos_Realizados.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if CdSerCASE_STATUS.AsInteger = 1 then
  begin
    RlaPagamento.Caption := 'À vista';
  end
  else if CdSerCASE_STATUS.AsInteger = 2 then
  begin
    RlaPagamento.Caption := 'A prazo';
  end;

  RlUsuario1.Caption := 'Usuário: ' + DataModule1.CdUsuarioUSU_USUARIO.AsString;
  RlData1.Caption := DateToStr(date);

end;

end.
