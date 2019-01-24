unit MinhasVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RelatorioExemplo, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Buttons, ReciboVenda, Vcl.Imaging.pngimage;

type
  Tfm_MinhasVendas = class(Tfm_RelatorioExemplo)
    DataInicial: TMaskEdit;
    DataFinal: TMaskEdit;
    EditProd: TEdit;
    EditCliente: TEdit;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    Image1: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    CDtabelaCLI_NOME: TStringField;
    CDtabelaPRO_DESCRICAO: TStringField;
    CDtabelaITV_PRODUTOS_FK: TLargeintField;
    CDtabelaITV_VENDAS_FK: TIntegerField;
    CDtabelaITV_QTD: TIntegerField;
    CDtabelaPRO_VALOR_SAIDA: TFloatField;
    CDtabelaITV_LUCRO_ITEN: TFloatField;
    CDtabelaVEN_STATUS: TSmallintField;
    CDtabelaVEN_COD: TIntegerField;
    CDtabelaVEN_DATA: TDateField;
    CDtabelaVEN_VALOR_TOTAL: TFloatField;
    SQLtabelaCLI_NOME: TStringField;
    SQLtabelaPRO_DESCRICAO: TStringField;
    SQLtabelaITV_PRODUTOS_FK: TLargeintField;
    SQLtabelaITV_VENDAS_FK: TIntegerField;
    SQLtabelaITV_QTD: TIntegerField;
    SQLtabelaPRO_VALOR_SAIDA: TFloatField;
    SQLtabelaITV_LUCRO_ITEN: TFloatField;
    SQLtabelaVEN_STATUS: TSmallintField;
    SQLtabelaVEN_COD: TIntegerField;
    SQLtabelaVEN_DATA: TDateField;
    SQLtabelaVEN_VALOR_TOTAL: TFloatField;
    Button3: TButton;
    SQLAux: TSQLQuery;
    PanSenha: TPanel;
    Label8: TLabel;
    EdtSenha: TEdit;
    SpeedButton1: TSpeedButton;
    SQLUsu: TSQLQuery;
    DsUsu: TDataSource;
    CdUsu: TClientDataSet;
    DpUsu: TDataSetProvider;
    SQLUsuUSU_USUARIO: TStringField;
    SQLUsuUSU_SENHA: TStringField;
    SQLUsuUSU_PRIVILEGIO: TStringField;
    SQLUsuUSU_COMISSAO: TFloatField;
    SQLUsuUSU_COD: TIntegerField;
    CdUsuUSU_USUARIO: TStringField;
    CdUsuUSU_SENHA: TStringField;
    CdUsuUSU_PRIVILEGIO: TStringField;
    CdUsuUSU_COMISSAO: TFloatField;
    CdUsuUSU_COD: TIntegerField;
    PanVenda: TPanel;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    EdtSenhaVenda: TEdit;
    Button4: TButton;
    Button5: TButton;
    Image6: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbreSQL;
    procedure SqlVenda;
  public
    { Public declarations }
  end;

var
  fm_MinhasVendas: Tfm_MinhasVendas;

implementation

{$R *.dfm}

uses Data_Module, ReciboVendaImpTermica;

