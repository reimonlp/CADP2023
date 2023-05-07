program compuestoPorPares;

function soloPares(numero:int64): boolean;
var 
  esPar: boolean;
begin
  esPar := true;
  while ((numero > 0) And (esPar=true)) Do
    begin
      esPar := (numero Mod 2 = 0);
      numero := numero Div 10;
    end;
  soloPares := esPar;
end;

var
  numero: int64;
begin
  write('Ingrese un número: '); readln(numero);
  writeln('Compuesto sólo por dígitos pares? ', soloPares(numero));
end.
