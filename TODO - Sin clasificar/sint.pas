program tipo_examen_2;
uses
crt;
type
	datos=record
		ci:string;
		nombre:string;
		agencia:string;
		CT:integer;
		Ctel:integer;
		montoT:word;
		montotel:word;
	end;
var
bufer,bufer2:string;
buf,i:integer;
archivo:text;
data:array[0..10] of datos;
begin
i:=0;
	assign(archivo,'C:\Users\Usuario\Desktop\programacion\TipoExamen2\CAJEROS.TXT');
	reset(archivo);
		while (not(eof(archivo))) do
			begin
				readln(archivo,bufer);
				
					while bufer <> '' do
						begin
							buf:=pos(',',bufer);
							data[i].ci:=copy(bufer,1,buf-1);
							delete(bufer,1,buf);
							buf:=pos(',',bufer);
							data[i].nombre:=copy(bufer,1,buf-1);
							delete(bufer,1,buf);
							data[i].agencia:=bufer;
							delete(bufer,1,length(bufer));
						end;
				i:=i+1;
			end;
	
	assign(archivo,'C:\Users\Usuario\Desktop\programacion\TipoExamen2\PASAJERO.TXT');
	reset(archivo);
			while (not(eof(archivo))) do
			begin
				readln(archivo,bufer);
					while bufer <> '' do
						begin
							buf:=pos(',',bufer);
							bufer2:=copy(bufer,1,buf-1);
							val(bufer2,i);
							delete(bufer,1,buf);
							buf:=pos(',',bufer);
							bufer2:=copy(bufer,1,buf-1);
								if bufer2='C' then
									begin
										data[i].ct:=data[i].ct+1;
										delete(bufer,1,buf);
										buf:=pos(',',bufer);
										delete(bufer,1,buf);
										buf:=pos(',',bufer);
										delete(bufer,1,buf);
										val(bufer,buf);
										data[i].montoT:=data[i].montoT+buf;
										delete(bufer,1,length(bufer));
									end
									else
									begin
										data[i].ctel:=data[i].ctel+1;
										delete(bufer,1,buf);
										buf:=pos(',',bufer);
										delete(bufer,1,buf);
										buf:=pos(',',bufer);
										delete(bufer,1,buf);
										val(bufer,buf);
										data[i].montoTel:=data[i].montoTel+buf;
										delete(bufer,1,length(bufer));
									end;
						end;
				
			end;
	
	for i:=0 to 9 do
		begin
			if 
		end;
end.
