unit PdvCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.FMTBcd, System.ImageList, Vcl.ImgList, Data.SqlExpr, Datasnap.Provider,
  Datasnap.DBClient, Data_Module, Produtos, PesquisaProdutos, PesquisaCliente,
  System.Actions, Vcl.ActnList, GeraNfe, Vcl.ComCtrls, ReciboVenda,
  Vcl.WinXPickers, Vcl.Imaging.pngimage;

type
  TFm_PdvCaixa = class(TForm)
    DBGrid1: TDBGrid;
    Image1: TImage;
    DbCod: TDBEdit;
    Label1: TLabel;
    DbQtd: TDBEdit;
    Label3: TLabel;
    DsTabela: TDataSource;
    CdTabela: TClientDataSet;
    CdTabelaTOTAL: TAggregateField;
    CdTabelaLUCRO: TAggregateField;
    DpTabela: TDataSetProvider;
    SQLTabela: TSQLQuery;
    DbPreco: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ImageList1: TImageList;
    BtnAdd: TButton;
    BtnExcluir: TButton;
    LabTotal: TLabel;
    DBText1: TDBText;
    Label7: TLabel;
    BtnIniVenda: TButton;
    DbProDesc: TDBEdit;
    DsPro: TDataSource;
    CdPro: TClientDataSet;
    DpPro: TDataSetProvider;
    SQLPro: TSQLQuery;
    BtnFinalizarVenda: TButton;
    BtnCancelVenda: TButton;
    SQLVenda: TSQLQuery;
    DPVenda: TDataSetProvider;
    DSVenda: TDataSource;
    CDVenda: TClientDataSet;
    SQLCodVenda: TSQLQuery;
    SQLCodVendaMAX: TIntegerField;
    DbSubTotal: TDBEdit;
    Label9: TLabel;
    BtnPesquisaPro: TSpeedButton;
    BtNfe: TButton;
    SQLVendaVEN_COD: TIntegerField;
    SQLVendaVEN_STATUS: TSmallintField;
    SQLVendaVEN_DATA: TDateField;
    SQLVendaVEN_VALOR_TOTAL: TFloatField;
    CDVendaVEN_COD: TIntegerField;
    CDVendaVEN_STATUS: TSmallintField;
    CDVendaVEN_DATA: TDateField;
    CDVendaVEN_VALOR_TOTAL: TFloatField;
    CdProPRO_DESCRICAO: TStringField;
    CdProPRO_VALOR_SAIDA: TFloatField;
    SQLProPRO_DESCRICAO: TStringField;
    SQLProPRO_VALOR_SAIDA: TFloatField;
    CdTabelaPRO_DESCRICAO: TStringField;
    CdTabelaITV_PRODUTOS_FK: TLargeintField;
    CdTabelaITV_VENDAS_FK: TIntegerField;
    CdTabelaITV_QTD: TIntegerField;
    CdTabelaVEN_STATUS: TSmallintField;
    CdTabelaPRO_VALOR_SAIDA: TFloatField;
    CdTabelaITV_LUCRO_ITEN: TFloatField;
    CdTabelaITV_PRO_DESCRICAO: TStringField;
    CdTabelaITV_PRECO: TFloatField;
    CdTabelaITV_SUBTOTAL: TFloatField;
    CdTabelaLUCRO_ITEN: TFloatField;
    SQLTabelaPRO_DESCRICAO: TStringField;
    SQLTabelaITV_PRODUTOS_FK: TLargeintField;
    SQLTabelaITV_VENDAS_FK: TIntegerField;
    SQLTabelaITV_QTD: TIntegerField;
    SQLTabelaVEN_STATUS: TSmallintField;
    SQLTabelaPRO_VALOR_SAIDA: TFloatField;
    SQLTabelaITV_LUCRO_ITEN: TFloatField;
    SQLTabelaITV_PRO_DESCRICAO: TStringField;
    SQLTabelaITV_PRECO: TFloatField;
    SQLTabelaITV_SUBTOTAL: TFloatField;
    SQLTabelaLUCRO_ITEN: TFloatField;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    SQLProPRO_QUANTIDADE: TIntegerField;
    CdProPRO_QUANTIDADE: TIntegerField;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Edit1: TEdit;
    Label13: TLabel;
    CboPagamento: TComboBox;
    Label12: TLabel;
    Label11: TLabel;
    ButFinalVenda: TButton;
    ChbVista: TCheckBox;
    ChbPrazo: TCheckBox;
    Label14: TLabel;
    DtpDataReceber: TDateTimePicker;
    Action7: TAction;
    SpbVoltar: TSpeedButton;
    SQLVendaVEN_FORMA_PAGAMENTO: TStringField;
    CDVendaVEN_FORMA_PAGAMENTO: TStringField;
    DbeParcelas: TDBEdit;
    Label15: TLabel;
    SQLVendaVEN_NUMERO_PARCELAS: TSmallintField;
    CDVendaVEN_NUMERO_PARCELAS: TSmallintField;
    Label8: TLabel;
    EdtCodCli: TEdit;
    SbPesquisaCli: TSpeedButton;
    Label16: TLabel;
    DBText2: TDBText;
    DsUsu: TDataSource;
    Image6: TImage;
    Label18: TLabel;
    EdtFuncio: TEdit;
    SpbFuncio: TSpeedButton;
    EdtDesconto: TEdit;
    Label19: TLabel;
    EdtAcrescimo: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    SQLVendaVEN_DESCONTO: TSingleField;
    SQLVendaVEN_ACRESCIMO: TSingleField;
    CDVendaVEN_DESCONTO: TSingleField;
    CDVendaVEN_ACRESCIMO: TSingleField;
    Label17: TLabel;
    DtpVenData: TDateTimePicker;
    SQLAux: TSQLQuery;
    procedure FormCreate(Sender: TObject);
    procedure BtnIniVendaClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnFinalizarVendaClick(Sender: TObject);
    procedure BtnCancelVendaClick(Sender: TObject);
    procedure DbQtdExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure CdTabelaAfterPost(DataSet: TDataSet);
    procedure BtnPesquisaProClick(Sender: TObject);
    procedure SbPesquisaCliClick(Sender: TObject);
    procedure BtNfeClick(Sender: TObject);
    procedure ChbPrazoClick(Sender: TObject);
    procedure ChbVistaClick(Sender: TObject);
    procedure ButFinalVendaClick(Sender: TObject);
    procedure SpbVoltarClick(Sender: TObject);
    procedure SpbFuncioClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreSqlVenda;
    procedure LimpaProdutos;
    procedure VerificaItens;
  public
    { Public declarations }
    //total_temp : Double;
    function TrocaVirgPPto(Valor: string): String;
  end;

