unit RelatorioProduCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Rel_ProCad, RLPDFFilter, RLFilters, RLXLSXFilter;

type
  TFmRelatorioProduCad = class(TForm)
    Image1: TImage;
    EdtCodPro: TEdit;
    EdtPro: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    RLXLSXFilter1: TRLXLSXFilter;
    RLPDFFilter1: TRLPDFFilter;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir;
  public
    { Public declarations }
  end;

var
  FmRelatorioProduCad: TFmRelatorioProduCad;

implementation

{$R *.dfm}

procedure TFmRelatorioProduCad.Button1Click(Sender: TObject);
begin
  Imprimir;
end;

procedure TFmRelatorioProduCad.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFmRelatorioProduCad.Imprimir;
begin
  try
    Fm_Rel_ProCad := TFm_Rel_ProCad.Create(self);
      Fm_Rel_ProCad.CdProduto.Close;
      Fm_Rel_ProCad.SQLProduto.SQL.Text := ' SELECT   '  +
                                         '   PRO_COD,  ' +
                                         '   PRO_DESCRICAO, ' +
                                         '   PRO_VALOR_ENTRADA, '  +
                                         '   PRO_VALOR_SAIDA,   '  +
                                         '   PRO_VENCI, '  +
                                         '   PRO_QUANTIDADE,  '  +
                                         '   FORN_RAZAO_SOCIAL,'  +
                                         '   PRO_FORNECEDOR_FK '  +
                                         ' FROM PRODUTOS   '  +
                                         ' LEFT JOIN fornecedores '  +
                                         ' ON FORN_COD = PRO_FORNECEDOR_FK  ' +
                                         ' WHERE PRO_STATUS = 1 ';
     if EdtCodPro.Text <> '' then
     begin
       Fm_Rel_ProCad.SQLProduto.SQL.Text := Fm_Rel_ProCad.SQLProduto.SQL.Text +
       ' AND  PRO_COD = ' +  EdtCodPro.Text;
     end;
     if EdtPro.Text <> '' then
     begin
        Fm_Rel_ProCad.SQLProduto.SQL.Text := Fm_Rel_ProCad.SQLProduto.SQL.Text +
        ' AND  PRO_DESCRICAO LIKE '+  QuotedStr('%'+EdtPro.Text+'%');
     end;
      Fm_Rel_ProCad.CdProduto.Open;

    if not Fm_Rel_ProCad.CdProduto.IsEmpty then
    begin
      Fm_Rel_ProCad.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;


  finally
    FreeAndNil(Fm_Rel_ProCad);
  end;
end;

end.
