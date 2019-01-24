unit RelatorioContaPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Rel_ContaPagar, RLXLSXFilter, RLFilters,
  RLPDFFilter;

type
  TFrm_RelatorioContaPagar = class(TForm)
    Image1: TImage;
    EdtCod: TEdit;
    EdtDesc: TEdit;
    CboSituacao: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    MdtDataPagaIni: TMaskEdit;
    Label3: TLabel;
    BtVisualizar: TButton;
    BtSair: TButton;
    MdtDataPagaFim: TMaskEdit;
    Label4: TLabel;
    MdtDataPagEfetuadoIni: TMaskEdit;
    Label5: TLabel;
    MdtDataPagEfetuadoFim: TMaskEdit;
    Label6: TLabel;
    CboStatus: TComboBox;
    Label7: TLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    procedure BtVisualizarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_RelatorioContaPagar: TFrm_RelatorioContaPagar;

implementation

{$R *.dfm}

procedure TFrm_RelatorioContaPagar.BtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_RelatorioContaPagar.BtVisualizarClick(Sender: TObject);
begin
  try
    Fm_RelContaPagar := TFm_RelContaPagar.Create(self);
      Fm_RelContaPagar.CdTabela.Close;
      Fm_RelContaPagar.SQLTabela.SQL.Text := ' SELECT * FROM CONTAS_PAGAR  WHERE COP_N_PARCELAS IS NOT null ';

     if EdtCod.Text <> '' then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text +
       ' AND  COP_COD = ' +  EdtCod.Text;
     end;
     if EdtDesc.Text <> '' then
     begin
        Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text +
        ' AND  COP_DESC LIKE '+  QuotedStr('%'+EdtDesc.Text+'%');
     end;
     if (MdtDataPagaIni.Text <> '  /  /    ') and (MdtDataPagaFim.Text <> '  /  /    ') then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
     end;
     if MdtDataPagaIni.Text <> '  /  /    ' then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaIni.Text)));
     end;
     if MdtDataPagaFim.Text <> '  /  /    ' then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagaFim.Text)));
     end;

     if (MdtDataPagEfetuadoIni.Text <> '  /  /    ') and (MdtDataPagEfetuadoFim.Text <> '  /  /    ') then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG_EFETUADO BETWEEN ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoIni.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoFim.Text)));
     end;
     if MdtDataPagEfetuadoIni.Text <> '  /  /    ' then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG_EFETUADO >= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoIni.Text)));
     end;
     if MdtDataPagEfetuadoFim.Text <> '  /  /    ' then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG_EFETUADO <= ' + QuotedStr(FormatDateTime('mm"-"dd"-"yyyy',StrToDate(MdtDataPagEfetuadoFim.Text)));
     end;

     if CboSituacao.ItemIndex = 1 then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_SITUACAO = ''' + 'Não Pago' + '''';
     end;
     if CboSituacao.ItemIndex = 2 then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_SITUACAO = ''' + 'Pago' + '''';
     end;

     if CboStatus.ItemIndex = 1  then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG < CURRENT_DATE ';
     end;
     if CboStatus.ItemIndex = 2 then
     begin
       Fm_RelContaPagar.SQLTabela.SQL.Text := Fm_RelContaPagar.SQLTabela.SQL.Text + ' AND COP_DATA_PAG > CURRENT_DATE ';
     end;

      Fm_RelContaPagar.CdTabela.Open;

    if not Fm_RelContaPagar.CdTabela.IsEmpty then
    begin
      Fm_RelContaPagar.RLReport1.Preview();
    end
    else
    begin
      Application.MessageBox('Não foi encontrado registros', 'Verifique !', mb_iconinformation + mb_ok);
    end;

  finally
    FreeAndNil(Fm_RelContaPagar);
  end;
end;

end.
