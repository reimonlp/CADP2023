CADP 2023 Parcial - Primera Fecha 10/6/2023- TEMA 1 - 8:00 AM
Una empresa de venta de pasajes aéreos está analizando la información de los viajes realizados por sus aviones. Para ello, __se dispone de una estructura de datos con la información de todos los viajes__. De cada viaje se conoce el __código de avión__ (entre 1000 y 2500), __el año__ en que se realizó el viaje, __la cantidad de pasajeros__ que viajaron, y __la ciudad de destino__. La información no se encuentra ordenada por ningún criterio. Además, la empresa __dispone de una estructura de datos con información sobre la capacidad máxima de cada avión__.

Realizar un programa que procese la información de los viajes e:
1. Informe el __código del avión__ que realizó la __mayor cantidad de viajes__
2. Genere una __lista__ con los viajes realizados en __años múltiplo de 10__ con __destino "Punta Cana"__ en los que el avión __no alcanzó su capacidad máxima__
3. COMPLETO: Para cada avión, informe el __promedio de pasajeros que viajaron entre todos sus viajes__

````pascal
program parcial

type
  cod_avion = 1000..2500;

  viaje = record
    avion: cod_avion;
    anio: integer;
    pasajeros: integer;
    destino: string;
  end;

  lViajes = ^nodo;
  nodo = record
    dato: viaje;
    sig: lViajes;
  end;

  vAviones = array[cod_avion] of integer;

procedure cargarCapacidad(var capacidad: vAviones);   // SE DISPONE

procedure cargarViajes(var listaViajes: lViajes);     // SE DISPONE

procedure initVCA(var vc: vAviones);
var
  i: cod_avion;
begin
  for i := 1000 to 2500 do
    vc[i] := 0;
end;

procedure agregarAdelante(var lista: lViajes; v: viaje);
var
  aux: lViajes;
begin
  new(aux);
  aux^.dato := v;
  aux^.sig := lista;
  lista := aux;
end;

function maximo(cantViajes: vAviones) : integer;
var
  maxViajes: integer;
  codA, codMax: cod_avion;
begin
  maxViajes := -1;
  for codA := 1000 to 2500 do
    if (cantViajes[codA] > maxViajes) then begin
      maxViajes := cantViajes[codA];
      codMax := codA;
    end;

  maximo := codMax;
end;

function promedio(cantPasajeros, cantViajes: integer) : real;
var
  aux : real;
begin
  if (cantViajes > 0) then
    aux := cantPasajeros / cantViajes
  else
    aux := 0;

  promedio := aux:0:1;
end;

procedure procesarViajes(listaViajes: lViajes; capacidad: vAviones; var lista2: lViajes; var cantViajes, cantPasajeros: vAviones);
var
  codA: cod_avion;
  v: viaje;
begin
  lista2 := nil;
  initVCA(cantViajes);
  initVCA(cantPasajeros);

  while (lista <> nil) do begin
    v := lista^.dato;
    codA := v.avion;
    cantViajes[codA] := cantViajes[codA] + 1;
    cantPasajeros[codA] := cantPasajeros + v.pasajeros

    if ((v.anio MOD 10 = 0) AND (v.destino = 'Punta Cana') AND (v.pasajeros < capacidad[codA])) then
      agregarAdelante(lista2, v);

    lista := lista^.sig;
  end;
end;

var
  listaViajes, lista2 : lViajes;
  capacidad, cantViajes, cantPasajeros : vAviones;
  i : cod_avion;
begin
  cargarCapacidad(capacidad);   // SE DISPONE
  cargarViajes(listaViajes);    // SE DISPONE

  procesarViajes(listaViajes, capacidad, lista2, cantViajes, cantPasajeros);

  writeln('Avión que realizó mayor cantidad de viajes: ', maximo(cantViajes));

  writeln('PASAJEROS PROMEDIO POR AVION');
  for i := 1000 to 2500 do
    writeln(i, ': ', promedio(cantPasajeros[i], cantViajes[i]));
end.
```