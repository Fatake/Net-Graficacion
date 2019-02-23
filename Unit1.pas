unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, CustomizeDlg;

type
  TEditorRedes = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    Lienzo: TImage;
    Archivo1: TMenuItem;
    Editar1: TMenuItem;
    Guardar1: TMenuItem;
    Abrir1: TMenuItem;
    Nuevo1: TMenuItem;
    Borrar1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    coordenadasTexto: TEdit;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Button8: TButton;
    Label1: TLabel;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Button12: TButton;
    SelectorBorrar1: TMenuItem;
    BorrarTodo1: TMenuItem;
    Ayuda1: TLabel;
    Ayuda2: TLabel;
    Ayuda3: TLabel;
    Ayuda4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure LienzoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LienzoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LienzoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Borrar1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure SelectorBorrar1Click(Sender: TObject);
    procedure BorrarTodo1Click(Sender: TObject);
    procedure Ayuda1Click(Sender: TObject);
    procedure Ayuda2Click(Sender: TObject);
    procedure Ayuda3Click(Sender: TObject);
    procedure Ayuda4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//
//Tipos propios
//
//Firewall
type TFirewall = Packed Record
  CordX : Integer;
  CordY : Integer;
end;
//Server
type TServer = Packed Record
  CordX : Integer;
  CordY : Integer;
end;
//Switch
type TSwitch = Packed Record
  CordX : Integer;
  CordY : Integer;
end;
//Computadora
type TPc = Packed Record
  CordX : Integer;
  CordY : Integer;
  angulo : Integer;
end;
//Impresora
type TPrinter = Packed Record
  CordX : Integer;
  CordY : Integer;
  angulo : Integer;
end;
//variables Globales
var
  EditorRedes: TEditorRedes;
  //Coordenadas del crosser
  x1,y1,x2,y2 : Integer;
  //Listas
  ListaFibras : array[1..100,1..2] of Tpoint;
  ListaCables : array[1..100,1..2] of Tpoint;
  ListaFirewalls : array[1..50] of TFirewall;
  ListaServers : array[1..50] of TServer;
  ListaSwitchs : array[1..50] of TSwitch;
  ListaPcs : array[1..50] of TPc;
  ListaImpre : array[1..50] of TPrinter;

  //Contadores
  angulo : Real;
  NumCable, NumFirewall, NumServer, NumSwitch, NumPc, NumImpr, NumFibra: Integer;

implementation

{$R *.dfm}

procedure TEditorRedes.FormCreate(Sender: TObject);
var i : Integer;
begin
  //Inicio de Conteo de objetos
  Numfibra := 0;
  NumCable := 0;
  NumFirewall := 0;
  NumServer := 0;
  NumSwitch := 0;
  NumPc := 0;
  NumImpr := 0;
  //Inicio del angulo, defauld = 0
  angulo := 0;
  //Pinta el Lienzo
  Lienzo.Canvas.Rectangle(0,0,2000,2000);
  Lienzo.Canvas.Pen.color := clgray;
  for i:=1 to 100 do
  begin
    Lienzo.canvas.MoveTo(0,i*20);
    Lienzo.Canvas.LineTo(2000,i*20);
  end;
  for i:=1 to 100 do
  begin
     Lienzo.canvas.MoveTo(i*20,0);
     Lienzo.Canvas.LineTo(i*20,2000);
  end;
  //inicio del ComboBox
  ComboBox1.Items.Clear;
  ComboBox1.Items.Add('0 Grados');
  ComboBox1.Items.Add('90 Grados');
  ComboBox1.Items.Add('180 Grados');
  ComboBox1.Items.Add('270 Grados');
end;

procedure TEditorRedes.Button7Click(Sender: TObject);
begin
  close();
end;

procedure TEditorRedes.Button6Click(Sender: TObject);
begin
  ShowMessage('Paulo Cesar Ruiz Lozano');
end;

procedure TEditorRedes.LienzoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  coordenadasTexto.Text := '('+InttoStr(X)+','+InttoStr(y)+')';
end;

procedure TEditorRedes.LienzoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var delta : Integer;
begin
    //Calculo del punto 20 mas cercano
    //Coordenadas X
    delta := X mod 20;
    if delta >= 10 then
    begin
      x1 := X + 20 - delta;
    end;
    if delta < 10 then
    begin
      x1 := X - delta;
    end;
    //Coordenadas Y
    delta := Y mod 20;
    if delta >= 10 then
    begin
      y1 := Y + 20 - delta;
    end;
    if delta < 10 then
    begin
      y1 := Y - delta;
    end;
    if Lienzo.Cursor = crCross then
    begin
      Edit1.Text := '('+IntToStr(x1)+','+IntToStr(y1)+')';
    end;
    if Lienzo.Cursor = crNoDrop then
    begin
      Edit1.Text := 'Arrasta y';
    end;

