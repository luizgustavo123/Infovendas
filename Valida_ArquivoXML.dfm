object Fm_Valida_Arquivo: TFm_Valida_Arquivo
  Left = 0
  Top = 0
  Caption = 'Validar Arquivo XML'
  ClientHeight = 133
  ClientWidth = 472
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
    Width = 457
    Height = 65
    Caption = ' Selecione o arquivo a ser validado '
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 424
      Top = 16
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object EdtArquivo: TEdit
      Left = 8
      Top = 16
      Width = 409
      Height = 21
      TabOrder = 0
      OnExit = EdtArquivoExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 82
    Width = 472
    Height = 51
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 112
      Top = 8
      Width = 106
      Height = 34
      Action = ActValidar
      Caption = 'F2 - Validar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 224
      Top = 8
      Width = 106
      Height = 34
      Action = ActFechar
      Caption = 'F3 - Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 80
    object ActValidar: TAction
      Caption = 'F2 - Validar'
      ShortCut = 113
      OnExecute = ActValidarExecute
    end
    object ActFechar: TAction
      Caption = 'F3 - Fechar'
      ShortCut = 114
      OnExecute = ActFecharExecute
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos XML|*.xml|Todos|*.*'
    Left = 416
    Top = 72
  end
end
