unit RelatorioContaRecebe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, RelContaRecebe, RLXLSXFilter, RLFilters,
  RLPDFFilter;

type
  TFrm_RelatorioContaRecebe = class(TForm)
    Image1: TImage;
    EdtCod: TEdit;
    Label1: TLabel;
    MdtDataPagaIni: TMaskEdit;
    MdtDataPagaFim: TMaskEdit;
    Label4: TLabel;
    Label8: TLabel;
    CboSituacao: TComboBox;
    Label3: TLabel;
    BtVisualizar: TButton;
    BtSair: TButton;
    MdtDataPagEfetuadoIni: TMaskEdit;
    Label2: TLabel;
    MdtDataPagEfetuadoFim: TMaskEdit;
    Label5: TLabel;
    EdtCli: TEdit;
    Label6: TLabel;
    CboStatus: TComboBox;
    Label7: TLabel;
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
  Frm_RelatorioContaRecebe: TFrm_RelatorioContaRecebe;

implementation

{$R *.dfm}

procedure TFrm_RelatorioContaRecebe.BtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_RelatorioContaRecebe.BtVisualizarClick(Sender: TObject);
begin
  try
    Fm_RelContaRecebe := TFm_RelContaRecebe.Create(self);
      Fm_RelContaRecebe.CdTabela.Close;
      Fm_RelContaRecebe.SQLTabela.SQL.Text := 'SELECT   '   +
                                              '  CONR_COD,  '  +
                                              '  CLI_NOME,  ' +
                                              '  CONR_PARCELA, '  +
                                              '  CONR_DATA_PAGO, ' +
                                              '  CONR_VALOR_PARCELA, ' +
                                              '  CONR_DATA_RECEBER, ' +
                                              '  CONR_SITUACAO '  +
                                              '  FROM CONTAS_RECEBER  ' +
                                              '  LEFT OUTER JOIN vendas '  +
                                              '  ON VEN_COD = CONR_VENDAS_FK  '  +
                                              '  LEFT OUTER JOIN CLIENTES '   +
                                              '  ON VEN_CLIENTES_FK = CLI_COD ' +
                                              '  WHERE CONR_COD > 0';

     if EdtCod.Text <> '' then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text +
       ' AND  CONR_COD = ' +  EdtCod.Text;
     end;
     if EdtCli.Text <> '' then
     begin
        Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text +
        ' AND  CLI_NOME LIKE '+  QuotedStr('%'+EdtCli.Text+'%');
     end;
     if (MdtDataPagaIni.Text <> '  /  /    ') and (MdtDataPagaFim.Text <> '  /  /    ') then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
     end;
     if MdtDataPagaIni.Text <> '  /  /    ' then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text)));
     end;
     if MdtDataPagaFim.Text <> '  /  /    ' then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
     end;

     if (MdtDataPagEfetuadoIni.Text <> '  /  /    ') and (MdtDataPagEfetuadoFim.Text <> '  /  /    ') then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_PAGO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoIni.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoFim.Text)));
     end;
     if MdtDataPagEfetuadoIni.Text <> '  /  /    ' then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_PAGO >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoIni.Text)));
     end;
     if MdtDataPagEfetuadoFim.Text <> '  /  /    ' then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_PAGO <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoFim.Text)));
     end;

     if CboSituacao.ItemIndex = 1 then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_SITUACAO = ''' + 'A receber' + '''';
     end;
     if CboSituacao.ItemIndex = 2 then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_SITUACAO = ''' + 'Pago' + '''';
     end;

     if CboStatus.ItemIndex = 1  then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER < CURRENT_DATE ';
     end;
     if CboStatus.ItemIndex = 2 then
     begin
       Fm_RelContaRecebe.SQLTabela.SQL.Text := Fm_RelContaRecebe.SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER > CURRENT_DATE ';
     end;

      Fm_RelContaRecebe.CdTabela.Open;

    if not Fm_RelContaRecebe.CdTabela.IsEmpty then
    begin
      Fm_RelContaRecebe.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;

  finally
    FreeAndNil(Fm_RelContaRecebe);
  end;
end;

end.