end;

procedure TEditorRedes.LienzoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var delta,i : Integer;
begin
    //Calculo del punto 20 mas cercano
    //Coordenadas X
    delta := X mod 20;
    if delta >= 10 then
    begin
      x2 := X + 20 - delta;
    end;
    if delta < 10 then
    begin
      x2 := X - delta;
    end;
    //Coordenadas Y
    delta := Y mod 20;
    if delta >= 10 then
    begin
      y2 := Y + 20 - delta;
    end;
    if delta < 10 then
    begin
      y2 := Y - delta;
    end;
    if Lienzo.Cursor = crCross then
    begin
      Edit2.Text := '('+IntToStr(x2)+','+IntToStr(y2)+')'
    end;
    if Lienzo.Cursor = crNoDrop then
    begin
      Edit2.Text := 'Borra';
    end;
    //Elimina
    if Lienzo.Cursor = crNoDrop then
    begin
      Lienzo.Canvas.Brush.Color := clWhite;
      Lienzo.Canvas.Rectangle(x1,y1,x2,y2);
      Lienzo.Canvas.Pen.color := clgray;
      //Pinta un rectangulo pequeño donde se va a repitan la maya
      for i:=1 to Round((x1+x2)/20) do
      begin
      Lienzo.canvas.MoveTo(x1,i*20);
      Lienzo.Canvas.LineTo(x2,i*20);
      end;
      for i:=1 to Round((y1+y2)/20) do
      begin
        Lienzo.canvas.MoveTo(x1+i*20,y1);
        Lienzo.Canvas.LineTo(x1+i*20,y2);
      end;
    end;
end;

procedure TEditorRedes.Button1Click(Sender: TObject);
begin
  Lienzo.Canvas.Pen.Color:=clgreen;
  Lienzo.Canvas.pen.Width:=5;
  Lienzo.Canvas.MoveTo(x1,y1);
  Lienzo.Canvas.lineto(x2,y2);
  Lienzo.Canvas.Pen.Color:=clblack;
  Lienzo.Canvas.pen.Width:=1;
end;

procedure TEditorRedes.Borrar1Click(Sender: TObject);
begin
  Lienzo.Cursor := crCross;
end;
//
//Limpiar todo Boton
//
procedure TEditorRedes.Button8Click(Sender: TObject);
var i : Integer;
begin
  //Reestablece el mouse
  Lienzo.Cursor := crCross;
  //Reestablece los contadores
  Numfibra := 0;
  NumCable := 0;
  NumFirewall := 0;
  NumServer := 0;
  NumSwitch := 0;
  NumPc := 0;
  NumImpr := 0;
  //Reestablece de defaul el angulo
  angulo := 0;
  //Pinta el Lienzo
  Lienzo.Canvas.Rectangle(0,0,2000,2000);
  //Punta maya
  Lienzo.Canvas.Pen.color:=clgray;
  for i := 1 to 100 do
  begin
    Lienzo.canvas.MoveTo(0,i*20);
    Lienzo.Canvas.LineTo(2000,i*20);
  end;
  for i := 1 to 100 do
  begin
     Lienzo.canvas.MoveTo(i*20,0);
     Lienzo.Canvas.LineTo(i*20,2000);
  end;
end;

procedure TEditorRedes.Guardar1Click(Sender: TObject);
begin
  SaveDialog1.Execute;
end;

procedure TEditorRedes.Abrir1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TEditorRedes.Button2Click(Sender: TObject);
begin
  //Pinta linea negra = cable
  Lienzo.Canvas.Pen.Color := clBlack;
  Lienzo.Canvas.pen.Width := 3;
  Lienzo.Canvas.MoveTo(x1,y1);
  Lienzo.Canvas.lineto(x2,y2);
  Lienzo.Canvas.Pen.Color := clblack;
  Lienzo.Canvas.pen.Width := 1;
end;

procedure TEditorRedes.Button5Click(Sender: TObject);
var Firewall : TBitmap;
begin
  Firewall := TBitmap.Create;
  Firewall.LoadFromFile('FirewallIcon.bmp');
  if Lienzo.Cursor = crCross then
  begin
    Lienzo.Canvas.Draw(x1,y1,Firewall);
  end;
end;
//
//Combo Box de Angulos
//
procedure TEditorRedes.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: angulo := 0;
    1: angulo := 90;
    2: angulo := 180;
    3: angulo := 270;
  end;
