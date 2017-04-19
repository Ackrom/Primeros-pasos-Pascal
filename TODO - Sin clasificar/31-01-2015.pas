program ETENB;
uses
crt;
type
datos=record
	cantidadPTQ:word;
	cantidadPTF:word;
	montoTotalPTQ:Longword;
	montoTotalPTF:Longword;
	codigo:string[5];
	nombre:string[100];
	agencia:string[2];
	end;
bufer=array[1..5] of string;
vendedores=array[0..9] of datos;
	
	
	function capturarL(var a:text):string;
begin
	readln(a,capturarL);
end;
	
	
	procedure desglosar(a:string;var b:bufer);
	var
	i:integer;
begin
	for i:=1 to 5 do
		begin
			b[i]:='';
		end;
i:=1;
	while a<>'' do
		begin
			if a[1]<>','then
					begin
						b[i]:=b[i]+a[1];
						delete(a,1,1);
					end
				else
					begin
						delete(a,1,1);
						i:=i+1;
					end;
		end;
end;

	procedure ordenarDV(var b:vendedores;var c:text);//c=vendedores
	var
	buf:bufer;
	i:byte;
begin
reset(c);
i:=0;
	while not(eof(c)) do
		begin
			desglosar(capturarL(c),buf);
			b[i].cantidadPTQ:=0;
			b[i].cantidadPTF:=0;
			b[i].codigo:=buf[1];
			b[i].nombre:=buf[2];
			b[i].agencia:=buf[3];
			i:=i+1;
		end;
close(c);
end;
	procedure ordenarDC(var b:vendedores;var c:text);
	var
	buf:bufer;
	i:byte;
	bufent:Longword;
begin
	reset(c);
		while not(eof(c)) do
			begin
				desglosar(capturarL(c),buf);
				val(buf[1],i);
				val(buf[5],bufent);
					if buf[2]='T' then
							begin
								b[i].montoTotalPTF:=b[i].montoTotalPTF+bufent;
								b[i].cantidadPTF:=b[i].cantidadPTF+1;
							end
						else
							begin
								b[i].montoTotalPTQ:=b[i].montoTotalPTQ+bufent;
								b[i].cantidadPTQ:=b[i].cantidadPTQ+1;
							end;
			end;
	close(c)
end;
	procedure MayorNTTF(a:vendedores);
	var
	i:byte;
	mayor:word;
	vend:byte;
begin
	mayor:=a[0].cantidadPTF;
	for i:=0 to 9 do
		begin
		if a[i].cantidadPTF>mayor then
			begin
				vend:=i;
				mayor:=a[i].cantidadPTF;
			end;
		end;
	Writeln('El vendedor con el mayor numero de transacciones via telefonica es:');
	writeln(a[vend].nombre,' con ',mayor,' transacciones');
end;
	procedure MayorMDV(a:vendedores);
	var
	i:byte;
	mayor:Longword;
	vend:byte;
begin
mayor:=a[0].montoTotalPTQ;
	for i:=0 to 9 do
		begin
		if a[i].montoTotalPTQ>mayor then
			begin
				vend:=i;
				mayor:=a[i].montoTotalPTQ;
			end;
		end;
	writeln('El vendedor con el mayor numero de ventas por taquilla es:');
	writeln(a[vend].nombre,' con ',mayor);
end;
var
vendedor:text;
transaccion:text;
v:vendedores;
i:integer;
begin
assign(vendedor,'C:\Users\Usuario\Desktop\resp pend\TipoExamen2\CAJEROS.TXT');
assign(transaccion,'C:\Users\Usuario\Desktop\resp pend\TipoExamen2\PASAJERO.TXT');
ordenarDV(v,vendedor);
ordenarDC(v,transaccion);
MayorNTTF(v);
MayorMDV(v);

end.
