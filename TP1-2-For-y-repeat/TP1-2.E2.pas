{ 2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído.
   Por ejemplo, si se lee la secuencia: 3 5 6 2 3 10 98 8 -12 9
   deberá informar: “El mayor número leído fue el 98”
}
program E2;
const
  numeros = 10; //DEFINO UNA CONSTANTE numeros
var
  numero, i, mayor : integer; //DEFINO LAS VARIABLES A UTILIZAR
begin

  mayor := -9999; //INICIALIZA mayor CON UN NUMERO PEQUEÑO
  
  // UTILIZA FOR PARA REPETIR LA CANTIDAD DE VECES ASIGNADA EN numeros
  for i:=1 to numeros do begin
    write('Ingrese un numero: '); //SOLICITA INGRESAR UN NUMERO
    
    readln(numero); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE numero
    
    //SI EL VALOR INGRESADO ES MAYOR QUE LA VARIABLE mayor
    if (numero > mayor) then
      mayor := numero; //ACTUALIZA EL VALOR DE mayor
  end;
  
  writeln(); //ESPACIO EN BLANCO
  
  writeln('El mayor numero ingresado fue ', mayor);
  
  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.