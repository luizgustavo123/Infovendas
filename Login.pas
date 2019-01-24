unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Data_Module, Vcl.Imaging.pngimage,
  Data.DB, Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, Principal, IniFiles;

type
  Tfm_Login = class(TForm)
    BtnEntrar: TButton;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    z: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Image2: TImage;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    Label4: TLabel;
    DBText1: TDBText;
    SpeedButton1: TSpeedButton;
    PanLicenca: TPanel;
    DbeSerial: TDBEdit;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    PanIP: TPanel;
    EdtIPServ: TEdit;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton5: TSpeedButton;
    procedure BtnEntrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Licenca;
  end;

var
  fm_Login: Tfm_Login;

implementation

{$R *.dfm}

uses Funcoes;


procedure Tfm_Login.BtnEntrarClick(Sender: TObject);
begin
   DataModule1.CdUsuario.Close;

   DataModule1.SQLUsuario.SQL.Text := 'SELECT ' +
                                      ' USU_COD, ' +
                                      ' USU_USUARIO,  ' +
                                      ' USU_COMISSAO, ' +
                                      ' USU_SENHA,  ' +
                                      ' USU_PRIVILEGIO '  +
                                      'FROM USUARIO  ' +
                                      ' WHERE USU_USUARIO = ' +''''+ EdtUsuario.Text+'''' +
                                      ' AND USU_SENHA = ' +''''+ EdtSenha.Text+''''+
                                      ' AND USU_STATUS = 1 ';
   DataModule1.CdUsuario.Open;

  if DataModule1.CdUsuario.IsEmpty then
  begin
    Application.MessageBox('Usuário ou Senha incorreto', 'Login', mb_iconinformation + mb_ok);
  end
  else if DataModule1.CdSisSIS_STATUS.AsString = 'Ativa' then
  begin
     if DataModule1.CdSisSISTEMA.AsString = 'INFOVENDAS'   then
     begin
       Fm_Principal := TFm_Principal.Create(self);
       Fm_Principal.ShowModal;

       fm_Login.Close;
       FreeAndNil(fm_Login);
     end
     else if DataModule1.CdSisSISTEMA.AsString = 'SALAOTEC'   then
     begin
       Fm_Principal := TFm_Principal.Create(self);
       Fm_Principal.ShowModal;

       fm_Login.Close;
       FreeAndNil(fm_Login);
     end;
  end
  else
  begin
    Application.MessageBox('Licença do Software expirou, para mais informações entre em contato', 'Verifique', mb_iconinformation + mb_ok);
  end;
end;

procedure Tfm_Login.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfm_Login.FormCreate(Sender: TObject);
var
  ArquivoINI: TmemIniFile;
  usu : String;
