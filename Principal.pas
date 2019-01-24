unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,
  CadServicos, CaixaServicos, Data_Module, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, ControleUsuario, RelatorioServicos,
  Produtos, Fornecedor, Clientes, Informacoes, Agenda, Vcl.ExtDlgs, PdvCaixa;

type
  TFm_Principal = class(TForm)
    Image1: TImage;
    Image3: TImage;
    SpeedButton10: TSpeedButton;
    Label11: TLabel;
    SpeedButton11: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    SbMinhasInformacoes: TSpeedButton;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    Label13: TLabel;
    SpeedButton4: TSpeedButton;
    Label4: TLabel;
    SpeedButton5: TSpeedButton;
    Label5: TLabel;
    SbRelatorios: TSpeedButton;
    Label3: TLabel;
    SbControleUsuarios: TSpeedButton;
    Label7: TLabel;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    SpeedButton6: TSpeedButton;
    Label9: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Label6: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label10: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label12: TLabel;
    Panel7: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    LabVenda: TLabel;
    LabOs: TLabel;
    LabLucro: TLabel;
    LabContaPaga: TLabel;
    LabContaRecebe: TLabel;
    LbaVemData: TLabel;
    LabOSData: TLabel;
    LabDatLucro: TLabel;
    LabDataContaPagar: TLabel;
    LabCContaRecebe: TLabel;
    SpeedButton9: TSpeedButton;
    Label31: TLabel;
    Label32: TLabel;
    SQLVenda: TSQLQuery;
    DsVenda: TDataSource;
    CdVenda: TClientDataSet;
    DpVenda: TDataSetProvider;
    DsServicos: TDataSource;
    CdServicos: TClientDataSet;
    DpServicos: TDataSetProvider;
    SQLServicos: TSQLQuery;
    DsContaPagar: TDataSource;
    CdContaPagar: TClientDataSet;
    DpContaPagar: TDataSetProvider;
    SQLContaPagar: TSQLQuery;
    DsContaRecebe: TDataSource;
    CdContaRecebe: TClientDataSet;
    DpContaRecebe: TDataSetProvider;
    SQLContaRecebe: TSQLQuery;
    DsLucro: TDataSource;
    CdLucro: TClientDataSet;
    DpLucro: TDataSetProvider;
    SQLLucro: TSQLQuery;
    SQLVendaTOTAL_VENDAS: TFloatField;
    CdVendaTOTAL_VENDAS: TFloatField;
    SQLServicosTOTAL_OS: TFloatField;
    CdServicosTOTAL_OS: TFloatField;
    SQLLucroSUM: TFloatField;
    CdLucroSUM: TFloatField;
    DsLucroVenda: TDataSource;
    CdLucroVenda: TClientDataSet;
    DpLucroVenda: TDataSetProvider;
    SQLLucroVenda: TSQLQuery;
    SQLContaPagarSUM: TFloatField;
    CdContaPagarSUM: TFloatField;
    SQLLucroVendaSUM: TFloatField;
    CdLucroVendaSUM: TFloatField;
    CdContaRecebeSUM: TFloatField;
    SQLContaRecebeSUM: TFloatField;
    SpeedButton12: TSpeedButton;
    Label18: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SbControleUsuariosClick(Sender: TObject);
    procedure SbRelatoriosClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SbMinhasInformacoesClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaDashboard;
  public
    { Public declarations }
    var Sistema : String;
  end;

var
  Fm_Principal: TFm_Principal;

implementation

{$R *.dfm}

uses Configuracoes, Funcoes;



procedure TFm_Principal.AtualizaDashboard;
begin
  CdVenda.Close;
  CdVenda.Open;
  CdServicos.Close;
  CdServicos.Open;
  CdLucro.Close;
  CdLucro.Open;
  CdLucroVenda.Close;
  CdLucroVenda.Open;
  CdContaPagar.Close;
  CdContaPagar.Open;
  CdContaRecebe.Close;
  CdContaRecebe.Open;


  if CdVendaTOTAL_VENDAS.Value <> null then
  begin
    LabVenda.Caption := FormatFloat('R$ #,,,,0.00',CdVendaTOTAL_VENDAS.Value);
  end;

  if CdServicosTOTAL_OS.Value <> null then
  begin
    LabOs.Caption := FormatFloat('R$ #,,,,0.00', CdServicosTOTAL_OS.Value);
  end;

  if CdLucroVendaSUM.Value <> null then
  begin
    LabLucro.Caption := FormatFloat('R$ #,,,,0.00', CdLucroSUM.Value + CdLucroVendaSUM.Value);
  end;

  if CdContaPagarSUM.Value <> null then
  begin
    LabContaPaga.Caption := FormatFloat('R$ #,,,,0.00',CdContaPagarSUM.Value);
  end;

  if CdContaRecebeSUM.Value <> null then
  begin
    LabContaRecebe.Caption := FormatFloat('R$ #,,,,0.00',CdContaRecebeSUM.Value);
  end;


  LabDataContaPagar.Caption := funcoes.NomedoMes(Date);
  LabDatLucro.Caption := funcoes.NomedoMes(Date);
  LabOSData.Caption := DateToStr(Date);
  LbaVemData.Caption := DateToStr(Date);
  LabCContaRecebe.Caption := funcoes.NomedoMes(Date);

end;

