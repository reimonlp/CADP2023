{ 8. Un local de ropa desea analizar las ventas realizadas en el último mes.
  Para ello se lee por cada día del mes, los montos de las ventas realizadas.
  La lectura de montos para cada día finaliza cuando se lee el monto 0. Se asume un mes de 31 días.
  Informar:
  - La cantidad de ventas por cada día.
  - El monto total acumulado en ventas de todo el mes.
}
program E8;
const
  //diasMes = 31;
  diasMes = 3; //PARA PRUEBAS
var
  //DEFINO LAS VARIABLES A UTILIZAR
  monto, acumulado : real;
  ventasDiarias, dia : integer;
begin
  acumulado := 0; //INICIALIZA acumulado EN 0
  
  for dia := 1 to diasMes do begin
    ventasDiarias := 0; //INICIALIZA ventasDiarias EN 0
    
    writeln(); //ESPACIO EN BLANCO
    writeln(); //ESPACIO EN BLANCO
    writeln('INGRESE LAS VENTAS PARA EL DÍA ', dia);
    
    repeat
      write('Monto de la venta: '); readln(monto);

      if (monto > 0) then begin
        acumulado := acumulado + monto;
        ventasDiarias := ventasDiarias + 1;
        writeln(); //ESPACIO EN BLANCO
      end;
    until(monto = 0);
    
    writeln(); //ESPACIO EN BLANCO
    writeln('CANTIDAD DE VENTAS DÍA ', dia, ': ', ventasDiarias);
  end;
  
  writeln(); //ESPACIO EN BLANCO
  writeln(); //ESPACIO EN BLANCO
  writeln('MONTO TOTAL ACUMULADO EN VENTAS: ', acumulado:0:2);
  
  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.