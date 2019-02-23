program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {EditorRedes},
  Unit2 in 'Unit2.pas' {Editor: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TEditorRedes, EditorRedes);
  Application.Run;
end.