procedure Tfm_MinhasVendas.AbreSQL;
begin
  CDtabela.Close;
  SQLtabela.SQL.Clear;
  SQLtabela.SQL.Text :=
  '  SELECT  '   +
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
  '    VEN_VALOR_TOTAL  ' +

  '  FROM ITENS_VENDAS  ' +

  '  INNER JOIN PRODUTOS            '  +
  '    ON ITV_PRODUTOS_FK = PRO_COD  ' +
  '  INNER JOIN VENDAS  '   +
  '    ON ITV_VENDAS_FK = VEN_COD  ' +
  '  INNER JOIN CLIENTES  ' +
  '    ON VEN_CLIENTES_FK = CLI_COD ' +
  '  WHERE (VEN_STATUS = 1 or (VEN_STATUS = 2)) ';

  if Edit1.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text + ' AND VEN_COD = ' + Edit1.Text;
  end;

  if EditProd.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text + ' AND PRO_DESCRICAO LIKE ' + QuotedStr('%' + EditProd.Text + '%');
  end;

  if EditCliente.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text + ' AND CLI_NOME LIKE ' + QuotedStr('%' + EditCliente.Text + '%');
  end;

  if (DataInicial.Text <> '  /  /    ') and (DataFinal.Text <> '  /  /    ') then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text + ' AND VEN_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataFinal.Text)));
  end;

  if DataInicial.Text <> '  /  /    ' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text + ' AND VEN_DATA >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataInicial.Text)));
  end;

  if DataFinal.Text <> '  /  /    ' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text + ' AND VEN_DATA <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataFinal.Text)));
  end;

  SQLtabela.SQL.Text := SQLtabela.SQL.Text +
  '  GROUP by   '    +
  '    VEN_COD,    '         +
  '    CLI_NOME, '   +
  '    PRO_VALOR_ENTRADA, '  +
  '    ITV_CLIENTES_FK,  '   +
  '    PRO_DESCRICAO,  '     +
  '    ITV_PRODUTOS_FK, '    +
  '    ITV_VENDAS_FK, '      +
  '    ITV_QTD, '            +
  '    PRO_VALOR_SAIDA, '    +
  '    VEN_STATUS, '         +
  '    ITV_LUCRO_ITEN,  '    +
  '    VEN_DATA, '           +
  '    VEN_VALOR_TOTAL  '    +
  '  ORDER BY VEN_DATA desc, VEN_COD ';

  CDtabela.Open;
end;

procedure Tfm_MinhasVendas.Button2Click(Sender: TObject);
begin
  inherited;
  AbreSQL;
end;

procedure Tfm_MinhasVendas.Button3Click(Sender: TObject);
begin
    if not PanSenha.Visible then
    begin
      PanSenha.Visible := True;
      EdtSenha.Clear;
    end
    else
    begin
      PanSenha.Visible := False;
      EdtSenha.Clear;
    end;

    if PanVenda.Visible = True then
    begin
       PanVenda.Visible := False
    end;
end;

procedure Tfm_MinhasVendas.Button4Click(Sender: TObject);
begin
    if not PanVenda.Visible then
    begin
      PanVenda.Visible := True;
      EdtSenhaVenda.Clear;
    end
    else
    begin
      PanVenda.Visible := False;
      EdtSenhaVenda.Clear;
    end;

    if PanSenha.Visible = True then
    begin
       PanSenha.Visible := False
    end;

end;

