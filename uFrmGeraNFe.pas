unit uFrmGeraNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids,
  DBGrids, FMTBcd, DB, DBClient, Provider, SqlExpr, pcnConversao;

type
  TFrmGeraNFe = class(TFrmPadrao)
    GroupBox1: TGroupBox;
    RadioOpcao: TRadioGroup;
    EdtDados: TEdit;
    GroupBox2: TGroupBox;
    DataIni: TDateTimePicker;
    DataFim: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    QryNFe: TSQLQuery;
    DspNFe: TDataSetProvider;
    CdsNFe: TClientDataSet;
    DataNFe: TDataSource;
    BitBtn2: TBitBtn;
    QryNFeID: TIntegerField;
    QryNFePEDIDO_NUM: TStringField;
    QryNFeIDCLIENTE: TIntegerField;
    QryNFeID_VENDEDOR: TIntegerField;
    QryNFeDATA_PEDIDO: TSQLTimeStampField;
    QryNFeHORA_PEDIDO: TSQLTimeStampField;
    QryNFeDATA_ENTREGA: TSQLTimeStampField;
    QryNFeHORA_ENTREGA: TSQLTimeStampField;
    QryNFeID_CLASSIFICACAO: TIntegerField;
    QryNFeCONFIRMADA: TStringField;
    QryNFeENTREGUE: TStringField;
    QryNFeVALOR: TFMTBCDField;
    QryNFeDESCONTO: TFMTBCDField;
    QryNFeACRESCIMO: TFMTBCDField;
    QryNFeOUTRAS_DESPESAS: TFMTBCDField;
    QryNFeVALOR_TOTAL: TFMTBCDField;
    QryNFeCANCELADO: TStringField;
    QryNFeID_FORMAPAG: TIntegerField;
    QryNFeEND_ENTREGA: TStringField;
    QryNFeNUM_END_ENTREGA: TStringField;
    QryNFeCOMPL_END_ENTREGA: TStringField;
    QryNFeBAIRRO_END_ENTREGA: TStringField;
    QryNFeCID_END_ENTREGA: TStringField;
    QryNFeUF_END_ENTREGA: TStringField;
    QryNFeCEP_END_ENTREGA: TStringField;
    QryNFeCLIENTE: TStringField;
    QryNFeTIPODOC: TIntegerField;
    QryNFeTIPO_PEDIDO: TIntegerField;
    QryNFeVALOR_REAL: TFMTBCDField;
    QryNFeMARGEM_VENDA: TBCDField;
    QryNFeVALOR_COMISSAO: TFMTBCDField;
    QryNFeTOTAL_GERAL: TFMTBCDField;
    QryNFeCOO: TIntegerField;
    QryNFeCCF: TIntegerField;
    QryNFeGNF: TIntegerField;
    QryNFeDAV: TStringField;
    QryNFeCNPJCPF: TStringField;
    QryNFeINSCEST: TStringField;
    QryNFeVALOR_TROCO: TFMTBCDField;
    QryNFeCAIXA: TStringField;
    QryNFeIDEMPRESA: TIntegerField;
    CdsNFeID: TIntegerField;
    CdsNFePEDIDO_NUM: TStringField;
    CdsNFeIDCLIENTE: TIntegerField;
    CdsNFeID_VENDEDOR: TIntegerField;
    CdsNFeDATA_PEDIDO: TSQLTimeStampField;
    CdsNFeHORA_PEDIDO: TSQLTimeStampField;
    CdsNFeDATA_ENTREGA: TSQLTimeStampField;
    CdsNFeHORA_ENTREGA: TSQLTimeStampField;
    CdsNFeID_CLASSIFICACAO: TIntegerField;
    CdsNFeCONFIRMADA: TStringField;
    CdsNFeENTREGUE: TStringField;
    CdsNFeVALOR: TFMTBCDField;
    CdsNFeDESCONTO: TFMTBCDField;
    CdsNFeACRESCIMO: TFMTBCDField;
    CdsNFeOUTRAS_DESPESAS: TFMTBCDField;
    CdsNFeVALOR_TOTAL: TFMTBCDField;
    CdsNFeCANCELADO: TStringField;
    CdsNFeID_FORMAPAG: TIntegerField;
    CdsNFeEND_ENTREGA: TStringField;
    CdsNFeNUM_END_ENTREGA: TStringField;
    CdsNFeCOMPL_END_ENTREGA: TStringField;
    CdsNFeBAIRRO_END_ENTREGA: TStringField;
    CdsNFeCID_END_ENTREGA: TStringField;
    CdsNFeUF_END_ENTREGA: TStringField;
    CdsNFeCEP_END_ENTREGA: TStringField;
    CdsNFeCLIENTE: TStringField;
    CdsNFeTIPODOC: TIntegerField;
    CdsNFeTIPO_PEDIDO: TIntegerField;
    CdsNFeVALOR_REAL: TFMTBCDField;
    CdsNFeMARGEM_VENDA: TBCDField;
    CdsNFeVALOR_COMISSAO: TFMTBCDField;
    CdsNFeTOTAL_GERAL: TFMTBCDField;
    CdsNFeCOO: TIntegerField;
    CdsNFeCCF: TIntegerField;
    CdsNFeGNF: TIntegerField;
    CdsNFeDAV: TStringField;
    CdsNFeCNPJCPF: TStringField;
    CdsNFeINSCEST: TStringField;
    CdsNFeVALOR_TROCO: TFMTBCDField;
    CdsNFeCAIXA: TStringField;
    CdsNFeIDEMPRESA: TIntegerField;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGeraNFe: TFrmGeraNFe;