var
  Fm_PdvCaixa: TFm_PdvCaixa;

implementation

{$R *.dfm}

uses Profissionais, ReciboVendaImpTermica;

procedure TFm_PdvCaixa.AbreSqlVenda;
begin
  CDVenda.Close;
  SQLVenda.SQL.Text := ' SELECT * FROM VENDAS  ';
  CDVenda.Open;
end;

procedure TFm_PdvCaixa.BtnAddClick(Sender: TObject);
begin
  //VerificaItens;

  if DbCod.Text <> '' then
  begin
    CdPro.Close;
    SQLPro.SQL.Text := ' SELECT ' +
                       '  PRO_DESCRICAO, ' +
                       '  PRO_VALOR_SAIDA, ' +
                       '  PRO_QUANTIDADE ' +
                       ' FROM PRODUTOS '    +
                       ' WHERE PRO_COD =  ' + DbCod.Text;
    CdPro.Open;

    if DbQtd.Text = '' then
    begin
      CdTabelaITV_QTD.AsInteger := 1;
    end;
  end;

  if not CdPro.IsEmpty then
  begin
    if (CdProPRO_QUANTIDADE.AsInteger - CdTabelaITV_QTD.AsInteger) > -1 then
    begin
      CdTabelaITV_PRO_DESCRICAO.AsString := CdProPRO_DESCRICAO.AsString;
      CdTabelaITV_PRECO.AsFloat    := CdProPRO_VALOR_SAIDA.AsFloat;

      CdTabela.FieldByName('ITV_SUBTOTAL').AsFloat := CdTabela.FieldByName('ITV_PRECO').AsFloat * CdTabela.FieldByName('ITV_QTD').AsInteger;
      CDtabela.Append;
    end
    else
    begin
      Application.MessageBox('Produto em falta no estoque', 'Verifique !', mb_iconinformation + mb_ok);
      CdTabela.Cancel;
      //CDtabela.Append;
      CDtabela.Edit;
    end;
  end
  else
  begin
    Application.MessageBox('Produto não Cadastrado', 'Verifique !', mb_iconinformation + mb_ok);
    CdTabela.Cancel;
    //CDtabela.Append;
  end;

  SQLCodVenda.Close;
  SQLCodVenda.Open;

  CDTabela.Edit;
  CDTabela.FieldByName('ITV_VENDAS_FK').AsInteger := SQLCodVendaMAX.AsInteger + 1;
  CDtabela.Post;

  CDTabela.Edit;
  DbCod.SetFocus;

