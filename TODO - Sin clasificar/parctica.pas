program desglosar_palabras;
uses
crt;
type 
	procedure desglosador(var a:text;var b:array of string;c:string);
		var
		bufer:string;
		i,numero:integer;
		begin		
			i:=0;
			reset(a);
			while (not(eof(a))) do
				begin
						readln(a,bufer);
					while bufer <> '' do
						begin
							
							numero:=pos(c,bufer);
							if numero <> 0 then
								begin
									b[i]:=copy(bufer,1,numero-1);
									delete(bufer,1,numero);
								end
								else
									begin
										b[i]:=bufer;
										delete(bufer,1,length(bufer));
									end;
							i:=i+1;
						end;
				end;
		end;
	procedure clasificador();
		
var
archivo:text;
buffer:array[1..200] of string;
begin
assign(archivo,'C:\Users\Usuario\Desktop\programacion\TipoExamen2\CAJEROS.TXT');
desglosador(archivo,buffer,',');

readkey;
end.
