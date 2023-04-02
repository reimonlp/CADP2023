// 4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos números mínimos leídos.
//
program E4;
const
  // total_numeros = 1000;
  total_numeros = 5; // TOMARIA DEMASIADO TIEMPO INGRESAR 1000 NUMEROS
var
  num, i, min1, min2: integer; //DEFINO LAS VARIABLES A UTILIZAR
begin
  min1:=9999; min2:=9999; //INICIALIZO LOS MINIMOS CON UN VALOR GRANDE
  
  writeln('Se le solicitará ingresar ', total_numeros, ' números.');
  
  // UTILIZA UN FOR PARA REPETIR LA CANTIDAD DE VECES ASIGNADA EN total_numeros
  for i:= 1 to total_numeros do begin
    writeln(); //ESPACIO EN BLANCO
    
    write('(', i, ' de ', total_numeros, ') '); //DECORADOR PARA SABER EL PROGRESO
    write('Ingrese un numero: '); //SOLICITA INGRESAR UN NUMERO
    
    readln(num); //ALMACENO EL NUMERO INGRESADO EN LA VARIABLE num

    //CASO ES MENOR QUE AMBOS MIN
    if (num < min1) then begin
      min2:= min1; min1:= num;
    end
    //CASO ES MENOR QUE min2 PERO MAYOR QUE min1
    else
      if (num < min2) then min2:= num;
  end; //AQUI TERMINA EL FOR
  
  writeln(); //ESPACIO EN BLANCO
  writeln('Los minimos son: ', min1, ' y ', min2); //IMPRIME LOS 2 MINIMOS
  
  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.
