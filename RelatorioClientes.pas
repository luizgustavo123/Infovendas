unit RelatorioClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Rel_Clientes, RLXLSXFilter, RLFilters, RLPDFFilter;

type
  TFm_RelatorioClientes = class(TForm)
    EdtCod: TEdit;
    EdtNome: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BtnVisualizar: TButton;
    BtnSair: TButton;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    EdtCidade: TEdit;
    Label3: TLabel;
    procedure BtnVisualizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir;
  public
    { Public declarations }
  end;

var
  Fm_RelatorioClientes: TFm_RelatorioClientes;

implementation

{$R *.dfm}

procedure TFm_RelatorioClientes.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFm_RelatorioClientes.BtnVisualizarClick(Sender: TObject);
begin
  Imprimir;
end;

procedure TFm_RelatorioClientes.Imprimir;
begin
  try
    Fm_Rel_Clientes := TFm_Rel_Clientes.Create(self);
      Fm_Rel_Clientes.CdCliente.Close;
      Fm_Rel_Clientes.SQLCliente.SQL.Text := ' SELECT   '  +
                                         '   CLI_COD,  ' +
                                         '   CLI_NOME, ' +
                                         '   CLI_ENDERECO, '  +
                                         '   CLI_NUMERO,   '  +
                                         '   CLI_TELEFONE, '  +
                                         '   CLI_CIDADE, '    +
                                         '   CLI_CELULAR,  '  +
                                         '   CLI_RG,       '  +
                                         '   CLI_CPF       '  +
                                         ' FROM CLIENTES   '  +
                                         ' WHERE CLI_COD > 0 and CLI_STATUS = 1';
     if EdtCod.Text <> '' then
     begin
       Fm_Rel_Clientes.SQLCliente.SQL.Text := Fm_Rel_Clientes.SQLCliente.SQL.Text +
       ' AND  CLI_COD = ' +  EdtCod.Text;
     end;
     if EdtNome.Text <> '' then
     begin
        Fm_Rel_Clientes.SQLCliente.SQL.Text := Fm_Rel_Clientes.SQLCliente.SQL.Text +
        ' AND  CLI_NOME LIKE '+  QuotedStr('%'+EdtNome.Text+'%');
     end;
     if EdtCidade.Text <> '' then
     begin
        Fm_Rel_Clientes.SQLCliente.SQL.Text := Fm_Rel_Clientes.SQLCliente.SQL.Text +
        ' AND  CLI_CIDADE LIKE '+  QuotedStr('%'+EdtCidade.Text+'%');
     end;

      Fm_Rel_Clientes.CdCliente.Open;

    if not Fm_Rel_Clientes.CdCliente.IsEmpty then
    begin
      Fm_Rel_Clientes.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;


  finally
    FreeAndNil(Fm_Rel_Clientes);
  end;
end;

end.
