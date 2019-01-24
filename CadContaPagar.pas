unit CadContaPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data_Module, PesquisaFornecedor, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.Imaging.pngimage;

type
  TFrm_CadContaPagar = class(TForm)
    z: TImage;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
    DbCodForn: TDBEdit;
    DtpDataPaga: TDateTimePicker;
    DbeParcelas: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    BtnPesquisaPro: TSpeedButton;
    Image2: TImage;
    Button5: TButton;
    Button1: TButton;
    BtoExcluir: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    EdtCod: TEdit;
    EdtDesc: TEdit;
    ButPesqu: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
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
    CdTabelaCOP_COD: TIntegerField;
    CdTabelaCOP_DESC: TStringField;
    CdTabelaCOP_VALOR: TFloatField;
    CdTabelaCOP_DATA_PAG: TDateField;
    CdTabelaCOP_N_PARCELAS: TIntegerField;
    CdTabelaCOP_FORN_FK: TIntegerField;
    CdTabelaCOP_OBS: TStringField;
    CdTabelaCOP_PARCELA: TStringField;
    MdtDataPaga: TMaskEdit;
    SQLTabelaCOP_SITUACAO: TStringField;
    CdTabelaCOP_SITUACAO: TStringField;
    SQLTabelaCOP_VALOR_PARCELA: TFloatField;
    CdTabelaCOP_VALOR_PARCELA: TFloatField;
    Image6: TImage;
    procedure BtnPesquisaProClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtoExcluirClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CdTabelaAfterPost(DataSet: TDataSet);
    procedure CdTabelaAfterDelete(DataSet: TDataSet);
    procedure CdTabelaBeforePost(DataSet: TDataSet);
    procedure DsTabelaDataChange(Sender: TObject; Field: TField);
    procedure ButPesquClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function TrocaVirgPPto(Valor: string): String;
  end;

var
  Frm_CadContaPagar: TFrm_CadContaPagar;

implementation

{$R *.dfm}

procedure TFrm_CadContaPagar.BtnPesquisaProClick(Sender: TObject);
begin
  try
    Fm_PesquisaFornecedor := TFm_PesquisaFornecedor.Create(self);
    Fm_PesquisaFornecedor.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaFornecedor);
    DbCodForn.SetFocus;
  end;
end;