end;

procedure TFm_PdvCaixa.BtnIniVendaClick(Sender: TObject);
begin
  DtpVenData.Date := Date;
  EdtFuncio.Clear;
  EdtCodCli.Text := '0';
  CboPagamento.ItemIndex := 0;
  Edit1.Clear;
  EdtDesconto.Clear;
  EdtAcrescimo.Clear;
  DtpDataReceber.Date := Date;
  ChbVista.Checked := True;
  Label11.Caption := '0,00';
  EdtDesconto.Enabled    := True;
  EdtAcrescimo.Enabled   := True;

  CDtabela.Append;
  SQLCodVenda.Close;
  SQLCodVenda.Open;

  AbreSqlVenda;

  CDVenda.Append;
  CDVendaVEN_COD.AsInteger := SQLCodVendaMAX.AsInteger + 1;
  CDVenda.FieldByName('VEN_STATUS').AsInteger := 0;
  CDVenda.Post;


  CDTabela.FieldByName('ITV_VENDAS_FK').AsInteger := SQLCodVendaMAX.AsInteger + 1;

  BtNfe.Enabled            := False;
  DbCod.Enabled            := True;
  DbProDesc.Enabled        := True;
  DbQtd.Enabled            := True;
  DbPreco.Enabled          := True;
  DbSubTotal.Enabled       := True;
  DBGrid1.Enabled          := True;
  BtnFinalizarVenda.Enabled:= True;
  BtnCancelVenda.Enabled   := True;
  BtnIniVenda.Enabled      := False;
  BtnAdd.Enabled           := True;
  BtnExcluir.Enabled       := True;
  BtnPesquisaPro.Enabled   := True;
  EdtCodCli.Enabled        := True;
  SbPesquisaCli.Enabled    := True;
  EdtFuncio.Enabled        := True;
  SpbFuncio.Enabled        := True;
  DtpDataReceber.Enabled   := True;
  DbeParcelas.Enabled      := True;
  CboPagamento.Enabled     := True;
  ChbVista.Enabled         := True;
  ChbPrazo.Enabled         := True;
  Edit1.Enabled            := True;

  Panel1.Visible := False;

  DbCod.SetFocus;

end;

procedure TFm_PdvCaixa.CdTabelaAfterPost(DataSet: TDataSet);
begin
  if DbQtd.Text = '' then
  begin
    DbQtd.Text := '1';
  end;
end;



procedure TFm_PdvCaixa.ChbVistaClick(Sender: TObject);
begin
  DtpDataReceber.Visible := False;
  Label14.Visible := False;

  DbeParcelas.Visible := False;
  Label15.Visible := False;

  ChbPrazo.Checked := False;

  if ChbVista.Checked then
  begin
    if Datamodule1.CdEmpEMP_DESCONTO_AVISTA.AsString <> '' then
    begin
      EdtDesconto.Text := Datamodule1.CdEmpEMP_DESCONTO_AVISTA.AsString;
      EdtAcrescimo.Text := '';
    end;
  end;

end;

procedure TFm_PdvCaixa.ChbPrazoClick(Sender: TObject);
begin
  DtpDataReceber.Visible := True;
  Label14.Visible := True;

  DbeParcelas.Visible := True;
  Label15.Visible := True;
  ChbVista.Checked := False;

  CDVenda.Edit;
  CDVendaVEN_NUMERO_PARCELAS.AsInteger := 1;

  if ChbPrazo.Checked then
  begin
    if Datamodule1.CdEmpEMP_ACRESCIMO_APRAZO.AsString <> '' then
    begin
      EdtAcrescimo.Text := Datamodule1.CdEmpEMP_ACRESCIMO_APRAZO.AsString;
      EdtDesconto.Text := '';
    end;
  end;
end;

