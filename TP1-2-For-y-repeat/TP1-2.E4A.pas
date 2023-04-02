{ 4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos números mínimos leídos.
   a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número 0, el cual debe procesarse.
}
program E4A;
var
  num, min1, min2: integer; //DEFINO LAS VARIABLES A UTILIZAR
begin
  min1:=9999; min2:=9999; //INICIALIZA LOS MINIMOS CON UN VALOR GRANDE
  
  writeln('Se le solicitará ingresar números. Ingrese el 0 como ultimo valor.');
  
  repeat //COMIENZA REPEAT UNTIL
    writeln(); //ESPACIO EN BLANCO
    write('Ingrese un numero: '); //SOLICITA INGRESAR UN NUMERO
    readln(num); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE num
    
    //CASO ES MENOR QUE AMBOS MIN
    if (num < min1) then begin
      min2:= min1; min1:= num;
    end
    //CASO ES MENOR QUE min2 PERO MAYOR QUE min1
    else
      if (num < min2) then min2:= num;

  until (num = 0); //REPETIR DESDE EL repeat HASTA QUE num = 0 EN ESTA POSICION
  
  writeln(); //ESPACIO EN BLANCO
  writeln('Los minimos son: ', min1, ' y ', min2); //IMPRIME LOS 2 MINIMOS
  
  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.
