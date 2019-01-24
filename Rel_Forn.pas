unit Rel_Forn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, RLReport,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient;

type
  TFrm_Rel_Forn = class(TForm)
    DsForn: TDataSource;
    CdForn: TClientDataSet;
    DpForn: TDataSetProvider;
    SQLForn: TSQLQuery;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RlCod: TRLDBText;
    RlRg: TRLDBText;
    RlNum: TRLDBText;
    RlTel: TRLDBText;
    RlmNomeCli: TRLDBMemo;
    RlmEnd: TRLDBMemo;
    RlCel: TRLDBText;
    RLBand3: TRLBand;
    RlUsuario: TRLLabel;
    RlData: TRLLabel;
    RLBand4: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    SQLFornFORN_NOME_FANTASIA: TStringField;
    SQLFornFORN_RAZAO_SOCIAL: TStringField;
    SQLFornFORN_CNPJ: TStringField;
    SQLFornFORN_ENDERECO: TStringField;
    SQLFornFORN_NUMERO: TIntegerField;
    SQLFornFORN_CEP: TIntegerField;
    SQLFornFORN_CIDADE: TStringField;
    SQLFornFORN_OBS: TStringField;
    SQLFornFORN_COD: TIntegerField;
    SQLFornFORN_TELEFONE: TStringField;
    SQLFornFORN_EMAIL: TStringField;
    SQLFornFORN_STATUS: TIntegerField;
    CdFornFORN_NOME_FANTASIA: TStringField;
    CdFornFORN_RAZAO_SOCIAL: TStringField;
    CdFornFORN_CNPJ: TStringField;
    CdFornFORN_ENDERECO: TStringField;
    CdFornFORN_NUMERO: TIntegerField;
    CdFornFORN_CEP: TIntegerField;
    CdFornFORN_CIDADE: TStringField;
    CdFornFORN_OBS: TStringField;
    CdFornFORN_COD: TIntegerField;
    CdFornFORN_TELEFONE: TStringField;
    CdFornFORN_EMAIL: TStringField;
    CdFornFORN_STATUS: TIntegerField;
    RLLabel4: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Rel_Forn: TFrm_Rel_Forn;

implementation

{$R *.dfm}

uses Data_Module;

procedure TFrm_Rel_Forn.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand2.Color = ClSilver then
    RLBand2.Color := clWhite
  else
    RLBand2.Color := ClSilver;
end;

procedure TFrm_Rel_Forn.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RlUsuario.Caption := 'Usuário: ' + DataModule1.CdUsuarioUSU_USUARIO.AsString;
  RlData.Caption := DateToStr(date);
end;

end.