implementation

uses uDmConexao, uDmNfe, pcnNFe, DateUtils;

{$R *.dfm}

procedure TFrmGeraNFe.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
  
end;

procedure TFrmGeraNFe.FormShow(Sender: TObject);
begin
  inherited;
  DataIni.Date := Date;
  DataFim.Date := Date;
  DmNFe.AtualizaConfigAcBr;
  EdtDados.SetFocus;

end;

procedure TFrmGeraNFe.BitBtn1Click(Sender: TObject);
begin
  inherited;
  QryNFe.Close;
  QryNFe.SQL.Clear;
  QryNFe.SQL.Add('select * from pedido');
  QryNFe.SQL.Add('where pedido.data_pedido between :pDatai and :pDataf');
  case RadioOpcao.ItemIndex of
    0: QryNFe.SQL.Add('and pedido.pedido_num = :pDados');
    1: QryNFe.SQL.Add('and pedido.idcliente = :pDados');
    2: QryNFe.SQL.Add('and upper(pedido.cliente) like :pDados');
  end;
  // parametros
  QryNFe.Params.ParamByName('pDatai').AsDate := DataIni.date;
  QryNFe.Params.ParamByName('pDataf').AsDate := DataFim.date;
  case RadioOpcao.ItemIndex of
    0: QryNFe.Params.ParamByName('pDados').AsString  := EdtDados.Text;
    1: QryNFe.Params.ParamByName('pDados').AsInteger := StrToInt(EdtDados.Text);
    2: QryNFe.Params.ParamByName('pDados').AsString  := '%'+UpperCase(EdtDados.Text);
  end;
  //
  QryNFe.Open;
  DBGrid1.SetFocus;

end;

