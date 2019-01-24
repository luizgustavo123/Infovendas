unit PesquisaFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFm_PesquisaFornecedor = class(TForm)
    Image3: TImage;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    Label10: TLabel;
    EditRazao: TEdit;
    Label11: TLabel;
    BTpesquisar: TButton;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    CDtabelaFORN_COD: TIntegerField;
    CDtabelaFORN_NOME_FANTASIA: TStringField;
    CDtabelaFORN_RAZAO_SOCIAL: TStringField;
    SQLtabelaFORN_COD: TIntegerField;
    SQLtabelaFORN_NOME_FANTASIA: TStringField;
    SQLtabelaFORN_RAZAO_SOCIAL: TStringField;
    procedure BTpesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_PesquisaFornecedor: TFm_PesquisaFornecedor;

implementation

{$R *.dfm}

uses Produtos, CadContaPagar, CadContasAvista;

procedure TFm_PesquisaFornecedor.BTpesquisarClick(Sender: TObject);
begin
  CDTabela.Close;
  SQLtabela.SQL.Clear;
  SQLtabela.SQL.Text :=   '  SELECT '  +
                          '    FORN_COD, ' +
                          '    FORN_NOME_FANTASIA, ' +
                          '    FORN_RAZAO_SOCIAL ' +
                          '  FROM FORNECEDORES ' +
                          '  WHERE FORN_STATUS = 1 ';

  if edtCodigo.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      ' AND FORN_COD = ' + edtCodigo.Text;
  end;

  if EditRazao.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
     'AND FORN_RAZAO_SOCIAL LIKE ' + QuotedStr('%'+EditRazao.Text+'%');
  end;
end;

procedure TFm_PesquisaFornecedor.DBGrid1DblClick(Sender: TObject);
begin
  if fm_Produtos <> nil then
  begin
    fm_Produtos.CDtabela.Edit;
    fm_Produtos.CDtabelaPRO_FORNECEDOR_FK.AsString := CDtabelaFORN_COD.AsString;
    close;
  end
  else if Frm_CadContaPagar <> nil then
  begin
    Frm_CadContaPagar.CdTabela.Edit;
    Frm_CadContaPagar.CdTabelaCOP_FORN_FK.AsString := CDtabelaFORN_COD.AsString;
    close;
  end
  else if Frm_CadContasAvista <> nil then
  begin
    Frm_CadContasAvista.CdTabela.Edit;
    Frm_CadContasAvista.CdTabelaCOP_FORN_FK.AsString := CDtabelaFORN_COD.AsString;
    close;
  end;
end;

procedure TFm_PesquisaFornecedor.FormCreate(Sender: TObject);
begin
  CdTabela.Close;
  CdTabela.Open;
end;

end.