end;
//
//Boton Borrar Seleccion
//
procedure TEditorRedes.Button10Click(Sender: TObject);
begin
  Lienzo.Cursor := crNoDrop;
  Edit1.Text := 'Arrasta y';
  Edit2.Text := 'Borra';
    //Lienzo.Canvas.Brush.Color := clBlack;
    //Lienzo.Canvas.Pen.Color := clBlack;
end;
//
//Boton Selector
//
procedure TEditorRedes.Button12Click(Sender: TObject);
begin
 Lienzo.Cursor := crCross;
end;

procedure TEditorRedes.Button3Click(Sender: TObject);
var Server : TBitmap;
begin
  Server := TBitmap.Create;
  Server.LoadFromFile('ServerIcon.bmp');
  if Lienzo.Cursor = crCross then
  begin
    Lienzo.Canvas.Draw(x1,y1,Server);
  end;
end;

procedure TEditorRedes.Button11Click(Sender: TObject);
var Switch : TBitmap;
begin
  Switch := TBitmap.Create;
  Switch.LoadFromFile('SwitchIcon.bmp');
  if Lienzo.Cursor = crCross then
  begin
    Lienzo.Canvas.Draw(x1,y1,Switch);
  end;
end;

procedure TEditorRedes.Button4Click(Sender: TObject);
var Computadora : TBitmap;
begin
  Computadora := TBitmap.Create;

  if Lienzo.Cursor = crCross then
  begin
    if angulo = 0 then
    begin
      Computadora.LoadFromFile('PCIcon.bmp');
    end;
    if angulo = 90 then
    begin
      Computadora.LoadFromFile('PCIcon90.bmp');
    end;
    if angulo = 180 then
    begin
      Computadora.LoadFromFile('PCIcon180.bmp');
    end;
    if angulo = 270 then
    begin
      Computadora.LoadFromFile('PCIcon270.bmp');
    end;
    Lienzo.Canvas.Draw(x1,y1,Computadora);
  end;
end;

procedure TEditorRedes.Button9Click(Sender: TObject);
var Impresora : TBitmap;
begin
  Impresora := TBitmap.Create;
  if Lienzo.Cursor = crCross then
  begin
    if angulo = 0 then
    begin
      Impresora.LoadFromFile('PrinterIcon.bmp');
    end;
    if angulo = 90 then
    begin
      Impresora.LoadFromFile('PrinterIcon90.bmp');
    end;
    if angulo = 180 then
    begin
      Impresora.LoadFromFile('PrinterIcon180.bmp');
    end;
    if angulo = 270 then
    begin
      Impresora.LoadFromFile('PrinterIcon270.bmp');
    end;
    Lienzo.Canvas.Draw(x1,y1,Impresora);
  end;
end;

procedure TEditorRedes.SelectorBorrar1Click(Sender: TObject);
begin
  Lienzo.Cursor := crNoDrop;
end;
//
//Borrar todo opcion menu
//
procedure TEditorRedes.BorrarTodo1Click(Sender: TObject);
var i : Integer;
begin
  //Reestablece el crosser de defauld
  Lienzo.Cursor := crCross;
  //Reestablece los contadores
  Numfibra := 0;
  NumCable := 0;
  NumFirewall := 0;
  NumServer := 0;
  NumSwitch := 0;
  NumPc := 0;
  NumImpr := 0;
  //Reestablece de defaul el angulo
  angulo := 0;
  //Pinta el Lienzo
  Lienzo.Canvas.Rectangle(0,0,2000,2000);
  //Punta maya
  Lienzo.Canvas.Pen.color:=clgray;
  for i := 1 to 100 do
  begin
    Lienzo.canvas.MoveTo(0,i*20);
    Lienzo.Canvas.LineTo(2000,i*20);
  end;
  for i := 1 to 100 do
  begin
     Lienzo.canvas.MoveTo(i*20,0);
     Lienzo.Canvas.LineTo(i*20,2000);
  end;
end;
//
//Ayuda 1
//
procedure TEditorRedes.Ayuda1Click(Sender: TObject);
begin
  ShowMessage('El angulo de rotacion de la Impresora o Computadora.');
end;
//
//Ayuda 2
//
procedure TEditorRedes.Ayuda2Click(Sender: TObject);
begin
  ShowMessage('Muestra las coordenadas del cursor sobre el Lienzo');
end;
//
//Ayuda 3
//
procedure TEditorRedes.Ayuda3Click(Sender: TObject);
begin
  ShowMessage('Coordenadas donde se dio Click sin soltar');
end;
//
//Ayuda 4
//
procedure TEditorRedes.Ayuda4Click(Sender: TObject);
begin
  ShowMessage('Coordenadas donde se soltó el click');
end;

end.
