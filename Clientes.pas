unit Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  Datasnap.DBClient, Data.DBXFirebird, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.Imaging.pngimage;

type
  Tfm_Clientes = class(TForm)
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBGrid1: TDBGrid;
    Clientes: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    PC: TPageControl;
    PCcadastro: TTabSheet;
    PCrelatorio: TTabSheet;
    EditCod: TEdit;
    EditNome: TEdit;
    Button6: TButton;
    EditCPF: TEdit;
    EditRG: TEdit;
    SpeedButton1: TSpeedButton;
    SQLtabelaCLI_NOME: TStringField;
    SQLtabelaCLI_ENDERECO: TStringField;
    SQLtabelaCLI_NUMERO: TStringField;
    SQLtabelaCLI_TELEFONE: TStringField;
    SQLtabelaCLI_CELULAR: TStringField;
    SQLtabelaCLI_OBS: TStringField;
    SQLtabelaCLI_RG: TStringField;
    SQLtabelaCLI_CPF: TStringField;
    SQLtabelaCLI_NASCIMENTO: TDateField;
    CDtabelaCLI_NOME: TStringField;
    CDtabelaCLI_ENDERECO: TStringField;
    CDtabelaCLI_NUMERO: TStringField;
    CDtabelaCLI_TELEFONE: TStringField;
    CDtabelaCLI_CELULAR: TStringField;
    CDtabelaCLI_OBS: TStringField;
    CDtabelaCLI_RG: TStringField;
    CDtabelaCLI_CPF: TStringField;
    CDtabelaCLI_NASCIMENTO: TDateField;
    SQLtabelaCLI_COD: TIntegerField;
    CDtabelaCLI_COD: TIntegerField;
    SQLtabelaCLI_END_COMPLEMENTO: TStringField;
    SQLtabelaCLI_END_ENTREGA: TStringField;
    SQLtabelaCLI_NUMERO_ENTREGA: TIntegerField;
    SQLtabelaCLI_END_COMPL_ENTREGA: TStringField;
    SQLtabelaCLI_BAIRRO_ENTREGA: TStringField;
    SQLtabelaCLI_CIDADE_ENTREGA: TStringField;
    SQLtabelaCLI_UF_ENTREGA: TStringField;
    CDtabelaCLI_END_COMPLEMENTO: TStringField;
    CDtabelaCLI_END_ENTREGA: TStringField;
    CDtabelaCLI_NUMERO_ENTREGA: TIntegerField;
    CDtabelaCLI_END_COMPL_ENTREGA: TStringField;
    CDtabelaCLI_BAIRRO_ENTREGA: TStringField;
    CDtabelaCLI_CIDADE_ENTREGA: TStringField;
    CDtabelaCLI_UF_ENTREGA: TStringField;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label9: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SbFoto: TSpeedButton;
    SQLtabelaCLI_FOTO: TStringField;
    CDtabelaCLI_FOTO: TStringField;
    Label15: TLabel;
    Image5: TImage;
    Image4: TImage;
    Label18: TLabel;
    SQLtabelaCLI_BAIRRO: TStringField;
    SQLtabelaCLI_CIDADE: TStringField;
    SQLtabelaCLI_UF: TStringField;
    SQLtabelaCLI_CEP: TStringField;
    CDtabelaCLI_BAIRRO: TStringField;
    CDtabelaCLI_CIDADE: TStringField;
    CDtabelaCLI_UF: TStringField;
    CDtabelaCLI_CEP: TStringField;
    Label17: TLabel;
    Label19: TLabel;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    Label20: TLabel;
    GroupBox1: TGroupBox;
    DBEdit9: TDBEdit;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    Label23: TLabel;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    DBEdit18: TDBEdit;
    Label25: TLabel;
    DBEdit19: TDBEdit;
    Label26: TLabel;
    SpeedButton2: TSpeedButton;
    DBEdit20: TDBEdit;
    Label27: TLabel;
    DBEdit21: TDBEdit;
    Label28: TLabel;
    SQLtabelaCLI_CNPJ: TStringField;
    SQLtabelaCLI_IE: TStringField;
    CDtabelaCLI_CNPJ: TStringField;
    CDtabelaCLI_IE: TStringField;
    DBMemo1: TDBMemo;
    Image6: TImage;
    SQLtabelaCLI_STATUS: TIntegerField;
    CDtabelaCLI_STATUS: TIntegerField;
    SQLtabelaCLI_LIMITE_CREDITO: TSingleField;
    CDtabelaCLI_LIMITE_CREDITO: TSingleField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CDtabelaAfterDelete(DataSet: TDataSet);
    procedure CDtabelaAfterPost(DataSet: TDataSet);
    procedure Button6Click(Sender: TObject);
    procedure SbFotoClick(Sender: TObject);
    procedure DStabelaDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbreSQL(Sender: TObject);

  public
    { Public declarations }
  end;

