unit Consultas_Nfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFm_Consultas = class(TForm)
    GrpRecibo: TGroupBox;
    EdtRecibo: TEdit;
    RadioTipo: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    GrpArquivo: TGroupBox;
    SpeedButton1: TSpeedButton;
    EdtArquivo: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Consultas: TFm_Consultas;

implementation

{$R *.dfm}

procedure TFm_Consultas.BitBtn1Click(Sender: TObject);
begin
  DataModule1.ACBrNFe1.NotasFiscais.Clear;
  if RadioTipo.ItemIndex = 0 then
  begin
    if EdtArquivo.Text = '' then
    begin
      ShowMessage('É necessário selecionar o arquivo XML!');
      Abort;
    end;
    DataModule1.ACBrNFe1.NotasFiscais.LoadFromFile(EdtArquivo.Text);
    DataModule1.ACBrNFe1.Consultar;
    Memo1.Lines.Text := UTF8Encode(DataModule1.ACBrNFe1.WebServices.Consulta.RetWS);
  end
  else if RadioTipo.ItemIndex = 1 then
  begin
    if EdtRecibo.Text = '' then
    begin
      ShowMessage('É necessário informar o numero do recibo!');
      Abort;
    end;
    DataModule1.ACBrNFe1.WebServices.Recibo.Recibo := EdtRecibo.Text;
    DataModule1.ACBrNFe1.WebServices.Retorno.Executar;
    Memo1.Lines.Text := UTF8Encode(DataModule1.ACBrNFe1.WebServices.Consulta.RetWS);
  end;
end;

procedure TFm_Consultas.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFm_Consultas.FormShow(Sender: TObject);
begin
  DataModule1.AtualizaConfigAcBr;
  RadioTipoClick(Sender);
end;

procedure TFm_Consultas.RadioTipoClick(Sender: TObject);
begin
  GrpArquivo.Visible := false;
  GrpRecibo.Visible  := false;
  if RadioTipo.ItemIndex = 0 then // Consultar carregamento XML
     GrpArquivo.Visible := true
  else if RadioTipo.ItemIndex = 1 then
     GrpRecibo.Visible := true;

end;

procedure TFm_Consultas.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtArquivo.Text := OpenDialog1.FileName;
end;

end.
