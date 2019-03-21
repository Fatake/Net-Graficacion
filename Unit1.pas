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
    Ayuda5: TMenuItem;
    Infor1: TMenuItem;
    Help1: TMenuItem;
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

  Firewall : TBitmap;
  Server : TBitmap;
  Switch : TBitmap;
  Computadora : TBitmap;
  Impresora : TBitmap;
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
  //Inicio de Imagenes
  Firewall := TBitmap.Create;
  Firewall.LoadFromFile('FirewallIcon.bmp');
  Server := TBitmap.Create;
  Server.LoadFromFile('ServerIcon.bmp');
  Switch := TBitmap.Create;
  Switch.LoadFromFile('SwitchIcon.bmp');
  Computadora := TBitmap.Create;
  Impresora := TBitmap.Create;
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
//
//Evento Mouse Up
//
procedure TEditorRedes.LienzoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var delta: Integer;
var i,j,k,a: Integer;
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
    //
    if Lienzo.Cursor = crCross then
    begin
      Edit2.Text := '('+IntToStr(x2)+','+IntToStr(y2)+')'
    end;
    //
    //Eliminar
    //
    if Lienzo.Cursor = crNoDrop then
    begin
      (*Pinta Maya*)
      Edit2.Text := 'Borra';
      //Pinta un rectangulo pequeño donde se va a repitan la maya
      Lienzo.Canvas.Brush.Color := clWhite;
      Lienzo.Canvas.Pen.color := clWhite;
      Lienzo.Canvas.Rectangle(x1,y1,x2,y2);

      Lienzo.Canvas.Pen.color := clGray;

      //Barras de X
      i := y1;
      while i <= y2 do
      begin
        Lienzo.canvas.MoveTo(x1,i);
        Lienzo.Canvas.LineTo(x2,i);
        i := i + 20;
      end;
      //Barras de Y
      i := x1;
      while i <= x2 do
      begin
        Lienzo.canvas.MoveTo(i,y1);
        Lienzo.Canvas.LineTo(i,y2);
        i := i + 20;
      end;
      //Default sets
      Lienzo.Canvas.Brush.Color := clWhite;
      Lienzo.Canvas.Pen.Color := clBlack;
      //
      (*Eliminar Objetos de ese rango*)
      //
      i := x1;
      j := y1;
      while i <= x2 do
      begin
        while j <= y2 do
        begin
          //Fibras
          if NumFibra <> 0 then
          begin
            for k := 1  to NumFibra do
            begin
              if (ListaFibras[k][1].X = i) then
              begin
                if( ListaFibras[k][1].Y = j)then
                begin
                  for a := k to NumFibra-1 do
                  begin
                    ListaFibras[a] := ListaFibras[a+1];
                  end;
                  NumFibra := NumFibra - 1;
                  Break;
                end;
              end;
            end;
          end;
          //Fin Fibras
          //Cables
          if NumCable <> 0 then
          begin
            for k := 1  to NumCable do
            begin
              if (ListaCables[k][1].X = i) then
              begin
                if( ListaCables[k][1].Y = j)then
                begin
                  for a := k to NumCable-1 do
                  begin
                    ListaCables[a] := ListaCables[a+1];
                  end;
                  NumCable := NumCable - 1;
                  Break;
                end;
              end;
            end;
          end;
          //Fin Cables
          //
          //Firewalls
          if NumFirewall <> 0 then
          begin
            for k := 1  to NumFirewall do
            begin
              if (ListaFirewalls[k].CordX = i) then
              begin
                if(ListaFirewalls[k].CordY = j)then
                begin
                  for a := k to NumFirewall-1 do
                  begin
                    ListaFirewalls[a] := ListaFirewalls[a+1];
                  end;
                  NumFirewall := NumFirewall - 1;
                  Break;
                end;
              end;
            end;
          end;
          //Fin Firewalls
          //Servers
          if NumServer <> 0 then
          begin
            for k := 1  to NumServer do
            begin
              if (ListaServers[k].CordX = i) then
              begin
                if(ListaServers[k].CordY = j)then
                begin
                  for a := k to NumServer-1 do
                  begin
                    ListaServers[a] := ListaServers[a+1];
                  end;
                  NumServer := NumServer - 1;
                  Break;
                end;
              end;
            end;
          end;
          //Fin Servers
          //Switchs
          if NumSwitch <> 0 then
          begin
            for k := 1  to NumSwitch do
            begin
              if (ListaSwitchs[k].CordX = i) then
              begin
                if(ListaSwitchs[k].CordY = j)then
                begin
                  for a := k to NumSwitch-1 do
                  begin
                    ListaSwitchs[a] := ListaSwitchs[a+1];
                  end;
                  NumSwitch := NumSwitch - 1;
                  Break;
                end;
              end;
            end;
          end;
          //Fin Switchs
          //PCs
          if NumPc <> 0 then
          begin
            for k := 1  to NumPc do
            begin
              if (ListaPcs[k].CordX = i) then
              begin
                if(ListaPcs[k].CordY = j)then
                begin
                  for a := k to NumSwitch-1 do
                  begin
                    ListaPcs[a] := ListaPcs[a+1];
                  end;
                  NumPc := NumPc - 1;
                  Break;
                end;
              end;
            end;
          end;
          //Fin Pcs
          //Impresoras
          if NumImpre <> 0 then
          begin
            for k := 1  to NumImpre do
            begin
              if (ListaImpre[k].CordX = i) then
              begin
                if(ListaImpre[k].CordY = j)then
                begin
                  for a := k to NumSwitch-1 do
                  begin
                    ListaImpre[a] := ListaImpre[a+1];
                  end;
                  NumImpre:= NumImpre - 1;
                  Break;
                end;
              end;
            end;
          end;
          //Fin Pcs
          j := j + 20;
        end;//2 While
        i := i + 20;
        end;//1 while
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
  ListaFibras[NumFibra+1][1] := Point(x1,y1);
  ListaFibras[NumFibra+1][2] := Point(x2,y2);
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
var  f: TextFile;
var i : Integer;
begin
  //Guardar Archivo
  if(SaveDialog1.Execute) then
  begin
    coordenadasTexto.Text := SaveDialog1.FileName;
    //Cargar arvhivos en Pascal
    AssignFile(f,SaveDialog1.FileName);
    //Fopen
    Rewrite(f);//Forma de leectura
    (*
    Donde
    f = fibras
    c = cables
    w = Firewalls
    s = server
    h = Switch
    p = Pc
    i = impresora
    k = fin de archivo
    *)

    //Fibras
    if NumFibra > 0 then
    begin
      for i := 1 to NumFibra do
      begin
        writeLn(f,'f' );
        writeLn(f,ListaFibras[i][1].X);
        writeLn(f,ListaFibras[i][1].Y);
        writeLn(f,ListaFibras[i][2].X);
        writeLn(f,ListaFibras[i][2].Y);
      end;
    end;
    //Cables
    if NumCable > 0 then
    begin
      for i := 1 to NumCable do
      begin
        writeLn(f,'c' );
        writeLn(f,ListaCables[i][1].X);
        writeLn(f,ListaCables[i][1].Y);
        writeLn(f,ListaCables[i][2].X);
        writeLn(f,ListaCables[i][2].Y);
      end;
    end;
    //
    //Firewalls
    if NumFirewall > 0 then
    begin
      for i := 1 to NumFirewall do
      begin
        writeLn(f,'w' );
        writeLn(f,ListaFirewalls[i].CordX);
        writeLn(f,ListaFirewalls[i].CordY);
      end;
    end;
    //Servers
    if NumServer > 0 then
    begin
      for i := 1 to NumServer do
      begin
        writeLn(f,'s' );
        writeLn(f,ListaServers[i].CordX);
        writeLn(f,ListaServers[i].CordY);
      end;
    end;
    //Switchs
    if NumSwitch > 0 then
    begin
      for i := 1 to NumSwitch do
      begin
        writeLn(f,'h' );
        writeLn(f,ListaSwitchs[i].CordX);
        writeLn(f,ListaSwitchs[i].CordY);
      end;
    end;
    //Pcs

    if NumPc > 0 then
    begin
      for i := 1 to NumPc do
      begin
        writeLn(f,'p' );
        writeLn(f,ListaPcs[i].CordX);
        writeLn(f,ListaPcs[i].CordY);
        writeLn(f,ListaPcs[i].angulo);
      end;
    end;
    //Impresoras

    if NumImpre > 0 then
    begin
      for i := 1 to NumImpre do
      begin
        writeLn(f,'i' );
        writeLn(f,ListaImpre[i].CordX);
        writeLn(f,ListaImpre[i].CordY);
        writeLn(f,ListaImpre[i].angulo);
      end;
    end;
    writeLn(f,'k');

    //Cerrar El archivo
    CloseFile(f);
  end;
