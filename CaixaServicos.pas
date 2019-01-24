unit CaixaServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data_Module, Data.FMTBcd, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, PesquisaCliente, PesquisaServico,
  PdvCaixa, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Funcoes,
  Vcl.Imaging.pngimage;

type
  TFm_CaixaServicos = class(TForm)
    Image1: TImage;
    DsCaixa: TDataSource;
    CdCaixa: TClientDataSet;
    DpCaixa: TDataSetProvider;
    SQLCaixa: TSQLQuery;
    DbeSer: TDBEdit;
    DbeSerDesc: TDBEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    BtnExcluir: TButton;
    BtnAdd: TButton;
    ImageList1: TImageList;
    BtnCancelVenda: TButton;
    BtnFinalizarVenda: TButton;
    BtnIniVenda: TButton;
    DsUsuario: TDataSource;
    CdCli: TClientDataSet;
    DpCli: TDataSetProvider;
    SQLCli: TSQLQuery;
    SQLSer: TSQLQuery;
    DpSer: TDataSetProvider;
    CdSer: TClientDataSet;
    SQLMax: TSQLQuery;
    SQLMaxMAX: TIntegerField;
    SQLTemp: TSQLQuery;
    CdCaixaTOTAL: TAggregateField;
    SQLCaixaCASE_COD: TIntegerField;
    SQLCaixaPRO_COD: TLargeintField;
    SQLCaixaCASE_COD_SERVICO: TIntegerField;
    SQLCaixaCASE_SERVICOS_FK: TIntegerField;
    SQLCaixaCASE_CLIENTE: TIntegerField;
    SQLCaixaCASE_DATA: TDateField;
    SQLCaixaCASE_STATUS: TSmallintField;
    SQLCaixaCASE_USUARIO_FK: TIntegerField;
    SQLCaixaCASE_SERVICO_TEMPO: TTimeField;
    SQLCaixaPSERV_QTD: TFloatField;
    SQLCaixaPRO_QUANTIDADE: TIntegerField;
    SQLCaixaCASE_SERVICO_VALOR: TFloatField;
    SQLCaixaCASE_SERVICO_DESC: TStringField;
    CdCaixaCASE_COD: TIntegerField;
    CdCaixaPRO_COD: TLargeintField;
    CdCaixaCASE_COD_SERVICO: TIntegerField;
    CdCaixaCASE_SERVICOS_FK: TIntegerField;
    CdCaixaCASE_CLIENTE: TIntegerField;
    CdCaixaCASE_DATA: TDateField;
    CdCaixaCASE_STATUS: TSmallintField;
    CdCaixaCASE_USUARIO_FK: TIntegerField;
    CdCaixaCASE_SERVICO_TEMPO: TTimeField;
    CdCaixaPSERV_QTD: TFloatField;
    CdCaixaPRO_QUANTIDADE: TIntegerField;
    CdCaixaCASE_SERVICO_VALOR: TFloatField;
    CdCaixaCASE_SERVICO_DESC: TStringField;
    SQLSerSERV_COD: TIntegerField;
    SQLSerSERV_DESCRICAO: TStringField;
    SQLSerSERV_TEMPO: TTimeField;
    SQLSerSERV_VALOR: TFloatField;
    CdSerSERV_COD: TIntegerField;
    CdSerSERV_DESCRICAO: TStringField;
    CdSerSERV_TEMPO: TTimeField;
    CdSerSERV_VALOR: TFloatField;
    CdCliCLI_COD: TIntegerField;
    CdCliCLI_NOME: TStringField;
    SQLCliCLI_COD: TIntegerField;
    SQLCliCLI_NOME: TStringField;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    SpbVoltar: TSpeedButton;
    Label15: TLabel;
    Label8: TLabel;
    SbPesquisaCli: TSpeedButton;
    Edit1: TEdit;
    CboPagamento: TComboBox;
    ButFinalVenda: TButton;
    ChbVista: TCheckBox;
    ChbPrazo: TCheckBox;
    DtpDataReceber: TDateTimePicker;
    EdtCli: TEdit;
    Action6: TAction;
    SQLCaixaCASE_NUMERO_PARCELAS: TSmallintField;
    CdCaixaCASE_NUMERO_PARCELAS: TSmallintField;
    EdtParcela: TEdit;
    Label3: TLabel;
    DBText2: TDBText;
    SQLCaixaTOTALPRODUTO: TFloatField;
    CdCaixaTOTALPRODUTO: TFloatField;
    CdCaixaVALORPRO: TAggregateField;
    SQLCaixaPRO_VALOR_SAIDA: TFloatField;
    CdCaixaPRO_VALOR_SAIDA: TFloatField;
    SQLTotalLucro: TSQLQuery;
    SQLTotalLucroSUM: TFloatField;
    Label16: TLabel;
    Image6: TImage;
    DBText1: TDBText;
    Label1: TLabel;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    EdtProf: TEdit;
    CboSTATUSSERVICO: TComboBox;
    Label6: TLabel;
    Label17: TLabel;
    DtpSerData: TDateTimePicker;
    Label7: TLabel;
    PanObs: TPanel;
    MemObs: TMemo;
    SpeedButton4: TSpeedButton;
    EdtDesconto: TEdit;
    EdtAcrescimo: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    CdUsua: TClientDataSet;
    DpUsua: TDataSetProvider;
    SQLUsua: TSQLQuery;
    SQLUsuaUSU_USUARIO: TStringField;
    SQLUsuaUSU_SENHA: TStringField;
    SQLUsuaUSU_PRIVILEGIO: TStringField;
    SQLUsuaUSU_COMISSAO: TFloatField;
    SQLUsuaUSU_COD: TIntegerField;
    CdUsuaUSU_USUARIO: TStringField;
    CdUsuaUSU_SENHA: TStringField;
    CdUsuaUSU_PRIVILEGIO: TStringField;
    CdUsuaUSU_COMISSAO: TFloatField;
    CdUsuaUSU_COD: TIntegerField;
    SQLCaixaPRO_VALOR_ENTRADA: TFloatField;
    CdCaixaPRO_VALOR_ENTRADA: TFloatField;
    DsOperador: TDataSource;
    SQLAux: TSQLQuery;
    DsAux: TDataSource;
    CdAux: TClientDataSet;
    DpAux: TDataSetProvider;
    SQLAuxPSERV_COD: TIntegerField;
    SQLAuxPSERV_PRODUTOS_FK: TLargeintField;
    SQLAuxPSERV_SERVICOS_FK: TIntegerField;
    SQLAuxPSERV_PRODUTO: TStringField;
    SQLAuxPSERV_QTD: TFloatField;
    CdAuxPSERV_COD: TIntegerField;
    CdAuxPSERV_PRODUTOS_FK: TLargeintField;
    CdAuxPSERV_SERVICOS_FK: TIntegerField;
    CdAuxPSERV_PRODUTO: TStringField;
    CdAuxPSERV_QTD: TFloatField;
    SQLAuxPRO_FORNECEDOR_FK: TIntegerField;
    SQLAuxPRO_DESCRICAO: TStringField;
    SQLAuxPRO_QUANTIDADE: TIntegerField;
    SQLAuxPRO_VALOR_ENTRADA: TFloatField;
    SQLAuxPRO_VALOR_SAIDA: TFloatField;
    SQLAuxPRO_OBS: TStringField;
    SQLAuxPRO_VENCI: TDateField;
    SQLAuxPRO_CODIGO_EAN13: TLargeintField;
    SQLAuxPRO_NCM: TIntegerField;
    SQLAuxPRO_TIPO_CFOP: TIntegerField;
    SQLAuxPRO_UNIDADE: TStringField;
    SQLAuxPRO_ALIQUOTA_ICMS: TFloatField;
    SQLAuxPRO_BASE_ST: TFloatField;
    SQLAuxPRO_FOTO: TStringField;
    SQLAuxPRO_COD: TLargeintField;
    SQLAuxPRO_STATUS: TIntegerField;
    CdAuxPRO_FORNECEDOR_FK: TIntegerField;
    CdAuxPRO_DESCRICAO: TStringField;
    CdAuxPRO_QUANTIDADE: TIntegerField;
    CdAuxPRO_VALOR_ENTRADA: TFloatField;
    CdAuxPRO_VALOR_SAIDA: TFloatField;
    CdAuxPRO_OBS: TStringField;
    CdAuxPRO_VENCI: TDateField;
    CdAuxPRO_CODIGO_EAN13: TLargeintField;
    CdAuxPRO_NCM: TIntegerField;
    CdAuxPRO_TIPO_CFOP: TIntegerField;
    CdAuxPRO_UNIDADE: TStringField;
    CdAuxPRO_ALIQUOTA_ICMS: TFloatField;
    CdAuxPRO_BASE_ST: TFloatField;
    CdAuxPRO_FOTO: TStringField;
    CdAuxPRO_COD: TLargeintField;
    CdAuxPRO_STATUS: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnIniVendaClick(Sender: TObject);
    procedure BtnFinalizarVendaClick(Sender: TObject);
    procedure BtnCancelVendaClick(Sender: TObject);
    procedure DbeSerExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure ButFinalVendaClick(Sender: TObject);
    procedure ChbVistaClick(Sender: TObject);
    procedure ChbPrazoClick(Sender: TObject);
    procedure SpbVoltarClick(Sender: TObject);
    procedure SbPesquisaCliClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbreSQLServico;
    procedure AbreSQLCaixa;
    procedure LimpaServicos;
  public
    { Public declarations }
    var CodServ : integer;
  end;

