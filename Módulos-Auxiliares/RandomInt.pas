program RandomInt;

function randomInt(min, max: int64) : int64;
begin
  if (min < 0) then
  begin
    max := max - min;
    min := min * -1;
    randomInt := Random(max) - min
  end
  else
    randomInt := Random(max - min) + min;
end;

var
  min, max: int64;
begin
  Randomize;
  write('Ingrese el mínimo deseado: '); readln(min);
  write('Ingrese el máximo deseado: '); readln(max);
  writeln(randomInt(min, max));
end.
