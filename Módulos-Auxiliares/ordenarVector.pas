program ordenar;

const numbers = 5;    // cantidad de elementos que posee el vector

type tvector = array[1..numbers] of integer;

procedure imprimirVectorH(v: tvector; a, b: integer);
var i, c: integer;
begin
  if (a = b) then writeln; 
  for i := 1 to numbers do write(' [', v[i]:3 ,']'); writeln;
  if (a <> 0) then begin
    for c := 1 to numbers do
      if (c = a) or (c = b) then write('  ^^^ ') else write('      ');
    writeln;
  end;
end;

procedure ordenar(var v: tvector);
var
  i, j: integer;    // usadas para recorrer el vector
  menor: integer;   // almacena la posicion del menor en la comparacion
  aux : integer;    // variable auxiliar para no perder datos
begin
  // imprimo el vector original
  imprimirVectorH(v, 0, 0);
  
  for i := 1 to (numbers - 1) do begin  // recorro desde el 1er al anteúltimo elemento
  
    menor := i;   // 'menor' toma el valor de 'i' en cada iteración del for
    
    // recorro desde el elemento siguiente a 'i' hasta el último del vector
    for j := (i + 1) to numbers do
    
      // si el elemento en la posición 'j' es menor que el de la posicion 'menor'
      if (v[j] < v[menor]) then
        menor := j;             // actualizo 'menor' con el valor de 'j'

    // entra al if sólo si se producirían cambios
    if (menor <> i) then begin

      // notifico que se va a producir un intercambio
      writeln; writeln('          v[', i,'] > v[', menor,']'); writeln;
      
      imprimirVectorH(v, i, menor);   // imprimo el vector señalando los cambios a producirse
      
      aux := v[menor];  // almaceno en 'aux' el valor de la posicion 'menor'
      v[menor] := v[i];  v[i] := aux;   // realizo el desplazamiento
    end;

  end;
  
  // imprimo el vector ordenado
  imprimirVectorH(v, 0, 0);
end;

var
  v : tvector; i : integer;
begin
  // le pido al usuario que ingrese números enteros para completar el vector
  // de tamaño definido en la constante numbers
  writeln; writeln('Ingrese ', numbers, ' números enteros para cargar el vector');
  
  for i := 1 to numbers do begin
    write('v[', i ,'] := '); readln(v[i]);
  end;

  ordenar(v);  // llamo al procedure ordenar
end.