procedure TFm_PdvCaixa.BtnFinalizarVendaClick(Sender: TObject);
begin
  if not CdTabela.IsEmpty then
  begin
    CdTabela.Edit;
    Panel1.Visible := True;
    BtnFinalizarVenda.Enabled := False;
    ButFinalVenda.Enabled := True;
    SpbVoltar.Enabled := True;
    ChbVista.SetFocus;
    Datamodule1.CdEmp.Close;
    Datamodule1.CdEmp.Open;

    if ChbVista.Checked then
    begin
      if Datamodule1.CdEmpEMP_DESCONTO_AVISTA.AsString <> '' then
      begin
        EdtDesconto.Text := Datamodule1.CdEmpEMP_DESCONTO_AVISTA.AsString;
      end;
    end;
  end
  else
  begin
    Application.MessageBox('Adicione produtos antes de finalizar', 'Verificar', mb_iconinformation + mb_ok);
  end;
end;

procedure TFm_PdvCaixa.BtnCancelVendaClick(Sender: TObject);
begin
  CdTabela.Cancel;
  CdTabela.EmptyDataSet;

  DbCod.Enabled            := False;
  DbProDesc.Enabled        := False;
  DbQtd.Enabled            := False;
  DbPreco.Enabled          := False;
  DbSubTotal.Enabled       := False;
  DBGrid1.Enabled          := False;
  BtnFinalizarVenda.Enabled:= False;
  BtnCancelVenda.Enabled   := False;
  BtnIniVenda.Enabled      := True;
  BtnAdd.Enabled           := False;
  BtnExcluir.Enabled       := False;
  BtnPesquisaPro.Enabled   := False;
  EdtCodCli.Enabled        := False;
  SbPesquisaCli.Enabled    := False;

end;

procedure TFm_PdvCaixa.BtnExcluirClick(Sender: TObject);
begin
  CdTabela.Delete;
  CdTabela.last;
  CdTabela.Next;
  DbCod.SetFocus;
end;

procedure TFm_PdvCaixa.BtNfeClick(Sender: TObject);
begin
  try
    FM_Geranfe := TFM_Geranfe.Create(self);
    FM_Geranfe.EdtDados.Text := CDVendaVEN_COD.AsString;
    FM_Geranfe.ShowModal;

  finally
    FreeAndNil(FM_Geranfe);
  end;
end;

procedure TFm_PdvCaixa.DbQtdExit(Sender: TObject);
begin
  if DbQtd.Text = '' then
  begin
    CdTabelaITV_QTD.AsInteger := 1;
  end;
    CdTabela.FieldByName('ITV_SUBTOTAL').AsFloat := CdTabela.FieldByName('ITV_PRECO').AsFloat * CdTabela.FieldByName('ITV_QTD').AsInteger;
end;

procedure TFm_PdvCaixa.FormCreate(Sender: TObject);
begin
  CdTabela.Close;
  CdTabela.Open;

  DataModule1.CdEmp.Close;
  DataModule1.CdEmp.Open;

  DtpVenData.Date := Date;
  DtpDataReceber.Date := Date;

  LimpaProdutos;
end;

procedure TFm_PdvCaixa.LimpaProdutos;
begin
  SQLAux.SQL.Text := ' DELETE FROM VENDAS WHERE VEN_STATUS = 0 ';
  SQLAux.ExecSQL();

  CdTabela.Close;
  CdTabela.Open;
end;

procedure TFm_PdvCaixa.SbPesquisaCliClick(Sender: TObject);
begin
  try
    Fm_PesquisaCliente := TFm_PesquisaCliente.Create(self);
    Fm_PesquisaCliente.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaCliente);
    EdtCodCli.SetFocus;
  end;

end;

procedure TFm_PdvCaixa.SpbVoltarClick(Sender: TObject);
begin
   Panel1.Visible := False;
   BtnFinalizarVenda.Enabled := True;
end;

procedure TFm_PdvCaixa.SpbFuncioClick(Sender: TObject);
begin
  Try
    FrmProfissionais := TFrmProfissionais.Create(Self);
    FrmProfissionais.ShowModal;
  Finally
    FreeAndNil(FrmProfissionais);
  End;
end;

procedure TFm_PdvCaixa.BtnPesquisaProClick(Sender: TObject);
begin
  try
    Fm_PesquisaProdutos := TFm_PesquisaProdutos.Create(self);
    Fm_PesquisaProdutos.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaProdutos);
    DbCod.SetFocus;
  end;

