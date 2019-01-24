unit Valida_ArquivoXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFm_Valida_Arquivo = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    EdtArquivo: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    ActValidar: TAction;
    ActFechar: TAction;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActValidarExecute(Sender: TObject);
    procedure ActFecharExecute(Sender: TObject);
    procedure EdtArquivoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Valida_Arquivo: TFm_Valida_Arquivo;

implementation

{$R *.dfm}

procedure TFm_Valida_Arquivo.ActFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFm_Valida_Arquivo.ActValidarExecute(Sender: TObject);
begin
 if EdtArquivo.Text = '' then
  begin
    ShowMessage('É necessário selecionar o arquivo!');
    Abort;
  end;
  // executa validação do arquivo
  try
    DataModule1.ACBrNFe1.NotasFiscais.Clear;
    DataModule1.ACBrNFe1.NotasFiscais.LoadFromFile(EdtArquivo.Text);
    DataModule1.ACBrNFe1.NotasFiscais.Validar;
  finally
    ShowMessage('Arquivo Validado com sucesso!');
  end;
end;

procedure TFm_Valida_Arquivo.EdtArquivoExit(Sender: TObject);
begin
  if EdtArquivo.Text = '' then
     SpeedButton1Click(Sender);
end;

procedure TFm_Valida_Arquivo.FormShow(Sender: TObject);
begin
  DataModule1.AtualizaConfigAcBr;
  EdtArquivo.SetFocus;
end;

procedure TFm_Valida_Arquivo.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtArquivo.Text := OpenDialog1.FileName;
end;

end.
