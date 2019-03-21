object EditorRedes: TEditorRedes
  Left = 178
  Top = 162
  Width = 1324
  Height = 709
  Caption = 'EditorRedes'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1072
    Top = 0
    Width = 233
    Height = 649
    Color = clCream
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 64
      Width = 60
      Height = 13
      Caption = 'Conecciones'
    end
    object Label2: TLabel
      Left = 24
      Top = 144
      Width = 30
      Height = 13
      Caption = 'Redes'
    end
    object Label3: TLabel
      Left = 16
      Top = 256
      Width = 65
      Height = 13
      Caption = 'Computadora'
    end
    object Ayuda1: TLabel
      Left = 168
      Top = 320
      Width = 6
      Height = 16
      Cursor = crHelp
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Ayuda1Click
    end
    object Ayuda2: TLabel
      Left = 16
      Top = 32
      Width = 6
      Height = 16
      Cursor = crHelp
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Ayuda2Click
    end
    object Ayuda3: TLabel
      Left = 184
      Top = 8
      Width = 6
      Height = 16
      Cursor = crHelp
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Ayuda3Click
    end
    object Ayuda4: TLabel
      Left = 184
      Top = 32
      Width = 6
      Height = 16
      Cursor = crHelp
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Ayuda4Click
    end
    object Button1: TButton
      Left = 16
      Top = 88
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Fibra Optica'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 112
      Top = 88
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cable'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 112
      Top = 176
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Server'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 16
      Top = 280
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Pc'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 16
      Top = 176
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Firewall'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 32
      Top = 600
      Width = 75
      Height = 25
      Caption = 'Autor'
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 128
      Top = 600
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 6
      OnClick = Button7Click
    end
    object coordenadasTexto: TEdit
      Left = 16
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 7
      Text = '(0000,0000)'
    end
    object Button8: TButton
      Left = 16
      Top = 424
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Limpiar todo'
      TabOrder = 8
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 104
      Top = 280
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Impresora'
      TabOrder = 9
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 16
      Top = 392
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Eliminar Seleccion'
      DragCursor = crDefault
      TabOrder = 10
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 16
      Top = 216
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Switch'
      TabOrder = 11
      OnClick = Button11Click
    end
    object Edit1: TEdit
      Left = 104
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 12
      Text = '(x1,y1)'
    end
    object Edit2: TEdit
      Left = 104
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 13
      Text = '(x2,y2)'
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 320
      Width = 145
      Height = 21
      Cursor = crHandPoint
      ItemHeight = 13
      TabOrder = 14
      Text = '0 Grados'
      OnChange = ComboBox1Change
    end
    object Button12: TButton
      Left = 16
      Top = 360
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Selector'
      TabOrder = 15
      OnClick = Button12Click
    end
  end
  object ScrollBox1: TScrollBox
    Left = 40
    Top = 32
    Width = 993
    Height = 585
    TabOrder = 1
    object Lienzo: TImage
      Left = 0
      Top = 0
      Width = 2000
      Height = 2000
      Cursor = crCross
      OnMouseDown = LienzoMouseDown
      OnMouseMove = LienzoMouseMove
      OnMouseUp = LienzoMouseUp
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object Guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = Guardar1Click
      end
      object Abrir1: TMenuItem
        Caption = 'Abrir'
        OnClick = Abrir1Click
      end
      object Nuevo1: TMenuItem
        Caption = 'Nuevo'
        OnClick = Nuevo1Click
      end
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object Borrar1: TMenuItem
        Caption = 'Seleccionar'
        OnClick = Borrar1Click
      end
      object SelectorBorrar1: TMenuItem
        Caption = 'Selector Borrar'
        OnClick = SelectorBorrar1Click
      end
      object BorrarTodo1: TMenuItem
        Caption = 'Borrar Todo'
        OnClick = BorrarTodo1Click
      end
    end
    object Ayuda5: TMenuItem
      Caption = 'Ayuda'
      object Infor1: TMenuItem
        Caption = 'Infor'
      end
      object Help1: TMenuItem
        Caption = 'Help'
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.edp|*.edp|.edp|.edp'
    Left = 8
    Top = 40
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.edp|*.edp|.edp|.edp'
    Left = 8
    Top = 80
  end
end
