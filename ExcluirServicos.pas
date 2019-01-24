unit ExcluirServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Data.DB, Data.FMTBcd,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Datasnap.Provider,
  Datasnap.DBClient, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.Mask, Vcl.ComCtrls, CommCtrl;

type
  TFm_ExcluirServicos = class(TForm)
    DBGrid1: TDBGrid;
    SQLSer: TSQLQuery;
    DsSer: TDataSource;
    CdSer: TClientDataSet;
    DpSer: TDataSetProvider;
    Image1: TImage;
    Button1: TButton;
    DsCli: TDataSource;
    CdCli: TClientDataSet;
    DpCli: TDataSetProvider;
    SQLCli: TSQLQuery;
    SQLSerCASE_DATA: TDateField;
    SQLSerCASE_COD_SERVICO: TIntegerField;
    SQLSerCASE_SERVICO_DESC: TStringField;
    SQLSerCASE_CLIENTE: TIntegerField;
    SQLSerCASE_SERVICO_VALOR: TFloatField;
    CdSerCASE_DATA: TDateField;
    CdSerCASE_COD_SERVICO: TIntegerField;
    CdSerCASE_SERVICO_DESC: TStringField;
    CdSerCASE_CLIENTE: TIntegerField;
    CdSerCASE_SERVICO_VALOR: TFloatField;
    CdSerSQLCli: TDataSetField;
    DsProf: TDataSource;
    CdProf: TClientDataSet;
    SQLProf: TSQLQuery;
    DpProf: TDataSetProvider;
    SQLProfUSU_USUARIO: TStringField;
    CdProfUSU_USUARIO: TStringField;
    SQLSerCASE_USUARIO_FK: TIntegerField;
    CdSerCASE_USUARIO_FK: TIntegerField;
    CdSerSQLProf: TDataSetField;
    Image6: TImage;
    Button2: TButton;
    SQLSerCASE_STATUSSERVICO: TStringField;
    CdSerCASE_STATUSSERVICO: TStringField;
    Button3: TButton;
    SQLCliCLIENTE: TStringField;
    CdCliCLIENTE: TStringField;
    Edit1: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Button4: TButton;
    DataInicial: TMaskEdit;
    DataFinal: TMaskEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CdSerAfterDelete(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure CdSerAfterPost(DataSet: TDataSet);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DataFinalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_ExcluirServicos: TFm_ExcluirServicos;

implementation

{$R *.dfm}

uses ReciboSer;

procedure TFm_ExcluirServicos.Button1Click(Sender: TObject);
begin
   if not CdSer.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir este Serviço ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CdSer.Delete;
     end;
   end;
end;

procedure TFm_ExcluirServicos.Button2Click(Sender: TObject);
begin
  if MessageDlg('Deseja Imprimir o Recibo do Serviço ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
  begin
    try
      FrmReciboSer := TFrmReciboSer.Create(self);

      FrmReciboSer.CdRecibo.Close;
      FrmReciboSer.SQLRecibo.SQL.Text := ' SELECT ' +
                                         ' USU_USUARIO, ' +
                                         ' CASE_SERVICOS_FK, '+
                                         ' CASE_COD_SERVICO, '+
                                         ' CASE_DATA,        '+
                                         ' CASE_SERVICO_VALOR, '+
                                         ' CASE_FORMA_PAGAMENTO, '+
                                         ' CASE_STATUS,  '+
                                         ' CASE_DESCONTO, ' +
                                         ' CASE_ACRESCIMO, ' +
                                         ' CLI_COD, '+
                                         ' CASE_OBS, ' +
                                         ' CASE_STATUSSERVICO, ' +
                                         ' CLI_NOME, '+
                                         ' CLI_ENDERECO, '+
                                         ' CLI_NUMERO, '+
                                         ' CLI_CIDADE, '+
                                         ' CLI_CPF, '+
                                         ' CLI_CNPJ, '+
                                         ' SERV_VALOR, ' +
                                         ' CLI_IE, '+
                                         ' CLI_TELEFONE, '+
                                         ' CLI_CELULAR, '+
                                         ' CASE_SERVICO_DESC '+
                                         ' FROM '+
                                         ' CAIXASERVICOS '+
                                         ' LEFT JOIN SERVICOS ' +
                                         ' ON CASE_SERVICOS_FK = SERV_COD ' +
                                         ' LEFT JOIN '+
                                         ' CLIENTES '+
                                         ' ON CLI_COD = CASE_CLIENTE '+
                                         ' LEFT JOIN ' +
                                         ' USUARIO ' +
                                         ' ON USU_COD = CASE_USUARIO_FK ' +
                                         ' WHERE CASE_COD_SERVICO = '+ CdSerCASE_COD_SERVICO.AsString;
      FrmReciboSer.CdRecibo.Open;
      FrmReciboSer.RlrRecibo.Preview;
    finally
      FreeAndNil(FrmReciboSer);
    end;

  end;
end;

procedure TFm_ExcluirServicos.Button3Click(Sender: TObject);
begin
  CdSer.Edit;
  CdSer.Post;
  Application.MessageBox('Salvo Com Sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure TFm_ExcluirServicos.Button4Click(Sender: TObject);
begin
  CdSer.Close;
  SQLSer.SQL.Text :=
  '  SELECT  '   +
  '  CASE_DATA, ' +
  '  CASE_STATUSSERVICO, '+
  '  CASE_USUARIO_FK, '+
  '  CASE_COD_SERVICO, '+
  '  CASE_SERVICO_DESC, '+
  '  CASE_CLIENTE, '+
  '  CASE_SERVICO_VALOR '+

  '  FROM CAIXASERVICOS  where CASE_COD_SERVICO > 0';

  if Edit1.Text <> '' then
  begin
    SQLSer.SQL.Text := SQLSer.SQL.Text + ' AND CASE_COD_SERVICO = ' + Edit1.Text;
  end;

  if (DataInicial.Text <> '  /  /    ') and (DataFinal.Text <> '  /  /    ') then
  begin
    SQLSer.SQL.Text := SQLSer.SQL.Text + ' AND CASE_DATA BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataFinal.Text)));
  end;

  if DataInicial.Text <> '  /  /    ' then
  begin
    SQLSer.SQL.Text := SQLSer.SQL.Text + ' AND CASE_DATA >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataInicial.Text)));
  end;

  if DataFinal.Text <> '  /  /    ' then
  begin
    SQLSer.SQL.Text := SQLSer.SQL.Text + ' AND CASE_DATA <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataFinal.Text)));
  end;

  SQLSer.SQL.Text := SQLSer.SQL.Text +
  '  GROUP by   '    +
  '  CASE_COD_SERVICO, '+
  '  CASE_DATA, '+
  '  CASE_STATUSSERVICO, '+
  '  CASE_CLIENTE, '+
  '  CASE_USUARIO_FK, '+
  '  CASE_SERVICO_DESC, '+
  '  CASE_SERVICO_VALOR '+
  ' ORDER BY CASE_DATA desc, CASE_COD_SERVICO';

  CdSer.Open;
end;

procedure TFm_ExcluirServicos.CdSerAfterDelete(DataSet: TDataSet);
begin
  CdSer.ApplyUpdates(0);
  CdSer.Refresh;
end;

procedure TFm_ExcluirServicos.CdSerAfterPost(DataSet: TDataSet);
begin
  CdSer.ApplyUpdates(0);
  CdSer.Refresh;
end;

procedure TFm_ExcluirServicos.DataFinalClick(Sender: TObject);
begin
  DateTime_SetFormat(DataFinal.Handle, '');
end;

procedure TFm_ExcluirServicos.DBGrid1ColExit(Sender: TObject);
begin
  CdSer.Edit;
end;

procedure TFm_ExcluirServicos.FormCreate(Sender: TObject);
begin
  DateTime_SetFormat(DataInicial.Handle, '  /  /    ');
  DateTime_SetFormat(DataFinal.Handle, '  /  /    ');

  CdSer.Close;
  CdSer.Open;

  with Dbgrid1.Columns[1].PickList do
  begin
      Add('Não Realizado');
      Add('Sendo Realizado');
      Add('Serviço Concluído');
  end;
end;

end.
