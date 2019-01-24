unit PesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFm_PesquisaCliente = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    EditCod: TEdit;
    EditNome: TEdit;
    Button6: TButton;
    Label6: TLabel;
    Label12: TLabel;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    CDtabelaCLI_COD: TIntegerField;
    CDtabelaCLI_NOME: TStringField;
    SQLtabelaCLI_COD: TIntegerField;
    SQLtabelaCLI_NOME: TStringField;
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_PesquisaCliente: TFm_PesquisaCliente;

implementation

{$R *.dfm}

uses PdvCaixa, CaixaServicos;

procedure TFm_PesquisaCliente.Button6Click(Sender: TObject);
begin
  CDTabela.Close;
  SQLtabela.SQL.Clear;
  SQLtabela.SQL.Text := 'SELECT' +
                          ' CLI_COD, ' +
                          ' CLI_NOME ' +
                        ' FROM CLIENTES ' +
                        ' WHERE CLI_COD > 0 AND CLI_STATUS = 1';

  if EditCod.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      ' AND CLI_COD = ' + EditCod.Text;
  end;

  if EditNome.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
     'AND CLI_NOME LIKE ' + QuotedStr('%'+EditNome.Text+'%');
  end;

  CDTabela.Open;
end;

procedure TFm_PesquisaCliente.DBGrid1DblClick(Sender: TObject);
begin
  if  Fm_PdvCaixa <> nil then
  begin
    Fm_PdvCaixa.EdtCodCli.Text := CDtabelaCLI_COD.AsString;
    Fm_PesquisaCliente.Close;
  end;

  if  Fm_CaixaServicos <> nil then
  begin
    Fm_CaixaServicos.EdtCli.Text := CDtabelaCLI_COD.AsString;
    Fm_PesquisaCliente.Close;
  end;
end;

procedure TFm_PesquisaCliente.FormCreate(Sender: TObject);
begin
  CDtabela.Close;
  CDtabela.Open;
end;

end.
