unit PesquisaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient;

type
  TFm_PesquisaProdutos = class(TForm)
    Image3: TImage;
    DBGrid1: TDBGrid;
    edtProduto: TEdit;
    lbl1: TLabel;
    edtCodigo: TEdit;
    lbl2: TLabel;
    BTpesquisar: TButton;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    CDtabelaPRO_COD: TLargeintField;
    CDtabelaPRO_DESCRICAO: TStringField;
    SQLtabelaPRO_COD: TLargeintField;
    SQLtabelaPRO_DESCRICAO: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BTpesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_PesquisaProdutos: TFm_PesquisaProdutos;

implementation

{$R *.dfm}

uses PdvCaixa, CadServicos;

procedure TFm_PesquisaProdutos.BTpesquisarClick(Sender: TObject);
begin
  CDTabela.Close;
  SQLtabela.SQL.Clear;
  SQLtabela.SQL.Text :=   ' SELECT ' +
                            ' PRO_COD, ' +
                            ' PRO_DESCRICAO ' +
                          ' FROM PRODUTOS ' +
                          ' WHERE PRO_STATUS = 1 ';

  if edtCodigo.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      ' AND PRO_COD = ' + edtCodigo.Text;
  end;

  if edtProduto.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
     'AND PRO_DESCRICAO LIKE ' + QuotedStr('%'+edtProduto.Text+'%');
  end;

  CDTabela.Open;
end;

procedure TFm_PesquisaProdutos.DBGrid1DblClick(Sender: TObject);
begin
  if  Fm_PdvCaixa <> nil then
  begin
    Fm_PdvCaixa.CdTabela.Edit;
    Fm_PdvCaixa.CdTabelaITV_PRODUTOS_FK.Value := CDtabelaPRO_COD.Value;
    Fm_PesquisaProdutos.Close;
  end
  else if Fm_CadServicos <> nil then
  begin
     Fm_CadServicos.CdPro.Edit;
     Fm_CadServicos.CdProPSERV_PRODUTOS_FK.Value := CDtabelaPRO_COD.Value;
     Fm_PesquisaProdutos.Close;
  end;
end;

procedure TFm_PesquisaProdutos.FormCreate(Sender: TObject);
begin
    CDtabela.Close;
    CDtabela.Open;
end;

end.