var
  Fm_CaixaServicos: TFm_CaixaServicos;

implementation

{$R *.dfm}

uses ReciboSer, Profissionais;

procedure TFm_CaixaServicos.AbreSQLCaixa;
begin
  CdCaixa.Close;
  SQLCaixa.SQL.Clear;
  SQLCaixa.SQL.Text :=  'SELECT '  +
                        '  CASE_COD,  '   +
                        '  PRO_COD,  '    +
                        '  CASE_COD_SERVICO,   '  +
                        '  CASE_SERVICOS_FK,  '  +
                        '  CASE_CLIENTE,     '    +
                        '  CASE_STATUS,     '     +
                        '  CASE_USUARIO_FK,  '    +
                        '  CASE_DATA,  '          +
                        '  CASE_NUMERO_PARCELAS, ' +
                        '  CASE_SERVICO_TEMPO, '  +
                        '  PSERV_QTD, '           +
                        '  PRO_QUANTIDADE,  '     +
                        '  PRO_VALOR_ENTRADA, '   +
                        '  PRO_VALOR_SAIDA, ' +
                        '  CASE_SERVICO_VALOR, '  +
                        '  CASE_SERVICO_DESC,  '   +
                        '  PRO_VALOR_SAIDA * PSERV_QTD as TOTALPRODUTO ' +
                        '  FROM CAIXASERVICOS  '  +
                        '  LEFT JOIN SERVICOS  '   +
                        '  ON CASE_SERVICOS_FK = SERV_COD  '  +
                        '  LEFT JOIN PRODUTOSERVICOS  '  +
                        '  ON PSERV_SERVICOS_FK = SERV_COD  '  +
                        '  LEFT JOIN PRODUTOS  ' +
                        '  ON PSERV_PRODUTOS_FK = PRO_COD  ' +
                        'WHERE CASE_STATUS = 0  ';

  CdCaixa.Open;
