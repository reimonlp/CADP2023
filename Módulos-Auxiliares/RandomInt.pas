program RandomInt;

function randomInt(min, max: int64) : int64;
begin
  if (min < 0) then
    min := min * -1;

  randomInt := Random(max - min) + min;
end;

begin
  write('Ingrese el mínimo deseado: '); readln(min);
  write('Ingrese el máximo deseado: '); readln(max);
  writeln(randomInt(min, max));
end;
