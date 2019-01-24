unit Rel_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Rel_Exemplo, Data.FMTBcd,
  RLReport, Data.DB, Datasnap.Provider, Datasnap.DBClient, Data.SqlExpr;

type
  TFm_Rel_Clientes = class(TFm_Rel_Exemplo)
    RlCod: TRLDBText;
    RlRg: TRLDBText;
    RlCpf: TRLDBText;
    RlNum: TRLDBText;
    RlTel: TRLDBText;
    SQLCliente: TSQLQuery;
    DsCliente: TDataSource;
    CdCliente: TClientDataSet;
    DpCliente: TDataSetProvider;
    RlmNomeCli: TRLDBMemo;
    RlmEnd: TRLDBMemo;
    RlCel: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    SQLClienteCLI_COD: TIntegerField;
    SQLClienteCLI_NOME: TStringField;
    SQLClienteCLI_ENDERECO: TStringField;
    SQLClienteCLI_NUMERO: TStringField;
    SQLClienteCLI_TELEFONE: TStringField;
    SQLClienteCLI_CELULAR: TStringField;
    SQLClienteCLI_RG: TStringField;
    SQLClienteCLI_CPF: TStringField;
    CdClienteCLI_COD: TIntegerField;
    CdClienteCLI_NOME: TStringField;
    CdClienteCLI_ENDERECO: TStringField;
    CdClienteCLI_NUMERO: TStringField;
    CdClienteCLI_TELEFONE: TStringField;
    CdClienteCLI_CELULAR: TStringField;
    CdClienteCLI_RG: TStringField;
    CdClienteCLI_CPF: TStringField;
    RLLabel9: TRLLabel;
    SQLClienteCLI_CIDADE: TStringField;
    CdClienteCLI_CIDADE: TStringField;
    RLLabel10: TRLLabel;
    RLDBMemo1: TRLDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Rel_Clientes: TFm_Rel_Clientes;

implementation

{$R *.dfm}

end.
