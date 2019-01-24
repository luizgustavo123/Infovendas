unit Rel_Exemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, RLReport;

type
  TFm_Rel_Exemplo = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLBand3: TRLBand;
    RlUsuario: TRLLabel;
    RlData: TRLLabel;
    RLBand4: TRLBand;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_Rel_Exemplo: TFm_Rel_Exemplo;

implementation

{$R *.dfm}

procedure TFm_Rel_Exemplo.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if RLBand2.Color = ClSilver then
    RLBand2.Color := clWhite
  else
    RLBand2.Color := ClSilver;
end;

procedure TFm_Rel_Exemplo.RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RlUsuario.Caption := 'Usuário: ' + DataModule1.CdUsuarioUSU_USUARIO.AsString;
  RlData.Caption := DateToStr(date);
end;

end.
