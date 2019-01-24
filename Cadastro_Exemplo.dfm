object fm_Cadastro_Exemplo: Tfm_Cadastro_Exemplo
  Left = 355
  Top = 40
  Caption = 'Cadastro'
  ClientHeight = 469
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Clientes: TLabel
    Left = 337
    Top = 8
    Width = 103
    Height = 33
    Caption = 'TITULO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Button1: TButton
    Left = 104
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 185
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 266
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
  end
  object Button5: TButton
    Left = 23
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
  end
  object PC: TPageControl
    Left = 8
    Top = 71
    Width = 809
    Height = 358
    ActivePage = PCcadastro
    TabOrder = 4
    object PCcadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 17
        Top = 40
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label9: TLabel
        Left = 17
        Top = 229
        Width = 67
        Height = 13
        Caption = 'Observa'#231#245'es:'
      end
      object DBEdit1: TDBEdit
        Left = 17
        Top = 59
        Width = 73
        Height = 21
        TabOrder = 0
      end
      object DBMemo1: TDBMemo
        Left = 17
        Top = 248
        Width = 141
        Height = 65
        TabOrder = 1
      end
    end
    object PCrelatorio: TTabSheet
      Caption = 'Relat'#243'rio'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 3
        Top = 64
        Width = 795
        Height = 249
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end>
      end
      object edtCodigo: TEdit
        Left = 3
        Top = 25
        Width = 83
        Height = 21
        TabOrder = 1
      end
      object BTpesquisar: TButton
        Left = 126
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
      end
    end
  end
  object DStabela: TDataSource
    DataSet = CDtabela
    Left = 608
    Top = 8
  end
  object CDtabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPtabela'
    Left = 656
    Top = 8
  end
  object DPtabela: TDataSetProvider
    DataSet = SQLtabela
    Left = 704
    Top = 8
  end
  object SQLtabela: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DataModule1.SQLConnection1
    Left = 752
    Top = 8
  end
end