end;

procedure TFm_CaixaServicos.AbreSQLServico;
begin
  CdSer.Close;
  SQLSer.SQL.Text := ' SELECT ' +
                     '   SERV_COD, ' +
                     '   SERV_DESCRICAO, '  +
                     '   SERV_TEMPO, ' +
                     '   SERV_VALOR '  +
                     ' FROM SERVICOS '  +
                     ' WHERE SERV_COD = ' + CdCaixaCASE_SERVICOS_FK.AsString;
  CdSer.Open;

  CdCaixa.Edit;
  CdCaixaCASE_SERVICO_DESC.AsString := CdSerSERV_DESCRICAO.AsString;
  CdCaixaCASE_SERVICO_TEMPO.AsDateTime := CdSerSERV_TEMPO.AsDateTime;
  CdCaixaCASE_SERVICO_VALOR.AsFloat := CdSerSERV_VALOR.AsFloat;
  CdCaixaCASE_COD_SERVICO.AsInteger := CodServ;
  CdCaixaCASE_STATUS.AsInteger := 0;
  CdCaixa.Post;

end;

procedure TFm_CaixaServicos.BtnAddClick(Sender: TObject);
begin
    CdCaixa.Edit;
    CdCaixa.Post;

    AbreSQLServico;
    CdCaixa.Append;
