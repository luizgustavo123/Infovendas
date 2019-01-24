unit PesquisaProf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Data_Module;

type
  TFmPesquisaProf = class(TForm)
    CdUsuario: TClientDataSet;
    CdUsuarioUSU_USUARIO: TStringField;
    CdUsuarioUSU_SENHA: TStringField;
    CdUsuarioUSU_PRIVILEGIO: TStringField;
    CdUsuarioUSU_COD: TIntegerField;
    CdUsuarioUSU_COMISSAO: TFloatField;
    DpUsuario: TDataSetProvider;
    SQLUsuario: TSQLQuery;
    SQLUsuarioUSU_USUARIO: TStringField;
    SQLUsuarioUSU_SENHA: TStringField;
    SQLUsuarioUSU_PRIVILEGIO: TStringField;
    SQLUsuarioUSU_COD: TIntegerField;
    SQLUsuarioUSU_COMISSAO: TFloatField;
    DsUsuario: TDataSource;
    DBGrid1: TDBGrid;
    Image3: TImage;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPesquisaProf: TFmPesquisaProf;

implementation

{$R *.dfm}

uses ServicosRealizados;

procedure TFmPesquisaProf.DBGrid1DblClick(Sender: TObject);
begin
  if  Fm_ServicosRealizados <> nil then
  begin
    Fm_ServicosRealizados.EdtProf.Text := CdUsuarioUSU_USUARIO.AsString;
  end;
end;

procedure TFmPesquisaProf.FormCreate(Sender: TObject);
begin
  CdUsuario.Close;
  CdUsuario.Open;
end;

end.
