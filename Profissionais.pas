unit Profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmProfissionais = class(TForm)
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    edtUsu: TEdit;
    BTpesquisar: TButton;
    Image3: TImage;
    lbl2: TLabel;
    lbl1: TLabel;
    DsUsu: TDataSource;
    CdUsu: TClientDataSet;
    DpUsu: TDataSetProvider;
    SQLUsu: TSQLQuery;
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
    procedure BTpesquisarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProfissionais: TFrmProfissionais;

implementation

{$R *.dfm}

uses Data_Module, CaixaServicos, PdvCaixa;

procedure TFrmProfissionais.BTpesquisarClick(Sender: TObject);
begin
  CdUsu.Close;
  SQLUsu.SQL.Text := 'SELECT * FROM USUARIO WHERE USU_STATUS = 1';

  if edtCodigo.Text <> '' then
  begin
    SQLUsu.SQL.Text := SQLUsu.SQL.Text + ' AND USU_COD = ' + edtCodigo.Text;
  end;

  if edtUsu.Text <> '' then
  begin
    SQLUsu.SQL.Text := SQLUsu.SQL.Text + ' AND USU_USUARIO LIKE ' + quotedstr('%' + edtUsu.Text + '%');
  end;

  CdUsu.Open;
end;

procedure TFrmProfissionais.DBGrid1DblClick(Sender: TObject);
begin
  if Fm_CaixaServicos <> nil then
  begin
    Fm_CaixaServicos.EdtProf.Text := CdUsuUSU_COD.AsString;

    FrmProfissionais.Close;

    Fm_CaixaServicos.EdtProf.SetFocus;
  end
  else if Fm_PdvCaixa <> nil then
  begin
    Fm_PdvCaixa.EdtFuncio.Text := CdUsuUSU_COD.AsString;

    FrmProfissionais.Close;

    Fm_PdvCaixa.EdtFuncio.SetFocus;
  end;
end;

procedure TFrmProfissionais.FormCreate(Sender: TObject);
begin
  CdUsu.Close;
  CdUsu.Open;
end;

end.
