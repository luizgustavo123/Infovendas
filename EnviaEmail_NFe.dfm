object Fm_EnviaEmail_NFe: TFm_EnviaEmail_NFe
  Left = 0
  Top = 0
  Caption = 'Enviar email NFe'
  ClientHeight = 357
  ClientWidth = 488
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
  object Label1: TLabel
    Left = 8
    Top = 77
    Width = 85
    Height = 13
    Caption = 'Email Destinat'#225'rio'
  end
  object Label27: TLabel
    Left = 8
    Top = 120
    Width = 122
    Height = 13
    Caption = 'Assunto do email enviado'
  end
  object Label28: TLabel
    Left = 8
    Top = 160
    Width = 93
    Height = 13
    Caption = 'Mensagem do Email'
  end
  object Panel1: TPanel
    Left = 0
    Top = 318
    Width = 488
    Height = 39
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 128
      Top = 5
      Width = 101
      Height = 30
      Caption = 'Imprimir'
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
      Left = 232
      Top = 5
      Width = 101
      Height = 30
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
  object EdtPara: TEdit
    Left = 8
    Top = 93
    Width = 473
    Height = 21
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 473
    Height = 65
    Caption = ' Selecione o Arquivo '
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 440
      Top = 23
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object EdtArquivo: TEdit
      Left = 8
      Top = 24
      Width = 425
      Height = 21
      TabOrder = 0
    end
  end
  object edtEmailAssunto: TEdit
    Left = 8
    Top = 136
    Width = 325
    Height = 21
    TabOrder = 3
  end
  object mmEmailMsg: TMemo
    Left = 8
    Top = 176
    Width = 249
    Height = 130
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 384
    Top = 32
  end
end
