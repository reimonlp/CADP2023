{*

4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X
en dicho vector, o el valor -1 en caso de no encontrarse.

b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna
el mismo vector donde se intercambiaron los valores de las posiciones x e y.

*}


program e4;
const
  df = 100;
type
  rango = 1..df;
  tvector = array[rango] of integer;
var
  vector: tvector;
  
  function posicion (x: integer; vector: tvector) : integer;
  var
    i, pos: integer;
  begin
    pos := -1;
    i:=1;
    while ((i <= df) and (vector[i] <> x)) do
      i := i + 1;
    if (vector[i] = x) then
      pos := i;
    posicion := pos;
  end;
  
  procedure intercambio(x, y : rango; var vector: tvector);
  var
    temp : integer;
  begin
    temp := vector[x];
    vector[x] := vector[y];
    vector[y] := temp;
  end;
  
var
  i, x, y : rango;
  n, pos: integer;
begin
  for i:=1 to df do
    vector[i] := i;
    
  writeln;
  
  write('ingrese un numero entero de 1 a 100 para saber su posicion: '); readln(n);
  pos := posicion(n, vector);
  if (pos <> -1) then
    writeln('la posicion es ', pos)
  else
    writeln('no se ha encontrado');
  
  writeln;
  
  for i:=1 to df do
    write(vector[i]:4);
  
  writeln; writeln;
  
  write('ingrese la primera posicion a intercambiar: '); readln(x);
  write('ingrese la segunda posicion a intercambiar: '); readln(y);
  
  writeln;
  
  intercambio(x, y, vector);
  
  for i:=1 to df do
    write(vector[i]:4);
  
  writeln; writeln;
    
  writeln('presione enter para salir'); readln;
end.