procedure TFrmGeraNFe.BitBtn3Click(Sender: TObject);
var aNumIten : Integer;
begin
  inherited;
  if DataNFe.DataSet.RecordCount = 0 then
  begin
    MessageDlg('É necessário selecionar o pedido!',mtWarning,[mbOK],0);
    Abort;
  end;
  if not DmNFe.Dados_Contato(CdsNFeIDCLIENTE.AsInteger) then
  begin
    MessageDlg('Cliente não esta cadastrado. Verifique!',mtWarning,[mbOK],0);
    Abort;
  end;
  if not DmNFe.Dados_PedidoItens(CdsNFeID.AsInteger) then
  begin
    MessageDlg('Não há itens para este pedido. Verifique!',mtWarning,[mbOK],0);
    Abort;
  end;
  //
  DmNFe.ACBrNFe1.NotasFiscais.Clear;
  //
  with DmNFe.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    // Dados Principais
    Ide.cNF     := StrToInt(CdsNFePEDIDO_NUM.AsString);
    Ide.natOp   := '5102';
    Ide.indPag  := ipVista;
    Ide.modelo  := 55;
    Ide.serie   := 1;
    Ide.nNF     := StrToInt(CdsNFePEDIDO_NUM.AsString);
    Ide.dEmi    := Date;
    Ide.dSaiEnt := Date;
    Ide.tpNF    := tnSaida;
    if DmNFe.sAmbiente = 0 then
       Ide.tpAmb   := taProducao
    else
       Ide.tpAmb := taHomologacao;
    Ide.verProc := '1.0.0.0';
    Ide.cUF     := StrToInt(DmNFe.sUF);
    Ide.cMunFG  := StrToInt(DmNFe.sCodMun);
    Ide.finNFe  := fnNormal;
    // Emitente
    Emit.CNPJCPF := DmNFe.sCNPJ;
    Emit.IE      := DmNFe.sIE;
    Emit.IEST    := '';
    Emit.xNome   := DmNFe.sRazao;
    Emit.xFant   := DmNFe.sFantasia;
    Emit.IM      := '';
    Emit.CNAE    := '';
    Emit.EnderEmit.xLgr    := DmNFe.sEndereco;
    Emit.EnderEmit.nro     := DmNFe.sNum;
    Emit.EnderEmit.xCpl    := '';
    Emit.EnderEmit.xBairro := DmNFe.sBairro;
    Emit.EnderEmit.cMun    := StrToInt(DmNFe.sCodMun);
    Emit.EnderEmit.xMun    := DmNFe.sCidade;
    Emit.EnderEmit.UF      := DmNFe.sUF;
    Emit.EnderEmit.CEP     := StrToInt(DmNFe.sCEP);
    Emit.EnderEmit.fone    := DmNFe.sFone;
    Emit.EnderEmit.cPais   := 1058;
    Emit.EnderEmit.xPais   := 'BRASIL';
    // Destinatario
    Dest.CNPJCPF := DmNFe.CdsContatosCNPJ_CPF.AsString;
    Dest.IE      := DmNFe.CdsContatosINSC_RG.AsString;
    Dest.ISUF    := '';
    Dest.xNome   := DmNFe.CdsContatosNOME.AsString;
    Dest.EnderDest.xLgr    := DmNFe.CdsContatosENDERECO.AsString;
    Dest.EnderDest.nro     := DmNFe.CdsContatosNUM_END.AsString;
    Dest.EnderDest.xCpl    := DmNFe.CdsContatosCOMPLEMENTO.AsString;
    Dest.EnderDest.xBairro := DmNFe.CdsContatosBAIRRO_END.AsString;
    Dest.EnderDest.cMun    := 0;
    Dest.EnderDest.xMun    := DmNFe.CdsContatosCIDADE_END.AsString;
    Dest.EnderDest.UF      := DmNFe.CdsContatosUF_END.AsString;
    Dest.EnderDest.CEP     := StrToInt(DmNFe.CdsContatosCEP_END.AsString);
    Dest.EnderDest.cPais   := 1058;
    Dest.EnderDest.xPais   := 'BRASIL';
    Dest.EnderDest.fone    := DmNFe.CdsContatosTELEFONE.AsString;
    // Entrega
    Entrega.xLgr    := DmNFe.CdsContatosEND_ENTREGA.AsString;
    Entrega.nro     := DmNFe.CdsContatosNUM_END_ENTREGA.AsString;
    Entrega.xCpl    := DmNFe.CdsContatosCOMPL_ENT.AsString;
    Entrega.xBairro := DmNFe.CdsContatosBAIRRO_END_ENTREGA.AsString;
    Entrega.cMun    := 0;
    Entrega.xMun    := DmNFe.CdsContatosCID_END_ENTREGA.AsString;
    Entrega.UF      := DmNFe.CdsContatosUF_END_ENT.AsString;
    // Itens da NFe
    aNumIten := 0;
    DmNFe.CdsPedidoItens.First;
    while not DmNFe.CdsPedidoItens.Eof do
    begin
      Inc(aNumIten);
      DmNFe.Dados_Produto(DmNFe.CdsPedidoItensIDPRODUTO.AsInteger);
      with Det.Add do
      begin
        Prod.nItem  := aNumIten;
        Prod.cProd  := IntToStr(DmNFe.CdsPedidoItensIDPRODUTO.AsInteger);
        Prod.cEAN   := DmNFe.CdsPedidoItensEAN13.AsString;
        Prod.xProd  := DmNFe.CdsPedidoItensDESCRICAO.AsString;
        Prod.NCM    := DmNFe.CdsProdutosCODIGO_NCM.AsString;
        Prod.EXTIPI := '';
        if (DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 0) or
           (DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 1) or
           (DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 2) or
           (DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 4) then
        begin
          Prod.CFOP   := '5102';
        end
        else if DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 3 then
        begin
          Prod.CFOP   := '5403';
        end;
        Prod.uCom := DmNFe.CdsProdutosUNIDADE.AsString;
        Prod.qCom := DmNFe.CdsPedidoItensQUANTIDADE.AsFloat;
        Prod.cEANTrib := '';
        Prod.uTrib := DmNFe.CdsProdutosUNIDADE.AsString;
        if DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 0 then
           Prod.qTrib := DmNFe.CdsPedidoItensQUANTIDADE.AsFloat
        else
           Prod.qTrib := 0;
        Prod.vFrete := 0;
        Prod.vSeg   := 0;
        Prod.vDesc  := DmNFe.CdsPedidoItensDESCONTO.AsFloat;
        with Imposto do
        begin
          with ICMS do
          begin
            if DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 0 then // 0 - Tributado
            begin
              CST           := cst00;
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := DmNFe.CdsPedidoItensVALOR_TOTAL.AsFloat;
              ICMS.pICMS    := DmNFe.CdsProdutosALIQUOTA_ICMS.AsFloat;
              ICMS.vICMS    := (DmNFe.CdsPedidoItensVALOR_TOTAL.AsFloat * DmNFe.CdsProdutosALIQUOTA_ICMS.AsFloat) / 100;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := 0;
              ICMS.vICMSST  := 0;
              ICMS.pRedBC   := 0;
            end;
            if DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 3 then // 3 - Sub. Tributaria
            begin
              CST           := cst60;
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := DmNFe.CdsPedidoItensVALOR_TOTAL.AsFloat;
              ICMS.pICMS    := 0;
              ICMS.vICMS    := 0;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := DmNFe.CdsProdutosALIQUOTA_ICMS.AsFloat;
              ICMS.vICMSST  := (DmNFe.CdsPedidoItensVALOR_TOTAL.AsFloat * DmNFe.CdsProdutosALIQUOTA_ICMS.AsFloat) / 100;
              ICMS.pRedBC   := 0;
            end;
          end;
          if (DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 1) or // 1 - Isento
             (DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 2) then // 2 - Não tributado
          begin
            with II do
            begin
              vBc      := 0;
              vDespAdu := 0;
              vII      := DmNFe.CdsPedidoItensVALOR_TOTAL.AsFloat;
              vIOF     := 0;
            end;
          end;
          if DmNFe.CdsPedidoItensTIPOPROD.AsInteger = 4 then // 4 - Serviço
          begin
            with ISSQN do
            begin
              vBC        := DmNFe.CdsPedidoItensVALOR_TOTAL.AsFloat;
              vAliq      := DmNFe.CdsProdutosALIQUOTA_ICMS.AsFloat;
              vISSQN     := (DmNFe.CdsPedidoItensVALOR_TOTAL.AsFloat * DmNFe.CdsProdutosALIQUOTA_ICMS.AsFloat) / 100;
              cMunFG     := 0;
              cListServ  := 0;
            end;
          end;
      end;
      DmNFe.CdsPedidoItens.Next;

    end;
    // informações finais da NFe
    DmNFe.Dados_Tributos(CdsNFeID.AsInteger);
    Total.ICMSTot.vBC     := DmNFe.CdsTributoVALOR.AsFloat;
    Total.ICMSTot.vICMS   := DmNFe.CdsTributoVAL_ICMS.AsFloat;
    Total.ICMSTot.vBCST   := DmNFe.CdsTributoBASE_ST.AsFloat;
    Total.ICMSTot.vST     := (DmNFe.CdsTributoBASE_ST.AsFloat * DmNFe.CdsTributoALIQUOTA_ICMS) /100;
    Total.ICMSTot.vProd   := CdsNFeVALOR.AsFloat;
    Total.ICMSTot.vFrete  := 0;
    Total.ICMSTot.vSeg    := 0;
    Total.ICMSTot.vDesc   := CdsNFeDESCONTO.AsFloat;
    Total.ICMSTot.vII     := 0;
    Total.ICMSTot.vIPI    := 0;
    Total.ICMSTot.vPIS    := 0;
    Total.ICMSTot.vCOFINS := 0;
    Total.ICMSTot.vOutro  := 0;
    Total.ICMSTot.vNF     := CdsNFeVALOR_TOTAL;
    //
    Total.ISSQNtot.vServ   := 0;
    Total.ISSQNtot.vBC     := 0;
    Total.ISSQNtot.vISS    := 0;
    Total.ISSQNtot.vPIS    := 0;
    Total.ISSQNtot.vCOFINS := 0;
    //
    Total.retTrib.vRetPIS    := 0;
    Total.retTrib.vRetCOFINS := 0;
    Total.retTrib.vRetCSLL   := 0;
    Total.retTrib.vBCIRRF    := 0;
    Total.retTrib.vIRRF      := 0;
    Total.retTrib.vRetPrev   := 0;
    // transportara
    Transp.Transporta.CNPJCPF := '';
    Transp.Transporta.xNome   := '';
    Transp.Transporta.IE      := '';
    Transp.Transporta.xEnder  := '';
    Transp.Transporta.xMun    := '';
    Transp.Transporta.UF      := '';
    With Transp.Reboque.Add do
    begin
      placa := '';
      UF    := '';
      RNTC  := '';
    end;
    with Transp.Vol.Add do
    begin
      qVol  := 1;
      esp   := ''
      marca := '';
      nVol  := '';
      pesoL := 0;
      pesoB := 0;
    end;
    // Cobranca
    Cobr.Fat.nFat  := CdsNFePEDIDO_NUM.AsString;
    Cobr.Fat.vOrig := CdsNFeVALOR_TOTAL.AsFloat;
    Cobr.Fat.vDesc := 0;
    Cobr.Fat.vLiq  := CdsNFeVALOR_TOTAL.AsFloat;
    with Cobr.Dup.Add do
    begin
      nDup  := CdsNFePEDIDO_NUM.AsString;
      dVenc := CdsNFeDATA_PEDIDO.AsDateTime + 30;
      vDup  := CdsNFeVALOR_TOTAL.AsFloat;
    end;
    //
    with InfAdic.obsCont.Add do
    begin
      xCampo := '';
      xTexto := '';
    end;
    with InfAdic.obsFisco.Add do
    begin
      xCampo := '';
      xTexto := '';
    end;

  end;

end;

end.
