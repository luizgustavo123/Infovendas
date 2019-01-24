unit ImprimirDANFE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data_Module, ACBrBase, ACBrNFeDANFEClass, ACBrDANFCeFortesFr;

type
  TFm_ImprimirDANFE = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_ImprimirDANFE: TFm_ImprimirDANFE;

implementation

{$R *.dfm}

procedure TFm_ImprimirDANFE.BitBtn1Click(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := DataModule1.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    DataModule1.ACBrNFe1.NotasFiscais.Clear;
    DataModule1.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName,False);
    DataModule1.ACBrNFe1.NotasFiscais.Imprimir;
  end;
end;

procedure TFm_ImprimirDANFE.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
