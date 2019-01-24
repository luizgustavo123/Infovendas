unit Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro_Exemplo, Data.DB, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, PesquisaFornecedor, Vcl.ExtDlgs,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList;

type
  Tfm_Produtos = class(Tfm_Cadastro_Exemplo)
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DbCodForn: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    edtProduto: TEdit;
    btn1: TSpeedButton;
    DBEdit8: TDBEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    lbl2: TLabel;
    lbl1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    Label17: TLabel;
    BtnPesquisaPro: TSpeedButton;
    SbFoto: TSpeedButton;
    Label5: TLabel;
    Image5: TImage;
    Image4: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SQLtabelaPRO_COD: TLargeintField;
    SQLtabelaPRO_DESCRICAO: TStringField;
    SQLtabelaPRO_QUANTIDADE: TIntegerField;
    SQLtabelaPRO_VALOR_ENTRADA: TFloatField;
    SQLtabelaPRO_VALOR_SAIDA: TFloatField;
    SQLtabelaPRO_OBS: TStringField;
    SQLtabelaPRO_VENCI: TDateField;
    SQLtabelaPRO_FORNECEDOR_FK: TIntegerField;
    SQLtabelaPRO_CODIGO_EAN13: TLargeintField;
    SQLtabelaPRO_NCM: TIntegerField;
    SQLtabelaPRO_UNIDADE: TStringField;
    SQLtabelaPRO_ALIQUOTA_ICMS: TFloatField;
    SQLtabelaPRO_FOTO: TStringField;
    SQLtabelaPRO_TIPO_CFOP: TIntegerField;
    CDtabelaPRO_COD: TLargeintField;
    CDtabelaPRO_DESCRICAO: TStringField;
    CDtabelaPRO_QUANTIDADE: TIntegerField;
    CDtabelaPRO_VALOR_ENTRADA: TFloatField;
    CDtabelaPRO_VALOR_SAIDA: TFloatField;
    CDtabelaPRO_OBS: TStringField;
    CDtabelaPRO_VENCI: TDateField;
    CDtabelaPRO_FORNECEDOR_FK: TIntegerField;
    CDtabelaPRO_CODIGO_EAN13: TLargeintField;
    CDtabelaPRO_NCM: TIntegerField;
    CDtabelaPRO_UNIDADE: TStringField;
    CDtabelaPRO_ALIQUOTA_ICMS: TFloatField;
    CDtabelaPRO_FOTO: TStringField;
    CDtabelaPRO_TIPO_CFOP: TIntegerField;
    SpeedButton1: TSpeedButton;
    SQLtabelaPRO_BASE_ST: TFloatField;
    CDtabelaPRO_BASE_ST: TFloatField;
    Image6: TImage;
    PanMaisQtd: TPanel;
    EdtMaisQuantidade: TEdit;
    Label10: TLabel;
    SpeedButton2: TSpeedButton;
    Button10: TButton;
    SQLtabelaPRO_STATUS: TIntegerField;
    CDtabelaPRO_STATUS: TIntegerField;
    SQLAux: TSQLQuery;
    procedure BTpesquisarClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CDtabelaAfterDelete(DataSet: TDataSet);
    procedure CDtabelaAfterPost(DataSet: TDataSet);
    procedure BtnPesquisaProClick(Sender: TObject);
    procedure SbFotoClick(Sender: TObject);
    procedure DStabelaDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CDtabelaBeforePost(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbreSQL;
  public
    { Public declarations }
  end;

var
  fm_Produtos: Tfm_Produtos;

implementation

{$R *.dfm}

uses Data_Module;

procedure Tfm_Produtos.AbreSQL;
begin
  CDTabela.Close;
  SQLtabela.SQL.Clear;
  SQLtabela.SQL.Text :=   ' SELECT ' +
                            ' * ' +
                          ' FROM PRODUTOS ' +
                          ' WHERE PRO_STATUS = 1 ';

  if edtCodigo.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      ' AND PRO_COD = ' + edtCodigo.Text;
  end;

  if edtProduto.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
     'AND PRO_DESCRICAO LIKE ' + QuotedStr('%'+edtProduto.Text+'%');
  end;

  CDTabela.Open;
end;


procedure Tfm_Produtos.BtnPesquisaProClick(Sender: TObject);
begin
  inherited;
  try
    Fm_PesquisaFornecedor := TFm_PesquisaFornecedor.Create(self);
    Fm_PesquisaFornecedor.ShowModal;
  finally
    FreeAndNil(Fm_PesquisaFornecedor);
    DbCodForn.SetFocus;
  end;
end;

procedure Tfm_Produtos.BTpesquisarClick(Sender: TObject);
begin
  inherited;
  AbreSQL;
end;

procedure Tfm_Produtos.Button10Click(Sender: TObject);
begin
  inherited;
  if PanMaisQtd.Visible = False then
  begin
    PanMaisQtd.Visible := True;
  end
  else
  begin
    PanMaisQtd.Visible := False;
  end;
end;

procedure Tfm_Produtos.Button1Click(Sender: TObject);
var temp : string;
begin
  inherited;
  SQLAux.Close;
  SQLAux.SQL.Text := 'SELECT * FROM PRODUTOS WHERE PRO_STATUS = 0 and PRO_COD = ' + CDtabelaPRO_COD.AsString;
  SQLAux.Open;

  if not SQLAux.IsEmpty then
  begin
    if MessageDlg('Este Produto foi excluído recentemente, deseja restaurar ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
    begin
      SQLAux.SQL.Text := ' UPDATE PRODUTOS SET PRO_STATUS = 1 WHERE PRO_COD = ' + CDtabelaPRO_COD.AsString;
      SQLAux.ExecSQL();

      temp := CDtabelaPRO_COD.AsString;

      CDTabela.Close;
      SQLtabela.SQL.Text := 'SELECT * FROM PRODUTOS WHERE PRO_COD = ' + temp;
      CDTabela.Open;
    end;
  end
  else
  begin
    Button2.Enabled := True;
    CDtabelaPRO_STATUS.AsInteger := 1;
    CDtabela.Post;
    Application.MessageBox('Produto Salvo com  Sucesso', 'Salvo', mb_iconinformation + mb_ok);
  end;
end;

procedure Tfm_Produtos.Button2Click(Sender: TObject);
begin
  inherited;
   if not CDtabela.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir este Produto ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CDtabela.Edit;
       CDtabelaPRO_STATUS.AsInteger := 0;
       CDtabela.ApplyUpdates(0);
       CDtabela.Refresh;
     end;
   end;
end;

procedure Tfm_Produtos.Button3Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := True;
  CDtabela.Cancel;
end;

procedure Tfm_Produtos.Button4Click(Sender: TObject);
begin
  if PanMaisQtd.Visible = False then
  begin
    PanMaisQtd.Visible := True;
  end
  else
  begin
    PanMaisQtd.Visible := False;
  end;
end;

procedure Tfm_Produtos.Button5Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := False;
  CDtabela.Append;
end;

procedure Tfm_Produtos.Button6Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := False;
  CDtabela.Append;
end;

procedure Tfm_Produtos.Button7Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := True;
  CDtabela.Post;
  Application.MessageBox('Produto Salvo com  Sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure Tfm_Produtos.Button8Click(Sender: TObject);
begin
  inherited;
   if not CDtabela.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir este Produto ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CDtabela.Delete;
     end;
   end;
end;

procedure Tfm_Produtos.Button9Click(Sender: TObject);
begin
  inherited;
  Button2.Enabled := True;
  CDtabela.Cancel;
end;

procedure Tfm_Produtos.CDtabelaAfterDelete(DataSet: TDataSet);
begin
  DataModule1.SQLUsuario.Close;
  DataModule1.SQLUsuario.Open;

  if DataModule1.SQLUsuarioUSU_PRIVILEGIO.AsString <> 'Operacional' then
  begin
    CDtabela.ApplyUpdates(0);
    CDtabela.Refresh;
  end;
end;

procedure Tfm_Produtos.CDtabelaAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataModule1.SQLUsuario.Close;
  DataModule1.SQLUsuario.Open;

  if DataModule1.SQLUsuarioUSU_PRIVILEGIO.AsString <> 'Operacional' then
  begin
    CDtabela.ApplyUpdates(0);
    CDtabela.Refresh;
  end;
end;

procedure Tfm_Produtos.CDtabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDtabelaPRO_VALOR_ENTRADA.AsString = '' then
  begin
    CDtabelaPRO_VALOR_ENTRADA.AsFloat := 0;
  end;
end;

procedure Tfm_Produtos.DStabelaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  Image4.Picture.LoadFromFile(CDtabelaPRO_FOTO.AsString);
end;

procedure Tfm_Produtos.FormCreate(Sender: TObject);
begin
  inherited;

  try
    CDtabela.Close;
    CDtabela.Open;
    Image4.Picture.LoadFromFile(CDtabelaPRO_FOTO.AsString);
  except
    CDtabela.Edit;
    CDtabelaPRO_FOTO.AsString := '';
    CDtabela.ApplyUpdates(0);
    CDtabela.Refresh;
  end;


  DataModule1.SQLUsuario.Close;
  DataModule1.SQLUsuario.Open;

  if DataModule1.SQLUsuarioUSU_PRIVILEGIO.AsString = 'Operacional' then
  begin
    Button1.Enabled := False;
    Button2.Enabled := False;
    Button5.Enabled := False;
    Button3.Enabled := False;
    Button10.Enabled := False;
  end;
end;

procedure Tfm_Produtos.SbFotoClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
  begin
    Image4.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
  CDtabela.Edit;
  CDtabelaPRO_FOTO.AsString := OpenPictureDialog1.FileName;
end;

procedure Tfm_Produtos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  CDtabela.Edit;
  CDtabelaPRO_FOTO.AsString := '';
end;

procedure Tfm_Produtos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  CDtabela.Edit;
  CDtabelaPRO_QUANTIDADE.AsInteger := CDtabelaPRO_QUANTIDADE.AsInteger + StrToInt(EdtMaisQuantidade.Text);
  EdtMaisQuantidade.Clear;
  PanMaisQtd.Visible := False;
end;

end.