end;

procedure TEditorRedes.Abrir1Click(Sender: TObject);
var aux,tipo: String;
var xa,ya,xb,yb: Integer;
var conP : TPc;
var conI : TPrinter;
var conH : TSwitch;
var conW : TFirewall;
var conS : TServer;
var  f: TextFile;
begin
  (*
  Donde
  f = fibras
  c = cables
  w = Firewalls
  s = server
  h = Switch
  p = Pc
  i = impresora
  k = fin de archivo
  *)
  aux := 'l';
  tipo := 'l';
  //Abrir Archivo
  if(OpenDialog1.Execute) then
  begin
    //Cargar arvhivos en Pascal
    AssignFile(f,OpenDialog1.FileName);
    //Fopen
    Reset(f);//fopen
    while not EOF(f) do //Mientras no llegue al final del archivo
    begin
      //Lee Linea
      readln(f,aux);
      if(CompareText(aux,'f') = 0)then//Busca Fibras
      begin
        tipo := 'f';
      end;
      if(CompareText(aux,'c') = 0)then//Busca Cables
      begin
        tipo := 'c';
      end;
      if(CompareText(aux,'w') = 0)then//Busca Firewalls
      begin
        tipo := 'w';
      end;
      if(CompareText(aux,'s') = 0)then//Busca Servidores
      begin
        tipo := 's';
      end;
      if(CompareText(aux,'h') = 0)then//Busca Switches
      begin
        tipo := 'h';
      end;
      if(CompareText(aux,'p') = 0)then//Busca Pcs
      begin
        tipo := 'p';
      end;
      if(CompareText(aux,'i') = 0)then//Busca Impresoras
      begin
        tipo := 'i';
      end;
      if(CompareText(aux,'k') = 0)then//Busca Fin de archivo
      begin
        tipo := 'l';
      end;
      //Llena
      if(CompareText(tipo,'l') <> 0)then
      begin
        if(CompareText(tipo,'f') = 0) then
        begin
          readln(f,xa);
          readln(f,ya);
          readln(f,xb);
          readln(f,yb);

          Lienzo.Canvas.Pen.Color := clgreen;
          Lienzo.Canvas.pen.Width := 5;
          //Pintar
          Lienzo.Canvas.MoveTo(xa,ya);
          Lienzo.Canvas.lineto(xb,yb);

          //Agregrar la fibra al arreglo
          ListaFibras[NumFibra+1][1] := Point(xa,ya);
          ListaFibras[NumFibra+1][2] := Point(xb,yb);
          NumFibra := NumFibra + 1;
          //Default
          Lienzo.Canvas.Pen.Color := clblack;
          Lienzo.Canvas.pen.Width := 1;
        end;
        if(CompareText(tipo,'c') = 0) then
        begin
          readln(f,xa);
          readln(f,ya);
          readln(f,xb);
          readln(f,yb);
          
          Lienzo.Canvas.Pen.Color := clBlack;
          Lienzo.Canvas.pen.Width := 3;

          Lienzo.Canvas.MoveTo(xa,ya);
          Lienzo.Canvas.lineto(xb,yb);

          ListaCables[NumCable+1][1] := Point(xa,ya);
          ListaCables[NumCable+1][2] := Point(xb,yb);
          NumCable := NumCable + 1;
          //Default
          Lienzo.Canvas.Pen.Color := clblack;
          Lienzo.Canvas.pen.Width := 1;
        end;
        if(CompareText(tipo,'w') = 0) then
        begin
          readln(f,xa);
          readln(f,ya);
          
          //Pinta
          Lienzo.Canvas.Draw(xa,ya,Firewall);
          //Guardar
          conW.CordX := xa;
          conW.CordY := ya;
          ListaFirewalls[NumFirewall+1] := conW;
          NumFirewall := NumFirewall +1;
        end;
        if(CompareText(tipo,'s') = 0) then
        begin
          readln(f,xa);
          readln(f,ya);
          
          Lienzo.Canvas.Draw(xa,ya,Server);
          //Guardar
          conS.CordX := xa;
          conS.CordY := ya;
          ListaServers[NumServer+1] := conS;
          NumServer := NumServer +1;
        end;
        if(CompareText(tipo,'h') = 0) then
        begin
          readln(f,xa);
          readln(f,ya);
          
          Lienzo.Canvas.Draw(xa,ya,Switch);
          //Guardar
          conH.CordX := xa;
          conH.CordY := ya;
          ListaSwitchs[NumSwitch+1] := conH;
          NumSwitch := NumSwitch + 1;
        end;
        if(CompareText(tipo,'p') = 0) then
        begin
          readln(f,xa);
          readln(f,ya);
          readln(f,yb);//Angulo
          
          if yb = 0 then
          begin
            Computadora.LoadFromFile('PCIcon.bmp');
            conP.angulo := 0;
          end;
          if yb = 90 then
          begin
            Computadora.LoadFromFile('PCIcon90.bmp');
            conP.angulo := 90;
          end;
          if yb = 180 then
          begin
            Computadora.LoadFromFile('PCIcon180.bmp');
            conP.angulo := 180;
          end;
          if yb = 270 then
          begin
            Computadora.LoadFromFile('PCIcon270.bmp');
            conP.angulo := 270;
          end;
          //Pinta
          Lienzo.Canvas.Draw(xa,ya,Computadora);
          //Guardar
          conP.CordX := xa;
          conP.CordY := ya;
          ListaPcs[NumPc+1] := conP;
          NumPc := NumPc + 1;
        end;
        if(CompareText(tipo,'i') = 0) then
        begin
          readln(f,xa);
          readln(f,ya);
          readln(f,yb);//Angulo
          
          if yb = 0 then
          begin
            Impresora.LoadFromFile('PrinterIcon.bmp');
            conI.angulo := 0;
          end;
          if yb = 90 then
          begin
            Impresora.LoadFromFile('PrinterIcon90.bmp');
            conI.angulo := 90;
          end;
          if yb = 180 then
          begin
            Impresora.LoadFromFile('PrinterIcon180.bmp');
            conI.angulo := 180;
          end;
          if yb = 270 then
          begin
            Impresora.LoadFromFile('PrinterIcon270.bmp');
            conI.angulo := 270;
          end;
          Lienzo.Canvas.Draw(x1,y1,Impresora);
          //Guardar
          conI.CordX := x1;
          conI.CordY := y1;
          ListaImpre[NumImpre+1] := conI;
          NumImpre := NumImpre + 1;
        end;
      end;
    end;
    CloseFile(f);//Cerrar El archivo
  end;
