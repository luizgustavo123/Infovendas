unit RelatorioVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Rel_Vendas, Vcl.Mask,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, RLPDFFilter, RLFilters, RLXLSXFilter,
  RLXLSFilter;

type
  TFm_RelatorioVendas = class(TForm)
    BtVisualizar: TButton;
    Image1: TImage;
    Label1: TLabel;
    EdtVenCod: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DataInicial: TMaskEdit;
    DataFinal: TMaskEdit;
    EditProd: TEdit;
    EditCliente: TEdit;
    BtSair: TButton;
    Label13: TLabel;
    CboPagamento: TComboBox;
    CbxFormaVenda: TComboBox;
    Label3: TLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    procedure BtVisualizarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure imprimir;
  public
    { Public declarations }
  end;

var
  Fm_RelatorioVendas: TFm_RelatorioVendas;

implementation

{$R *.dfm}

{ TFm_RelatorioVendas }

procedure TFm_RelatorioVendas.BtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFm_RelatorioVendas.BtVisualizarClick(Sender: TObject);
begin
  imprimir;
end;

procedure TFm_RelatorioVendas.imprimir;
begin
  try
    Fm_Rel_Vendas := TFm_Rel_Vendas.Create(self);
    Fm_Rel_Vendas.CdVenda.Close;
    Fm_Rel_Vendas.SQLVenda.SQL.Text :=
    '  SELECT  '   +
    '    USU_USUARIO, ' +
    '    USU_COMISSAO, ' +
    '    VEN_VALOR_TOTAL *  USU_COMISSAO /100 as valor_comissao, ' +
    '    CLI_NOME, ' +
    '    PRO_DESCRICAO, '   +
    '    ITV_PRODUTOS_FK, ' +
    '    ITV_VENDAS_FK, '   +
    '    ITV_QTD, '         +
    '    PRO_VALOR_SAIDA, ' +
    '    ITV_LUCRO_ITEN,  ' +
    '    VEN_STATUS,      ' +
    '    VEN_COD,         ' +
    '    VEN_DATA,        ' +
    '    VEN_DESCONTO,    ' +
    '    VEN_ACRESCIMO,   ' +
    '    ITV_SUBTOTAL,     ' +
    '    VEN_FORMA_PAGAMENTO, ' +
    '    VEN_VALOR_TOTAL  ' +
    '  FROM ITENS_VENDAS  ' +

    '  INNER JOIN PRODUTOS            '  +
    '    ON ITV_PRODUTOS_FK = PRO_COD  ' +
    '  INNER JOIN VENDAS  '   +
    '    ON ITV_VENDAS_FK = VEN_COD  ' +
    '   LEFT JOIN USUARIO  ' +
    '    ON USU_COD = VEN_FUNCIONARIO_FK ' +
    '  INNER JOIN CLIENTES  ' +
    '    ON VEN_CLIENTES_FK = CLI_COD ';

    if CbxFormaVenda.ItemIndex = 0 then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + '  WHERE (VEN_STATUS = 1 or (VEN_STATUS = 2)) ';
    end
    else if CbxFormaVenda.ItemIndex = 1 then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + '  WHERE VEN_STATUS = 1 ';
    end
    else
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + '  WHERE VEN_STATUS = 2 ';
    end;

    if CboPagamento.ItemIndex = 1 then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND VEN_FORMA_PAGAMENTO = ' + '''Dinheiro''';
    end
    else if CboPagamento.ItemIndex = 2 then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND VEN_FORMA_PAGAMENTO = ' + '''Cartão''';
    end
    else if CboPagamento.ItemIndex = 3 then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND VEN_FORMA_PAGAMENTO = ' + '''Cheque''';
    end;

    if EdtVenCod.Text <> '' then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND VEN_COD = ' + EdtVenCod.Text;
    end;

    if EditProd.Text <> '' then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND  PRO_DESCRICAO LIKE '+  QuotedStr('%'+EditProd.Text+'%');
    end;

    if EditCliente.Text <> '' then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND  CLI_NOME LIKE '+  QuotedStr('%'+EditCliente.Text+'%');
    end;

    if (DataInicial.Text <> '  /  /    ') and (DataFinal.Text <> '  /  /    ') then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND VEN_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataFinal.Text)));
    end;

    if DataInicial.Text <> '  /  /    ' then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND VEN_DATA >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataInicial.Text)));
    end;

    if DataFinal.Text <> '  /  /    ' then
    begin
      Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text + ' AND VEN_DATA <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataFinal.Text)));
    end;

    Fm_Rel_Vendas.SQLVenda.SQL.Text := Fm_Rel_Vendas.SQLVenda.SQL.Text +
    '  GROUP by   '    +
    '    CLI_NOME, '   +
    '    PRO_VALOR_ENTRADA, '  +
    '    ITV_CLIENTES_FK,  '   +
    '    PRO_DESCRICAO,  '     +
    '    ITV_PRODUTOS_FK, '    +
    '    ITV_VENDAS_FK, '      +
    '    ITV_QTD, '            +
    '    USU_USUARIO, '        +
    '    USU_COMISSAO, '       +
    '    PRO_VALOR_SAIDA, '    +
    '    VEN_STATUS, '         +
    '    VEN_COD,    '         +
    '    VEN_DESCONTO,    '    +
    '    VEN_ACRESCIMO,   '    +
    '    ITV_LUCRO_ITEN,  '    +
    '    VEN_DATA, '           +
    '    ITV_SUBTOTAL, '       +
    '    VEN_FORMA_PAGAMENTO, ' +
    '    VEN_VALOR_TOTAL  '    +
    '  ORDER BY VEN_COD   ';

    Fm_Rel_Vendas.CDVenda.Open;
    if not Fm_Rel_Vendas.CDVenda.IsEmpty then
    begin
      Fm_Rel_Vendas.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;
  finally
    FreeAndNil(Fm_Rel_Vendas);

  end;

end;

end.
