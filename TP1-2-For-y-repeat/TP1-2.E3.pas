{ 3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en TIC.
   De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
   La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura informar:
   - La cantidad de alumnos aprobados (nota 8 o mayor)
   - la cantidad de alumnos que obtuvieron un 7 como nota.
}
program E3;
const
  nombreFinal = 'Zidane Zinedine';
var
 nombre : string; nota, alumnosAprobados, alumnosNota7 : integer; //DEFINO LAS VARIABLES A UTILIZAR
begin
  alumnosAprobados := 0; alumnosNota7 := 0; //INICIALIZA EN 0 LAS VARIABLES FINALES
  
  writeln('Alumnos ingresantes a la carrera Analista en TIC.');
  
  repeat //COMIENZA REPEAT UNTIL
    writeln(); //ESPACIO EN BLANCO

    write('Ingrese nombre: '); //SOLICITA INGRESAR UN NOMBRE
    readln(nombre); //ALMACENA EL NOMBRE INGRESADO EN LA VARIABLE nombre
    
    write('Ingrese nota de EPA: '); //SOLICITA INGRESAR UN NUMERO
    readln(nota); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE nota
    
    if (nota >= 8) then //CHEQUEA SI nota ES MAYOR O IGUAL QUE 8
      alumnosAprobados := alumnosAprobados + 1 //ACTUALIZA alumnosAprobados
      
    else if (nota = 7) then //CHEQUEA SI nota ES IGUAL QUE 7
      alumnosNota7 := alumnosNota7 + 1; //ACTUALIZA alumnosNota7
      
  until (nombre = nombreFinal); //REPETIR DESDE EL repeat HASTA QUE nombre SEA IGUAL A nombreFinal ('Zidane Zinedine') EN ESTA POSICION
  
  writeln('Alumnos aprobados: ', alumnosAprobados);
  writeln('Alumnos con nota 7: ', alumnosNota7);

  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.