end;

procedure TEditorRedes.Button2Click(Sender: TObject);
begin
  //Pinta linea negra = cable
  Lienzo.Canvas.Pen.Color := clBlack;
  Lienzo.Canvas.pen.Width := 3;

  Lienzo.Canvas.MoveTo(x1,y1);
  Lienzo.Canvas.lineto(x2,y2);

  ListaCables[NumCable+1][1] := Point(x1,y1);
  ListaCables[NumCable+1][2] := Point(x2,y2);
  NumCable := NumCable + 1;
  //Default
  Lienzo.Canvas.Pen.Color := clblack;
  Lienzo.Canvas.pen.Width := 1;
end;

procedure TEditorRedes.Button5Click(Sender: TObject);
var contador : TFirewall;
begin
  if Lienzo.Cursor = crCross then
  begin
    //Pinta
    Lienzo.Canvas.Draw(x1,y1,Firewall);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaFirewalls[NumFirewall+1] := contador;
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
var contador : TServer;
begin
  if Lienzo.Cursor = crCross then
  begin
    Lienzo.Canvas.Draw(x1,y1,Server);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaServers[NumServer+1] := contador;
    NumServer := NumServer +1;
  end;
end;

procedure TEditorRedes.Button11Click(Sender: TObject);
var contador : TSwitch;
begin
  if Lienzo.Cursor = crCross then
  begin
    Lienzo.Canvas.Draw(x1,y1,Switch);
    //Guardar
    contador.CordX := x1;
    contador.CordY := y1;
    ListaSwitchs[NumSwitch+1] := contador;
    NumSwitch := NumSwitch + 1;
  end;
end;

procedure TEditorRedes.Button4Click(Sender: TObject);
var contador : TPc;
begin
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
    ListaPcs[NumPc+1] := contador;
    NumPc := NumPc + 1;
  end;
end;

procedure TEditorRedes.Button9Click(Sender: TObject);
var contador : TPrinter;
begin
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
    ListaImpre[NumImpre+1] := contador;
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
