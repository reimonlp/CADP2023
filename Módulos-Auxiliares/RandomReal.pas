program RandReal;

procedure randomReal(var result: real);
var
  e, d: real;
begin
  e := Random(60) - 10; // parte entera de -10 a 50
  d := Random(99) / 100; // parte decimal de 0.00 a 0.99
  result := e + d;
end;

var
  x: real;
begin
  Randomize;
  randomReal(x);
  writeln(x:0:2);
end.
