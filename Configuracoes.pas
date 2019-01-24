unit Configuracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ExtDlgs,
  Vcl.Imaging.pngimage,IniFiles;

type
  TFrmConfiguracoes = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    DsTabela: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    Image6: TImage;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label9: TLabel;
    SbFoto: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Image2: TImage;
    Image4: TImage;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label17: TLabel;
    Label14: TLabel;
    CdEmp: TClientDataSet;
    CdEmpEMP_COD: TIntegerField;
    CdEmpEMP_NOME_FANTASIA: TStringField;
    CdEmpEMP_RAZAO_SOCIAL: TStringField;
    CdEmpEMP_CNPJ: TStringField;
    CdEmpEMP_ENDERECO: TStringField;
    CdEmpEMP_CEP: TStringField;
    CdEmpEMP_CIDADE: TStringField;
    CdEmpEMP_TELEFONE: TStringField;
    CdEmpEMP_OBS: TStringField;
    CdEmpEMP_NUMERO: TIntegerField;
    CdEmpEMP_CELULAR: TStringField;
    CdEmpEMP_INC_ESTADUAL: TStringField;
    CdEmpEMP_LOGO: TStringField;
    CdEmpEMP_DESCONTO_AVISTA: TSmallintField;
    CdEmpEMP_ACRESCIMO_APRAZO: TSingleField;
    CdEmpEMP_SERV_DESCONTO_AVISTA: TSingleField;
    CdEmpEMP_SERV_ACRESCIMO_APRAZO: TSingleField;
    DpEmp: TDataSetProvider;
    SQLEmp: TSQLQuery;
    SQLEmpEMP_COD: TIntegerField;
    SQLEmpEMP_NOME_FANTASIA: TStringField;
    SQLEmpEMP_RAZAO_SOCIAL: TStringField;
    SQLEmpEMP_CNPJ: TStringField;
    SQLEmpEMP_ENDERECO: TStringField;
    SQLEmpEMP_CEP: TStringField;
    SQLEmpEMP_CIDADE: TStringField;
    SQLEmpEMP_TELEFONE: TStringField;
    SQLEmpEMP_OBS: TStringField;
    SQLEmpEMP_NUMERO: TIntegerField;
    SQLEmpEMP_CELULAR: TStringField;
    SQLEmpEMP_INC_ESTADUAL: TStringField;
    SQLEmpEMP_LOGO: TStringField;
    SQLEmpEMP_DESCONTO_AVISTA: TSmallintField;
    SQLEmpEMP_ACRESCIMO_APRAZO: TSingleField;
    SQLEmpEMP_SERV_DESCONTO_AVISTA: TSingleField;
    SQLEmpEMP_SERV_ACRESCIMO_APRAZO: TSingleField;
    GroupBox3: TGroupBox;
    CboImpTermi: TCheckBox;
    CboImpA4: TCheckBox;
    Label18: TLabel;
    Label19: TLabel;
    SQLEmpEMP_IMP_A4: TSmallintField;
    CdEmpEMP_IMP_A4: TSmallintField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SbFotoClick(Sender: TObject);
    procedure CdEmpAfterPost(DataSet: TDataSet);
    procedure CboImpTermiClick(Sender: TObject);
    procedure CboImpA4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfiguracoes: TFrmConfiguracoes;

implementation

{$R *.dfm}

uses Funcoes;

procedure TFrmConfiguracoes.Button1Click(Sender: TObject);
begin
  if CboImpA4.Checked then
  begin
    CdEmp.Edit;
    CdEmpEMP_IMP_A4.AsInteger := 1;
  end
  else
  begin
    CdEmp.Edit;
    CdEmpEMP_IMP_A4.AsInteger := 0;
  end;

  CdEmp.Edit;
  CdEmp.Post;

  Application.MessageBox('Salvo Com Sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure TFrmConfiguracoes.Button2Click(Sender: TObject);
begin
  CdEmp.Cancel;
end;

procedure TFrmConfiguracoes.Button3Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmConfiguracoes.CboImpA4Click(Sender: TObject);
begin
  CboImpTermi.Checked := False;
end;

procedure TFrmConfiguracoes.CboImpTermiClick(Sender: TObject);
begin
    CboImpA4.Checked := False;
end;

procedure TFrmConfiguracoes.CdEmpAfterPost(DataSet: TDataSet);
begin
  CdEmp.ApplyUpdates(0);
  CdEmp.Refresh;
end;

procedure TFrmConfiguracoes.FormCreate(Sender: TObject);
begin
  try
    CdEmp.Close;
    CdEmp.Open;
    Image4.Picture.LoadFromFile(CdEmpEMP_LOGO.AsString);
  except
    CdEmp.Edit;
    CdEmpEMP_LOGO.AsString := '';
    CdEmp.ApplyUpdates(0);
    CdEmp.Refresh;
  end;

  if CdEmpEMP_IMP_A4.AsInteger = 1 then
  begin
    CboImpTermi.Checked := False;
    CboImpA4.Checked := True;
  end
  else
  begin
    CboImpA4.Checked := False;
    CboImpTermi.Checked := True;
  end;
end;


procedure TFrmConfiguracoes.SbFotoClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image4.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
  CdEmp.Edit;
  CdEmpEMP_LOGO.AsString := OpenPictureDialog1.FileName;
end;

procedure TFrmConfiguracoes.SpeedButton2Click(Sender: TObject);
begin
  CdEmp.Edit;
  CdEmpEMP_LOGO.AsString := '';
end;

end.
