unit EnviaEmail_NFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFm_EnviaEmail_NFe = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdtPara: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    EdtArquivo: TEdit;
    OpenDialog1: TOpenDialog;
    edtEmailAssunto: TEdit;
    Label27: TLabel;
    mmEmailMsg: TMemo;
    Label28: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_EnviaEmail_NFe: TFm_EnviaEmail_NFe;

implementation

{$R *.dfm}

procedure TFm_EnviaEmail_NFe.BitBtn1Click(Sender: TObject);
var
 Para : String;
 CC: Tstrings;
begin
  Para := EdtPara.Text;

  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := DataModule1.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    DataModule1.ACBrNFe1.NotasFiscais.Clear;
    DataModule1.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
    CC:=TstringList.Create;
    try
      DataModule1.ACBrMail1.Host := DataModule1.sSMPTHost;
      DataModule1.ACBrMail1.Port := DataModule1.sSMTPPort;
      DataModule1.ACBrMail1.Username := DataModule1.sSMTPUsu;
      DataModule1.ACBrMail1.Password := DataModule1.sSMTPPass;
      DataModule1.ACBrMail1.From := EdtPara.Text;

      DataModule1.ACBrMail1.FromName := 'Projeto ACBr - ACBrNFe';

      DataModule1.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail( Para, edtEmailAssunto.Text,
                                               mmEmailMsg.Lines
                                               , True  // Enviar PDF junto
                                               , CC    // Lista com emails que serão enviado cópias - TStrings
                                               , nil); // Lista de anexos - TStrings
    finally
      CC.Free;
    end;
  end;
end;

procedure TFm_EnviaEmail_NFe.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFm_EnviaEmail_NFe.FormShow(Sender: TObject);
begin
  DataModule1.AtualizaConfigAcBr;
  EdtArquivo.SetFocus;
end;

procedure TFm_EnviaEmail_NFe.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtArquivo.Text := OpenDialog1.FileName;
end;

end.
