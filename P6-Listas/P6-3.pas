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
procedure armarNodo3A (var L:lista; v:integer);
var 
    aux, nuevo:lista;
begin 
    new (nuevo);
    nuevo^.num := v;
    nuevo^.sig := nil;

    if(L = nil) then
        L := nuevo
    else begin
        aux := L;
        while (aux^.sig <> nil) do
            aux := aux^.sig;
        aux^.sig := nuevo;
    end;
end;
procedure armarNodo3B (var L, ult:lista; v:integer);
var 
    aux : lista;
begin 
    new(aux);
    aux^.num := v;
    aux^.sig := nil;

    if(L = nil) then begin
        L := aux;
        ult := aux;
    end
    else begin
        ult^.sig := aux;
        ult := aux;
    end;
end;
procedure sumarEnLista(L:lista; v:integer);
begin
    while(L <> nil) do begin
        L^.num := L^.num + v;
        L := L^.sig;
    end;
end;

var
    pri, ult:lista;
    valor:integer;
begin
    pri := nil;
    ult := nil;
    write('Ingrese un numero: ');
    readln(valor);
    while (valor <> 0) do begin 
        armarNodo3B (pri, ult, valor);
        write ('Ingrese un numero: ');
        readln(valor);
    end;

    imprimirLista(pri);
end.
