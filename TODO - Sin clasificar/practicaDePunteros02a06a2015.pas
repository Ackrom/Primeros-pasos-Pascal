program punteros;
uses
crt;
type
nodo=^tnodo;
tnodo=record
	algo:integer;
	sig:nodo;
	end;
procedure incertarNodo(var i:nodo);
	var
	nuevo:nodo;
	begin
		new(nuevo);
		nuevo^.sig:=nil;
		read(nuevo^.algo);
		i^.sig:=nuevo;
		i:=nuevo;
	end;
procedure recorrer(inicio:nodo);
	var
	i:integer;
	begin
		for i:=1 to 3 do 
			begin
				writeln(inicio^.algo);
				inicio:=inicio^.sig;
			end;
	end;
var
ini,rec:nodo;
begin
new(rec);
rec^.algo:=32;
ini:=rec;
incertarNodo(rec);
incertarNodo(rec);
recorrer(ini);
recorrer(ini);
readkey;
end.