var
  fm_Clientes: Tfm_Clientes;

implementation

{$R *.dfm}

uses Data_Module;


procedure Tfm_Clientes.AbreSQL(Sender: TObject);
begin
  CDTabela.Close;
  SQLtabela.SQL.Clear;
  SQLtabela.SQL.Text := 'SELECT' +
                        ' * ' +
                        ' FROM CLIENTES ' +
                        ' WHERE CLI_STATUS = 1 AND CLI_COD <> 0';

  if EditCod.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      ' AND CLI_COD = ' + EditCod.Text;
  end;

  if EditNome.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
     'AND CLI_NOME LIKE ' + QuotedStr('%'+EditNome.Text+'%');
  end;

  if EditCPF.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      'AND CLI_CPF = ' +  QuotedStr(EditCPF.Text);
  end;

  if EditRG.Text <> '' then
  begin
    SQLtabela.SQL.Text := SQLtabela.SQL.Text +
      'AND CLI_RG = ' +  QuotedStr(EditRG.Text);
  end;

  CDTabela.Open;

end;

procedure Tfm_Clientes.Button1Click(Sender: TObject);
begin
  Button2.Enabled := True;
  CDtabelaCLI_STATUS.AsInteger := 1;
  CDtabela.Post;
  Application.MessageBox('Cliente Salvo com  Sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure Tfm_Clientes.Button2Click(Sender: TObject);
begin
   if not CDtabela.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Excluir o Cliente ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CDtabela.Edit;
       CDtabelaCLI_STATUS.AsInteger := 0;
       CDtabela.ApplyUpdates(0);
       CDtabela.Refresh;
     end;
   end;
end;

procedure Tfm_Clientes.Button3Click(Sender: TObject);
begin
  Button2.Enabled := True;
  CDtabela.Cancel;
end;

procedure Tfm_Clientes.Button5Click(Sender: TObject);
begin
  Button2.Enabled := False;
  CDtabela.Append;
end;

procedure Tfm_Clientes.Button6Click(Sender: TObject);
begin
  AbreSQL(Sender);
  CDtabela.Refresh;
end;

procedure Tfm_Clientes.CDtabelaAfterDelete(DataSet: TDataSet);
begin
  CDtabela.ApplyUpdates(0);
  CDtabela.Refresh;
end;

procedure Tfm_Clientes.CDtabelaAfterPost(DataSet: TDataSet);
begin
  CDtabela.ApplyUpdates(0);
  CDtabela.Refresh;
end;

procedure Tfm_Clientes.DStabelaDataChange(Sender: TObject; Field: TField);
begin
  Image4.Picture.LoadFromFile(CDtabelaCLI_FOTO.AsString);
end;

procedure Tfm_Clientes.FormCreate(Sender: TObject);
begin
  if not CDtabela.IsEmpty then
  begin
    Button2.Enabled := False;
  end;

  try
    CDtabela.Close;
    CDtabela.Open;
    Image4.Picture.LoadFromFile(CDtabelaCLI_FOTO.AsString);
  except
    CDtabela.Edit;
    CDtabelaCLI_FOTO.AsString := '';
    CDtabela.ApplyUpdates(0);
    CDtabela.Refresh;
  end;


end;

procedure Tfm_Clientes.SbFotoClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image4.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
  CDtabela.Edit;
  CDtabelaCLI_FOTO.AsString := OpenPictureDialog1.FileName;
end;

procedure Tfm_Clientes.SpeedButton2Click(Sender: TObject);
begin
  CDtabela.Edit;
  CDtabelaCLI_FOTO.AsString := '';
end;

end.
