{ 7. Realizar un programa que lea desde teclado información de autos de carrera.
  Para cada uno de los autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera.
  En la carrera participaron 100 autos.
  Informar en pantalla:
  - Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
  - Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.
}
program E7;
const
  //cantParticipantes = 100;
  cantParticipantes = 5; //PARA PRUEBAS
var
  //DEFINO LAS VARIABLES A UTILIZAR
  i : integer;
  tiempoPiloto, tiempoPiloto1primeros, tiempoPiloto2primeros, tiempoPiloto1ultimos, tiempoPiloto2ultimos : real;
  nombrePiloto, nombrePiloto1primeros, nombrePiloto2primeros, nombrePiloto1ultimos, nombrePiloto2ultimos : string;
  //
  // Piloto1primeros SERÁ EL PRIMERO EN EL ORDEN DE LLEGADA Y Piloto2ultimos SERÁ EL ULTIMO
  //
  // { Piloto1primeros, Piloto2primeros, .., Piloto1ultimos, Piloto2ultimos }
  //
begin
  tiempoPiloto1primeros := 99999999; tiempoPiloto2primeros := 99999999; //INICIALIZA LOS MINIMOS CON VALORES EXTREMOS
  tiempoPiloto1ultimos := -1; tiempoPiloto2ultimos := -1; //INICIALIZA LOS MAXIMOS CON VALORES EXTREMOS
  nombrePiloto1primeros := ''; nombrePiloto2primeros := ''; nombrePiloto1ultimos := ''; nombrePiloto2ultimos := '';

  // UTILIZA FOR PARA REPETIR LA CANTIDAD DE VECES ASIGNADA EN cantParticipantes
  for i := 1 to cantParticipantes do begin
  
    writeln(); //ESPACIO EN BLANCO
    
    write('(', i:3, ' de ', cantParticipantes,') '); //DECORADOR PARA SABER EL PROGRESO
    write('Ingrese nombre del Piloto: '); //SOLICITA INGRESAR UN NOMBRE
    
    readln(nombrePiloto); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE nombrePiloto
    
    write('Ingrese el tiempo total en segundos: '); //SOLICITA INGRESAR UN NUMERO
    
    readln(tiempoPiloto); //ALMACENA EL NUMERO INGRESADO EN LA VARIABLE tiempoPiloto
    
    //CASO ES MENOR QUE AMBOS PRIMEROS PUESTOS (PRIMER LUGAR)
    if (tiempoPiloto < tiempoPiloto1primeros) then begin
      tiempoPiloto2primeros := tiempoPiloto1primeros;
      nombrePiloto2primeros := nombrePiloto1primeros;
      
      tiempoPiloto1primeros := tiempoPiloto;
      nombrePiloto1primeros := nombrePiloto;
    end
    //CASO ES MENOR QUE tiempoPiloto2primeros PERO MAYOR QUE tiempoPiloto1primeros (SEGUNDO LUGAR)
    else if (tiempoPiloto < tiempoPiloto2primeros) then begin
      tiempoPiloto2primeros := tiempoPiloto;
      nombrePiloto2primeros := nombrePiloto;
    end;
        
    //CASO ES MAYOR QUE AMBOS ULTIMOS PUESTOS (ÚLTIMO LUGAR)
    if (tiempoPiloto > tiempoPiloto2ultimos) then begin
      tiempoPiloto1ultimos := tiempoPiloto2ultimos;
      nombrePiloto1ultimos := nombrePiloto2ultimos;
      
      tiempoPiloto2ultimos := tiempoPiloto;
      nombrePiloto2ultimos := nombrePiloto;
    end
    //CASO ES MAYOR QUE tiempoPiloto1ultimos PERO MENOR QUE tiempoPiloto2ultimos (ANTEULTIMO LUGAR)
    else if (tiempoPiloto > tiempoPiloto1ultimos) then begin
      tiempoPiloto1ultimos := tiempoPiloto;
      nombrePiloto1ultimos := nombrePiloto;
    end;

  end; //AQUI TERMINA EL FOR

  writeln(); //ESPACIO EN BLANCO
  writeln('     Primer Lugar:', nombrePiloto1primeros);
  writeln(); //ESPACIO EN BLANCO
  writeln('    Segundo Lugar:', nombrePiloto2primeros);
  writeln(); //ESPACIO EN BLANCO
  writeln(' Anteúltimo Lugar:', nombrePiloto1ultimos);
  writeln(); //ESPACIO EN BLANCO
  writeln('     Último Lugar:', nombrePiloto2ultimos);
  
  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.