begin
  usu :=  funcoes.GetNetUserName;
  ArquivoINI := TmemIniFile.Create('C:\Users\'+ usu + '\Documents\ConexaoSistemaSoftPop.ini');
  EdtIPServ.Text := ArquivoINI.ReadString('IP', 'SERVIDOR', '');
  ArquivoINI.UpdateFile;
  ArquivoINI.Free;

  try
    datamodule1.SQLConnection1.Connected := False;
    datamodule1.SQLConnection1.Connected := True;
  except
    Application.MessageBox('IP informado está errado', 'Verifique', mb_iconinformation + mb_ok);
  end;

  Licenca;
end;

procedure Tfm_Login.Licenca;
var licenca1,licenca2,licenca3,licenca4,licenca5,licenca6,licenca7,licenca8,licenca9,licenca10,licenca11,licenca12,licencaDemo : String;
DemoData, mes1,mes2,mes3,mes4,mes5,mes6,mes7,mes8,mes9,mes10,mes11,mes12 : TDate;
begin
  licencaDemo := 'DEMO'; // 7 Dias para teste
  licenca1 := 'fr2d'; //  30.01.2019
  licenca2 := 'lkgh'; //  02.03.2019
  licenca3 := 'hhgg'; //  30.03.2019
  licenca4 := 'ghjk'; //  30.04.2019
  licenca5 := 'gjgj'; //  30.05.2019
  licenca6 := 'fkyo'; //  30.06.2019
  licenca7 := 'erty'; //  30.07.2019
  licenca8 := 'erte'; //  30.08.2019
  licenca9 := 'esxc'; //  30.09.2019
  licenca10:= 'ghjt'; //  30.10.2019
  licenca11:= 'ffgt'; //  30.11.2019
  licenca12:= 'ggmm'; //  30.12.2019

  mes1 := StrToDate('30/01/2019');
  mes2 := StrToDate('02/03/2019');
  mes3 := StrToDate('30/03/2019');
  mes4 := StrToDate('30/04/2019');
  mes5 := StrToDate('30/05/2019');
  mes6 := StrToDate('30/06/2019');
  mes7 := StrToDate('30/07/2019');
  mes8 := StrToDate('30/08/2019');
  mes9 := StrToDate('30/09/2019');
  mes10 := StrToDate('30/10/2019');
  mes11 := StrToDate('30/11/2019');
  mes12 := StrToDate('30/12/2019');

  DataModule1.CdSis.Close;
  DataModule1.CdSis.Open;

  if DataModule1.CdSisSIS_DATA_DEMO.AsString = '' then
  begin
    DemoData := (Date + 7);
    DataModule1.CdSis.Edit;
    DataModule1.CdSisSIS_DATA_DEMO.AsDateTime := DemoData;
  end;

  if licencaDemo = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= DataModule1.CdSisSIS_DATA_DEMO.AsDateTime then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca1 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes1 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca2 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes2 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca3 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes3 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca4 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes4 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca5 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes5 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca6 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes6 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca7 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes7 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca8 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes8 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca9 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes9 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca10 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes10 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca11 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes11 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else if licenca12 = DataModule1.CdSisSIS_SERIAL.AsString then
  begin
    if Date <= mes12 then
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Ativa';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
    else
    begin
      DataModule1.CdSis.Edit;
      DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
      DataModule1.CdSis.ApplyUpdates(0);
      DataModule1.CdSis.Refresh;
    end
  end
  else
  begin
    DataModule1.CdSis.Edit;
    DataModule1.CdSisSIS_STATUS.AsString := 'Expirou';
    DataModule1.CdSis.ApplyUpdates(0);
    DataModule1.CdSis.Refresh;
  end;
end;

procedure Tfm_Login.SpeedButton1Click(Sender: TObject);
begin
  if PanLicenca.Visible = False then
  begin
    PanLicenca.Visible := True;
  end
  else
  begin
    PanLicenca.Visible := False;
  end;
end;

procedure Tfm_Login.SpeedButton2Click(Sender: TObject);
begin
  DataModule1.CdSis.Post;
  DataModule1.CdSis.ApplyUpdates(0);
  DataModule1.CdSis.Refresh;

  Licenca;

  DataModule1.CdSis.Close;
  DataModule1.CdSis.Open;
end;

procedure Tfm_Login.SpeedButton4Click(Sender: TObject);
var
  ArquivoINI: TmemIniFile;
  usu : String;
begin
  usu :=  funcoes.GetNetUserName;

  ArquivoINI := TmemIniFile.Create('C:\Users\'+ usu + '\Documents\ConexaoSistemaSoftPop.ini');
  ArquivoINI.WriteString('IP', 'SERVIDOR', EdtIPServ.Text);
  ArquivoINI.UpdateFile;
  ArquivoINI.Free;

  try
    datamodule1.SQLConnection1.Connected := False;
    datamodule1.SQLConnection1.Connected := True;
    Application.MessageBox('IP Salvo Com Sucesso', 'Salvo', mb_iconinformation + mb_ok);
  except
    Application.MessageBox('Erro de IP', 'Verifique', mb_iconinformation + mb_ok);
  end;

  Licenca;
end;

procedure Tfm_Login.SpeedButton5Click(Sender: TObject);
begin
  if PanIP.Visible = False then
  begin
    PanIP.Visible := True;
  end
  else
  begin
    PanIP.Visible := False;
  end;
end;

end.
