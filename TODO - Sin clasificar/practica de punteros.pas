program practica_de_punteros;
uses
crt;
type
tnodo=^nodo;
nodo=record
	algo:integer;
	sig:tnodo;
	end;

	procedure agregar(var i:tnodo);
	var
	p,aux:tnodo;
	resp:char;
	ciclo:boolean;
begin
	repeat
	new(p);
	read(p^.algo);
	p^.sig:=nil;
	aux:=i;
	ciclo:=true;
	if i=nil then
		begin
		WRITELN('OP0');
		i:=p;
		end
		else
		begin
		WHILE CICLO DO
	BEGIN
		if (aux^.algo<p^.algo) and ciclo then
			begin
				WRITELN('OP1');
				p^.sig:=aux;
				i:=p;
				ciclo:=false;
			end;
		if (aux^.sig=nil) and ciclo then
			begin
				WRITELN('OP2');
				aux^.sig:=p;
				ciclo:=false
			end;
	IF AUX^.SIG<>NIL THEN
	BEGIN
		if (aux^.sig^.algo<p^.algo) and ciclo then
			begin
				WRITELN('OP3');
				p^.sig:=aux^.sig;
				aux^.sig:=p;
				ciclo:=false
			end;
	END;		
		WRITELN(aux^.algo);
		aux:=aux^.sig;
	END;
		end;
	writeln('Decea agregar otro mas?:');
	repeat
	read(resp);
	
	until (resp='S') or (resp='N');
	until resp='N';
end;
var
inicio,p:tnodo;

begin
	inicio:=nil;
	agregar(inicio);
	p:=inicio;
	while p<>nil do
	begin
		writeln(p^.algo);
		p:=p^.sig;
	end;
end.
