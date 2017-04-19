program problema4;
uses
crt;
type
tnodo=^nodo;
nodo=record
	valor:integer;
	sig:tnodo;
	end;
var
a,b:string[8];
c,d:integer;
punt,inicio,fin:tnodo;
ciclo:boolean;
begin
ciclo:=true;
new(punt);
punt^.sig:=nil;
inicio:=punt;
fin:=inicio;
	while ciclo do
	begin
		readln(a);
		b:='';
		while a[1]<>' ' do
			begin
				b:=b+a[1];
				delete(a,1,1);
			end;
		delete(a,1,1);
		val(a,c);
		val(b,d);
		if (c=0)and(d=0) then
		begin
			ciclo:=false;
		end
			else
		begin
			punt^.valor:=c+d;
			new(punt);
			punt^.sig:=nil;
			fin^.sig:=punt;
			fin:=punt;
		end;
	end;
	punt:=inicio;
	while punt^.sig<>nil do
		begin
			writeln(punt^.valor);
			punt:=punt^.sig;
		end;
end.