end;

procedure TFm_CaixaServicos.BtnCancelVendaClick(Sender: TObject);
begin
  CdCaixa.Cancel;

  EdtCli.Enabled            := False;
  SpeedButton1.Enabled      := False;
  DbeSerDesc.Enabled        := False;
  DbeSer.Enabled            := False;
  DBGrid1.Enabled           := False;
  BtnFinalizarVenda.Enabled := False;
  BtnCancelVenda.Enabled    := False;
  BtnIniVenda.Enabled       := True;
  BtnAdd.Enabled            := False;
  BtnExcluir.Enabled        := False;

  CdCaixa.Close;

  EdtCli.Clear;

end;

procedure TFm_CaixaServicos.BtnExcluirClick(Sender: TObject);
begin
  CdCaixa.Delete;
end;

procedure TFm_CaixaServicos.BtnFinalizarVendaClick(Sender: TObject);
begin
  if not (CdCaixa.IsEmpty) and (CdCaixaTOTAL.Value <> null)  then
  begin
    Panel1.Visible := True;
    BtnFinalizarVenda.Enabled := False;
    ButFinalVenda.Enabled := True;
    SpbVoltar.Enabled := True;
    SbPesquisaCli.Enabled := True;
    SbPesquisaCli.Enabled := True;
    GroupBox1.Visible := True;
    Edit1.SetFocus;
    if ChbVista.Checked then
    begin
      if Datamodule1.CdEmpEMP_SERV_DESCONTO_AVISTA.AsString <> '' then
      begin
        EdtDesconto.Text := Datamodule1.CdEmpEMP_SERV_DESCONTO_AVISTA.AsString;
      end;
    end;
  end
  else
  begin
    Application.MessageBox('Adicione serviços antes de finalizar', 'Verificar', mb_iconinformation + mb_ok);
  end;
end;

procedure TFm_CaixaServicos.BtnIniVendaClick(Sender: TObject);
begin
  AbreSQLCaixa;

  SQLMax.Close;
  SQLMax.Open;
  CodServ := SQLMaxMAX.AsInteger + 1;

  EdtCli.Enabled           := True;
  SpeedButton1.Enabled     := True;
  DbeSerDesc.Enabled       := True;
  DbeSer.Enabled           := True;
  DBGrid1.Enabled          := True;
  BtnFinalizarVenda.Enabled:= True;
  BtnCancelVenda.Enabled   := True;
  BtnIniVenda.Enabled      := False;
  BtnAdd.Enabled           := True;
  BtnExcluir.Enabled       := True;
  Panel1.Visible := False;
  DbeSer.SetFocus;
  ChbVista.Enabled        := True;
  ChbPrazo.Enabled        := True;
  DtpDataReceber.Enabled  := True;
  EdtParcela.Enabled      := True;
  Edit1.Enabled           := True;
  EdtDesconto.Enabled     := True;
  EdtAcrescimo.Enabled    := True;
  EdtProf.Enabled         := True;
  DtpSerData.Enabled      := True;
  CboSTATUSSERVICO.Enabled:= True;
  CboPagamento.Enabled    := True;
  Label11.Caption := '0,00';
  ChbVista.Checked := True;
  DtpDataReceber.Date := Date;
  EdtParcela.Text := '1';
  Edit1.Clear;
  EdtDesconto.Clear;
  EdtAcrescimo.Clear;
  EdtCli.Clear;
  MemObs.Clear;
  EdtProf.Clear;
  DtpSerData.Date := Date;
  CboSTATUSSERVICO.ItemIndex := 2;
  CboPagamento.ItemIndex := 0;
end;

