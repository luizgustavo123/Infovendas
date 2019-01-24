unit NFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, GeraNfe, Valida_ArquivoXML,
  EnviaNfe, CancelaNfe, InutilizaNFe, EnviaEmail_NFe, ImprimirDANFE,
  Consultas_Nfe, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFm_Nfe = class(TForm)
    MainMenu1: TMainMenu;
    StatusdoServio1: TMenuItem;
    GerarNFe1: TMenuItem;
    ValidarXML1: TMenuItem;
    CriareEnviar1: TMenuItem;
    CancelamentoNFe1: TMenuItem;
    InutilizarNmerao1: TMenuItem;
    Consultas1: TMenuItem;
    ConsultarCarregamentoXML1: TMenuItem;
    ImprimirDanfe1: TMenuItem;
    EnviarEmailNFe1: TMenuItem;
    Configuraes1: TMenuItem;
    Image1: TImage;
    procedure Configuraes1Click(Sender: TObject);
    procedure StatusdoServio1Click(Sender: TObject);
    procedure GerarNFe1Click(Sender: TObject);
    procedure ValidarXML1Click(Sender: TObject);
    procedure CriareEnviar1Click(Sender: TObject);
    procedure CancelamentoNFe1Click(Sender: TObject);
    procedure InutilizarNmerao1Click(Sender: TObject);
    procedure EnviarEmailNFe1Click(Sender: TObject);
    procedure ImprimirDanfe1Click(Sender: TObject);
    procedure ConsultarCarregamentoXML1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Nfe: TFm_Nfe;

implementation

{$R *.dfm}

uses ConfigNfe, Status;

procedure TFm_Nfe.CancelamentoNFe1Click(Sender: TObject);
begin
  Fm_CancelaNfe := TFm_CancelaNfe.Create(self);
  Fm_CancelaNfe.ShowModal;
end;

procedure TFm_Nfe.Configuraes1Click(Sender: TObject);
begin
  Fm_ConfigNfe := TFm_ConfigNfe.Create(self);
  Fm_ConfigNfe.ShowModal;
end;

procedure TFm_Nfe.ConsultarCarregamentoXML1Click(Sender: TObject);
begin
  Fm_Consultas := TFm_Consultas.Create(self);
  Fm_Consultas.ShowModal;
end;

procedure TFm_Nfe.CriareEnviar1Click(Sender: TObject);
begin
  Fm_EnviaNfe := TFm_EnviaNfe.Create(self);
  Fm_EnviaNfe.ShowModal;
end;

procedure TFm_Nfe.EnviarEmailNFe1Click(Sender: TObject);
begin
  Fm_EnviaEmail_NFe := TFm_EnviaEmail_NFe.Create(self);
  Fm_EnviaEmail_NFe.ShowModal;
end;

procedure TFm_Nfe.GerarNFe1Click(Sender: TObject);
begin
  FM_Geranfe := TFM_Geranfe.Create(self);
  FM_Geranfe.ShowModal;
end;

procedure TFm_Nfe.ImprimirDanfe1Click(Sender: TObject);
begin
  Fm_ImprimirDANFE := TFm_ImprimirDANFE.Create(self);
  Fm_ImprimirDANFE.ShowModal;
end;

procedure TFm_Nfe.InutilizarNmerao1Click(Sender: TObject);
begin
  Fm_InutilizaNFe := TFm_InutilizaNFe.Create(self);
  Fm_InutilizaNFe.ShowModal;
end;

procedure TFm_Nfe.StatusdoServio1Click(Sender: TObject);
begin
  Fm_Status := TFm_Status.Create(self);
  Fm_Status.ShowModal;
end;

procedure TFm_Nfe.ValidarXML1Click(Sender: TObject);
begin
  Fm_Valida_Arquivo := TFm_Valida_Arquivo.Create(self);
  Fm_Valida_Arquivo.ShowModal;
end;

end.

