object Editor: TEditor
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Align = alClient
  TabOrder = 0
  TabStop = True
  Visible = False
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Angulo'
  end
  object Button1: TButton
    Left = 160
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Crear'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
  end
end
