program JugamosConListas;
type 
    lista = ^nodo;
    nodo = record 
        num:integer;
        sig:lista;
    end;
procedure imprimirLista(L:lista); {C}
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
procedure sumarEnLista(L:lista; v:integer); {D}
begin
    while(L <> nil) do begin
        L^.num := L^.num + v;
        L := L^.sig;
    end;
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

    sumarEnLista(pri, 1);
    imprimirLista(pri);
end.
