unit CadContasAvista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Data_Module, PesquisaFornecedor, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TFrm_CadContasAvista = class(TForm)
    Image1: TImage;
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
    SQLTabelaCOP_DATA_PAG_EFETUADO: TDateField;
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
    CdTabelaCOP_DATA_PAG_EFETUADO: TDateField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image2: TImage;
    TabSheet2: TTabSheet;
    Image3: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdtCod: TEdit;
    EdtDesc: TEdit;
    ButPesqu: TButton;
    MdtDataPaga: TMaskEdit;
    DbCodForn: TDBEdit;
    DBEdit2: TDBEdit;
    DtpDataPag: TDateTimePicker;
    BtnPesquisaPro: TSpeedButton;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Button5: TButton;
    Button2: TButton;
    BtoExcluir: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    Image6: TImage;
    procedure BtnPesquisaProClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CdTabelaAfterDelete(DataSet: TDataSet);
    procedure CdTabelaAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BtoExcluirClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButPesquClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadContasAvista: TFrm_CadContasAvista;

implementation

{$R *.dfm}

procedure TFrm_CadContasAvista.BtnPesquisaProClick(Sender: TObject);
begin
  try
    Fm_PesquisaFornecedor := TFm_PesquisaFornecedor.Create(self);
    Fm_PesquisaFornecedor.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaFornecedor);
    DbCodForn.SetFocus;
  end;
end;

procedure TFrm_CadContasAvista.BtoExcluirClick(Sender: TObject);
begin
   if not CDtabela.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir esta Conta ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CDtabela.Delete;
     end;
   end;
end;

procedure TFrm_CadContasAvista.ButPesquClick(Sender: TObject);
begin
  CdTabela.Close;

  SQLTabela.SQL.Text := 'SELECT *  FROM CONTAS_PAGAR WHERE COP_N_PARCELAS IS NULL';

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
    SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND COP_DATA_PAG_EFETUADO = ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPaga.Text)));
  end;

  CdTabela.Open;
end;

procedure TFrm_CadContasAvista.Button1Click(Sender: TObject);
begin
  CdTabelaCOP_SITUACAO.AsString := 'Pago';
  CdTabelaCOP_DATA_PAG_EFETUADO.AsDateTime := DtpDataPag.Date;
  CdTabela.Post;

  Application.MessageBox('Conta lançada com sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure TFrm_CadContasAvista.Button3Click(Sender: TObject);
begin
  CdTabela.Cancel;
  BtoExcluir.Enabled := True;
end;

procedure TFrm_CadContasAvista.Button5Click(Sender: TObject);
begin
  CdTabela.Append;
  BtoExcluir.Enabled := False;
  DtpDataPag.Date := date;
end;

procedure TFrm_CadContasAvista.CdTabelaAfterDelete(DataSet: TDataSet);
begin
  CdTabela.ApplyUpdates(0);
  CdTabela.Refresh;
end;

procedure TFrm_CadContasAvista.CdTabelaAfterPost(DataSet: TDataSet);
begin
  CdTabela.ApplyUpdates(0);
  CdTabela.Refresh;
end;

procedure TFrm_CadContasAvista.FormCreate(Sender: TObject);
begin
  CdTabela.Close;
  CdTabela.Open;
  CdTabela.Append;

  DtpDataPag.Date := Date;

  PageControl1.TabIndex := 0;
end;

end.
