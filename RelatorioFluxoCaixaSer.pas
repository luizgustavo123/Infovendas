unit RelatorioFluxoCaixaSer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, RLXLSXFilter, RLFilters,
  RLPDFFilter, RelFluxoCaixaSer;

type
  TFrmRelatorioFluxoCaixaSer = class(TForm)
    Image1: TImage;
    Label6: TLabel;
    Label2: TLabel;
    BtVisualizar: TButton;
    BtSair: TButton;
    DtpIni: TDateTimePicker;
    DtpFim: TDateTimePicker;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    procedure BtVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorioFluxoCaixaSer: TFrmRelatorioFluxoCaixaSer;

implementation

{$R *.dfm}

procedure TFrmRelatorioFluxoCaixaSer.BtSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRelatorioFluxoCaixaSer.BtVisualizarClick(Sender: TObject);
begin
  try
    FrmRelFluxoCaixaSer := TFrmRelFluxoCaixaSer.Create(Self);
    FrmRelFluxoCaixaSer.CdVenda.Close;
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := ' SELECT ' + '''Venda a vista''' + ' as desc, VEN_DATA, VEN_COD, VEN_VALOR_TOTAL, CAST(' + '''0''' +  ' as float), VEN_LUCRO_TOTAL, ' + ''' ''' + ' as situ FROM VENDAS WHERE VEN_STATUS = 1 ';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' AND VEN_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' UNION ALL ';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' select ' + '''Ordem de Serviço''' + ' as desc, CASE_DATA, CASE_COD_SERVICO, SUM(CASE_SERVICO_VALOR), CAST(' + '''0''' +  ' as float), CASE_LUCRO, ' + ''' ''' + ' as situ from CAIXASERVICOS where CASE_STATUS = 1 AND CASE_STATUSSERVICO = ' + '''Serviço Concluído''';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' AND CASE_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' GROUP by ' +
                                                                                      ' CASE_COD_SERVICO, ' +
                                                                                      ' CASE_DATA, '  +
                                                                                      ' CASE_LUCRO ' +
                                                                                      ' union all ';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' select ' + '''Conta Recebida''' + ' as desc, CONR_DATA_PAGO, CONR_COD, CAST(' + '''0''' +  ' as float), CONR_VALOR_PARCELA, CONR_LUCRO, CONR_SITUACAO FROM CONTAS_RECEBER ';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' WHERE (CONR_DATA_RECEBER BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date)) + ') OR ' +
    ' (CONR_DATA_PAGO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date)) + ') ';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' UNION ALL ';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' select ' + '''Conta Paga''' + ' as desc, COP_DATA_PAG_EFETUADO, COP_COD,COP_VALOR, COP_VALOR_PARCELA, CAST(' + '''0''' +  ' as float) as AUX, COP_SITUACAO FROM CONTAS_PAGAR ';
    FrmRelFluxoCaixaSer.SQLVenda.SQL.Text := FrmRelFluxoCaixaSer.SQLVenda.SQL.Text + ' WHERE (COP_DATA_PAG BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date)) + ') OR ' +
    ' (COP_DATA_PAG_EFETUADO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date)) + ')';


    FrmRelFluxoCaixaSer.CdVenda.Open;

    FrmRelFluxoCaixaSer.CdContasPaga.Close;
    FrmRelFluxoCaixaSer.SQLContasPaga.SQL.Text := 'SELECT SUM(COP_VALOR) FROM CONTAS_PAGAR WHERE COP_VALOR_PARCELA is null ' +
    ' AND COP_DATA_PAG_EFETUADO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdContasPaga.Open;

    FrmRelFluxoCaixaSer.CdVendaavista.Close;
    FrmRelFluxoCaixaSer.SQLVendaavista.SQL.Text  := 'SELECT SUM(VEN_VALOR_TOTAL) FROM VENDAS WHERE VEN_STATUS = 1' +
    ' AND VEN_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdVendaavista.Open;

    FrmRelFluxoCaixaSer.CdContaPagParcela.Close;
    FrmRelFluxoCaixaSer.SQLContaPagParcela.SQL.Text := 'SELECT SUM(COP_VALOR_PARCELA) FROM CONTAS_PAGAR WHERE COP_SITUACAO = ' + '''Pago''' +
     ' AND COP_DATA_PAG_EFETUADO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdContaPagParcela.Open;

    FrmRelFluxoCaixaSer.CdContaRecebida.Close;
    FrmRelFluxoCaixaSer.SQLContaRecebida.SQL.Text := 'SELECT SUM(CONR_VALOR_PARCELA) FROM CONTAS_RECEBER WHERE CONR_SITUACAO = ' + '''Pago''' +
    ' AND CONR_DATA_PAGO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdContaRecebida.Open;

    FrmRelFluxoCaixaSer.CdContaAreceber.Close;
    FrmRelFluxoCaixaSer.SQLContaAreceber.SQL.Text := 'SELECT SUM(CONR_VALOR_PARCELA) FROM CONTAS_RECEBER WHERE CONR_SITUACAO = ' + '''A receber''' +
    ' AND CONR_DATA_RECEBER BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdContaAreceber.Open;

    FrmRelFluxoCaixaSer.CdContaParcelaApagar.Close;
    FrmRelFluxoCaixaSer.SQLContaParcelaApagar.SQL.Text := 'SELECT SUM(COP_VALOR_PARCELA) FROM CONTAS_PAGAR WHERE COP_SITUACAO = ' + '''Não Pago''' +
    ' AND COP_DATA_PAG BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdContaParcelaApagar.Open;

    FrmRelFluxoCaixaSer.CdLucroBruto.Close;
    FrmRelFluxoCaixaSer.SQLLucroBruto.SQL.Text := 'SELECT SUM(CONR_LUCRO) AS LUCRO FROM CONTAS_RECEBER WHERE CONR_SITUACAO = ' + '''Pago''' +
    ' AND CONR_DATA_PAGO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdLucroBruto.Open;

    FrmRelFluxoCaixaSer.CdLucroBrutoAreceber.Close;
    FrmRelFluxoCaixaSer.SQLLucroBrutoAreceber.SQL.Text := 'SELECT SUM(CONR_LUCRO) AS LUCROaReceber FROM CONTAS_RECEBER WHERE CONR_SITUACAO = ' + '''A receber''' +
    ' AND CONR_DATA_RECEBER BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdLucroBrutoAreceber.Open;

    FrmRelFluxoCaixaSer.CdLucroBrutoAvista.Close;
    FrmRelFluxoCaixaSer.SQLLucroBrutoAvista.SQL.Text  := 'SELECT SUM(VEN_LUCRO_TOTAL) AS LUCROAVISTA FROM VENDAS WHERE VEN_STATUS = 1' +
    ' AND VEN_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdLucroBrutoAvista.Open;

    FrmRelFluxoCaixaSer.CdServTotal.Close;
    FrmRelFluxoCaixaSer.SQLServTotal.SQL.Text  := 'SELECT SUM(CASE_SERVICO_VALOR) FROM CAIXASERVICOS WHERE CASE_STATUS = 1 ' +
    ' AND CASE_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date));
    FrmRelFluxoCaixaSer.CdServTotal.Open;

    FrmRelFluxoCaixaSer.CdLucroBrutoSer.Close;
    FrmRelFluxoCaixaSer.SQLLucroBrutoSer.SQL.Text  := 'SELECT DISTINCT CASE_COD_SERVICO, CASE_LUCRO  FROM CAIXASERVICOS WHERE CASE_STATUS = 1 '+
    ' AND CASE_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpIni.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy', DtpFim.Date)) +
    ' GROUP by '  +
    ' CASE_COD_SERVICO, ' +
    ' CASE_LUCRO ';
    FrmRelFluxoCaixaSer.CdLucroBrutoSer.Open;

    FrmRelFluxoCaixaSer.RlrFluxoCaixa.Preview();

  finally
    FreeAndNil(FrmRelFluxoCaixaSer);
  end;
end;

procedure TFrmRelatorioFluxoCaixaSer.FormCreate(Sender: TObject);
begin
  DtpIni.Date := Date;
  DtpFim.Date := Date;
end;

end.
