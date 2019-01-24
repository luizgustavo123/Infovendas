object Fm_Consultas: TFm_Consultas
  Left = 0
  Top = 0
  Caption = 'Consultas'
  ClientHeight = 416
  ClientWidth = 575
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
  object GrpRecibo: TGroupBox
    Left = 199
    Top = 9
    Width = 369
    Height = 57
    Caption = ' Informe o N'#250'mero do Lote '
    TabOrder = 0
    object EdtRecibo: TEdit
      Left = 8
      Top = 19
      Width = 321
      Height = 21
      TabOrder = 0
    end
  end
  object RadioTipo: TRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 57
    Caption = ' Tipo de Consulta '
    ItemIndex = 0
    Items.Strings = (
      'Consultar o Carregamento XML'
      'Consultar Recibo de Lote')
    TabOrder = 1
    OnClick = RadioTipoClick
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 72
    Width = 185
    Height = 33
    Caption = 'Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 72
    Width = 185
    Height = 33
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 111
    Width = 561
    Height = 297
    Align = alCustom
    TabOrder = 4
  end
  object GrpArquivo: TGroupBox
    Left = 199
    Top = 8
    Width = 369
    Height = 57
    Caption = ' Selecione o Arquivo '
    TabOrder = 5
    object SpeedButton1: TSpeedButton
      Left = 335
      Top = 21
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object EdtArquivo: TEdit
      Left = 8
      Top = 22
      Width = 321
      Height = 21
      TabOrder = 0
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 536
    Top = 56
  end
end
