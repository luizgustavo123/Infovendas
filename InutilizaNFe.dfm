object Fm_InutilizaNFe: TFm_InutilizaNFe
  Left = 0
  Top = 0
  Caption = 'Inutiliza'#231#227'o de NFe'
  ClientHeight = 420
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 553
    Height = 241
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Modelo'
    end
    object Label2: TLabel
      Left = 88
      Top = 48
      Width = 24
      Height = 13
      Caption = 'Serie'
    end
    object Label3: TLabel
      Left = 144
      Top = 48
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label4: TLabel
      Left = 32
      Top = 88
      Width = 55
      Height = 13
      Caption = 'Num. Inicial'
    end
    object Label5: TLabel
      Left = 160
      Top = 88
      Width = 50
      Height = 13
      Caption = 'Num. Final'
    end
    object Label6: TLabel
      Left = 32
      Top = 128
      Width = 57
      Height = 13
      Caption = 'Justificativa'
    end
    object Label7: TLabel
      Left = 34
      Top = 10
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object EdtModelo: TEdit
      Left = 32
      Top = 64
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object EdtSerie: TEdit
      Left = 88
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object EdtAno: TEdit
      Left = 144
      Top = 64
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object EdtInicio: TEdit
      Left = 32
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EdtFinal: TEdit
      Left = 160
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object MemoJustifica: TMemo
      Left = 32
      Top = 144
      Width = 465
      Height = 89
      TabOrder = 5
    end
    object EdtCNPJ: TEdit
      Left = 32
      Top = 25
      Width = 169
      Height = 21
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 256
    Width = 553
    Height = 105
    Caption = ' Retorno '
    TabOrder = 1
    object MemoRetorno: TMemo
      Left = 2
      Top = 15
      Width = 549
      Height = 88
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 14
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 572
    Height = 51
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 341
    ExplicitWidth = 574
    object BitBtn1: TBitBtn
      Left = 152
      Top = 8
      Width = 119
      Height = 35
      Action = ActEnviar
      Caption = 'F2 - Enviar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 280
      Top = 8
      Width = 119
      Height = 35
      Action = ActFechar
      Caption = 'F3 - Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 344
    Top = 144
    object ActEnviar: TAction
      Caption = 'F2 - Enviar'
      ShortCut = 113
      OnExecute = ActEnviarExecute
    end
    object ActFechar: TAction
      Caption = 'F3 - Fechar'
      ShortCut = 114
      OnExecute = ActFecharExecute
    end
  end
end
