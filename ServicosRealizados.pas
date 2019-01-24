unit ServicosRealizados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, Rel_Servicos_Realizados, PesquisaProf;

type
  TFm_ServicosRealizados = class(TForm)
    DataInicial: TMaskEdit;
    BtSair: TButton;
    Label6: TLabel;
    Label2: TLabel;
    Fm_ServicosRealizados: TImage;
    EdtCodSer: TEdit;
    Label1: TLabel;
    DataFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    EdtProf: TEdit;
    Label7: TLabel;
    BtVisualizar: TButton;
    CboPagamento: TComboBox;
    CbxFormaVenda: TComboBox;
    Label5: TLabel;
    Label13: TLabel;
    EditCliente: TEdit;
    Label8: TLabel;
    CboSTATUSSERVICO: TComboBox;
    Label9: TLabel;
    procedure BtVisualizarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_ServicosRealizados: TFm_ServicosRealizados;

implementation

{$R *.dfm}

procedure TFm_ServicosRealizados.BtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFm_ServicosRealizados.BtVisualizarClick(Sender: TObject);
begin
  try
    Fm_Rel_Servicos_Realizados := TFm_Rel_Servicos_Realizados.Create(self);
    Fm_Rel_Servicos_Realizados.CdSer.Close;
    Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := ' SELECT  ' +
                                                  ' CASE_COD, ' +
                                                  ' CASE_DESCONTO, '  +
                                                  ' CASE_ACRESCIMO, '+
                                                  ' CASE_SERVICO_VALOR, ' +
                                                  ' CASE_COD_SERVICO, ' +
                                                  ' USU_USUARIO, ' +
                                                  ' SERV_DESCRICAO, ' +
                                                  ' SERV_TEMPO, ' +
                                                  ' CASE_DATA, ' +
                                                  ' SERV_VALOR * USU_COMISSAO /100 as valor_comissao, ' +
                                                  ' USU_COMISSAO, ' +
                                                  ' CASE_LUCRO,  ' +
                                                  ' CASE_STATUS, ' +
                                                  ' CASE_STATUSSERVICO, ' +
                                                  ' CASE_FORMA_PAGAMENTO, ' +
                                                  ' CLI_NOME, ' +
                                                  ' SERV_VALOR ' +
                                                  ' FROM caixaservicos ' +
                                                  ' INNER JOIN usuario ' +
                                                  ' ON USU_COD = CASE_USUARIO_FK ' +
                                                  ' INNER JOIN SERVICOS ' +
                                                  ' ON SERV_COD = CASE_SERVICOS_FK ' +
                                                  ' LEFT JOIN CLIENTES ' +
                                                  ' ON CASE_CLIENTE = CLI_COD ';
    if CbxFormaVenda.ItemIndex = 0 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + '  WHERE (CASE_STATUS = 1 or (CASE_STATUS = 2)) ';
    end
    else if CbxFormaVenda.ItemIndex = 1 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + '  WHERE CASE_STATUS = 1 ';
    end
    else
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + '  WHERE CASE_STATUS = 2 ';
    end;

     if EdtCodSer.Text <> '' then
     begin
       Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text +
       ' AND  CASE_COD_SERVICO = ' +  EdtCodSer.Text;
     end;

     if EdtProf.Text <> '' then
     begin
        Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text +
        ' AND  USU_USUARIO LIKE '+  QuotedStr('%'+EdtProf.Text+'%');
     end;

     if EditCliente.Text <> '' then
     begin
        Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text +
        ' AND  CLI_NOME LIKE '+  QuotedStr('%'+EditCliente.Text+'%');
     end;

    if CboPagamento.ItemIndex = 1 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_FORMA_PAGAMENTO = ' + '''Dinheiro''';
    end
    else if CboPagamento.ItemIndex = 2 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_FORMA_PAGAMENTO = ' + '''Cartão''';
    end
    else if CboPagamento.ItemIndex = 3 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_FORMA_PAGAMENTO = ' + '''Cheque''';
    end;

    if CboSTATUSSERVICO.ItemIndex = 1 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_STATUSSERVICO = ' + '''Não Realizado''';
    end
    else if CboSTATUSSERVICO.ItemIndex = 2 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_STATUSSERVICO = ' + '''Sendo Realizado''';
    end
    else if CboSTATUSSERVICO.ItemIndex = 3 then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_STATUSSERVICO = ' + '''Serviço Concluído''';
    end;


    if DataInicial.Text <> '  /  /    ' then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_DATA >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataInicial.Text)));
    end;

    if DataFinal.Text <> '  /  /    ' then
    begin
      Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text + ' AND CASE_DATA <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(DataFinal.Text)));
    end;

    Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text := Fm_Rel_Servicos_Realizados.SQLSer.SQL.Text +
    'group by '  +
    ' CASE_COD_SERVICO, ' +
    ' CASE_COD, ' +
    ' CASE_DESCONTO, '  +
    ' CASE_ACRESCIMO, '+
    ' CASE_SERVICO_VALOR, ' +
    ' CASE_STATUSSERVICO, ' +
    ' USU_USUARIO, ' +
    ' SERV_DESCRICAO, '  +
    ' SERV_TEMPO, ' +
    ' CASE_DATA, ' +
    ' USU_COMISSAO, ' +
    ' CASE_LUCRO, ' +
    ' CASE_STATUS, ' +
    ' CASE_FORMA_PAGAMENTO, ' +
    ' CLI_NOME, '  +
    ' SERV_VALOR';

    Fm_Rel_Servicos_Realizados.CdSer.Open;

    if not Fm_Rel_Servicos_Realizados.CdSer.IsEmpty then
    begin
      Fm_Rel_Servicos_Realizados.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;

  finally
    FreeAndNil(Fm_Rel_Servicos_Realizados);
  end;
end;

procedure TFm_ServicosRealizados.SpeedButton1Click(Sender: TObject);
begin
  try
    FmPesquisaProf := TFmPesquisaProf.Create(self);
    FmPesquisaProf.ShowModal;
  finally
    FreeAndNil(FmPesquisaProf);
    EdtProf.SetFocus;
  end;
end;

end.
