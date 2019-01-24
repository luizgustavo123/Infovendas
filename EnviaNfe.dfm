object Fm_EnviaNfe: TFm_EnviaNfe
  Left = 0
  Top = 0
  Caption = 'Enviar NFe'
  ClientHeight = 187
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 70
    Width = 76
    Height = 13
    Caption = 'Numero do Lote'
  end
  object Label2: TLabel
    Left = 30
    Top = 70
    Width = 87
    Height = 13
    Caption = 'Numero do Pedido'
  end
  object GroupBox1: TGroupBox
    Left = 19
    Top = 8
    Width = 609
    Height = 57
    Caption = 'Selecionar Arquivo XML da NFe'
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 567
      Top = 23
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object EdtArquivo: TMaskEdit
      Left = 11
      Top = 24
      Width = 550
      Height = 21
      TabOrder = 0
      Text = ''
    end
  end
  object Button1: TButton
    Left = 216
    Top = 144
    Width = 89
    Height = 35
    Action = ActEnviar
    TabOrder = 1
  end
  object Button2: TButton
    Left = 344
    Top = 144
    Width = 89
    Height = 35
    Action = ActFechar
    TabOrder = 2
  end
  object EdtNumLote: TEdit
    Left = 168
    Top = 89
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object EdtPedido: TEdit
    Left = 30
    Top = 89
    Width = 121
    Height = 21
    TabOrder = 4
    OnExit = EdtPedidoExit
  end
  object OpenDialog1: TOpenDialog
    Left = 614
    Top = 96
  end
  object ActionList1: TActionList
    Left = 542
    Top = 96
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
