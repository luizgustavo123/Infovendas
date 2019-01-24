unit BaixaContaPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data_Module, Data.DB, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask;

type
  TFrmBaixaContaPagar = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    SQLTemp: TSQLQuery;
    CDtabelaCOP_COD: TIntegerField;
    CDtabelaCOP_DESC: TStringField;
    CDtabelaCOP_VALOR: TFloatField;
    CDtabelaCOP_DATA_PAG: TDateField;
    CDtabelaCOP_PARCELA: TStringField;
    CDtabelaFORN_NOME_FANTASIA: TStringField;
    CDtabelaCOP_VALOR_PARCELA: TFloatField;
    SQLtabelaCOP_COD: TIntegerField;
    SQLtabelaCOP_DESC: TStringField;
    SQLtabelaCOP_VALOR: TFloatField;
    SQLtabelaCOP_DATA_PAG: TDateField;
    SQLtabelaCOP_PARCELA: TStringField;
    SQLtabelaFORN_NOME_FANTASIA: TStringField;
    SQLtabelaCOP_VALOR_PARCELA: TFloatField;
    Image6: TImage;
    GroupBox1: TGroupBox;
    Button1: TButton;
    DtpDataPag: TDateTimePicker;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    EdtCod: TEdit;
    Label7: TLabel;
    Label6: TLabel;
    EdtDesc: TEdit;
    MdtDataPagaIni: TMaskEdit;
    Label8: TLabel;
    ButPesqu: TButton;
    MdtDataPagaFim: TMaskEdit;
    Label2: TLabel;
    SQLtabelaCOP_N_PARCELAS: TIntegerField;
    SQLtabelaCOP_FORN_FK: TIntegerField;
    SQLtabelaCOP_OBS: TStringField;
    SQLtabelaCOP_SITUACAO: TStringField;
    SQLtabelaCOP_DATA_PAG_EFETUADO: TDateField;
    SQLtabelaFORN_RAZAO_SOCIAL: TStringField;
    SQLtabelaFORN_CNPJ: TStringField;
    SQLtabelaFORN_ENDERECO: TStringField;
    SQLtabelaFORN_NUMERO: TIntegerField;
    SQLtabelaFORN_CEP: TIntegerField;
    SQLtabelaFORN_CIDADE: TStringField;
    SQLtabelaFORN_OBS: TStringField;
    SQLtabelaFORN_COD: TIntegerField;
    SQLtabelaFORN_TELEFONE: TStringField;
    SQLtabelaFORN_EMAIL: TStringField;
    SQLtabelaFORN_STATUS: TIntegerField;
    CDtabelaCOP_N_PARCELAS: TIntegerField;
    CDtabelaCOP_FORN_FK: TIntegerField;
    CDtabelaCOP_OBS: TStringField;
    CDtabelaCOP_SITUACAO: TStringField;
    CDtabelaCOP_DATA_PAG_EFETUADO: TDateField;
    CDtabelaFORN_RAZAO_SOCIAL: TStringField;
    CDtabelaFORN_CNPJ: TStringField;
    CDtabelaFORN_ENDERECO: TStringField;
    CDtabelaFORN_NUMERO: TIntegerField;
    CDtabelaFORN_CEP: TIntegerField;
    CDtabelaFORN_CIDADE: TStringField;
    CDtabelaFORN_OBS: TStringField;
    CDtabelaFORN_COD: TIntegerField;
    CDtabelaFORN_TELEFONE: TStringField;
    CDtabelaFORN_EMAIL: TStringField;
    CDtabelaFORN_STATUS: TIntegerField;
    EdtForn: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButPesquClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaixaContaPagar: TFrmBaixaContaPagar;

implementation

{$R *.dfm}

procedure TFrmBaixaContaPagar.ButPesquClick(Sender: TObject);
begin
  CdTabela.Close;

  SQLTabela.SQL.Text := 'SELECT * FROM CONTAS_PAGAR LEFT JOIN fornecedores ON FORN_COD = COP_FORN_FK WHERE COP_SITUACAO = ' + '''Não Pago'' ';

  if EdtCod.Text <> '' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_COD = ' + EdtCod.Text;
  end;

  if EdtDesc.Text <> '' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_DESC LIKE ' + '''' + '%' + EdtDesc.Text + '%' + '''';
  end;

  if EdtForn.Text <> '' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND FORN_NOME_FANTASIA LIKE ' + '''' + '%' + EdtForn.Text + '%' + '''';
  end;

  if (MdtDataPagaIni.Text <> '  /  /    ') and (MdtDataPagaFim.Text <> '  /  /    ') then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_DATA_PAG BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
  end;
  if MdtDataPagaIni.Text <> '  /  /    ' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_DATA_PAG >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text)));
  end;
  if MdtDataPagaFim.Text <> '  /  /    ' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_DATA_PAG <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
  end;




  CdTabela.Open;
end;

procedure TFrmBaixaContaPagar.Button1Click(Sender: TObject);
begin
   if MessageDlg('Deseja Realmente dar Baixa nesta Conta ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
   begin
     SQLTemp.SQL.Text := 'UPDATE CONTAS_PAGAR SET COP_DATA_PAG_EFETUADO = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DtpDataPag.Date)) + ', COP_SITUACAO = ' + '''' + 'Pago' + '''' + 'WHERE COP_COD = ' + CDtabelaCOP_COD.AsString;
     SQLTemp.ExecSQL;

     CDtabela.Close;
     CDtabela.Open;
   end;
end;

procedure TFrmBaixaContaPagar.FormCreate(Sender: TObject);
begin
  CDtabela.Close;
  CDtabela.Open;

  DtpDataPag.Date := Date;
end;

end.
