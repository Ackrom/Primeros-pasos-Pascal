program factura_V3;
uses
crt;
const
IVA=0.12;
DESCUENTO=0.10;
type
	tDatos=record
		nombre:string;
		ci:integer;
		cantidad:real;
		numero:array[1..20] of integer;
		precio:array [1..20] of real;
end;
var
cant,numeroDeProducto,cliente,prec:tDatos;
i:integer;


procedure recoleccion;
var
continuacion:integer;
siclo:boolean;
begin
i:=0;
siclo:=true;
while siclo=true do
	begin
	i:=i+1;
		writeln('introduzca el numero del producto');
		readln(numeroDeProducto.numero[i]);
		writeln('introduzca la cantidad');
		readln(cant.cantidad);
		writeln('introduzca el precio');
		readln(prec.precio[i]);
		writeln('introducira otro producto?');
		writeln('1/si 0/no');
		repeat
		begin
		readln(continuacion);
		end
		until (continuacion=1)or (continuacion=0);
		
		
		if continuacion=0 then
		siclo:=false;
	end;
end;

begin
recoleccion;
readkey;
end.
