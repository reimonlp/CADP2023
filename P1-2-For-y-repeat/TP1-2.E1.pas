{ 1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
}
program E1;
const
  numeros = 10; //DEFINO UNA CONSTANTE numeros
var
  numero, i, suma : integer; //DEFINO LAS VARIABLES A UTILIZAR
begin
  suma := 0; //INICIALIZA suma EN 0
  
  writeln('Se le solicitará que ingrese ', numeros, ' enteros');
  
  // UTILIZA FOR PARA REPETIR LA CANTIDAD DE VECES ASIGNADA EN numeros
  for i:=1 to numeros do begin
    writeln(); //ESPACIO EN BLANCO
    
    write('(', i:2, ' de ', numeros,') '); //DECORADOR PARA SABER EL PROGRESO
    write('Ingrese un número entero: '); //SOLICITA INGRESAR UN NUMERO
    
    readln(numero); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE numero
    
    suma := suma + numero; //ACTUALIZA EL VALOR DE LA VARIABLE suma
  end;
  writeln(); //ESPACIO EN BLANCO
  
  writeln('La suma de los ', numeros, ' numeros es ', suma);

  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.