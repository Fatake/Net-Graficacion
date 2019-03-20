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
    procedure Nuevo1Click(Sender: TObject);
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
  ListaFibras : array[1..100,1..2] of TPoint;
  ListaCables : array[1..100,1..2] of TPoint;
  ListaFirewalls : array[1..50] of TFirewall;
  ListaServers : array[1..50] of TServer;
  ListaSwitchs : array[1..50] of TSwitch;
  ListaPcs : array[1..50] of TPc;
  ListaImpre : array[1..50] of TPrinter;

  //Contadores
  angulo : Real;
  NumFibra, NumCable, NumFirewall, NumServer, NumSwitch, NumPc, NumImpre: Integer;

implementation

{$R *.dfm}
//
//Constructor
//
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
  NumImpre := 0;
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
//
//Boton Salir
//
procedure TEditorRedes.Button7Click(Sender: TObject);
begin
  close();
end;
//
//Boton Autor
//
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
//var aux1,aux2: Integer;
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
    //
    //Elimina
    //
    if Lienzo.Cursor = crNoDrop then
    begin
      Edit2.Text := 'Borra';

      Lienzo.Canvas.Brush.Color := clWhite;
      Lienzo.Canvas.Pen.color := clWhite;
      Lienzo.Canvas.Rectangle(x1,y1,x2,y2);
      Lienzo.Canvas.Pen.color := clGray;
      //Pinta un rectangulo pequeño donde se va a repitan la maya
      //X
      i := y1;
      while i <= y2 do
      begin
        Lienzo.canvas.MoveTo(x1,i);
        Lienzo.Canvas.LineTo(x2,i);
        i := i + 20;
      end;
      //
      i := x1;
      while i <= x2 do
      begin
        Lienzo.canvas.MoveTo(i,y1);
        Lienzo.Canvas.LineTo(i,y2);
        i := i + 20;
      end;


      Lienzo.Canvas.Brush.Color := clWhite;
      Lienzo.Canvas.Pen.Color := clBlack;
    end;
end;

procedure TEditorRedes.Button1Click(Sender: TObject);
begin
  //Color de fibra
  Lienzo.Canvas.Pen.Color := clgreen;
  Lienzo.Canvas.pen.Width := 5;
  //Pintar
  Lienzo.Canvas.MoveTo(x1,y1);
  Lienzo.Canvas.lineto(x2,y2);

  //Agregrar la fibra al arreglo
  ListaFibras[NumFibra][1] := Point(x1,y1);
  ListaFibras[NumFibra][2] := Point(x2,y2);
  NumFibra := NumFibra + 1;
  //Default
  Lienzo.Canvas.Pen.Color := clblack;
  Lienzo.Canvas.pen.Width := 1;
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
  NumImpre := 0;
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
  //Guardar Archivo
  if(SaveDialog1.Execute) then
  begin
    coordenadasTexto.Text := SaveDialog1.FileName;
  end;
end;

procedure TEditorRedes.Abrir1Click(Sender: TObject);
begin
  //Abrir Archivo
  if(OpenDialog1.Execute) then
  begin
    coordenadasTexto.Text := OpenDialog1.FileName;
  end;
end;

procedure TEditorRedes.Button2Click(Sender: TObject);
begin
  //Pinta linea negra = cable
  Lienzo.Canvas.Pen.Color := clBlack;
  Lienzo.Canvas.pen.Width := 3;

  Lienzo.Canvas.MoveTo(x1,y1);
  Lienzo.Canvas.lineto(x2,y2);

  ListaCables[NumCable][1] := Point(x1,y1);
  ListaCables[NumCable][2] := Point(x2,y2);
  NumCable := NumCable + 1;
  //Default
  Lienzo.Canvas.Pen.Color := clblack;
  Lienzo.Canvas.pen.Width := 1;
end;

procedure TEditorRedes.Button5Click(Sender: TObject);
var Firewall : TBitmap;
var contador : TFirewall;
begin
  Firewall := TBitmap.Create;
  Firewall.LoadFromFile('FirewallIcon.bmp');
  if Lienzo.Cursor = crCross then
  begin
    //Pinta
    Lienzo.Canvas.Draw(x1,y1,Firewall);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaFirewalls[NumFirewall] := contador;
    NumFirewall := NumFirewall +1;

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
var contador : TServer;
begin
  Server := TBitmap.Create;
  Server.LoadFromFile('ServerIcon.bmp');
  if Lienzo.Cursor = crCross then
  begin
    Lienzo.Canvas.Draw(x1,y1,Server);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaServers[NumServer] := contador;
    NumServer := NumServer +1;
  end;
end;

procedure TEditorRedes.Button11Click(Sender: TObject);
var Switch : TBitmap;
var contador : TSwitch;
begin
  Switch := TBitmap.Create;
  Switch.LoadFromFile('SwitchIcon.bmp');
  if Lienzo.Cursor = crCross then
  begin
    Lienzo.Canvas.Draw(x1,y1,Switch);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaSwitchs[NumSwitch] := contador;
    NumSwitch := NumSwitch + 1;
  end;
end;

procedure TEditorRedes.Button4Click(Sender: TObject);
var Computadora : TBitmap;
var contador : TPc;
begin
  Computadora := TBitmap.Create;

  if Lienzo.Cursor = crCross then
  begin
    if angulo = 0 then
    begin
      Computadora.LoadFromFile('PCIcon.bmp');
      contador.angulo := 0;
    end;
    if angulo = 90 then
    begin
      Computadora.LoadFromFile('PCIcon90.bmp');
      contador.angulo := 90;
    end;
    if angulo = 180 then
    begin
      Computadora.LoadFromFile('PCIcon180.bmp');
      contador.angulo := 180;
    end;
    if angulo = 270 then
    begin
      Computadora.LoadFromFile('PCIcon270.bmp');
      contador.angulo := 270;
    end;
    Lienzo.Canvas.Draw(x1,y1,Computadora);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaPcs[NumPc] := contador;
    NumPc := NumPc + 1;
  end;
end;

procedure TEditorRedes.Button9Click(Sender: TObject);
var Impresora : TBitmap;
var contador : TPrinter;
begin
  Impresora := TBitmap.Create;
  if Lienzo.Cursor = crCross then
  begin
    if angulo = 0 then
    begin
      Impresora.LoadFromFile('PrinterIcon.bmp');
      contador.angulo := 0;
    end;
    if angulo = 90 then
    begin
      Impresora.LoadFromFile('PrinterIcon90.bmp');
      contador.angulo := 90;
    end;
    if angulo = 180 then
    begin
      Impresora.LoadFromFile('PrinterIcon180.bmp');
      contador.angulo := 180;
    end;
    if angulo = 270 then
    begin
      Impresora.LoadFromFile('PrinterIcon270.bmp');
      contador.angulo := 270;
    end;
    Lienzo.Canvas.Draw(x1,y1,Impresora);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaImpre[NumImpre] := contador;
    NumImpre := NumImpre + 1;
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
  NumImpre := 0;
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

procedure TEditorRedes.Nuevo1Click(Sender: TObject);
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
  NumImpre := 0;
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

end.
