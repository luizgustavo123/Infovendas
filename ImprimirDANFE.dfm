object Fm_ImprimirDANFE: TFm_ImprimirDANFE
  Left = 0
  Top = 0
  Caption = 'Imprimir DANFE'
  ClientHeight = 112
  ClientWidth = 306
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 96
    Caption = 'Selecione a NFe'
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 25
      Top = 31
      Width = 100
      Height = 36
      Caption = 'Imprimir DANFE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 144
      Top = 31
      Width = 100
      Height = 36
      Caption = 'Encerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 264
    Top = 56
  end
end