procedure Tfm_MinhasVendas.Button5Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Imprimir o Recibo de venda ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
  begin
    if DataModule1.CdEmpEMP_IMP_A4.AsInteger = 1 then
    begin
    try
      FrmReciboVenda := TFrmReciboVenda.Create(self);

      FrmReciboVenda.CdRecibo.Close;
      FrmReciboVenda.SQLRecibo.SQL.Text :=  ' SELECT ' +
                                            '  VEN_COD, '  +
                                            '  VEN_DATA, '  +
                                            '  VEN_VALOR_TOTAL,  '  +
                                            '  VEN_FORMA_PAGAMENTO, ' +
                                            '  VEN_STATUS, '  +
                                            '  CLI_COD, '  +
                                            '  CLI_NOME, ' +
                                            ' VEN_DESCONTO, ' +
                                            ' VEN_ACRESCIMO, ' +
                                            ' VEN_TOTALBRUTO, ' +
                                            '  CLI_ENDERECO, '  +
                                            '  CLI_NUMERO, ' +
                                            '  CLI_CIDADE, ' +
                                            '  CLI_CPF, ' +
                                            '  CLI_CNPJ, ' +
                                            '  CLI_IE, ' +
                                            '  CLI_TELEFONE, ' +
                                            '  CLI_CELULAR, ' +
                                            '  ITV_PRODUTOS_FK,  ' +
                                            '  ITV_PRO_DESCRICAO, ' +
                                            '  ITV_QTD, ' +
                                            '  ITV_DESCONTO, '  +
                                            '  ITV_SUBTOTAL, '  +
                                            '  PRO_VALOR_SAIDA  ' +
                                            ' FROM ' +
                                            ' ITENS_VENDAS  ' +
                                            ' INNER JOIN  ' +
                                            ' PRODUTOS ' +
                                            ' ON ITV_PRODUTOS_FK = PRO_COD ' +
                                            ' INNER JOIN ' +
                                            ' VENDAS  ' +
                                            ' ON ITV_VENDAS_FK = VEN_COD ' +
                                            ' LEFT JOIN ' +
                                            ' CLIENTES ' +
                                            ' ON VEN_CLIENTES_FK = CLI_COD  ' +
                                            ' WHERE VEN_COD = ' + (CDtabelaITV_VENDAS_FK.AsString);
      FrmReciboVenda.CdRecibo.Open;
      FrmReciboVenda.RlrRecibo.Preview;
    finally
      FreeAndNil(FrmReciboVenda);
    end;
    end
    else
    begin
      try
        FrmReciboVendaImpTermica := TFrmReciboVendaImpTermica.Create(self);

        FrmReciboVendaImpTermica.CdRecibo.Close;
        FrmReciboVendaImpTermica.SQLRecibo.SQL.Text :=  ' SELECT ' +
                                              '  VEN_COD, '  +
                                              '  VEN_DATA, '  +
                                              '  VEN_VALOR_TOTAL,  '  +
                                              '  VEN_FORMA_PAGAMENTO, ' +
                                              '  VEN_STATUS, '  +
                                              '  CLI_COD, '  +
                                              '  CLI_NOME, ' +
                                              ' VEN_DESCONTO, ' +
                                              ' VEN_ACRESCIMO, ' +
                                              ' VEN_TOTALBRUTO, ' +
                                              '  CLI_ENDERECO, '  +
                                              '  CLI_NUMERO, ' +
                                              '  CLI_CIDADE, ' +
                                              '  CLI_CPF, ' +
                                              '  CLI_CNPJ, ' +
                                              '  CLI_IE, ' +
                                              '  CLI_TELEFONE, ' +
                                              '  CLI_CELULAR, ' +
                                              '  ITV_PRODUTOS_FK,  ' +
                                              '  ITV_PRO_DESCRICAO, ' +
                                              '  ITV_QTD, ' +
                                              '  ITV_DESCONTO, '  +
                                              '  ITV_SUBTOTAL, '  +
                                              '  PRO_VALOR_SAIDA  ' +
                                              ' FROM ' +
                                              ' ITENS_VENDAS  ' +
                                              ' INNER JOIN  ' +
                                              ' PRODUTOS ' +
                                              ' ON ITV_PRODUTOS_FK = PRO_COD ' +
                                              ' INNER JOIN ' +
                                              ' VENDAS  ' +
                                              ' ON ITV_VENDAS_FK = VEN_COD ' +
                                              ' LEFT JOIN ' +
                                              ' CLIENTES ' +
                                              ' ON VEN_CLIENTES_FK = CLI_COD  ' +
                                              ' WHERE VEN_COD = ' + (CDtabelaITV_VENDAS_FK.AsString);
        FrmReciboVendaImpTermica.CdRecibo.Open;
        FrmReciboVendaImpTermica.RlrRecibo.Preview;
      finally
        FreeAndNil(FrmReciboVendaImpTermica);
      end;
    end;
  end;
end;

procedure Tfm_MinhasVendas.FormCreate(Sender: TObject);
begin
  inherited;
  CDtabela.Close;
  CDtabela.Open;
end;

