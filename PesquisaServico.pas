unit PesquisaServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFm_PesquisaServico = class(TForm)
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    edtServico: TEdit;
    BTpesquisar: TButton;
    Image3: TImage;
    lbl2: TLabel;
    lbl1: TLabel;
    DsServicos: TDataSource;
    CdServicos: TClientDataSet;
    CdServicosSERV_COD: TIntegerField;
    CdServicosSERV_DESCRICAO: TStringField;
    CdServicosSERV_TEMPO: TTimeField;
    CdServicosSERV_VALOR: TFloatField;
    CdServicosSERV_OBS: TStringField;
    DpServicos: TDataSetProvider;
    SQLServicos: TSQLQuery;
    SQLServicosSERV_COD: TIntegerField;
    SQLServicosSERV_DESCRICAO: TStringField;
    SQLServicosSERV_TEMPO: TTimeField;
    SQLServicosSERV_VALOR: TFloatField;
    SQLServicosSERV_OBS: TStringField;
    procedure BTpesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_PesquisaServico: TFm_PesquisaServico;

implementation

{$R *.dfm}

uses CaixaServicos;

procedure TFm_PesquisaServico.BTpesquisarClick(Sender: TObject);
begin
  CdServicos.Close;
  SQLServicos.SQL.Text := 'SELECT '  +
                          '  SERV_COD, '  +
                          '  SERV_DESCRICAO, '  +
                          '  SERV_TEMPO,     '  +
                          '  SERV_OBS,       '  +
                          '  SERV_VALOR      '  +
                          'FROM SERVICOS     ' +
                          'WHERE SERV_COD > 0';
   if edtCodigo.Text <> '' then
   begin
     SQLServicos.SQL.Text := SQLServicos.SQL.Text +
     'AND SERV_COD = ' + edtCodigo.Text;
   end;

   if edtServico.Text <> '' then
   begin
     SQLServicos.SQL.Text := SQLServicos.SQL.Text +
     'AND SERV_DESCRICAO like ' + quotedstr('%' + edtServico.Text + '%');
   end;
   CdServicos.Open;

end;

procedure TFm_PesquisaServico.DBGrid1DblClick(Sender: TObject);
begin
  if  Fm_CaixaServicos <> nil then
  begin
    Fm_CaixaServicos.CdCaixa.Edit;
    Fm_CaixaServicos.CdCaixaCASE_SERVICOS_FK.AsString := CdServicosSERV_COD.AsString;

    Fm_PesquisaServico.Close;

    Fm_CaixaServicos.DbeSer.SetFocus;
  end;
end;

procedure TFm_PesquisaServico.FormCreate(Sender: TObject);
begin
  CdServicos.Close;
  CdServicos.Open;
end;

end.
