{ 2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído.
   Por ejemplo, si se lee la secuencia: 3 5 6 2 3 10 98 8 -12 9
   deberá informar: “El mayor número leído fue el 98”
      a. Modifique el programa anterior para que, además de informar el mayor número leído, se informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la misma secuencia: 3 5 6 2 3 10 98 8 -12 9 deberá informar: “El mayor número leído fue el 98, en la posición 7”
}
program E2A;
const
  numeros = 10; //DEFINO UNA CONSTANTE numeros
var
  numero, i, mayor, posMayor : integer; //DEFINO LAS VARIABLES A UTILIZAR
begin

  mayor := -9999; //INICIALIZA mayor CON UN NUMERO PEQUEÑO
  
  // UTILIZA FOR PARA REPETIR LA CANTIDAD DE VECES ASIGNADA EN numeros
  for i:=1 to numeros do begin
    writeln(); //ESPACIO EN BLANCO
    
    write('(', i:2, ' de ', numeros,') '); //DECORADOR PARA SABER EL PROGRESO
    write('Ingrese un numero: '); //SOLICITA INGRESAR UN NUMERO
    
    readln(numero); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE numero
    
    //CHEQUEA SI EL VALOR INGRESADO ES MAYOR QUE LA VARIABLE mayor
    if (numero > mayor) then begin
      mayor := numero; //ACTUALIZA EL VALOR DE mayor
      posMayor := i;
    end;
  end;
  
  writeln(); //ESPACIO EN BLANCO
  
  writeln('El mayor número leído fue el ', mayor, ', en la posicion ', posMayor);
  
  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.