procedure TFm_Principal.FormCreate(Sender: TObject);
begin
  DataModule1.CdSis.Close;
  DataModule1.CdSis.Open;

  AtualizaDashboard;

  DataModule1.SQLUsuario.Close;
  DataModule1.SQLUsuario.Open;

  if DataModule1.CdSisSIS_IMG_FUNDO.AsString <> '' then
  begin
    try
      DataModule1.CdSis.Close;
      DataModule1.CdSis.Open;
      Image3.Picture.LoadFromFile(DataModule1.CdSisSIS_IMG_FUNDO.AsString);
    except
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_IMG_FUNDO.AsString := '';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end;
  end;

end;

procedure TFm_Principal.SbControleUsuariosClick(Sender: TObject);
begin
  DataModule1.CdSis.Close;
  DataModule1.CdSis.Open;

  if DataModule1.SQLUsuarioUSU_PRIVILEGIO.AsString <> 'Operacional' then
  begin
    try
      FmControleUsuario := TFmControleUsuario.Create(self);
      FmControleUsuario.ShowModal;
    finally
      FreeAndNil(FmControleUsuario);
    end;
  end
  else
  begin
    Application.MessageBox('Sem permissão de acesso', 'Verifique', mb_iconinformation + mb_ok);
  end;

end;

procedure TFm_Principal.SbMinhasInformacoesClick(Sender: TObject);
begin
  DataModule1.CdSis.Close;
  DataModule1.CdSis.Open;

  if DataModule1.SQLUsuarioUSU_PRIVILEGIO.AsString <> 'Operacional' then
  begin
    try
      Fm_Informacoes := TFm_Informacoes.Create(self);
      Fm_Informacoes.ShowModal;
    finally
      FreeAndNil(Fm_Informacoes);
    end
  end
  else
  begin
    Application.MessageBox('Sem permissão de acesso', 'Verifique', mb_iconinformation + mb_ok);
  end;
end;

procedure TFm_Principal.SbRelatoriosClick(Sender: TObject);
begin
  try
    Fm_RelatorioPrincipal := TFm_RelatorioPrincipal.Create(self);
    Fm_RelatorioPrincipal.ShowModal;
  finally
    FreeAndNil(Fm_RelatorioPrincipal);
  end;
end;

procedure TFm_Principal.SpeedButton10Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image3.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
  DataModule1.CdSis.Edit;
  DataModule1.CdSisSIS_IMG_FUNDO.AsString := OpenPictureDialog1.FileName;

  DataModule1.CdSis.ApplyUpdates(0);
  DataModule1.CdSis.Refresh;
end;

procedure TFm_Principal.SpeedButton11Click(Sender: TObject);
begin
   if MessageDlg('Deseja realmente excluir a imagem de fundo ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
   begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_IMG_FUNDO.AsString := '';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;

      Image3.Picture.LoadFromFile(DataModule1.CdSisSIS_IMG_FUNDO.AsString);
   end;
end;

procedure TFm_Principal.SpeedButton12Click(Sender: TObject);
begin
  AtualizaDashboard;
end;

procedure TFm_Principal.SpeedButton1Click(Sender: TObject);
begin
  try
    Fm_CaixaServicos := TFm_CaixaServicos.Create(Self);
    Fm_CaixaServicos.ShowModal;
  finally
    FreeAndNil(Fm_CaixaServicos);
  end;
end;

procedure TFm_Principal.SpeedButton2Click(Sender: TObject);
begin
  try
    Fm_CadServicos := TFm_CadServicos.Create(self);
    Fm_CadServicos.ShowModal;
  finally
    FreeAndNil(Fm_CadServicos);
  end;
end;

procedure TFm_Principal.SpeedButton3Click(Sender: TObject);
begin
  TRY
    fm_Produtos := Tfm_Produtos.Create(self);
    fm_Produtos.ShowModal;
  FINALLY
    FreeAndNil(fm_Produtos);
  END;
end;

procedure TFm_Principal.SpeedButton4Click(Sender: TObject);
begin
  try
    fm_Fornecedor := Tfm_Fornecedor.Create(self);
    fm_Fornecedor.ShowModal;
  finally
    FreeAndNil(fm_Fornecedor);
  end;
end;

procedure TFm_Principal.SpeedButton5Click(Sender: TObject);
begin
  try
    fm_Clientes := Tfm_Clientes.Create(self);
    fm_Clientes.ShowModal;
  finally
    FreeAndNil(fm_Clientes);
  end;
end;

procedure TFm_Principal.SpeedButton6Click(Sender: TObject);
begin
  Try
    FrmAgenda := TFrmAgenda.Create(self);
    FrmAgenda.ShowModal;
  Finally
    FreeAndNil(FrmAgenda);
  End;
end;

procedure TFm_Principal.SpeedButton7Click(Sender: TObject);
begin
  try
    Fm_PdvCaixa := TFm_PdvCaixa.Create(self);
    Fm_PdvCaixa.ShowModal;
  finally
    FreeAndNil(Fm_PdvCaixa);
  end;
end;

procedure TFm_Principal.SpeedButton8Click(Sender: TObject);
begin
  DataModule1.CdSis.Close;
  DataModule1.CdSis.Open;

  if DataModule1.SQLUsuarioUSU_PRIVILEGIO.AsString <> 'Operacional' then
  begin
    try
      FrmConfiguracoes := TFrmConfiguracoes.Create(self);
      FrmConfiguracoes.ShowModal;
    finally
      FreeAndNil(FrmConfiguracoes);
    end
  end
  else
  begin
    Application.MessageBox('Sem permissão de acesso', 'Verifique', mb_iconinformation + mb_ok);
  end;
end;

procedure TFm_Principal.SpeedButton9Click(Sender: TObject);
begin
  if Panel2.Visible then
  begin
    Panel2.Visible := False;
  end
  else
  begin
    Panel2.Visible := True;
  end;
end;

end.
