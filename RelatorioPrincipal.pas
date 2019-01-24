unit RelatorioPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RelatorioClientes, RelatorioProduCad,
  Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ExtCtrls, ServicosRealizados,
  RelatorioFluxoCaixaSer, RelatorioVendas;

type
  TFm_RelatorioServicos = class(TForm)
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
    procedure RelaodeClientes1Click(Sender: TObject);
    procedure ProdutosCadastrados1Click(Sender: TObject);
    procedure ServiosRealizados2Click(Sender: TObject);
    procedure Fluxodecaixa1Click(Sender: TObject);
    procedure RelatriodeVendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_RelatorioServicos: TFm_RelatorioServicos;

implementation

{$R *.dfm}

procedure TFm_RelatorioServicos.Fluxodecaixa1Click(Sender: TObject);
begin
  try
    FrmRelatorioFluxoCaixaSer := TFrmRelatorioFluxoCaixaSer.Create(Self);
    FrmRelatorioFluxoCaixaSer.ShowModal;
  finally
    FreeAndNil(FrmRelatorioFluxoCaixaSer);
  end;
end;

procedure TFm_RelatorioServicos.ProdutosCadastrados1Click(Sender: TObject);
begin
  FmRelatorioProduCad := TFmRelatorioProduCad.Create(self);
  FmRelatorioProduCad.ShowModal
end;

procedure TFm_RelatorioServicos.RelaodeClientes1Click(Sender: TObject);
begin
  Fm_RelatorioClientes := TFm_RelatorioClientes.Create(self);
  Fm_RelatorioClientes.ShowModal;
end;

procedure TFm_RelatorioServicos.RelatriodeVendas1Click(Sender: TObject);
begin
  try
    Fm_RelatorioVendas := TFm_RelatorioVendas.Create(self);
    Fm_RelatorioVendas.ShowModal;
  finally
    FreeAndNil(Fm_RelatorioVendas);
  end;
end;

procedure TFm_RelatorioServicos.ServiosRealizados2Click(Sender: TObject);
begin
  try
    Fm_ServicosRealizados := TFm_ServicosRealizados.Create(self);
    Fm_ServicosRealizados.ShowModal;
  finally
    FreeAndNil(Fm_ServicosRealizados);
  end;
end;

end.
