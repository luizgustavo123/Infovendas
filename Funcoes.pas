unit Funcoes;

interface

uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Dialogs, StdCtrls, Grids, DBGrids;

function TrocaVirgPPto(Valor: string): String;
Function GetNetUserName: string;
Function NomedoMes(dData:TDatetime):string;

implementation

function TrocaVirgPPto(Valor: string): String;
var i:integer;
begin
    if Valor <>'' then begin
        for i := 0 to Length(Valor) do begin
            if Valor[i]=',' then Valor[i]:='.';

        end;
     end;
     Result := valor;
end;

//Para Capturar o usuário Logado no Windows
Function GetNetUserName: string;
Var
  NetUserNameLength: DWord;
Begin
  NetUserNameLength:=50;
  SetLength(Result, NetUserNameLength);
  GetUserName(pChar(Result),NetUserNameLength);
  SetLength(Result, StrLen(pChar(Result)));
End;

Function NomedoMes(dData:TDatetime):string;
var
nAno,nMes,nDia:word;
cMes:array[1..12] of string;
begin
  cMes[01] := 'Janeiro';
  cMes[02] := 'Fevereiro';
  cMes[03] := 'Março';
  cMes[04] := 'Abril';
  cMes[05] := 'Maio';
  cMes[06] := 'Junho';
  cMes[07] := 'Julho';
  cMes[08] := 'Agosto';
  cMes[09] := 'Setembro';
  cMes[10] := 'Outubro';
  cMes[11] := 'Novembro';
  cMes[12] := 'Dezembro';
  decodedate(dData,nAno,nMes,nDia);
  if (nMes>=1) and (nMes<=13)then
  begin
    Result:=cMes[nMes];
  end
  else
  begin
    Result:='';
  end;
end;

end.
