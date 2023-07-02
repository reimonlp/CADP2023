{

CADP 2023 - Parcial - Segunda Fecha - 01/07/2023 - TEMA 1 - 8:00 AM

El productor musical Bizarrap organiza sesiones musicales con diferentes artistas. Implementar un programa que lea y almacene información de dichas sesiones. De cada sesión se lee: título de sesión, nombre del artista, género musical (1: Trap Latino, 2: Reggaeton, 3: Urban, 4: Electrónica, 5: Pop Rap) y cantidad de visualizaciones en YouTube. La lectura finaliza cuando se lee la sesión del artista con nombre "Peso Pluma", la cual debe procesarse. La información debe quedar almacenada en una estructura de datos ordenada por título de sesión de forma ascendente.

Una vez leída y almacenada la información, se pide:

A. Informar los dos códigos de género musical con mayor cantidad de visualizaciones en YouTube.
B. Informar la cantidad de sesiones del género "Reggaeton" cuya cantidad de visualizaciones contiene la misma cantidad de dígitos pares que impares.
C. COMPLETO: Realizar un módulo que reciba un título de sesión y elimine dicha sesión de la estructura. El título de sesión puede no existir. Invocar el módulo desarrollado en el programa principal con un título leído por teclado.

}
program Tema1;
const 
  ultNombre = 'Peso Pluma';
type
  gensMusic = 1..5;
  sesion = record
    titulo: string;
    artista: string;
    genero: gensMusic;
    vis: integer;
  end;
  lista = ^nodo;
  nodo = record
    d: sesion;
    s: lista;
  end;
  vGens = array[gensMusic] of Integer;

procedure insertarOrdenado(var sesiones : lista; sesionLeida : sesion);
var
  nueva, anterior, actual: lista;
begin
  new(nueva); nueva^.d := sesionLeida; nueva^.s := nil;

  if (sesiones = NIL) then
    sesiones := nueva
  else begin
    actual := sesiones; anterior := sesiones;

    while (actual <> nil) and (actual^.d.titulo < nueva^.d.titulo) do begin
      anterior := actual; actual := actual^.s;
    end;

    if (actual = sesiones) then begin
      nueva^.s := sesiones; sesiones := nueva;
    end else begin
      nueva^.s := actual; anterior^.s := nueva;
    end;
  end;
end;

procedure eliminar(var sesiones : lista; titulo : string);
var
  anterior, actual, siguiente: lista;
begin
  actual := sesiones; anterior := sesiones;

  while (actual <> nil) and (actual^.d.titulo <> titulo) do begin
    anterior := actual; actual := actual^.s; siguiente := actual^.s;
  end;

  if (actual = sesiones) then 
    sesiones := sesiones^.s
  else if (actual <> nil) then
    anterior^.s := siguiente;

  dispose(actual);
end;

procedure cargarSesiones(var sesiones : lista);
var
  sesionLeida : sesion;
begin
  repeat
    writeln;
    Write('Titulo de sesion: '); ReadLn(sesionLeida.titulo);
    Write('Nombre del Artista: '); ReadLn(sesionLeida.artista);
    WriteLn('(1: Trap Latino, 2: Reggaeton, 3: Urban, 4: Electronica, 5: Pop Rap)');
    Write('Genero Musical: '); ReadLn(sesionLeida.genero);
    Write('Visualizaciones en YouTube: '); ReadLn(sesionLeida.vis);

    insertarOrdenado(sesiones, sesionLeida);
  until (sesionLeida.artista = ultNombre);
end;

function eqPI(numero: Integer) : Boolean;
var
  digito, pares, impares : Integer;
begin
  pares := 0; impares := 0;
  while (numero <> 0) do begin
    digito := numero MOD 10;
    numero := numero DIV 10;

    if (digito MOD 2 = 0) then
      pares := pares + 1
    else
      impares := impares + 1;
  end;

  eqPI := (pares = impares);
end;

procedure procesarSesiones(sesiones: lista; var visualizaciones: vGens; var maxVis1, maxVis2, RegMismaCant: Integer);

  procedure maximos(visualizaciones: vGens; var maxVis1, maxVis2: integer);
  var
    i, max1, max2: Integer;
  begin
    for i := 1 to 5 do
    begin
      if (visualizaciones[i] > max1) then
      begin
        max2 := max1; maxVis2 := maxVis1;
        max1 := visualizaciones[i]; maxVis1 := i;
      end
      else if (visualizaciones[i] > max2) then
      begin
        max2 := visualizaciones[i]; maxVis2 := i;
      end;
    end;
  end;

begin
  RegMismaCant := 0;

  while (sesiones <> NIL) do begin
    visualizaciones[sesiones^.d.genero] := visualizaciones[sesiones^.d.genero] + sesiones^.d.vis;
    if (sesiones^.d.genero = 2) and (eqPI(sesiones^.d.vis)) then
      RegMismaCant := RegMismaCant + 1;
    sesiones := sesiones^.s;
  end;

  maximos(visualizaciones, maxVis1, maxVis2);
end;

var
  sesiones : lista = nil;
  visualizaciones : vGens;
  maxVis1, maxVis2, RegMismaCant, i : Integer;
  eliminarSesion : String;
begin
  for i := 1 to 5 do visualizaciones[i] := 0;
  maxVis1 := -1; maxVis2 := -2;

  cargarSesiones(sesiones);

  procesarSesiones(sesiones, visualizaciones, maxVis1, maxVis2, RegMismaCant);

  WriteLn('Generos con mayor cantidad de visualizaciones: ', maxVis1, ' y ', maxVis2);
  WriteLn('Reggaeton cuya cantidad de visualizaciones tiene la misma cantidad de digitos pares que impares: ', RegMismaCant);

  Write('Ingrese el nombre de la sesion a eliminar: '); ReadLn(eliminarSesion);
  eliminar(sesiones, eliminarSesion);
end.