procedure TFm_CaixaServicos.ButFinalVendaClick(Sender: TObject);
var Query : TSQLQuery;
cliente, VTotal, NovoVTotal, FormaPagamento, NLucroDivi, NovoVLucro,Parcela,NovoVParcela, VLucro, LUCROstr, StatusServico, Desconto, Acrescimo : String;
valor : Double;
LucroDivi, troco,ValorParcela, Valorporcentagem, Nvalorporcentagem, LUCRO, Total : double;
I,DiasPagamento, VenMax,Nparcela : integer;
begin
  if EdtProf.Text = '' then
  begin
    EdtProf.SetFocus;
    Application.MessageBox('Adicione um profissional para o serviço', 'Verifique', mb_iconinformation + mb_ok);
  end
  else if not (CdCaixa.IsEmpty) then
  begin
    CdCaixa.First;

    Total := CdCaixaTOTAL.Value;

    CdUsua.Close;
    SQLUsua.SQL.Text := 'select * from usuario where USU_COD = ' + EdtProf.Text;
    SQLUsua.ExecSQL();
    CdUsua.Open;

    Valorporcentagem  := CdUsuaUSU_COMISSAO.AsFloat/100;
    Nvalorporcentagem := CdCaixaTOTAL.Value - (CdCaixaTOTAL.Value * Valorporcentagem);
    while not CdCaixa.Eof do
    begin
      if EdtDesconto.Text <> ''  then
      begin
        Desconto := EdtDesconto.Text;
        CdCaixa.Edit;
        CdCaixaCASE_SERVICO_VALOR.AsFloat := CdCaixaCASE_SERVICO_VALOR.AsFloat - (strToFloat(Desconto) * CdCaixaCASE_SERVICO_VALOR.AsFloat / 100);
      end
      else
      begin
        Desconto := '0';
      end;

      if EdtAcrescimo.Text <> ''  then
      begin
        Acrescimo := EdtAcrescimo.Text;
        CdCaixa.Edit;
        CdCaixaCASE_SERVICO_VALOR.AsFloat := CdCaixaCASE_SERVICO_VALOR.AsFloat + (strToFloat(Acrescimo) * CdCaixaCASE_SERVICO_VALOR.AsFloat / 100);
      end
      else
      begin
        Acrescimo := '0';
      end;

      CdCaixa.Next;
    end;

    CdCaixa.ApplyUpdates(0);
    CdCaixa.Refresh;

    CdCaixa.Close;
    CdCaixa.Open;
    if not CdCaixa.IsEmpty then
    begin
        CdCaixa.First;
        while not CdCaixa.Eof do
        begin
          if CdCaixaPRO_COD.AsString <> '' then
          begin
              SQLTemp.SQL.Text := 'update PRODUTOS set PRO_QUANTIDADE = PRO_QUANTIDADE - ' + CdCaixaPSERV_QTD.AsString + ' WHERE PRO_COD = ' + CdCaixaPRO_COD.AsString;
              SQLTemp.ExecSQL;
              CdCaixa.Next;
          end
          else
          begin
            CdCaixa.Next;
          end;
        end;

      if EdtDesconto.Text <> ''  then
      begin
        if CdCaixaVALORPRO.Value <> Null then
        begin
          LUCRO := Nvalorporcentagem - CdCaixaVALORPRO.Value;
          LUCRO := LUCRO - (strToFloat(Desconto) * Total / 100);
        end
        else
        begin
          LUCRO := Nvalorporcentagem;
          LUCRO := LUCRO - (strToFloat(Desconto) * Total / 100);
        end;
      end
      else
      begin
        if CdCaixaVALORPRO.Value <> Null then
        begin
          LUCRO := Nvalorporcentagem - CdCaixaVALORPRO.Value;
        end
        else
        begin
          LUCRO := Nvalorporcentagem;
        end;
      end;

      if EdtAcrescimo.Text <> ''  then
      begin
        if CdCaixaVALORPRO.Value <> Null then
        begin
          LUCRO := LUCRO + Nvalorporcentagem - CdCaixaVALORPRO.Value;
          LUCRO := LUCRO + (strToFloat(Acrescimo) * Total / 100);
        end
        else
        begin
          LUCRO := LUCRO + Nvalorporcentagem;
          LUCRO := LUCRO + (strToFloat(Acrescimo) * Total / 100);
        end;
      end;

      if EdtCli.Text <> '' then
      begin
        cliente := EdtCli.Text;
      end
      else
      begin
        cliente := '0'
      end;

      VTotal := (CdCaixaTOTAL.AsString);
      NovoVTotal := ((TrocaVirgPPto(VTotal)));

      if CboPagamento.ItemIndex = 0 then
      begin
        if Edit1.Text <> '' then
        begin
          valor := StrToFloat(Edit1.Text);
          Label11.Caption := FloatToStr(valor - Total);
        end;
      end;

      LUCROstr := ((TrocaVirgPPto(FloatToStr(LUCRO))));

      if CboSTATUSSERVICO.ItemIndex = 0 then
      begin
        StatusServico := '''Não Realizado''';
      end
      else if CboSTATUSSERVICO.ItemIndex = 1 then
      begin
        StatusServico := '''Sendo Realizado''';
      end
      else
      begin
        StatusServico := '''Serviço Concluído''';
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

        SQLCaixa.SQL.Text := 'UPDATE CAIXASERVICOS SET CASE_ACRESCIMO = ' + Acrescimo + ', CASE_DESCONTO = ' + Desconto + ', CASE_OBS = ' + '''' + MemObs.Text + '''' + ' ,CASE_STATUSSERVICO = ' + StatusServico + ' ,CASE_DATA = '+ QuotedStr(FormatDateTime('yyyy-mm-dd', DtpSerData.Date)) + ', CASE_LUCRO = ' + LUCROstr + ', CASE_FORMA_PAGAMENTO = ' + FormaPagamento +  ' ,CASE_STATUS = 1, CASE_CLIENTE = ' +  cliente + ', CASE_USUARIO_FK = ' + EdtProf.Text  + ' WHERE CASE_COD_SERVICO = ' + CdCaixaCASE_COD_SERVICO.AsString;
        SQLCaixa.ExecSQL;
      end
      else
      begin

        if (EdtParcela.Text = '') or (EdtParcela.Text = '0')  then
        begin
          EdtParcela.Text := '1';
        end;

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

        LUCROstr := ((TrocaVirgPPto(FloatToStr(LUCRO))));

        SQLCaixa.SQL.Text := 'UPDATE CAIXASERVICOS SET CASE_ACRESCIMO = ' + Acrescimo + ', CASE_DESCONTO = ' + Desconto + ', CASE_OBS = ' + '''' + MemObs.Text + '''' + ' ,CASE_STATUSSERVICO = ' + StatusServico + ' ,CASE_DATA = '+ QuotedStr(FormatDateTime('yyyy-mm-dd', DtpSerData.Date)) + ', CASE_LUCRO = ' + LUCROstr + ', CASE_FORMA_PAGAMENTO = ' + FormaPagamento+ ',CASE_NUMERO_PARCELAS = ' + EdtParcela.Text + ' ,CASE_STATUS = 2, CASE_CLIENTE = ' +  cliente + ', CASE_USUARIO_FK = ' + EdtProf.Text  + ' WHERE CASE_COD_SERVICO = ' + CdCaixaCASE_COD_SERVICO.AsString;
        SQLCaixa.ExecSQL;

        DiasPagamento := 0;
        Nparcela      := 0;

        ValorParcela := (CdCaixaTOTAL.Value/StrToInt(EdtParcela.Text));
        NovoVParcela := FloatToStr(ValorParcela);
        NovoVParcela := ((TrocaVirgPPto(NovoVParcela)));

        LucroDivi := LUCRO / StrToInt(EdtParcela.Text);
        NLucroDivi := ((TrocaVirgPPto(FloatToStr(LucroDivi))));

        for I := 1 to StrToInt(EdtParcela.Text) do
        begin
          Nparcela := Nparcela + 1;

          Parcela := inttostr(Nparcela) + '/' + EdtParcela.Text;

          SQLTemp.SQL.Clear;
          SQLTemp.SQL.text:='INSERT INTO CONTAS_RECEBER (CONR_CAIXASER_FK, CONR_CXSERVICOS, CONR_PARCELA, CONR_VALOR_PARCELA, CONR_LUCRO, CONR_DATA_RECEBER, CONR_SITUACAO) VALUES(' + CdCaixaCASE_COD.AsString + ', ' + CdCaixaCASE_COD_SERVICO.AsString + ', ' +
          '''' + Parcela + '''' + ', ' +  NovoVParcela  + ', ' +  NLucroDivi  + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd', (DtpDataReceber.Date + DiasPagamento))) + ', ' + '''' + 'A receber' + '''' + ')';
          SQLTemp.ExecSQL;

          DiasPagamento := DiasPagamento + 30;
        end;


      end;

      EdtCli.Enabled            := False;
      SpeedButton1.Enabled      := False;
      DbeSerDesc.Enabled        := False;
      DbeSer.Enabled            := False;
      DBGrid1.Enabled           := False;
      BtnFinalizarVenda.Enabled := False;
      BtnCancelVenda.Enabled    := False;
      BtnIniVenda.Enabled       := True;
      BtnAdd.Enabled            := False;
      BtnExcluir.Enabled        := False;
      ChbVista.Enabled          := False;
      ChbPrazo.Enabled          := False;
      DtpDataReceber.Enabled    := False;
      EdtParcela.Enabled        := False;
      Edit1.Enabled             := False;
      EdtDesconto.Enabled       := False;
      EdtAcrescimo.Enabled      := False;
      EdtProf.Enabled           := False;
      DtpSerData.Enabled        := False;
      CboSTATUSSERVICO.Enabled  := False;
      CboPagamento.Enabled      := False;
      SbPesquisaCli.Enabled     := False;
      ButFinalVenda.Enabled     := False;
      SpbVoltar.Enabled := False;

      CdCaixa.Close;

      if MessageDlg('Deseja Imprimir a Ordem de Serviço ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
      begin
        try
          FrmReciboSer := TFrmReciboSer.Create(self);
          FrmReciboSer.RlrRecibo.Preview;
        finally
          FreeAndNil(FrmReciboSer);
        end;

      end;

      Application.MessageBox('Ordem de Serviço Finalizada Com Sucesso', 'Salvo', mb_iconinformation + mb_ok);
    end
    else
    begin
      Application.MessageBox('Adicione Serviços a Ordem de Serviço Antes de Finalizar', 'Verifique !', mb_iconinformation + mb_ok);
    end;
  end;
end;

procedure TFm_CaixaServicos.ChbPrazoClick(Sender: TObject);
begin
  DtpDataReceber.Visible := True;
  Label14.Visible := True;

  EdtParcela.Visible := True;
  Label15.Visible := True;
  ChbVista.Checked := False;

  if ChbPrazo.Checked then
  begin
    if Datamodule1.CdEmpEMP_SERV_ACRESCIMO_APRAZO.AsString <> '' then
    begin
      EdtAcrescimo.Text := Datamodule1.CdEmpEMP_SERV_ACRESCIMO_APRAZO.AsString;
      EdtDesconto.Text := '';
    end;
  end;
end;

procedure TFm_CaixaServicos.ChbVistaClick(Sender: TObject);
begin
  DtpDataReceber.Visible := False;
  Label14.Visible := False;

  EdtParcela.Visible := False;
  Label15.Visible := False;

  ChbPrazo.Checked := False;

  if ChbVista.Checked then
  begin
    if Datamodule1.CdEmpEMP_SERV_DESCONTO_AVISTA.AsString <> '' then
    begin
      EdtDesconto.Text := Datamodule1.CdEmpEMP_SERV_DESCONTO_AVISTA.AsString;
      EdtAcrescimo.Text := '';
    end;
  end;
end;

procedure TFm_CaixaServicos.DbeSerExit(Sender: TObject);
begin
  if DbeSer.Text <> '' then
  begin
    CdSer.Close;

    SQLSer.SQL.Clear;
    SQLSer.SQL.Text := 'SELECT ' +
                       ' SERV_COD, '  +
                       ' SERV_DESCRICAO, '  +
                       ' SERV_TEMPO, ' +
                       ' SERV_VALOR '  +
                       ' FROM SERVICOS ' +
                       ' WHERE SERV_COD = ' + DbeSer.Text;

    CdSer.Open;

    if CdSer.IsEmpty then
    begin
      Application.MessageBox('Serviço Não Cadastrado', 'Verifique !', mb_iconinformation + mb_ok);
      CdCaixa.Cancel;
    end
    else
    begin
      CdCaixa.Edit;
      CdCaixaCASE_SERVICO_DESC.AsString := CdSerSERV_DESCRICAO.AsString;
    end;
  end;

    {CdCaixa.First;
    while not CdCaixa.Eof do
    begin
      if CdCaixaPSERV_QTD.AsInteger <> 0 then
      begin
        if CdCaixaPRO_QUANTIDADE.AsInteger <= 0 then
        begin
          CdCaixa.Cancel;
          ShowMessage('Não há produtos em estoque para realizar este serviço: '+ CdCaixaCASE_SERVICO_DESC.AsString);
        end;
      end;
      CdCaixa.Next;
    end;    }
    if DbeSer.Text <> '' then
    begin
      CdAux.Close;
      SQLAux.SQL.Text := ' select * FROM PRODUTOSERVICOS LEFT JOIN PRODUTOS ' +
      ' ON PSERV_PRODUTOS_FK = PRO_COD WHERE PSERV_SERVICOS_FK = ' + DbeSer.Text;
      CdAux.Open;

      CdAux.First;
      while not CdAux.Eof do
      begin
        if NOT CdAuxPSERV_QTD.IsNull then
        begin
          if CdAuxPRO_QUANTIDADE.AsInteger <= 0 then
          begin
            CdCaixa.Cancel;
            ShowMessage('Não há produtos em estoque para realizar este serviço: '+ CdAuxPRO_DESCRICAO.AsString);
          end;
        end;
        CdAux.Next;
      end;
    end;

end;

procedure TFm_CaixaServicos.FormCreate(Sender: TObject);
begin
  CdCaixa.Close;
  CdCaixa.Open;

  Datamodule1.CdEmp.Close;
  Datamodule1.CdEmp.Open;

  DtpDataReceber.Date := Date;
  DtpSerData.Date := Date;

  LimpaServicos;
end;

procedure TFm_CaixaServicos.LimpaServicos;
begin
  SQLAux.SQL.Text := ' DELETE FROM CAIXASERVICOS WHERE CASE_STATUS = 0 ';
  SQLAux.ExecSQL();

  CdCaixa.Close;
  CdCaixa.Open;
end;

procedure TFm_CaixaServicos.SbPesquisaCliClick(Sender: TObject);
begin
  try
    Fm_PesquisaCliente := TFm_PesquisaCliente.Create(self);
    Fm_PesquisaCliente.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaCliente);
    EdtCli.SetFocus;
  end;
