unit RelatorioContaPagaAvista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Rel_ContaPagar, Rel_ContaPagaAvista,
  RLXLSXFilter, RLFilters, RLPDFFilter;

type
  TFrm_RelatorioContaPagaAvista = class(TForm)
    Image1: TImage;
    EdtCod: TEdit;
    EdtDesc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtVisualizar: TButton;
    BtSair: TButton;
    MdtDataPagEfetuadoIni: TMaskEdit;
    Label5: TLabel;
    MdtDataPagEfetuadoFim: TMaskEdit;
    Label6: TLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    procedure BtVisualizarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_RelatorioContaPagaAvista: TFrm_RelatorioContaPagaAvista;

implementation

{$R *.dfm}

procedure TFrm_RelatorioContaPagaAvista.BtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_RelatorioContaPagaAvista.BtVisualizarClick(Sender: TObject);
begin
  try
    Fm_RelContaPagaAvista := TFm_RelContaPagaAvista.Create(self);
      Fm_RelContaPagaAvista.CdTabela.Close;
      Fm_RelContaPagaAvista.SQLTabela.SQL.Text := ' SELECT * FROM CONTAS_PAGAR WHERE COP_N_PARCELAS IS NULL ';

     if EdtCod.Text <> '' then
     begin
       Fm_RelContaPagaAvista.SQLTabela.SQL.Text := Fm_RelContaPagaAvista.SQLTabela.SQL.Text +
       ' AND  COP_COD = ' +  EdtCod.Text;
     end;
     if EdtDesc.Text <> '' then
     begin
        Fm_RelContaPagaAvista.SQLTabela.SQL.Text := Fm_RelContaPagaAvista.SQLTabela.SQL.Text +
        ' AND  COP_DESC LIKE '+  QuotedStr('%'+EdtDesc.Text+'%');
     end;
     if (MdtDataPagEfetuadoIni.Text <> '  /  /    ') and (MdtDataPagEfetuadoFim.Text <> '  /  /    ') then
     begin
       Fm_RelContaPagaAvista.SQLTabela.SQL.Text := Fm_RelContaPagaAvista.SQLTabela.SQL.Text + ' AND COP_DATA_PAG_EFETUADO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoIni.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoFim.Text)));
     end;
     if MdtDataPagEfetuadoIni.Text <> '  /  /    ' then
     begin
       Fm_RelContaPagaAvista.SQLTabela.SQL.Text := Fm_RelContaPagaAvista.SQLTabela.SQL.Text + ' AND COP_DATA_PAG_EFETUADO >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoIni.Text)));
     end;
     if MdtDataPagEfetuadoFim.Text <> '  /  /    ' then
     begin
       Fm_RelContaPagaAvista.SQLTabela.SQL.Text := Fm_RelContaPagaAvista.SQLTabela.SQL.Text + ' AND COP_DATA_PAG_EFETUADO <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoFim.Text)));
     end;

      Fm_RelContaPagaAvista.CdTabela.Open;

    if not Fm_RelContaPagaAvista.CdTabela.IsEmpty then
    begin
      Fm_RelContaPagaAvista.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;

  finally
    FreeAndNil(Fm_RelContaPagaAvista);
  end;
end;

end.
