program tarea;
uses
crt;
type
 datos=record
	agencia:string[2];
	Ci:string[12];
	nombre:string;
	cvptaquilla:integer;
	cvptelefono:integer;
	mttaq:word;
	mttel:word;
end;
var
dat:array[0..9] of datos;
operador,trans:text;
buffer:string;
bufer:integer;

i:integer;
begin
assign(operador,'C:\Users\Usuario\Desktop\programacion\TipoExamen2\CAJEROS.TXT');
assign(trans,'C:\Users\Usuario\Desktop\programacion\TipoExamen2\PASAJERO.TXt');
reset(operador);
		for i:=0 to 9 do
			begin
				readln(operador,buffer);
				bufer:=pos(',',buffer);
				dat[i].ci:=copy(buffer,1,bufer-1);
				delete(buffer,1,bufer);
				bufer:=pos(',',buffer);
				dat[i].nombre:=copy(buffer,1,bufer-1);
				delete(buffer,1,bufer);
				
			end;
close(operador);
end.
