unit Informacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ExcluirServicos,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, BaixaContaPagar, BaixaContaRecebe,
  CadContaPagar, CadContasAvista;

type
  TFm_Informacoes = class(TForm)
    MainMenu1: TMainMenu;
    Servios1: TMenuItem;
    ServiosRealizados1: TMenuItem;
    Image1: TImage;
    Contas1: TMenuItem;
    Cadastrarcontaspagasvista1: TMenuItem;
    Cadastrarcontasapagar1: TMenuItem;
    Baixadecontasareceber1: TMenuItem;
    Baixadecontasapagar1: TMenuItem;
    Vendas1: TMenuItem;
    GerenciarVendas1: TMenuItem;
    procedure ServiosRealizados1Click(Sender: TObject);
    procedure Cadastrarcontaspagasvista1Click(Sender: TObject);
    procedure Cadastrarcontasapagar1Click(Sender: TObject);
    procedure Baixadecontasareceber1Click(Sender: TObject);
    procedure Baixadecontasapagar1Click(Sender: TObject);
    procedure GerenciarVendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Informacoes: TFm_Informacoes;

implementation

{$R *.dfm}

uses MinhasVendas;

procedure TFm_Informacoes.Baixadecontasapagar1Click(Sender: TObject);
begin
  try
    FrmBaixaContaPagar := TFrmBaixaContaPagar.Create(Self);
    FrmBaixaContaPagar.ShowModal;
  finally
     FreeAndNil(FrmBaixaContaPagar);
  end;
end;

procedure TFm_Informacoes.Baixadecontasareceber1Click(Sender: TObject);
begin
  try
    FrmBaixaContaRecebe:= TFrmBaixaContaRecebe.Create(self);
    FrmBaixaContaRecebe.ShowModal;
  finally
    FreeAndNil(FrmBaixaContaRecebe);
  end;
end;

procedure TFm_Informacoes.Cadastrarcontasapagar1Click(Sender: TObject);
begin
  try
    Frm_CadContaPagar := TFrm_CadContaPagar.Create(Self);
    Frm_CadContaPagar.ShowModal;
  finally
     FreeAndNil(Frm_CadContaPagar);
  end;
end;

procedure TFm_Informacoes.Cadastrarcontaspagasvista1Click(Sender: TObject);
begin
  try
    Frm_CadContasAvista := TFrm_CadContasAvista.Create(Self);
    Frm_CadContasAvista.ShowModal;
  finally
     FreeAndNil(Frm_CadContasAvista);
  end;
end;

procedure TFm_Informacoes.GerenciarVendas1Click(Sender: TObject);
begin
  try
    fm_MinhasVendas := Tfm_MinhasVendas.Create(self);
    fm_MinhasVendas.ShowModal;
  finally
    FreeAndNil(fm_MinhasVendas);
  end;
end;

procedure TFm_Informacoes.ServiosRealizados1Click(Sender: TObject);
begin
  try
    Fm_ExcluirServicos := TFm_ExcluirServicos.Create(self);
    Fm_ExcluirServicos.ShowModal;
  finally
    FreeAndNil(Fm_ExcluirServicos);
  end;
end;

end.
