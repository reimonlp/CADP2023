program supermercado;
type
    lista = ^nodo;
    nodo = record
        codigo, stockActual, stockMinimo, precio : integer;
        descripcion : string;
        sig : lista;
    end;
procedure agregarProductos(var L : lista);
var
    nuevo : lista;
    cod : integer;    
begin
    write('Codigo: ');
    readln(cod);

    while(cod <> -1) do begin
        new(nuevo);

        nuevo^.codigo := cod;

        write('Stock Actual: ');
        readln(nuevo^.stockActual);
        write('Stock Minimo: ');
        readln(nuevo^.stockMinimo);
        write('Precio: ');
        readln(nuevo^.precio);
        write('Descripcion: ');
        readln(nuevo^.descripcion);

        if(L = nil) then L := nuevo
        else begin
            nuevo^.sig := L;
            L := nuevo;
        end;
        
        writeln('');

        write('Codigo: ');
        readln(cod)
    end;
end;
procedure imprimirProductos(L : lista);  
begin
    while (L <> nil) do begin
        writeln('');

        write('Codigo: ');
        writeln(L^.codigo);
        write('Stock Actual: ');
        writeln(L^.stockActual);
        write('Stock Minimo: ');
        writeln(L^.stockMinimo);
        write('Precio: ');
        writeln(L^.precio);
        write('Descripcion: ');
        writeln(L^.descripcion);

        L := L^.sig;
    end;
    
end;
function porcentajeProductos(L : lista) : real;
var
    cantProductos, cantidadStockBajoMinimo : integer;
begin
    cantProductos := 0;
    cantidadStockBajoMinimo := 0;
    while(L <> nil) do begin
        cantProductos := cantProductos + 1;
        if(L^.stockActual < L^.stockMinimo) then begin
            cantidadStockBajoMinimo := cantidadStockBajoMinimo + 1;
        end;
        L := L^.sig;
    end;
    porcentajeProductos := (cantidadStockBajoMinimo / cantProductos) * 100;
end;
function contarDigitosPares(num : integer) : integer;
var
    cant, dig : integer;
begin
    cant := 0;
    while(num <> 0) do begin
        dig := num mod 10;
        num := num div 10;

        if((dig mod 2) = 0) then cant := cant + 1;
    end;
    contarDigitosPares := cant;
end;
procedure obtenerDescripcion(L : lista);
begin
    while(L <> nil) do begin
        if(contarDigitosPares(L^.codigo) >= 3) then writeln('Descripcion: ', L^.descripcion);

        L := L^.sig;
    end;
end;
procedure obtenerCodigoProductosEconomicos(L : lista);
var
    prod1, prod2, precio1, precio2 : integer;
begin
    precio1 := 32767;
    precio2 := 32767;
    prod1 := 0;
    prod2 := 0;
    while(L <> nil) do begin
        if(L^.precio < precio2) then begin
            if(L^.precio < precio1) then begin
                precio2 := precio1;
                prod2 := prod1;
                precio1 := L^.precio;
                prod1 := L^.codigo;
            end
            else begin
                precio2 := L^.precio;
                prod2 := L^.codigo;
            end;
        end;
        L := L^.sig;
    end;

    writeln('Prod1: ', prod1);
    writeln('Prod2: ', prod2);
end;

var
    productos : lista;
begin 
    productos := nil;
    agregarProductos(productos);
    writeln(porcentajeProductos(productos):0:2,'%');
    obtenerDescripcion(productos);
    obtenerCodigoProductosEconomicos(productos);
    imprimirProductos(productos);
end.