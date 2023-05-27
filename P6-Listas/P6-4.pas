program JugamosConListas;
type 
    lista = ^nodo;
    nodo = record 
        num:integer;
        sig:lista;
    end;
procedure imprimirLista(L:lista);
begin
    while(L <> nil) do begin
        writeln(L^.num);
        L := L^.sig;
    end;
end;
procedure armarNodo (var L:lista; v:integer);
var 
    aux:lista;
begin 
    new(aux);
    aux ^.num:= v;
    aux ^.sig:= L;
    L:= aux;
end;

function maximo(L : lista) : integer; {A}
var
    max : integer;
begin
    max := L^.num;
    while (L <> nil) do begin
        if( max < L^.num) then max := L^.num
        else L := L^.sig
    end;
    maximo := max;
end;

function minimo(L : lista) : integer; {B}
var
    min : integer;
begin
    min := L^.num;
    while (L <> nil) do begin
        if( min > L^.num) then min := L^.num
        else L := L^.sig
    end;
    minimo := min;
end;

function multiplo(L : lista; v : integer) : integer; {C}
var
    cant : integer;
begin
    cant := 0;

    while (L <> nil) do begin
        if((L^.num mod v) = 0) then cant := cant + 1;
        L := L^.sig;
    end;

    multiplo := cant;
end;
var
    pri:lista;
    valor:integer;
begin
    pri := nil;
    write('Ingrese un numero: ');
    readln(valor);
    while (valor <> 0) do begin 
        armarNodo (pri, valor);
        write ('Ingrese un numero: ');
        readln(valor);
    end;
    imprimirLista(pri);

    writeln('Max: ',maximo(pri));
    writeln('Min: ',minimo(pri));
    writeln('Multiplo de 5: ', multiplo(pri,5));
end.
