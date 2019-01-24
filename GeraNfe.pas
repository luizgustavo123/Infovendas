unit GeraNfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Data.DB, Data.FMTBcd,
  Datasnap.Provider, Datasnap.DBClient, Data.SqlExpr, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, pcnconversaonfe, pcnConversao,
  Clientes;

type
  TFM_Geranfe = class(TForm)
    DBGrid1: TDBGrid;
    RadioOpcao: TRadioGroup;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DataIni: TDateTimePicker;
    DataFim: TDateTimePicker;
    EdtDados: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    QryNFe: TSQLQuery;
    CdsNFe: TClientDataSet;
    DataNFe: TDataSource;
    DspNFe: TDataSetProvider;
    CdsNFeTOTAL_ITENS: TAggregateField;
    QryNFeVEN_COD: TIntegerField;
    QryNFeVEN_DATA: TDateField;
    QryNFeVEN_VALOR_TOTAL: TFloatField;
    QryNFeCLI_NOME: TStringField;
    QryNFeCLI_COD: TIntegerField;
    QryNFeITV_PRODUTOS_FK: TLargeintField;
    QryNFePRO_DESCRICAO: TStringField;
    QryNFeCLI_TELEFONE: TStringField;
    QryNFePRO_CODIGO_EAN13: TLargeintField;
    QryNFeCLI_CPF: TStringField;
    QryNFePRO_VALOR_SAIDA: TFloatField;
    QryNFeCLI_ENDERECO: TStringField;
    QryNFeCLI_NUMERO: TStringField;
    QryNFeCLI_END_COMPLEMENTO: TStringField;
    QryNFeCLI_BAIRRO: TStringField;
    QryNFeCLI_RG: TStringField;
    QryNFeCLI_CIDADE: TStringField;
    QryNFeCLI_UF: TStringField;
    QryNFeCLI_CEP: TStringField;
    QryNFeCLI_END_ENTREGA: TStringField;
    QryNFeCLI_NUMERO_ENTREGA: TIntegerField;
    QryNFeCLI_END_COMPL_ENTREGA: TStringField;
    QryNFeCLI_BAIRRO_ENTREGA: TStringField;
    QryNFeCLI_CIDADE_ENTREGA: TStringField;
    QryNFeCLI_UF_ENTREGA: TStringField;
    QryNFePRO_NCM: TIntegerField;
    QryNFePRO_TIPO_CFOP: TIntegerField;
    QryNFePRO_UNIDADE: TStringField;
    QryNFeITV_QTD: TIntegerField;
    QryNFePRO_BASE_ST: TFloatField;
    QryNFeITV_DESCONTO: TFloatField;
    QryNFePRO_ALIQUOTA_ICMS: TFloatField;
    CdsNFeVEN_COD: TIntegerField;
    CdsNFeVEN_DATA: TDateField;
    CdsNFeVEN_VALOR_TOTAL: TFloatField;
    CdsNFeCLI_NOME: TStringField;
    CdsNFeCLI_COD: TIntegerField;
    CdsNFeITV_PRODUTOS_FK: TLargeintField;
    CdsNFePRO_DESCRICAO: TStringField;
    CdsNFeCLI_TELEFONE: TStringField;
    CdsNFePRO_CODIGO_EAN13: TLargeintField;
    CdsNFeCLI_CPF: TStringField;
    CdsNFePRO_VALOR_SAIDA: TFloatField;
    CdsNFeCLI_ENDERECO: TStringField;
    CdsNFeCLI_NUMERO: TStringField;
    CdsNFeCLI_END_COMPLEMENTO: TStringField;
    CdsNFeCLI_BAIRRO: TStringField;
    CdsNFeCLI_RG: TStringField;
    CdsNFeCLI_CIDADE: TStringField;
    CdsNFeCLI_UF: TStringField;
    CdsNFeCLI_CEP: TStringField;
    CdsNFeCLI_END_ENTREGA: TStringField;
    CdsNFeCLI_NUMERO_ENTREGA: TIntegerField;
    CdsNFeCLI_END_COMPL_ENTREGA: TStringField;
    CdsNFeCLI_BAIRRO_ENTREGA: TStringField;
    CdsNFeCLI_CIDADE_ENTREGA: TStringField;
    CdsNFeCLI_UF_ENTREGA: TStringField;
    CdsNFePRO_NCM: TIntegerField;
    CdsNFePRO_TIPO_CFOP: TIntegerField;
    CdsNFePRO_UNIDADE: TStringField;
    CdsNFeITV_QTD: TIntegerField;
    CdsNFePRO_BASE_ST: TFloatField;
    CdsNFeITV_DESCONTO: TFloatField;
    CdsNFePRO_ALIQUOTA_ICMS: TFloatField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Geranfe: TFM_Geranfe;

implementation

