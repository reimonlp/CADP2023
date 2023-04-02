{ 5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el número 100, el cual debe procesarse. Informar en pantalla:
   - El número máximo leído.
   - El número mínimo leído.
   - La suma total de los números leídos.
}
program E5;
var
 numero, maximo, minimo, suma : integer; //DEFINO LAS VARIABLES A UTILIZAR
begin
  maximo := -9999; minimo := 9999; //INICIALIZA MAXIMO Y MINIMO CON VALORES EXTREMOS
  suma := 0; //INICIALIZA suma EN 0
  
  writeln('Se le solicitará ingresar números. Ingrese el 100 como último valor.');
  
  repeat //COMIENZA REPEAT UNTIL
    writeln(); //ESPACIO EN BLANCO
    write('Ingrese un numero: '); //SOLICITA INGRESAR UN NUMERO
    readln(numero); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE numero
    
    if (numero > maximo) then //CHEQUEA SI EL NUMERO INGRESADO ES MAS GRANDE QUE mayor
      maximo := numero;
      
    if (numero < minimo) then //CHEQUEA SI EL NUMERO INGRESADO ES MAS PEQUEÑO QUE minimo
      minimo := numero;
      
    suma := suma + numero; //SUMA EL NUMERO INGRESADO A LA VARIABLE suma
    
  until(numero = 100); //REPETIR DESDE EL repeat HASTA QUE numero = 100 EN ESTA POSICION
  
  writeln(); //ESPACIO EN BLANCO
  writeln('Número máximo leído: ', maximo);
  writeln('Número mínimo leído: ', minimo);
  writeln('Suma total: ', suma);

  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.
