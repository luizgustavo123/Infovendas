unit EnviaNfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask,
  System.Actions, Vcl.ActnList, Data_Module;

type
  TFm_EnviaNfe = class(TForm)
    GroupBox1: TGroupBox;
    EdtArquivo: TMaskEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    ActionList1: TActionList;
    Button2: TButton;
    ActEnviar: TAction;
    ActFechar: TAction;
    Label1: TLabel;
    Label2: TLabel;
    EdtNumLote: TEdit;
    EdtPedido: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ActFecharExecute(Sender: TObject);
    procedure ActEnviarExecute(Sender: TObject);
    procedure EdtPedidoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_EnviaNfe: TFm_EnviaNfe;

implementation

{$R *.dfm}

procedure TFm_EnviaNfe.ActEnviarExecute(Sender: TObject);
var aChaveNfe, aRecibo, aProcolo : String;
begin
  //
  if EdtArquivo.Text = '' then
  begin
    ShowMessage('É necessário selcionar o arquivo XML');
    Abort;
  end;

  if Trim(EdtNumLote.Text) = '' then
  begin
    ShowMessage('É necessário informar o numero do lote!');
    Abort;
  end;
  //
  try
    DataModule1.ACBrNFe1.NotasFiscais.Clear;
    DataModule1.ACBrNFe1.NotasFiscais.LoadFromFile(EdtArquivo.Text);
    DataModule1.ACBrNFe1.Enviar(EdtNumLote.Text);
    //
    aChaveNfe := DataModule1.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].chNFe;
    aProcolo  := DataModule1.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt;
    aRecibo   := DataModule1.ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec;
    // grava chave NFe
    if aChaveNfe <> '' then
    begin
      DataModule1.GravaChaveNFEPedido(aChaveNfe,EdtPedido.Text);

    end;
   except
     ShowMessage('Erro ao enviar a NFe.Verifique!!!');
   end;
end;

procedure TFm_EnviaNfe.ActFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFm_EnviaNfe.EdtPedidoExit(Sender: TObject);
begin
  EdtNumLote.Text := EdtPedido.Text;
end;

procedure TFm_EnviaNfe.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtArquivo.Text :=  OpenDialog1.FileName;
end;

end.