{$R *.dfm}

procedure TFM_Geranfe.BitBtn1Click(Sender: TObject);
begin
  QryNFe.Close;
  CdsNFe.Close;
 // CdsNFe.Params.Clear;
  QryNFe.SQL.Clear;
  QryNFe.SQL.Text := 'SELECT VEN_COD,PRO_ALIQUOTA_ICMS,VEN_DATA,PRO_UNIDADE,ITV_DESCONTO, VEN_VALOR_TOTAL,CLI_NOME,CLI_COD,ITV_PRODUTOS_FK,PRO_DESCRICAO, ' +
                 ' CLI_END_COMPLEMENTO,CLI_BAIRRO,PRO_VALOR_SAIDA, CLI_ENDERECO,ITV_QTD, CLI_CIDADE,PRO_TIPO_CFOP,PRO_NCM, PRO_CODIGO_EAN13,CLI_UF,CLI_CEP,CLI_END_ENTREGA, ' +
                 ' CLI_NUMERO_ENTREGA,CLI_NUMERO, CLI_END_COMPL_ENTREGA,PRO_BASE_ST,CLI_CPF,CLI_RG, CLI_BAIRRO_ENTREGA,CLI_TELEFONE, CLI_CIDADE_ENTREGA, ' +
                 ' CLI_UF_ENTREGA  FROM VENDAS ' +
                 ' INNER JOIN  clientes  '  +
                 '   ON VEN_CLIENTES_FK = CLI_COD '  +
                 ' INNER JOIN itens_vendas ' +
                 '   ON VEN_COD = ITV_VENDAS_FK  '  +
                 ' INNER JOIN produtos  '  +
                 '   ON PRO_COD = ITV_PRODUTOS_FK' +
                 ' WHERE VEN_DATA BETWEEN :pDatai and :pDataf ';
  case RadioOpcao.ItemIndex of
    0: QryNFe.SQL.Add('and VEN_COD = :pDados');
    1: QryNFe.SQL.Add('and VEN_CLIENTES_FK = :pDados');
    2: QryNFe.SQL.Add('and (CLI_NOME) like :pDados');
  end;
  // parametros
  //CdsNFe.FetchParams;
  QryNFe.Params.ParamByName('pDatai').AsString := (FormatDateTime('yyyy-mm-dd', DataIni.date));
  QryNFe.Params.ParamByName('pDataf').AsString := (FormatDateTime('yyyy-mm-dd', DataFim.date));
  case RadioOpcao.ItemIndex of
    0: QryNFe.Params.ParamByName('pDados').AsString  := EdtDados.Text;
    1: QryNFe.Params.ParamByName('pDados').AsInteger := StrToInt(EdtDados.Text);
    2: QryNFe.Params.ParamByName('pDados').AsString  := '%'+(EdtDados.Text);
  end;
  //
  CdsNFe.Open;
  DBGrid1.SetFocus;
end;

