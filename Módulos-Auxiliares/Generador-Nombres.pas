program GeneradorNombresAleatorios;

procedure GenerarNombreApellidoAleatorio(var Nombre, Apellido: string);
const
  SilabasNombres: array[1..20] of string = ('ana', 'mar', 'jua', 'ped', 'pau', 'car', 'lu', 'ma', 'fe', 'so',
                                            'li', 'ro', 'me', 'pa', 'no', 'la', 'sa', 'lu', 'ba', 'mi');
  SilabasApellidos: array[1..20] of string = ('gon', 'mor', 'rom', 'gue', 'fer', 'ram', 'gar', 'ber', 'per', 'del',
                                              'tor', 'her', 'dia', 'vaz', 'cal', 'sal', 'ver', 'guez', 'ros', 'mart');
var
  LongitudNombre, LongitudApellido, i: integer;
begin
  Randomize;
  LongitudNombre := Random(3) + 2;
  LongitudApellido := Random(2) + 2;
  Nombre := ''; Apellido := '';
  
  for i := 1 to LongitudNombre do
    Nombre := Nombre + SilabasNombres[Random(20) + 1];

  for i := 1 to LongitudApellido do
    Apellido := Apellido + SilabasApellidos[Random(20) + 1];

  Nombre[1] := UpCase(Nombre[1]);
  Apellido[1] := UpCase(Apellido[1]);
end;

var
  Nombre, Apellido: string;
begin
  GenerarNombreApellidoAleatorio(Nombre, Apellido);
  writeln(Nombre, ' ', Apellido);
end.