end;

procedure TFm_PdvCaixa.ButFinalVendaClick(Sender: TObject);
var
  LucroDivi, valor, troco,ValorParcela : double;
  VTotal, VLucro : String;
  NLucroDivi, NovoVTotal, NovoVLucro, FormaPagamento,Parcela,NovoVParcela, Desconto, Acrescimo, TotalBruto : String;
  I,DiasPagamento, VenMax,Nparcela : integer;
begin
  CdTabela.First;
  while not CdTabela.Eof do
  begin
    if CdTabelaITV_PRODUTOS_FK.AsString <> '' then
    begin
      SQLPro.SQL.Text := 'UPDATE PRODUTOS SET PRO_QUANTIDADE = PRO_QUANTIDADE - ' + CdTabelaITV_QTD.AsString + ' WHERE PRO_COD = ' + CdTabelaITV_PRODUTOS_FK.AsString;
      SQLPro.ExecSQL;

      CdTabela.Next;
    end
    else
    begin
      CdTabela.Next;
    end;
  end;

  CDVenda.ApplyUpdates(0);
  CdTabela.ApplyUpdates(0);

  CdTabela.Close;

  CdTabela.Open;

  TotalBruto := (CdTabela.FieldByName('TOTAL').AsString);
  TotalBruto := ((TrocaVirgPPto(TotalBruto)));

    if EdtDesconto.Text <> ''  then
    begin
      Desconto := EdtDesconto.Text;

      VTotal := (CdTabela.FieldByName('TOTAL').AsString);

      VLucro := floatToStr(CdTabela.FieldByName('LUCRO').Value - (strToFloat(Desconto) * strToFloat(VTotal) / 100));
      NovoVLucro := ((TrocaVirgPPto(VLucro)));

      VTotal := floatToStr(strToFloat(VTotal) - (strToFloat(Desconto) * strToFloat(VTotal) / 100));
      NovoVTotal := ((TrocaVirgPPto(VTotal)));
    end
    else
    begin
      Desconto := '0';

      VTotal := (CdTabela.FieldByName('TOTAL').AsString);
      NovoVTotal := ((TrocaVirgPPto(VTotal)));

      VLucro := (CdTabela.FieldByName('LUCRO').AsString);
      NovoVLucro := ((TrocaVirgPPto(VLucro)));
    end;

    if EdtAcrescimo.Text <> ''  then
    begin
      Acrescimo := EdtAcrescimo.Text;

      VLucro := floatToStr(strToFloat(VLucro) + (strToFloat(Acrescimo) * strToFloat(VTotal) / 100));
      NovoVLucro := ((TrocaVirgPPto(VLucro)));

      VTotal := floatToStr(strToFloat(VTotal) + (strToFloat(Acrescimo) * strToFloat(VTotal) / 100));
      NovoVTotal := ((TrocaVirgPPto(VTotal)));
    end
    else
    begin
      Acrescimo := '0';
    end;

  if CboPagamento.ItemIndex = 0 then
  begin
    if Edit1.Text <> '' then
    begin
      valor := StrToFloat(Edit1.Text);
      Label11.Caption := FloatToStr(valor - StrToFloat(VTotal));
    end;
  end;

  if not ChbPrazo.Checked then
  begin
    if CboPagamento.ItemIndex = 0 then
    begin
      FormaPagamento := '''Dinheiro''';
    end
    else if CboPagamento.ItemIndex = 1 then
    begin
      FormaPagamento := ' ''Cartão'' ';
    end
    else
    begin
      FormaPagamento := '''Cheque''';
    end;

    SQLVenda.SQL.Clear;
    if EdtFuncio.Text <> '' then
    begin
      SQLVenda.SQL.text:='UPDATE VENDAS SET VEN_TOTALBRUTO = ' + TotalBruto + ', VEN_ACRESCIMO = ' + Acrescimo + ', VEN_DESCONTO = ' + Desconto + ', VEN_FUNCIONARIO_FK = ' + EdtFuncio.Text + ' ,VEN_STATUS = 1, VEN_FORMA_PAGAMENTO = ' + FormaPagamento + ', VEN_DATA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DtpVenData.Date)) + ',' + ' VEN_VALOR_TOTAL = '+ NovoVTotal + ',' + ' VEN_LUCRO_TOTAL = '+ NovoVLucro + ',' + 'VEN_CLIENTES_FK = ' + EdtCodCli.Text +' WHERE VEN_COD = (SELECT MAX(VEN_COD) FROM VENDAS)';
    end
    else
    begin
      SQLVenda.SQL.text:='UPDATE VENDAS SET VEN_TOTALBRUTO = ' + TotalBruto + ', VEN_ACRESCIMO = ' + Acrescimo + ', VEN_DESCONTO = ' + Desconto + ', VEN_STATUS = 1, VEN_FORMA_PAGAMENTO = ' + FormaPagamento + ', VEN_DATA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DtpVenData.Date)) + ',' + ' VEN_VALOR_TOTAL = '+ NovoVTotal + ',' + ' VEN_LUCRO_TOTAL = '+ NovoVLucro + ',' + 'VEN_CLIENTES_FK = ' + EdtCodCli.Text +' WHERE VEN_COD = (SELECT MAX(VEN_COD) FROM VENDAS)';
    end;
    SQLVenda.ExecSQL;
  end
  else
  begin
    if CboPagamento.ItemIndex = 0 then
    begin
      FormaPagamento := '''Dinheiro''';
    end
    else if CboPagamento.ItemIndex = 1 then
    begin
      FormaPagamento := '''Cartão''';
    end
    else
    begin
      FormaPagamento := '''Cheque''';
    end;

    SQLVenda.SQL.Clear;
    if EdtFuncio.Text <> '' then
    begin
      SQLVenda.SQL.text:='UPDATE VENDAS SET VEN_TOTALBRUTO = ' + TotalBruto + ', VEN_ACRESCIMO = ' + Acrescimo + ', VEN_DESCONTO = ' + Desconto + ', VEN_FUNCIONARIO_FK = ' + EdtFuncio.Text + ' , VEN_STATUS = 2, VEN_FORMA_PAGAMENTO = ' + FormaPagamento + ', VEN_DATA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DtpVenData.Date)) + ',' +
      ' VEN_VALOR_TOTAL = '+ NovoVTotal + ',' + ' VEN_LUCRO_TOTAL = '+ NovoVLucro + ',' + 'VEN_CLIENTES_FK = ' + EdtCodCli.Text +' WHERE VEN_COD = (SELECT MAX(VEN_COD) FROM VENDAS)';
    end
    else
    begin
      SQLVenda.SQL.text:='UPDATE VENDAS SET VEN_TOTALBRUTO = ' + TotalBruto + ', VEN_ACRESCIMO = ' + Acrescimo + ', VEN_DESCONTO = ' + Desconto + ', VEN_STATUS = 2, VEN_FORMA_PAGAMENTO = ' + FormaPagamento + ', VEN_DATA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DtpVenData.Date)) + ',' +
      ' VEN_VALOR_TOTAL = '+ NovoVTotal + ',' + ' VEN_LUCRO_TOTAL = '+ NovoVLucro + ',' + 'VEN_CLIENTES_FK = ' + EdtCodCli.Text +' WHERE VEN_COD = (SELECT MAX(VEN_COD) FROM VENDAS)';
    end;
    SQLVenda.ExecSQL;

    DiasPagamento := 0;
    Nparcela      := 0;

    ValorParcela := (StrToFloat(VTotal)/CDVendaVEN_NUMERO_PARCELAS.AsInteger);
    NovoVParcela := FloatToStr(ValorParcela);
    NovoVParcela := ((TrocaVirgPPto(NovoVParcela)));

    LucroDivi := StrToFloat(VLucro) / CDVendaVEN_NUMERO_PARCELAS.AsInteger;
    NLucroDivi := ((TrocaVirgPPto(FloatToStr(LucroDivi))));

    for I := 1 to CDVendaVEN_NUMERO_PARCELAS.AsInteger do
    begin
      Nparcela := Nparcela + 1;

      Parcela := inttostr(Nparcela) + '/' + inttostr(CDVendaVEN_NUMERO_PARCELAS.AsInteger);

      SQLCodVenda.Close;
      SQLCodVenda.Open;

      VenMax := SQLCodVendaMAX.AsInteger;

      SQLVenda.SQL.Clear;
      SQLVenda.SQL.text:='INSERT INTO CONTAS_RECEBER (CONR_VENDAS_FK, CONR_PARCELA, CONR_VALOR_PARCELA, CONR_LUCRO, CONR_DATA_RECEBER, CONR_SITUACAO) VALUES(' + inttostr(VenMax) + ', ' +
      '''' + Parcela + '''' + ', ' +  NovoVParcela  + ', ' +  NLucroDivi  + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd', (DtpDataReceber.Date + DiasPagamento))) + ', ' + '''' + 'A receber' + '''' + ')';
      SQLVenda.ExecSQL;

      DiasPagamento := DiasPagamento + 30;
    end;

  end;

  CdTabela.Close;
  CdTabela.Open;

  BtNfe.Enabled            := True;
  DbCod.Enabled            := False;
  DbProDesc.Enabled        := False;
  DbQtd.Enabled            := False;
  DbPreco.Enabled          := False;
  DbSubTotal.Enabled       := False;
  DBGrid1.Enabled          := False;
  BtnFinalizarVenda.Enabled:= False;
  BtnCancelVenda.Enabled   := False;
  BtnIniVenda.Enabled      := True;
  BtnAdd.Enabled           := False;
  BtnExcluir.Enabled       := False;
  BtnPesquisaPro.Enabled   := False;
  EdtCodCli.Enabled        := False;
  SbPesquisaCli.Enabled    := False;
  ButFinalVenda.Enabled    := False;
  EdtFuncio.Enabled        := False;
  SpbFuncio.Enabled        := False;
  DtpDataReceber.Enabled   := False;
  DbeParcelas.Enabled      := False;
  CboPagamento.Enabled     := False;
  ChbVista.Enabled         := False;
  ChbPrazo.Enabled         := False;
  Edit1.Enabled            := False;
  EdtDesconto.Enabled      := False;
  EdtAcrescimo.Enabled     := False;

  SpbVoltar.Enabled := False;

  AbreSqlVenda;

  if MessageDlg('Deseja Imprimir o Recibo de venda ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
  begin
    if DataModule1.CdEmpEMP_IMP_A4.AsInteger = 1 then
    begin
      try
        FrmReciboVenda := TFrmReciboVenda.Create(self);
        FrmReciboVenda.RlrRecibo.Preview;
      finally
        FreeAndNil(FrmReciboVenda);
      end;
    end
    else
    begin
      try
        FrmReciboVendaImpTermica := TFrmReciboVendaImpTermica.Create(self);
        FrmReciboVendaImpTermica.RlrRecibo.Preview;
      finally
        FreeAndNil(FrmReciboVendaImpTermica);
      end;
    end;
  end;

  Application.MessageBox('Venda Finalizada Com Sucesso', 'Salvo', mb_iconinformation + mb_ok);

end;

function TFm_PdvCaixa.TrocaVirgPPto(Valor: string): String;
var i:integer;
begin
    if Valor <>'' then begin
        for i := 0 to Length(Valor) do begin
            if Valor[i]=',' then Valor[i]:='.';

        end;
     end;
     Result := valor;
end;

procedure TFm_PdvCaixa.VerificaItens;
begin
  CdTabela.Edit;
  if DbCod.Text <> '' then
  begin
    CdPro.Close;
    SQLPro.SQL.Text := ' SELECT ' +
                       '  PRO_DESCRICAO, ' +
                       '  PRO_QUANTIDADE, ' +
                       '  PRO_VALOR_SAIDA ' +
                       ' FROM PRODUTOS '    +
                       ' WHERE PRO_COD =  ' + DbCod.Text +
                       ' AND PRO_STATUS = 1';
    CdPro.Open;

    CdTabelaITV_QTD.AsInteger := 1;
  end;

  if not (CdPro.IsEmpty) and (DbCod.Text <> '')then
  begin
     CdTabelaITV_PRO_DESCRICAO.AsString := CdProPRO_DESCRICAO.AsString;
     CdTabelaITV_PRECO.AsFloat    := CdProPRO_VALOR_SAIDA.AsFloat;

     CdTabela.FieldByName('ITV_SUBTOTAL').AsFloat := CdTabela.FieldByName('ITV_PRECO').AsFloat * CdTabela.FieldByName('ITV_QTD').AsInteger;
  end
  else if DbCod.Text <> '' then
  begin
    Application.MessageBox('Produto não Cadastrado', 'Verifique !', mb_iconinformation + mb_ok);
    CdTabela.Cancel;
    //CDtabela.Append;
  end;

end;

end.
