unit BaixaContaRecebe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data_Module, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Vcl.Mask;

type
  TFrmBaixaContaRecebe = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    SQLtabelaCONR_COD: TIntegerField;
    SQLtabelaCLI_NOME: TStringField;
    SQLtabelaCONR_PARCELA: TStringField;
    SQLtabelaCONR_VALOR_PARCELA: TFloatField;
    SQLtabelaCONR_DATA_RECEBER: TDateField;
    SQLtabelaCONR_SITUACAO: TStringField;
    CDtabelaCONR_COD: TIntegerField;
    CDtabelaCLI_NOME: TStringField;
    CDtabelaCONR_PARCELA: TStringField;
    CDtabelaCONR_VALOR_PARCELA: TFloatField;
    CDtabelaCONR_DATA_RECEBER: TDateField;
    CDtabelaCONR_SITUACAO: TStringField;
    SQLTemp: TSQLQuery;
    Image6: TImage;
    GroupBox1: TGroupBox;
    Button1: TButton;
    DtpDataPag: TDateTimePicker;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Button2: TButton;
    MdtDataPagaIni: TMaskEdit;
    MdtDataPagaFim: TMaskEdit;
    Label4: TLabel;
    Label8: TLabel;
    EdtCli: TEdit;
    Label6: TLabel;
    EdtCod: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaixaContaRecebe: TFrmBaixaContaRecebe;

implementation

{$R *.dfm}

procedure TFrmBaixaContaRecebe.Button1Click(Sender: TObject);
begin
   if MessageDlg('Deseja Realmente dar Baixa nesta Conta ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
   begin
     SQLTemp.SQL.Text := 'UPDATE CONTAS_RECEBER SET CONR_DATA_PAGO = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DtpDataPag.Date)) + ', CONR_SITUACAO = ' + '''' + 'Pago' + '''' + 'WHERE CONR_COD = ' + CDtabelaCONR_COD.AsString;
     SQLTemp.ExecSQL;

     CDtabela.Close;
     CDtabela.Open;
   end;

end;

procedure TFrmBaixaContaRecebe.Button2Click(Sender: TObject);
begin
      CdTabela.Close;
      SQLTabela.SQL.Text := ' SELECT ' +
                            ' CONR_COD, ' +
                            ' CLI_NOME, ' +
                            ' CONR_PARCELA, ' +
                            ' CONR_VALOR_PARCELA, ' +
                            ' CONR_DATA_RECEBER, ' +
                            ' CONR_SITUACAO ' +
                            ' FROM CONTAS_RECEBER ' +
                            ' LEFT JOIN vendas ' +
                            ' ON VEN_COD = CONR_VENDAS_FK ' +
                            ' LEFT JOIN CAIXASERVICOS ' +
                            ' ON CASE_COD = CONR_CAIXASER_FK ' +
                            ' LEFT JOIN CLIENTES ' +
                            ' ON VEN_CLIENTES_FK = CLI_COD ' +
                            ' or CASE_CLIENTE = CLI_COD ' +
                            ' WHERE CONR_SITUACAO = ''' + 'A receber' + '''';


     if EdtCod.Text <> '' then
     begin
       SQLTabela.SQL.Text := SQLTabela.SQL.Text +
       ' AND  CONR_COD = ' +  EdtCod.Text;
     end;
     if EdtCli.Text <> '' then
     begin
        SQLTabela.SQL.Text := SQLTabela.SQL.Text +
        ' AND  CLI_NOME LIKE '+  QuotedStr('%'+EdtCli.Text+'%');
     end;
     if (MdtDataPagaIni.Text <> '  /  /    ') and (MdtDataPagaFim.Text <> '  /  /    ') then
     begin
       SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
     end;
     if MdtDataPagaIni.Text <> '  /  /    ' then
     begin
       SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text)));
     end;
     if MdtDataPagaFim.Text <> '  /  /    ' then
     begin
       SQLTabela.SQL.Text := SQLTabela.SQL.Text + ' AND CONR_DATA_RECEBER <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
     end;

      CdTabela.Open;
end;

procedure TFrmBaixaContaRecebe.FormCreate(Sender: TObject);
begin
  CDtabela.Close;
  CDtabela.Open;

  DtpDataPag.Date := Date;
end;

end.
