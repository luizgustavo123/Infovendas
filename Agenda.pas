unit Agenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.FMTBcd,
  Vcl.Imaging.pngimage, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TFrmAgenda = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    Button5: TButton;
    DsAgenda: TDataSource;
    CdAgenda: TClientDataSet;
    CdAgendaAGE_COD: TIntegerField;
    CdAgendaAGE_DATA: TDateField;
    CdAgendaAGE_PROFISSIONAL_FK: TIntegerField;
    CdAgendaAGE_SERVICOS_FK: TIntegerField;
    CdAgendaAGE_HORARIO: TTimeField;
    CdAgendaAGE_PROF_DESC: TStringField;
    CdAgendaAGE_SERV_DESC: TStringField;
    DpAgenda: TDataSetProvider;
    SQLAgenda: TSQLQuery;
    SQLAgendaAGE_COD: TIntegerField;
    SQLAgendaAGE_DATA: TDateField;
    SQLAgendaAGE_PROFISSIONAL_FK: TIntegerField;
    SQLAgendaAGE_SERVICOS_FK: TIntegerField;
    SQLAgendaAGE_HORARIO: TTimeField;
    SQLAgendaAGE_PROF_DESC: TStringField;
    SQLAgendaAGE_SERV_DESC: TStringField;
    DsSer: TDataSource;
    DsUsu: TDataSource;
    CdUsu: TClientDataSet;
    CdUsuUSU_USUARIO: TStringField;
    CdSer: TClientDataSet;
    CdSerSERV_DESCRICAO: TStringField;
    DpSer: TDataSetProvider;
    DpUsu: TDataSetProvider;
    SQLUsu: TSQLQuery;
    SQLUsuUSU_USUARIO: TStringField;
    SQLSer: TSQLQuery;
    SQLSerSERV_DESCRICAO: TStringField;
    Image2: TImage;
    SQLAgendaAGE_OBS: TStringField;
    CdAgendaAGE_OBS: TStringField;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure CdAgendaAfterDelete(DataSet: TDataSet);
    procedure CdAgendaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgenda: TFrmAgenda;

implementation

{$R *.dfm}

procedure TFrmAgenda.Button1Click(Sender: TObject);
begin
  CdAgenda.Edit;
  CdAgenda.Post;
  Application.MessageBox('Salvo Com Sucesso', 'Salvo', mb_iconinformation + mb_ok);
end;

procedure TFrmAgenda.Button2Click(Sender: TObject);
begin
   if not CdAgenda.IsEmpty then
   begin
     if MessageDlg('Deseja Realmente Finalizar este Horário ?',mtConfirmation, [mbYes, mbNo],0, mbNo) = mrYes then
     begin
       CdAgenda.Delete;
     end;
   end;
end;

procedure TFrmAgenda.Button3Click(Sender: TObject);
begin
  CdAgenda.Cancel;
end;

procedure TFrmAgenda.Button5Click(Sender: TObject);
begin
  CdAgenda.Append;
end;

procedure TFrmAgenda.CdAgendaAfterDelete(DataSet: TDataSet);
begin
  CdAgenda.ApplyUpdates(0);
  CdAgenda.Refresh;
end;

procedure TFrmAgenda.CdAgendaAfterPost(DataSet: TDataSet);
begin
  CdAgenda.ApplyUpdates(0);
  CdAgenda.Refresh;
end;

procedure TFrmAgenda.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clWhite
    else
      Canvas.Brush.Color := clSilver;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;

end;

procedure TFrmAgenda.FormCreate(Sender: TObject);
begin
  CdAgenda.Close;
  CdAgenda.Open;

  CdSer.Close;
  CdSer.Open;

  CdUsu.Close;
  CdUsu.Open;

  with Dbgrid1.Columns[2].PickList do
  begin
    Clear;
    CdSer.First;
    while not CdSer.Eof do
    begin
      Add(CdSerSERV_DESCRICAO.AsString);
      CdSer.Next;
    end;
  end;

  with Dbgrid1.Columns[3].PickList do
  begin
    Clear;
    CdUsu.First;
    while not CdUsu.Eof do
    begin
      Add(CdUsuUSU_USUARIO.AsString);
      CdUsu.Next;
    end;
  end;
end;

end.
