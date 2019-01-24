unit RelatorioServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RelatorioClientes, RelatorioProduCad,
  Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ExtCtrls, ServicosRealizados,
  RelatorioFluxoCaixaSer, RelatorioVendas;

type
  TFm_RelatorioPrincipal = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Clientes1: TMenuItem;
    RelaodeClientes1: TMenuItem;
    Produtos1: TMenuItem;
    ProdutosCadastrados1: TMenuItem;
    ServiosRealizados1: TMenuItem;
    ServiosRealizados2: TMenuItem;
    Fluxodecaixa1: TMenuItem;
    Vendas1: TMenuItem;
    RelatriodeVendas1: TMenuItem;
    Fornecedores1: TMenuItem;
    ProdutosCadastrados2: TMenuItem;
    Contas1: TMenuItem;
    Contasapagar1: TMenuItem;
    Contasareceber1: TMenuItem;
    Contaspagasavista1: TMenuItem;
    procedure RelaodeClientes1Click(Sender: TObject);
    procedure ProdutosCadastrados1Click(Sender: TObject);
    procedure ServiosRealizados2Click(Sender: TObject);
    procedure Fluxodecaixa1Click(Sender: TObject);
    procedure RelatriodeVendas1Click(Sender: TObject);
    procedure ProdutosCadastrados2Click(Sender: TObject);
    procedure Contasapagar1Click(Sender: TObject);
    procedure Contasareceber1Click(Sender: TObject);
    procedure Contaspagasavista1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_RelatorioPrincipal: TFm_RelatorioPrincipal;

implementation

{$R *.dfm}

uses RelatorioForn, RelatorioContaRecebe, RelatorioContaPagar,
  RelatorioContaPagaAvista;

procedure TFm_RelatorioPrincipal.Contasapagar1Click(Sender: TObject);
begin
  try
    Frm_RelatorioContaPagar := TFrm_RelatorioContaPagar.Create(Self);
    Frm_RelatorioContaPagar.ShowModal;
  finally
    FreeAndNil(Frm_RelatorioContaPagar);
  end;
end;

procedure TFm_RelatorioPrincipal.Contasareceber1Click(Sender: TObject);
begin
  try
    Frm_RelatorioContaRecebe := TFrm_RelatorioContaRecebe.Create(self);
    Frm_RelatorioContaRecebe.ShowModal;
  finally
    FreeAndNil(Frm_RelatorioContaRecebe);
  end;
end;

procedure TFm_RelatorioPrincipal.Contaspagasavista1Click(Sender: TObject);
begin
  try
    Frm_RelatorioContaPagaAvista := TFrm_RelatorioContaPagaAvista.Create(Self);
    Frm_RelatorioContaPagaAvista.ShowModal;
  finally
    FreeAndNil(Frm_RelatorioContaPagaAvista);
  end;
end;

procedure TFm_RelatorioPrincipal.Fluxodecaixa1Click(Sender: TObject);
begin
  try
    FrmRelatorioFluxoCaixaSer := TFrmRelatorioFluxoCaixaSer.Create(Self);
    FrmRelatorioFluxoCaixaSer.ShowModal;
  finally
    FreeAndNil(FrmRelatorioFluxoCaixaSer);
  end;
end;

procedure TFm_RelatorioPrincipal.ProdutosCadastrados1Click(Sender: TObject);
begin
  FmRelatorioProduCad := TFmRelatorioProduCad.Create(self);
  FmRelatorioProduCad.ShowModal
end;

procedure TFm_RelatorioPrincipal.ProdutosCadastrados2Click(Sender: TObject);
begin
  Frm_RelatorioForn := TFrm_RelatorioForn.Create(self);
  Frm_RelatorioForn.ShowModal;
end;

procedure TFm_RelatorioPrincipal.RelaodeClientes1Click(Sender: TObject);
begin
  Fm_RelatorioClientes := TFm_RelatorioClientes.Create(self);
  Fm_RelatorioClientes.ShowModal;
end;

procedure TFm_RelatorioPrincipal.RelatriodeVendas1Click(Sender: TObject);
begin
  try
    Fm_RelatorioVendas := TFm_RelatorioVendas.Create(self);
    Fm_RelatorioVendas.ShowModal;
  finally
    FreeAndNil(Fm_RelatorioVendas);
  end;
end;

procedure TFm_RelatorioPrincipal.ServiosRealizados2Click(Sender: TObject);
begin
  try
    Fm_ServicosRealizados := TFm_ServicosRealizados.Create(self);
    Fm_ServicosRealizados.ShowModal;
  finally
    FreeAndNil(Fm_ServicosRealizados);
  end;
end;

end.
