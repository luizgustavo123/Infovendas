unit CadServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Data.DB, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.ComCtrls, PesquisaProdutos, Vcl.Imaging.pngimage;

type
  TFm_CadServicos = class(TForm)
    PC: TPageControl;
    PCcadastro: TTabSheet;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit2: TDBEdit;
    DbValor: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    PCrelatorio: TTabSheet;
    btn1: TSpeedButton;
    Image3: TImage;
    lbl2: TLabel;
    lbl1: TLabel;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    BTpesquisar: TButton;
    edtServico: TEdit;
    Image1: TImage;
    Button1: TButton;
    Button5: TButton;
    Button2: TButton;
    Button3: TButton;
    DsServicos: TDataSource;
    CdServicos: TClientDataSet;
    DpServicos: TDataSetProvider;
    SQLServicos: TSQLQuery;
    DsPro: TDataSource;
    CdPro: TClientDataSet;
    DpPro: TDataSetProvider;
    SQLPro: TSQLQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Produtos: TTabSheet;
    DBGrid2: TDBGrid;
    DBMemo1: TDBMemo;
    CdProAux: TClientDataSet;
    DpProAux: TDataSetProvider;
    SQLProAux: TSQLQuery;
    SQLProAuxPRO_DESCRICAO: TStringField;
    CdProAuxPRO_DESCRICAO: TStringField;
    SQLServicosSERV_COD: TIntegerField;
    SQLServicosSERV_DESCRICAO: TStringField;
    SQLServicosSERV_TEMPO: TTimeField;
    SQLServicosSERV_OBS: TStringField;
    SQLServicosSERV_VALOR: TFloatField;
    CdServicosSERV_COD: TIntegerField;
    CdServicosSERV_DESCRICAO: TStringField;
    CdServicosSERV_TEMPO: TTimeField;
    CdServicosSERV_OBS: TStringField;
    CdServicosSERV_VALOR: TFloatField;
    SQLProPSERV_COD: TIntegerField;
    SQLProPSERV_PRODUTOS_FK: TLargeintField;
    SQLProPSERV_PRODUTO: TStringField;
    SQLProPSERV_QTD: TFloatField;
    SQLProPSERV_SERVICOS_FK: TIntegerField;
    CdProPSERV_COD: TIntegerField;
    CdProPSERV_PRODUTOS_FK: TLargeintField;
    CdProPSERV_PRODUTO: TStringField;
    CdProPSERV_QTD: TFloatField;
    CdProPSERV_SERVICOS_FK: TIntegerField;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CdServicosAfterPost(DataSet: TDataSet);
    procedure CdServicosAfterDelete(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTpesquisarClick(Sender: TObject);
    procedure CdProPSERV_PRODUTOS_FKChange(Sender: TField);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure PCcadastroShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure SqlProdutos;
    procedure AbreSqlProAux;
  public
    { Public declarations }
  end;

var
  Fm_CadServicos: TFm_CadServicos;

implementation

{$R *.dfm}

procedure TFm_CadServicos.BTpesquisarClick(Sender: TObject);
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

procedure TFm_CadServicos.Button1Click(Sender: TObject);
begin
  CdPro.First;
  while not CdPro.Eof do
  begin
    if CdProPSERV_QTD.AsString = '' then
    begin
      CdPro.Edit;
      CdProPSERV_QTD.AsInteger := 1;
    end;
    CdPro.Next;
  end;

  CdServicos.Edit;
  CdServicos.post;

  CdPro.First;
  if CdPro.Eof then
  begin
    CdPro.Edit;
    CdProPSERV_SERVICOS_FK.AsInteger := CdServicosSERV_COD.AsInteger;
  end
  else
  begin
    while not CdPro.Eof do
    begin
      CdPro.Edit;
      CdProPSERV_SERVICOS_FK.AsInteger := CdServicosSERV_COD.AsInteger;
      CdPro.Next;
    end;
  end;
  CdPro.Edit;
  CdPro.post;

  CdPro.ApplyUpdates(0);
  CdPro.Refresh;

  SqlProdutos;

  Application.MessageBox('Serviço Salvo Com Sucesso', '', mb_iconinformation + mb_ok);

end;

procedure TFm_CadServicos.Button2Click(Sender: TObject);
begin
   if not CdServicos.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir este Serviço ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CdServicos.Delete;
     end;
   end;
  SqlProdutos;
end;

procedure TFm_CadServicos.Button3Click(Sender: TObject);
begin
  CdServicos.Cancel;

  SqlProdutos;
end;

procedure TFm_CadServicos.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TFm_CadServicos.Button5Click(Sender: TObject);
begin
  CdServicos.Append;
  CdPro.Append;

  SqlProdutos;
end;

procedure TFm_CadServicos.CdProPSERV_PRODUTOS_FKChange(Sender: TField);
begin
  AbreSqlProAux;
end;

procedure TFm_CadServicos.CdServicosAfterDelete(DataSet: TDataSet);
begin
  CdServicos.ApplyUpdates(0);
  CdServicos.Refresh;
end;

procedure TFm_CadServicos.CdServicosAfterPost(DataSet: TDataSet);
begin
  CdServicos.ApplyUpdates(0);
  CdServicos.Refresh;
end;

procedure TFm_CadServicos.DBGrid1CellClick(Column: TColumn);
begin
  SqlProdutos;
end;

procedure TFm_CadServicos.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
    try
      Fm_PesquisaProdutos := TFm_PesquisaProdutos.Create(self);
      Fm_PesquisaProdutos.ShowModal;
    finally
      FreeAndNIL(Fm_PesquisaProdutos);
    end;
  end
  else if (Key = vk_Delete) then
  begin
    CdPro.Delete;
  end;
end;

procedure TFm_CadServicos.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  SqlProdutos;
end;

procedure TFm_CadServicos.FormCreate(Sender: TObject);
begin
  CdServicos.Close;
  CdServicos.Open;

  SqlProdutos;

end;

procedure TFm_CadServicos.PCcadastroShow(Sender: TObject);
begin
  SqlProdutos;
end;

procedure TFm_CadServicos.AbreSqlProAux;
begin
  CdProAux.Close;
  SQLProAux.SQL.Text := 'SELECT '  +
                        '  PRO_DESCRICAO '  +
                        'FROM PRODUTOS '  +
                        'WHERE PRO_COD = ' + CdProPSERV_PRODUTOS_FK.AsString +
                        ' AND PRO_STATUS = 1 ';
  CdProAux.Open;

  if not CdProAux.IsEmpty then
  begin
    CdPro.Edit;
    CdProPSERV_PRODUTO.AsString := CdProAuxPRO_DESCRICAO.AsString;
  end
  else
  begin
    Application.MessageBox('Produto não Cadastrado', 'Verifique !', mb_iconinformation + mb_ok);
    CdPro.Delete;
  end;
end;

procedure TFm_CadServicos.SpeedButton1Click(Sender: TObject);
begin
  CdPro.Append;
end;

procedure TFm_CadServicos.SpeedButton2Click(Sender: TObject);
begin
  CdPro.Delete;
end;

procedure TFm_CadServicos.SpeedButton3Click(Sender: TObject);
begin
    try
      Fm_PesquisaProdutos := TFm_PesquisaProdutos.Create(self);
      Fm_PesquisaProdutos.ShowModal;
    finally
      FreeAndNIL(Fm_PesquisaProdutos);
    end;
end;

procedure TFm_CadServicos.SqlProdutos;
var filtro : String;
begin
  if CdServicosSERV_COD.AsString <> '' then
  begin
    filtro := CdServicosSERV_COD.AsString;
  end
  else
  begin
    filtro := '0';
  end;

  CdPro.Close;

  SQLPro.SQL.Clear;
  SQLPro.SQL.Text := 'SELECT   ' +
                     ' PSERV_COD,  '  +
                     ' PSERV_PRODUTOS_FK, '  +
                     ' PSERV_SERVICOS_FK, '  +
                     ' PSERV_QTD, ' +
                     ' PSERV_PRODUTO '     +
                     ' FROM PRODUTOSERVICOS  ' +
                     ' WHERE PSERV_SERVICOS_FK = ' + filtro;
  CdPro.Open;

end;

end.
