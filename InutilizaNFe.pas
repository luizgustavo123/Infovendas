unit InutilizaNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFm_InutilizaNFe = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtModelo: TEdit;
    EdtSerie: TEdit;
    EdtAno: TEdit;
    EdtInicio: TEdit;
    EdtFinal: TEdit;
    MemoJustifica: TMemo;
    EdtCNPJ: TEdit;
    GroupBox2: TGroupBox;
    MemoRetorno: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    ActEnviar: TAction;
    ActFechar: TAction;
    procedure ActEnviarExecute(Sender: TObject);
    procedure ActFecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_InutilizaNFe: TFm_InutilizaNFe;

implementation

{$R *.dfm}

procedure TFm_InutilizaNFe.ActEnviarExecute(Sender: TObject);
begin
  // verificações
  if (EdtCNPJ.Text = '') or (EdtModelo.Text = '') or (EdtSerie.Text = '') or
     (EdtAno.Text = '') or (EdtInicio.Text = '') or (EdtFinal.Text = '') or
     (MemoJustifica.Text = '') then
  begin
    ShowMessage('Todos os campos do formulário devem ser preenchidos!');
    Abort;
  end;
  //
  DataModule1.ACBrNFe1.WebServices.Inutiliza(EdtCNPJ.Text,
                                       MemoJustifica.Text,
                                       StrToInt(EdtAno.Text),
                                       StrToInt(EdtModelo.Text),
                                       StrToInt(EdtSerie.Text),
                                       StrToInt(EdtInicio.Text),
                                       StrToInt(EdtFinal.Text));
  // captura retorno
  MemoRetorno.Lines.Text := UTF8Encode(DataModule1.ACBrNFe1.WebServices.Inutilizacao.RetWS);

end;

procedure TFm_InutilizaNFe.ActFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFm_InutilizaNFe.FormShow(Sender: TObject);
begin
  DataModule1.AtualizaConfigAcBr;
end;

end.