procedure TFrm_CadContaPagar.ButPesquClick(Sender: TObject);
begin
  CdTabela.Close;

  SQLTabela.SQL.Text := 'SELECT * FROM CONTAS_PAGAR WHERE COP_SITUACAO = ' + '''Não Pago'' ';

  if EdtCod.Text <> '' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_COD = ' + EdtCod.Text;
  end
  else if EdtDesc.Text <> '' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_DESC LIKE ' + '''' + '%' + EdtDesc.Text + '%' + '''';
  end
  else if MdtDataPaga.Text <> '  /  /    ' then
  begin
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_DATA_PAG = ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPaga.Text)));
  end;

  CdTabela.Open;
end;

procedure TFrm_CadContaPagar.Button1Click(Sender: TObject);
var
I,Nparcela,DiasPagamento : integer;
ValorParcela : double;
VTotal, VLucro, TotalConta : String;
NovoVTotal, NovoVLucro, FormaPagamento,Parcela,NovoVParcela : String;
begin
  BtoExcluir.Enabled := True;

  DiasPagamento := 0;
  Nparcela      := 0;

  ValorParcela := (CdTabelaCOP_VALOR.AsFloat/CdTabelaCOP_N_PARCELAS.AsInteger);
  NovoVParcela := FloatToStr(ValorParcela);
  NovoVParcela := ((TrocaVirgPPto(NovoVParcela)));
  TotalConta := ((TrocaVirgPPto(CdTabelaCOP_VALOR.AsString)));

  if CdTabelaCOP_N_PARCELAS.AsInteger = 0 then
  begin
    CdTabelaCOP_N_PARCELAS.AsInteger := 1;
  end;

  for I := 1 to CdTabelaCOP_N_PARCELAS.AsInteger do
  begin
    Nparcela := Nparcela + 1;

    Parcela := inttostr(Nparcela) + '/' + inttostr(CdTabelaCOP_N_PARCELAS.AsInteger);

    SQLTabela.SQL.Clear;
    SQLTabela.SQL.text:= 'INSERT INTO CONTAS_PAGAR (COP_DESC, COP_VALOR, COP_DATA_PAG, COP_N_PARCELAS, COP_PARCELA, COP_VALOR_PARCELA, COP_SITUACAO ';
    if CdTabelaCOP_OBS.AsString <> '' then
    begin
      SQLTabela.SQL.text:= SQLTabela.SQL.text + ',COP_OBS ';
    end;
    if CdTabelaCOP_FORN_FK.AsString <> '' then
    begin
      SQLTabela.SQL.text:= SQLTabela.SQL.text + ', COP_FORN_FK';
    end;

    SQLTabela.SQL.text:= SQLTabela.SQL.text + ') VALUES(' + '''' + CdTabelaCOP_DESC.AsString + '''' + ', ' +
    TotalConta + ',' + QuotedStr(FormatDateTime('yyyy-mm-dd', (DtpDataPaga.Date + DiasPagamento))) + ',' + CdTabelaCOP_N_PARCELAS.AsString + ',' +
    '''' + Parcela + '''' + ', ' +  NovoVParcela  + ', ' + '''' + 'Não Pago' + '''';
    if CdTabelaCOP_OBS.AsString <> '' then
    begin
      SQLTabela.SQL.text:= SQLTabela.SQL.text + ',' + '''' + CdTabelaCOP_OBS.AsString + '''';
    end;
    if CdTabelaCOP_FORN_FK.AsString <> '' then
    begin
      SQLTabela.SQL.text:= SQLTabela.SQL.text + ', ' + '''' + CdTabelaCOP_FORN_FK.AsString + '''';
    end;

    SQLTabela.SQL.text:= SQLTabela.SQL.text + ')';

    SQLTabela.ExecSQL;

    DiasPagamento := DiasPagamento + 30;
  end;

  Application.MessageBox('Conta salva com sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure TFrm_CadContaPagar.BtoExcluirClick(Sender: TObject);
begin
   if not CDtabela.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir esta Conta ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CDtabela.Delete;
     end;
   end;
end;

procedure TFrm_CadContaPagar.Button3Click(Sender: TObject);
begin
  CdTabela.Cancel;
  BtoExcluir.Enabled := True;
end;

procedure TFrm_CadContaPagar.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CadContaPagar.Button5Click(Sender: TObject);
begin
  CdTabela.Append;
  BtoExcluir.Enabled := False;
  DtpDataPaga.Date := date;
end;

procedure TFrm_CadContaPagar.CdTabelaAfterDelete(DataSet: TDataSet);
begin
  CdTabela.ApplyUpdates(0);
  CdTabela.Refresh;
end;

procedure TFrm_CadContaPagar.CdTabelaAfterPost(DataSet: TDataSet);
begin
  CdTabela.ApplyUpdates(0);
  CdTabela.Refresh;
end;

procedure TFrm_CadContaPagar.CdTabelaBeforePost(DataSet: TDataSet);
begin
  CdTabela.Edit;
  CdTabelaCOP_DATA_PAG.AsDateTime := DtpDataPaga.Date;
end;

procedure TFrm_CadContaPagar.DsTabelaDataChange(Sender: TObject; Field: TField);
begin
  if CdTabelaCOP_DATA_PAG.AsString <> '' then
  begin
    DtpDataPaga.Date := CdTabelaCOP_DATA_PAG.AsDateTime;
  end;
end;

procedure TFrm_CadContaPagar.FormCreate(Sender: TObject);
begin
  CdTabela.Close;
  CdTabela.Open;

  if CdTabelaCOP_N_PARCELAS.AsString = '' then
  begin
    CdTabela.Edit;
    CdTabelaCOP_N_PARCELAS.AsInteger := 1;
  end;

  if CdTabelaCOP_DATA_PAG.AsString = '' then
  begin
    DtpDataPaga.Date := date;
  end
  else
  begin
    DtpDataPaga.Date := CdTabelaCOP_DATA_PAG.AsDateTime;
  end;
end;

function TFrm_CadContaPagar.TrocaVirgPPto(Valor: string): String;
var i:integer;
begin
    if Valor <>'' then begin
        for i := 0 to Length(Valor) do begin
            if Valor[i]=',' then Valor[i]:='.';

        end;
     end;
     Result := valor;
end;

end.
