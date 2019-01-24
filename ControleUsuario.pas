unit ControleUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data_Module, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  Datasnap.DBClient;

type
  TFmControleUsuario = class(TForm)
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    CbPrivilegio: TComboBox;
    DsUsuario: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    DbeComissao: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Image6: TImage;
    CdUsuario: TClientDataSet;
    CdUsuarioUSU_USUARIO: TStringField;
    CdUsuarioUSU_SENHA: TStringField;
    CdUsuarioUSU_PRIVILEGIO: TStringField;
    CdUsuarioUSU_COMISSAO: TFloatField;
    CdUsuarioUSU_COD: TIntegerField;
    DpUsuario: TDataSetProvider;
    SQLUsuario: TSQLQuery;
    SQLUsuarioUSU_USUARIO: TStringField;
    SQLUsuarioUSU_SENHA: TStringField;
    SQLUsuarioUSU_PRIVILEGIO: TStringField;
    SQLUsuarioUSU_COMISSAO: TFloatField;
    SQLUsuarioUSU_COD: TIntegerField;
    SQLUsuarioUSU_STATUS: TSmallintField;
    CdUsuarioUSU_STATUS: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DsUsuarioDataChange(Sender: TObject; Field: TField);
    procedure CbPrivilegioExit(Sender: TObject);
    procedure CdUsuarioAfterPost(DataSet: TDataSet);
    procedure CdUsuarioAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure AbreSQL;
  public
    { Public declarations }
    var index : integer;
  end;

var
  FmControleUsuario: TFmControleUsuario;

implementation

{$R *.dfm}

procedure TFmControleUsuario.AbreSQL;
begin
  CdUsuario.Close;
  SQLUsuario.SQL.Clear;
  SQLUsuario.SQL.Text := 'SELECT ' +
                                     ' USU_COD, ' +
                                     ' USU_COMISSAO, ' +
                                     ' USU_USUARIO,  '   +
                                     ' USU_STATUS, ' +
                                     ' USU_SENHA,   '  +
                                     ' USU_PRIVILEGIO ' +
                                     ' FROM USUARIO  ' +
                                     ' WHERE USU_STATUS = 1';
  CdUsuario.Open;

end;

procedure TFmControleUsuario.Button1Click(Sender: TObject);
begin
  CdUsuario.Append;
end;

procedure TFmControleUsuario.Button2Click(Sender: TObject);
begin
  CbPrivilegio.SetFocus;
  if index = 0 then
  begin
    CdUsuario.Edit;
    CdUsuarioUSU_PRIVILEGIO.AsString := 'Gerencial';
  end
  else
  begin
    CdUsuario.Edit;
    CdUsuarioUSU_PRIVILEGIO.AsString := 'Operacional';
  end;

  CdUsuario.Edit;
  CdUsuarioUSU_STATUS.AsInteger := 1;
  CdUsuario.Post;
  ShowMessage('Usuário Salvo Com Sucesso ');
end;

procedure TFmControleUsuario.Button3Click(Sender: TObject);
begin
    CdUsuario.Cancel;
end;

procedure TFmControleUsuario.Button4Click(Sender: TObject);
begin
  if MessageDlg('Deseja Realmente Excluir o Usuário ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
  begin
    CdUsuario.Edit;
    CdUsuarioUSU_STATUS.AsInteger := 0;
    Cdusuario.ApplyUpdates(0);
    Cdusuario.Refresh;
    ShowMessage('Usuário excluído ');
  end;
end;

procedure TFmControleUsuario.CbPrivilegioExit(Sender: TObject);
begin
  index := CbPrivilegio.ItemIndex;
end;

procedure TFmControleUsuario.CdUsuarioAfterDelete(DataSet: TDataSet);
begin
 Cdusuario.ApplyUpdates(0);
 Cdusuario.Refresh;
end;

procedure TFmControleUsuario.CdUsuarioAfterPost(DataSet: TDataSet);
begin
 Cdusuario.ApplyUpdates(0);
 Cdusuario.Refresh;
end;

procedure TFmControleUsuario.DsUsuarioDataChange(Sender: TObject;
  Field: TField);
begin
  if CdUsuarioUSU_PRIVILEGIO.AsString = 'Operacional' then
  begin
    CbPrivilegio.ItemIndex := 1;
  end
  else
  begin
    CbPrivilegio.ItemIndex := 0;
  end;
end;

procedure TFmControleUsuario.FormCreate(Sender: TObject);
begin
  AbreSQL;

  if CdUsuarioUSU_PRIVILEGIO.AsString = 'Operacional' then
  begin
    CbPrivilegio.ItemIndex := 1;
  end
  else
  begin
    CbPrivilegio.ItemIndex := 0;
  end;

  {if not DataModule1.CdUsuario.IsEmpty then
  begin
    Button3.Enabled := False;
  end;   }
end;

end.