procedure Tfm_MinhasVendas.SpeedButton1Click(Sender: TObject);
begin
  inherited;
    CdUsu.Close;
    SQLUsu.SQL.Text := 'SELECT * FROM USUARIO WHERE USU_SENHA = ' + '''' + EdtSenha.Text + '''' + ' AND USU_PRIVILEGIO = ' + '''' + 'Gerencial' + '''';
    CdUsu.Open;

    if not CdUsu.IsEmpty then
    begin
      if MessageDlg('Deseja Realmente Excluir este Produto da Venda ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
      begin
        if MessageDlg('Deseja Extornar este Produto para o Estoque ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
        begin
            if CdTabelaITV_PRODUTOS_FK.AsString <> '' then
            begin
              SQLAux.SQL.Text := 'UPDATE PRODUTOS SET PRO_QUANTIDADE = PRO_QUANTIDADE + ' + CdTabelaITV_QTD.AsString + ' WHERE PRO_COD = ' + CdTabelaITV_PRODUTOS_FK.AsString;
              SQLAux.ExecSQL;
            end
        end;
        SQLAux.SQL.Clear;
        SQLAux.SQL.Text := ('DELETE FROM itens_vendas WHERE ITV_VENDAS_FK = ' + CDtabelaITV_VENDAS_FK.AsString + ' AND ITV_PRODUTOS_FK = ' + CDtabelaITV_PRODUTOS_FK.AsString);
        SQLAux.ExecSQL;
        CDtabela.Refresh;
      end;
    end
    else
    begin
      Application.MessageBox('Senha não gerencial', 'Verifique !', mb_iconinformation + mb_ok);
    end;
end;

procedure Tfm_MinhasVendas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
    CdUsu.Close;
    SQLUsu.SQL.Text := 'SELECT * FROM USUARIO WHERE USU_SENHA = ' + '''' + EdtSenhaVenda.Text + '''' + ' AND USU_PRIVILEGIO = ' + '''' + 'Gerencial' + '''';
    CdUsu.Open;

    if not CdUsu.IsEmpty then
    begin
      if MessageDlg('Deseja Realmente Excluir esta Venda ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
      begin
        if MessageDlg('Deseja Extornar os Produtos para o Estoque ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
        begin
          SqlVenda;
          CdTabela.First;
          while not CdTabela.Eof do
          begin
            if CdTabelaITV_PRODUTOS_FK.AsString <> '' then
            begin
              SQLAux.SQL.Text := 'UPDATE PRODUTOS SET PRO_QUANTIDADE = PRO_QUANTIDADE + ' + CdTabelaITV_QTD.AsString + ' WHERE PRO_COD = ' + CdTabelaITV_PRODUTOS_FK.AsString;
              SQLAux.ExecSQL;

              CdTabela.Next;
            end
            else
            begin
              CdTabela.Next;
            end;
          end;
        end;

        SQLAux.SQL.Clear;
        SQLAux.SQL.Text := ('DELETE FROM vendas WHERE VEN_COD = ' + CDtabelaITV_VENDAS_FK.AsString);
        SQLAux.ExecSQL;

        AbreSQL;

        CDtabela.Refresh;
      end;
    end
    else
    begin
      Application.MessageBox('Senha não gerencial', 'Verifique !', mb_iconinformation + mb_ok);
    end;
end;

procedure Tfm_MinhasVendas.SqlVenda;
begin
  SQLtabela.SQL.Text:= ' SELECT ' +
                       '   CLI_NOME, ' +
                       '   PRO_DESCRICAO, ' +
                       '   ITV_PRODUTOS_FK, ' +
                       '   ITV_VENDAS_FK, ' +
                       '   ITV_QTD, ' +
                       '   PRO_VALOR_SAIDA, ' +
                       '   ITV_LUCRO_ITEN,  ' +
                       '   VEN_STATUS,  '  +
                       '   VEN_COD, ' +
                       '   VEN_DATA, ' +
                       '   VEN_VALOR_TOTAL  ' +

                       ' FROM ITENS_VENDAS '  +

                       ' INNER JOIN PRODUTOS ' +
                       '   ON ITV_PRODUTOS_FK = PRO_COD ' +
                       ' INNER JOIN VENDAS ' +
                       '   ON ITV_VENDAS_FK = VEN_COD '  +
                       ' INNER JOIN CLIENTES '  +
                       '   ON VEN_CLIENTES_FK = CLI_COD ' +
                       ' WHERE (VEN_STATUS = 1 or (VEN_STATUS = 2)) AND  VEN_COD = '  + CDtabelaVEN_COD.AsString +

                       ' GROUP by '  +
                       '   CLI_NOME, ' +
                       '   PRO_VALOR_ENTRADA, '  +
                       '   ITV_CLIENTES_FK, ' +
                       '   PRO_DESCRICAO, ' +
                       '   ITV_PRODUTOS_FK,  '  +
                       '   ITV_VENDAS_FK, ' +
                       '   ITV_QTD, ' +
                       '   PRO_VALOR_SAIDA, ' +
                       '   VEN_STATUS, ' +
                       '   VEN_COD, '  +
                       '   ITV_LUCRO_ITEN, '  +
                       '   VEN_DATA, '  +
                       '   VEN_VALOR_TOTAL ' +
                       ' ORDER BY VEN_COD  ';

  CDtabela.Open;
  CDtabela.Refresh;

end;

end.
