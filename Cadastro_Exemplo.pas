unit Cadastro_Exemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, System.Actions,
  Vcl.ActnList;

type
  Tfm_Cadastro_Exemplo = class(TForm)
    Label1: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    Clientes: TLabel;
    Button5: TButton;
    DStabela: TDataSource;
    CDtabela: TClientDataSet;
    DPtabela: TDataSetProvider;
    SQLtabela: TSQLQuery;
    PCcadastro: TTabSheet;
    PCrelatorio: TTabSheet;
    edtCodigo: TEdit;
    BTpesquisar: TButton;
    PC: TPageControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Cadastro_Exemplo: Tfm_Cadastro_Exemplo;

implementation

{$R *.dfm}

uses Data_Module;

end.
