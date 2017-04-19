program INAC;
uses
crt;
type
	datos=record
		codigo:integer;
		nombrev:string;
		agencia:string[2];
		montoC:integer;
		montoT:integer;
	end;
var
pasajero,cajero:text;
cajeros: array [0..9] of datos;
buff,buff2:string;
i,buffe,j:integer;
begin


assign(cajero,'C:\Users\Usuario\Desktop\programacion\TipoExamen2\CAJEROS.TXT');
assign(pasajero,'C:\Users\Usuario\Desktop\programacion\TipoExamen2\CAJEROS.TXT');
reset(cajero);
reset(pasjero);
	for i:=0 to 9 do
	begin
	
	readln(cajero,buff);
		val(buff,buffe,j);
		delete(buff,j,60);
		if i=0 then writeln(buff);
		val(buff,buffe);
		cajeros[i].codigo:=buffe;
	writeln(cajeros[i].codigo);
	end;
	reset(cajero);
	for i:=0 to 9 do
	begin
	readln(cajero,buff);
	buffe:=pos(',',buff);

	buff:=copy(buff,buffe+1,60);
	buffe:=pos(',',buff);
	buff:=copy(buff,1,buffe-1);
		cajeros[i].nombrev:=buff;
	writeln(cajeros[i].nombrev);
	end;
	reset(cajero);
	for i:=0 to 9 do
	begin
	readln(cajero,buff);
	buffe:=pos(',',buff);
	delete(buff,buffe,1);
	buffe:=pos(',',buff);
	buff:=copy(buff,buffe+1,2);
	cajeros[i].agencia:=buff;
	writeln(cajeros[i].agencia);
	end;
	while (not(eof)) do
	begin
	readln(pasajero,buff);
	buff2:=copy(buff,1,1);
	val(buff2,buffe);
	
	end;

	close(pasajero);
	close(cajero);
	
end.
