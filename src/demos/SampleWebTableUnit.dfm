object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Exemplo de WebTable'
  ClientHeight = 490
  ClientWidth = 1121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    1121
    490)
  TextHeight = 15
  object ButtonGerar: TButton
    Left = 1038
    Top = 457
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Gerar'
    TabOrder = 0
    OnClick = ButtonGerarClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 8
    Width = 1113
    Height = 443
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