end;

procedure TFm_CaixaServicos.SpbVoltarClick(Sender: TObject);
begin
   Panel1.Visible := False;
   BtnFinalizarVenda.Enabled := True;
end;

procedure TFm_CaixaServicos.SpeedButton1Click(Sender: TObject);
begin
  try
    Fm_PesquisaServico := TFm_PesquisaServico.Create(self);
    Fm_PesquisaServico.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaServico);
    DbeSer.SetFocus;
  end;
end;

procedure TFm_CaixaServicos.SpeedButton2Click(Sender: TObject);
begin
  try
    Fm_PesquisaCliente := TFm_PesquisaCliente.Create(self);
    Fm_PesquisaCliente.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaCliente);
    EdtCli.SetFocus;
  end;
end;

procedure TFm_CaixaServicos.SpeedButton3Click(Sender: TObject);
begin
  Try
    FrmProfissionais := TFrmProfissionais.Create(Self);
    FrmProfissionais.ShowModal;
  Finally
    FreeAndNil(FrmProfissionais);
  End;
end;

procedure TFm_CaixaServicos.SpeedButton4Click(Sender: TObject);
begin
  if PanObs.Visible = True then
  begin
    PanObs.Visible := False;
  end
  else
  begin
    PanObs.Visible := True;
  end;
end;

end.
