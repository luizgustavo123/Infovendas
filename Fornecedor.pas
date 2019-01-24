unit Fornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro_Exemplo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.Actions,
  Vcl.ActnList;

type
  Tfm_Fornecedor = class(Tfm_Cadastro_Exemplo)
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    SQLtabelaFORN_COD: TIntegerField;
    SQLtabelaFORN_NOME_FANTASIA: TStringField;
    SQLtabelaFORN_RAZAO_SOCIAL: TStringField;
    SQLtabelaFORN_CNPJ: TStringField;
    SQLtabelaFORN_ENDERECO: TStringField;
    SQLtabelaFORN_NUMERO: TIntegerField;
    SQLtabelaFORN_CEP: TIntegerField;
    SQLtabelaFORN_CIDADE: TStringField;
    SQLtabelaFORN_OBS: TStringField;
    CDtabelaFORN_COD: TIntegerField;
    CDtabelaFORN_NOME_FANTASIA: TStringField;
    CDtabelaFORN_RAZAO_SOCIAL: TStringField;
    CDtabelaFORN_CNPJ: TStringField;
    CDtabelaFORN_ENDERECO: TStringField;
    CDtabelaFORN_NUMERO: TIntegerField;
    CDtabelaFORN_CEP: TIntegerField;
    CDtabelaFORN_CIDADE: TStringField;
    CDtabelaFORN_OBS: TStringField;
    EditRazao: TEdit;
    EditCnpj: TEdit;
    SQLtabelaFORN_TELEFONE: TStringField;
    SQLtabelaFORN_EMAIL: TStringField;
    CDtabelaFORN_TELEFONE: TStringField;
    CDtabelaFORN_EMAIL: TStringField;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Image1: TImage;
    Image2: TImage;
    Label15: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    Image3: TImage;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Image6: TImage;
    SQLtabelaFORN_STATUS: TIntegerField;
    CDtabelaFORN_STATUS: TIntegerField;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CDtabelaAfterDelete(DataSet: TDataSet);
    procedure CDtabelaAfterPost(DataSet: TDataSet);
    procedure BTpesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreSQL;
  public
    { Public declarations }
  end;

var
  fm_Fornecedor: Tfm_Fornecedor;

implementation

{$R *.dfm}

procedure Tfm_Fornecedor.AbreSQL;
begin
  CDTabela.Close;
  SQLtabela.SQL.Clear;
  SQLtabela.SQL.Text :=   '  SELECT '  +
                          ' * ' +
                          '  FROM FORNECEDORES ' +
                          '  WHERE FORN_COD > 0 AND FORN_STATUS = 1';

  if edtCodigo.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      ' AND FORN_COD = ' + edtCodigo.Text;
  end;

  if EditRazao.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
     'AND FORN_RAZAO_SOCIAL LIKE ' + QuotedStr('%'+EditRazao.Text+'%');
  end;

  if EditCnpj.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      'AND FORN_CNPJ = ' +  QuotedStr(EditCnpj.Text);
  end;

  CDTabela.Open;

end;



procedure Tfm_Fornecedor.BTpesquisarClick(Sender: TObject);
begin
  inherited;
  AbreSQL;
end;

procedure Tfm_Fornecedor.Button1Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := True;
  CDtabelaFORN_STATUS.AsInteger := 1;
  CDtabela.Post;
  Application.MessageBox('Fornecedor Salvo Com Sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure Tfm_Fornecedor.Button2Click(Sender: TObject);
begin
   if not CDtabela.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir o Fornecedor ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CDtabela.Edit;
       CDtabelaFORN_STATUS.AsInteger := 0;
       CDtabela.ApplyUpdates(0);
       CDtabela.Refresh;
     end;
   end;
end;

procedure Tfm_Fornecedor.Button3Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := True;
  CDtabela.Cancel;
end;

procedure Tfm_Fornecedor.Button4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfm_Fornecedor.Button5Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := False;
  CDtabela.Append;
end;

procedure Tfm_Fornecedor.CDtabelaAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CDtabela.ApplyUpdates(0);
  CDtabela.Refresh;
end;

procedure Tfm_Fornecedor.CDtabelaAfterPost(DataSet: TDataSet);
begin
  inherited;
  CDtabela.ApplyUpdates(0);
  CDtabela.Refresh;
end;

procedure Tfm_Fornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  CDtabela.Close;
  CDtabela.Open;
end;

end.
