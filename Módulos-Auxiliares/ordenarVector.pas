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
  imprimirVectorH(v, 0, 0);
  
  // recorro desde el 1er al anteúltimo elemento
  for i := 1 to (numbers - 1) do begin
  
    // 'menor' toma el valor la posición 'i' en cada iteración del for
    menor := i;
    
    // recorro desde el elemento siguiente a 'i' hasta el último del vector
    for j := (i + 1) to numbers do
    
      // si el elemento en la posición 'j' es menor que el de la posicion 'menor'
      if (v[j] < v[menor]) then
        menor := j;   // actualizo 'menor' con el valor de 'j'

    if (menor <> i) then begin  // entra al if sólo si se produjeron cambios
      // notifico que se va a producir un intercambio
      writeln; writeln('          v[', i,'] > v[', menor,']'); writeln;
      
      imprimirVectorH(v, i, menor); // imprimo el vector señalando los cambios
    end;
    
    // almaceno en 'aux' el valor de la posicion 'menor' que puede ser el mismo
    // de la posición original pero esto no afecta al funcionamiento
    aux := v[menor];
    
    // realizo el desplazamiento
    v[menor] := v[i];  v[i] := aux;
    
    // en el caso de que las variables 'menor' e 'i' sean iguales los datos se
    // mantuvieron en sus posiciones originales, podría implentarse un if para
    // optimizar la ejecución
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