procedure TFM_Geranfe.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFM_Geranfe.BitBtn3Click(Sender: TObject);
var aNumIten : Integer;
begin
  inherited;
  if DataNFe.DataSet.RecordCount = 0 then
  begin
    MessageDlg('É necessário selecionar o pedido!',mtWarning,[mbOK],0);
    Abort;
  end;

  DataModule1.ACBrNFe1.NotasFiscais.Clear;
  //

  DataModule1.CdConfigNfe.Close;
  DataModule1.CdConfigNfe.Open;

  with DataModule1.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    // Dados Principais
    Ide.cNF     := StrToInt(CdsNFeVEN_COD.AsString);
    Ide.natOp   := '5102';
    Ide.indPag  := ipVista;
    Ide.modelo  := 55;
    Ide.serie   := 1;
    Ide.nNF     := StrToInt(CdsNFeVEN_COD.AsString);
    Ide.dEmi    := Date;
    Ide.dSaiEnt := Date;
    Ide.tpNF    := tnSaida;
    if DataModule1.sAmbiente = 0 then
       Ide.tpAmb   := taProducao
    else
       Ide.tpAmb := taHomologacao;
    Ide.verProc := '1.0.0.0';
    Ide.cUF     := StrToInt(DataModule1.CdConfigNfeUF.AsString);
    Ide.cMunFG  := StrToInt(DataModule1.CdConfigNfeCOD_MUN.AsString);
    Ide.finNFe  := fnNormal;
    // Emitente
    Emit.CRT     := crtSimplesNacional;
    Emit.CNPJCPF := DataModule1.CdConfigNfeCNPJ.AsString;
    Emit.IE      := DataModule1.CdConfigNfeI_ESTADUAL.AsString;
    Emit.IEST    := '';
    Emit.xNome   := DataModule1.CdConfigNfeRAZAO_SOCIAL.AsString;
    Emit.xFant   := DataModule1.CdConfigNfeNOME_FANTASIA.AsString;
    Emit.IM      := '';
    Emit.CNAE    := '';
    Emit.EnderEmit.xLgr    := DataModule1.CdConfigNfeENDERECO.AsString;
    Emit.EnderEmit.nro     := DataModule1.CdConfigNfeEND_NUMERO.AsString;
    Emit.EnderEmit.xCpl    := '';
    Emit.EnderEmit.xBairro := DataModule1.CdConfigNfeBAIRRO.AsString;
    Emit.EnderEmit.cMun    := StrToInt(DataModule1.CdConfigNfeCOD_MUN.AsString);
    Emit.EnderEmit.xMun    := DataModule1.CdConfigNfeCIDADE.AsString;
    Emit.EnderEmit.UF      := DataModule1.CdConfigNfeUF.AsString;
    Emit.EnderEmit.CEP     := StrToInt(DataModule1.CdConfigNfeCEP.AsString);
    Emit.EnderEmit.fone    := DataModule1.CdConfigNfeFONE.AsString;
    Emit.EnderEmit.cPais   := 1058;
    Emit.EnderEmit.xPais   := 'BRASIL';
    // Destinatario
    Dest.CNPJCPF := CdsNFeCLI_CPF.AsString;
    Dest.IE      := CdsNFeCLI_RG.AsString;
    Dest.ISUF    := '';
    Dest.xNome   := CdsNFeCLI_NOME.AsString;
    Dest.EnderDest.xLgr    := CdsNFeCLI_ENDERECO.AsString;
    Dest.EnderDest.nro     := CdsNFeCLI_NUMERO.AsString;
    Dest.EnderDest.xCpl    := CdsNFeCLI_END_COMPLEMENTO.AsString;
    Dest.EnderDest.xBairro := CdsNFeCLI_BAIRRO.AsString;
    Dest.EnderDest.cMun    := 0;
    Dest.EnderDest.xMun    := CdsNFeCLI_CIDADE.AsString;
    Dest.EnderDest.UF      := CdsNFeCLI_UF.AsString;
    Dest.EnderDest.CEP     := StrToInt(CdsNFeCLI_CEP.AsString);
    Dest.EnderDest.cPais   := 1058;
    Dest.EnderDest.xPais   := 'BRASIL';
    Dest.EnderDest.fone    := CdsNFeCLI_TELEFONE.AsString;
    // Entrega
    Entrega.xLgr    := CdsNFeCLI_END_ENTREGA.AsString;
    Entrega.nro     := CdsNFeCLI_NUMERO_ENTREGA.AsString;
    Entrega.xCpl    := CdsNFeCLI_END_COMPL_ENTREGA.AsString;
    Entrega.xBairro := CdsNFeCLI_BAIRRO_ENTREGA.AsString;
    Entrega.cMun    := 0;
    Entrega.xMun    := CdsNFeCLI_CIDADE_ENTREGA.AsString;
    Entrega.UF      := CdsNFeCLI_UF_ENTREGA.AsString;
    // Itens da NFe
    aNumIten := 0;
    CdsNFe.First;
    while not CdsNFe.Eof do
    begin
      Inc(aNumIten);
     // DmNFe.Dados_Produto(DataModule1.CdsPedidoItensIDPRODUTO.AsInteger);
      with Det.Add do
      begin
        Prod.nItem  := aNumIten;
        Prod.cProd  := IntToStr(CdsNFeITV_PRODUTOS_FK.AsInteger);
        Prod.cEAN   := CdsNFePRO_CODIGO_EAN13.AsString;
        Prod.xProd  := CdsNFePRO_DESCRICAO.AsString;
        Prod.NCM    := CdsNFePRO_NCM.AsString;
        Prod.EXTIPI := '';
        Prod.CFOP   := CdsNFePRO_TIPO_CFOP.AsString;
        Prod.uCom := CdsNFePRO_UNIDADE.AsString;
        Prod.qCom := CdsNFeITV_QTD.AsFloat;
        Prod.cEANTrib := '';
        Prod.uTrib := CdsNFePRO_UNIDADE.AsString;
        if CdsNFePRO_TIPO_CFOP.AsInteger = 0 then
           Prod.qTrib := CdsNFeITV_QTD.AsFloat
        else
           Prod.qTrib := 0;
        Prod.vFrete := 0;
        Prod.vSeg   := 0;
        Prod.vDesc  := CdsNFeITV_DESCONTO.AsFloat;
        with Imposto do
        begin
          with ICMS do
          begin
            if CdsNFePRO_TIPO_CFOP.AsInteger = 0 then // 0 - Tributado
            begin
              CST           := cst00;
              CSOSN         := csosn101;
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := CdsNFeTOTAL_ITENS.Value;
              ICMS.pICMS    := CdsNFePRO_ALIQUOTA_ICMS.AsFloat;
              ICMS.vICMS    := (CdsNFeTOTAL_ITENS.Value * CdsNFePRO_ALIQUOTA_ICMS.AsFloat) / 100;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := 0;
              ICMS.vICMSST  := 0;
              ICMS.pRedBC   := 0;
            end;
            if CdsNFePRO_TIPO_CFOP.AsInteger = 3 then // 3 - Sub. Tributaria
            begin
              CST           := cst60;
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := CdsNFeTOTAL_ITENS.Value;
              ICMS.pICMS    := 0;
              ICMS.vICMS    := 0;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := CdsNFePRO_ALIQUOTA_ICMS.AsFloat;
              ICMS.vICMSST  := (CdsNFeTOTAL_ITENS.Value * CdsNFePRO_ALIQUOTA_ICMS.AsFloat) / 100;
              ICMS.pRedBC   := 0;
            end;
          end;
          if (CdsNFePRO_TIPO_CFOP.AsInteger = 1) or // 1 - Isento
             (CdsNFePRO_TIPO_CFOP.AsInteger = 2) then // 2 - Não tributado
          begin
            with II do
            begin
              vBc      := 0;
              vDespAdu := 0;
              vII      := CdsNFeTOTAL_ITENS.Value;
              vIOF     := 0;
            end;
          end;
          if CdsNFePRO_TIPO_CFOP.AsInteger = 4 then // 4 - Serviço
          begin
            with ISSQN do
            begin
              vBC        := CdsNFeTOTAL_ITENS.AsFloat;
              vAliq      := CdsNFePRO_ALIQUOTA_ICMS.AsFloat;
              vISSQN     := (CdsNFeTOTAL_ITENS.Value * CdsNFePRO_ALIQUOTA_ICMS.AsFloat) / 100;
              cMunFG     := 0;
              cListServ  := '';
            end;
          end;
      end;
      CdsNFe.Next;

    end;
    // informações finais da NFe
    //DmNFe.Dados_Tributos(CdsNFeID.AsInteger);
    Total.ICMSTot.vBC     := CdsNFeVEN_VALOR_TOTAL.AsFloat;
    Total.ICMSTot.vICMS   := CdsNFePRO_ALIQUOTA_ICMS.AsFloat;
    Total.ICMSTot.vBCST   := CdsNFePRO_BASE_ST.AsFloat;
    Total.ICMSTot.vST     := (CdsNFePRO_BASE_ST.AsFloat * CdsNFePRO_ALIQUOTA_ICMS.AsFloat) /100;
    Total.ICMSTot.vProd   := CdsNFeVEN_VALOR_TOTAL.AsFloat;
    Total.ICMSTot.vFrete  := 0;
    Total.ICMSTot.vSeg    := 0;
    Total.ICMSTot.vDesc   := CdsNFeITV_DESCONTO.AsFloat;
    Total.ICMSTot.vII     := 0;
    Total.ICMSTot.vIPI    := 0;
    Total.ICMSTot.vPIS    := 0;
    Total.ICMSTot.vCOFINS := 0;
    Total.ICMSTot.vOutro  := 0;
    Total.ICMSTot.vNF     := CdsNFeVEN_VALOR_TOTAL.AsFloat;
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
      esp   := '';
      marca := '';
      nVol  := '';
      pesoL := 0;
      pesoB := 0;
    end;
    // Cobranca
    Cobr.Fat.nFat  := CdsNFeVEN_COD.AsString;
    Cobr.Fat.vOrig := CdsNFeVEN_VALOR_TOTAL.AsFloat;
    Cobr.Fat.vDesc := 0;
    Cobr.Fat.vLiq  := CdsNFeVEN_VALOR_TOTAL.AsFloat;
    with Cobr.Dup.Add do
    begin
      nDup  := CdsNFeVEN_COD.AsString;
      dVenc := CdsNFeVEN_DATA.AsDateTime + 30;
      vDup  := CdsNFeVEN_VALOR_TOTAL.AsFloat;
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
  // comandos para gerar arquivo XML
  // DataModule1.ACBrNFe1.NotasFiscais.Assinar;
  DataModule1.ACBrNFe1.NotasFiscais.Items[0].GravarXML;
  ShowMessage('Arquivo gerado em: '+DataModule1.ACBrNFe1.NotasFiscais.Items[0].NomeArq);
end;

end;

procedure TFM_Geranfe.FormCreate(Sender: TObject);
begin
Dataini.Date := Date;
Datafim.Date := Date;
end;

procedure TFM_Geranfe.FormShow(Sender: TObject);
begin
  DataIni.Date := Date;
  DataFim.Date := Date;
  EdtDados.SetFocus;
  DataModule1.AtualizaConfigAcBr;
end;

end.


