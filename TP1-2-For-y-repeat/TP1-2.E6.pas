{ 6. Realizar un programa que lea información de 200 productos de un supermercado.
   De cada producto se lee código y precio (cada código es un número entre 1 y 200).
   Informar en pantalla:
   - Los códigos de los dos productos más baratos.
   - La cantidad de productos de más de 16 pesos con código par.
}
program E6;
const
  //cantProductos = 200;
  cantProductos = 3; //PARA PRUEBAS
type
  code = 1..200; //DEFINO UN TIPO DE VARIABLE code CON RANGO DE 1 A 200
var
  //DEFINO LAS VARIABLES A UTILIZAR
  codigo, min1Cod, min2Cod : code;
  precio, min1, min2 : real;
  mas16CodPar, i : integer;
begin
  min1 := 9999; min2 := 9999; //INICIALIZA LOS MINIMOS CON VALORES EXTREMOS
  mas16CodPar := 0; //INICIALIZA mas16CodPar EN 0
  
  // UTILIZA FOR PARA REPETIR LA CANTIDAD DE VECES ASIGNADA EN cantProductos
  for i := 1 to cantProductos do begin
    writeln(); //ESPACIO EN BLANCO
    
    write('(', i:3, ' de ', cantProductos,') '); //DECORADOR PARA SABER EL PROGRESO
    write('Ingrese código de producto: '); //SOLICITA INGRESAR UN NUMERO
    
    readln(codigo); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE codigo
    
    write('Ingrese precio del producto: '); //SOLICITA INGRESAR UN NUMERO
    
    readln(precio); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE precio
    
    //CASO ES MENOR QUE AMBOS MIN
    if (precio < min1) then begin
      min2 := min1;
      min2Cod := min1Cod;
      
      min1 := precio;
      min1Cod := codigo;
    end
    //CASO ES MENOR QUE min2 PERO MAYOR QUE min1
    else if (precio < min2) then begin
      min2 := precio;
      min2Cod := codigo;
    end;
    
    if (precio > 16) and (codigo mod 2 = 0) then
      mas16CodPar := mas16CodPar + 1;
  end; //AQUI TERMINA EL FOR

  writeln(); //ESPACIO EN BLANCO
  writeln('Códigos de los dos productos más baratos:');
  writeln('  ', min1Cod, ': $', min1:0:2);
  writeln('  ', min2Cod, ': $', min2:0:2);
  
  writeln(); //ESPACIO EN BLANCO
  writeln('Productos de más de $16 con código par: ', mas16CodPar);

  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.