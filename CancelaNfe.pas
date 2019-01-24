unit CancelaNfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Data.DB, Data.FMTBcd,
  System.Actions, Vcl.ActnList, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, pcnConversao;

type
  TFm_CancelaNfe = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Datai: TDateTimePicker;
    Dataf: TDateTimePicker;
    BitBtn1: TBitBtn;
    EdtProtocolo: TEdit;
    EdtJustifica: TEdit;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataNFe: TDataSource;
    QryNFe: TSQLQuery;
    DspNFe: TDataSetProvider;
    CdsNFe: TClientDataSet;
    ActionList1: TActionList;
    ActCancelar: TAction;
    ActFechar: TAction;
    QryNFeVEN_COD: TIntegerField;
    QryNFeCLI_NOME: TStringField;
    QryNFeVEN_DATA: TDateField;
    QryNFeVEN_VALOR_TOTAL: TSingleField;
    QryNFeVEN_CHAVE_NFE: TStringField;
    CdsNFeVEN_COD: TIntegerField;
    CdsNFeCLI_NOME: TStringField;
    CdsNFeVEN_DATA: TDateField;
    CdsNFeVEN_VALOR_TOTAL: TSingleField;
    CdsNFeVEN_CHAVE_NFE: TStringField;
    QryNFeCLI_CPF: TStringField;
    CdsNFeCLI_CPF: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure ActCancelarExecute(Sender: TObject);
    procedure ActFecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_CancelaNfe: TFm_CancelaNfe;

implementation

{$R *.dfm}

procedure TFm_CancelaNfe.ActCancelarExecute(Sender: TObject);
var
 Chave, CNPJ, Protocolo, Justificativa : string;
 idLote : Integer;
begin
  if CdsNFe.RecordCount = 0 then
  begin
    ShowMessage('É necessário seleciona NFe!');
    Abort;
  end;
  if (EdtProtocolo.Text = '') or (EdtJustifica.Text = '') then
  begin
    ShowMessage('É necessário informar o Protocolo e Justificativa!');
    Abort;
  end;

  Chave := CdsNFeVEN_CHAVE_NFE.AsString;
  idLote := CdsNFeVEN_COD.AsInteger;

  CNPJ := CdsNFeCLI_CPF.AsString;

  Protocolo:= EdtProtocolo.Text;

  Justificativa := EdtJustifica.Text;


  DataModule1.ACBrNFe1.EventoNFe.Evento.Clear;
  try
  with DataModule1.ACBrNFe1.EventoNFe.Evento.Add do
   begin
     infEvento.chNFe := Chave;
     infEvento.CNPJ   := CNPJ;
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := Justificativa;
     infEvento.detEvento.nProt := Protocolo;
   end;
  except
    ShowMessage('Erro ao cancelar NFe. Verifique!');
  end;

  DataModule1.ACBrNFe1.EnviarEvento(idLote);
end;

procedure TFm_CancelaNfe.ActFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFm_CancelaNfe.BitBtn1Click(Sender: TObject);
begin
  CdsNFe.Close;
  CdsNFe.Params.ParamByName('pDatai').AsDateTime := Datai.Date;
  CdsNFe.Params.ParamByName('pDataf').AsDateTime := Dataf.Date;
  CdsNFe.Open;
  DBGrid1.SetFocus;
end;

procedure TFm_CancelaNfe.FormCreate(Sender: TObject);
begin
Datai.Date := Date;
Dataf.Date := Date;
end;

procedure TFm_CancelaNfe.FormShow(Sender: TObject);
begin
  DataModule1.AtualizaConfigAcBr;
end;

end.
