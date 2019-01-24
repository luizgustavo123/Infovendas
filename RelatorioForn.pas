unit RelatorioForn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLPDFFilter, RLFilters, RLXLSXFilter,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFrm_RelatorioForn = class(TForm)
    BtnVisualizar: TButton;
    BtnSair: TButton;
    Image1: TImage;
    EdtNome: TEdit;
    Label2: TLabel;
    EdtCod: TEdit;
    Label1: TLabel;
    RLXLSXFilter1: TRLXLSXFilter;
    RLPDFFilter1: TRLPDFFilter;
    procedure BtnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_RelatorioForn: TFrm_RelatorioForn;

implementation

{$R *.dfm}

uses Rel_Forn;

procedure TFrm_RelatorioForn.BtnVisualizarClick(Sender: TObject);
begin
  try
    Frm_Rel_Forn := TFrm_Rel_Forn.Create(self);
      Frm_Rel_Forn.CdForn.Close;
      Frm_Rel_Forn.SQLForn.SQL.Text := ' SELECT   '  +
                                         ' * ' +
                                         ' FROM FORNECEDORES   '  +
                                         ' WHERE FORN_STATUS = 1';
     if EdtCod.Text <> '' then
     begin
       Frm_Rel_Forn.SQLForn.SQL.Text := Frm_Rel_Forn.SQLForn.SQL.Text +
       ' AND  FORN_COD = ' +  EdtCod.Text;
     end;
     if EdtNome.Text <> '' then
     begin
        Frm_Rel_Forn.SQLForn.SQL.Text := Frm_Rel_Forn.SQLForn.SQL.Text +
        ' AND  FORN_NOME_FANTASIA LIKE '+  QuotedStr('%'+EdtNome.Text+'%');
     end;
      Frm_Rel_Forn.CdForn.Open;

    if not Frm_Rel_Forn.CdForn.IsEmpty then
    begin
      Frm_Rel_Forn.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;


  finally
    FreeAndNil(Frm_Rel_Forn);
  end;
end;

end.
