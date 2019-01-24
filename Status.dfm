object Fm_Status: TFm_Status
  Left = 0
  Top = 0
  Caption = 'Status'
  ClientHeight = 408
  ClientWidth = 872
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
    Width = 857
    Height = 353
    Caption = 'Status do Servi'#231'o'
    TabOrder = 0
    object RetornoWS: TMemo
      Left = 16
      Top = 24
      Width = 809
      Height = 89
      TabOrder = 0
    end
    object Dados: TMemo
      Left = 16
      Top = 248
      Width = 809
      Height = 89
      TabOrder = 1
    end
    object WebBrowser1: TWebBrowser
      Left = 16
      Top = 119
      Width = 809
      Height = 123
      TabOrder = 2
      ControlData = {
        4C0000009D530000B60C00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Button1: TButton
    Left = 345
    Top = 369
    Width = 89
    Height = 32
    Caption = 'Verificar Status'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 464
    Top = 369
    Width = 89
    Height = 32
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 608
    Top = 256
  end
end
