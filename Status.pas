unit Status;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  ACBrBase, ACBrDFe, ACBrNFe, pcnConversao;

type
  TFm_Status = class(TForm)
    GroupBox1: TGroupBox;
    RetornoWS: TMemo;
    Dados: TMemo;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Button2: TButton;
    ACBrNFe1: TACBrNFe;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Status: TFm_Status;

implementation

{$R *.dfm}

uses Data_Module;

procedure TFm_Status.Button1Click(Sender: TObject);
begin
  ACBrNFe1.WebServices.StatusServico.Executar;
  RetornoWS.Lines.Clear;
  RetornoWS.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.StatusServico.RetWS);
  //
  RetornoWS.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'retornoexe.xml');
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'retornoexe.xml');
  //
  Dados.Lines.Clear;
  Dados.Lines.Add('Tipo Ambiente: '+ TpAmbToStr(ACBrNFe1.WebServices.StatusServico.tpAmb));
  Dados.Lines.Add('Versão Aplicativo: '+ ACBrNFe1.WebServices.StatusServico.verAplic);
  Dados.Lines.Add('Status: '+IntToStr(ACBrNFe1.WebServices.StatusServico.cStat));
  Dados.Lines.Add('Motivo: '+ACBrNFe1.WebServices.StatusServico.xMotivo);
  Dados.Lines.Add('UF'+IntToStr(ACBrNFe1.WebServices.StatusServico.cUF));
  Dados.Lines.Add('Data Hora Recebimento: '+DateTimeToStr(ACBrNFe1.WebServices.StatusServico.dhRecbto));
  Dados.Lines.Add('Data Hora Reterno: '+DateTimeToStr(ACBrNFe1.WebServices.StatusServico.dhRetorno));
  Dados.Lines.Add('Observação: '+ACBrNFe1.WebServices.StatusServico.xObs);

end;

procedure TFm_Status.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFm_Status.FormShow(Sender: TObject);
begin
  DataModule1.AtualizaConfigAcBr;
end;

end.
