program lista;
uses 
crt;
type
 tnodo=^nodo;
	nodo=record
		dato:integer;
		sig:tnodo;
		ant:tnodo;
		end;
function cantidad_de_nodos(a:tnodo):integer;
	var
	x:integer;
	begin
	x:=0;
		while a<>nil do
		begin
		x:=x+1;
		a:=a^.sig;
		end;
	cantidad_de_nodos:=x;
	end;
procedure cambio(a:tnodo;c:integer);
	var
	i:integer;
	g:tnodo;
	gg:tnodo;
	begin
	new(g);
	new(gg);
	g:=a;
	gg:=a;
	for i:=1 to c-1 do
	begin
		g:=g^.sig;
		gg:=gg^.sig;
	end;
	g:=g^.ant;
	while g<>nil do
	begin
		gg^.dato:=g^.dato;
		gg:=gg^.ant;
		g:=g^.ant;
	end;
	end;
var
p:tnodo;
x:integer;
inicio:tnodo;
begin
	inicio:=nil;
		for x:=1 to 3 do
			begin
				new(p);
				readln(p^.dato);
				p^.sig:=nil;
				p^.ant:=nil;
				p^.sig:=inicio;
				if x<>1 then
					begin
					inicio^.ant:=p;
					inicio:=p;
					end
					else
				inicio:=p;
			end;
			
			{for x:=1 to 2 do
				begin
				
				p:=p^.sig;
				end;
			}	
			
			writeln(cantidad_de_nodos(inicio));
			writeln(inicio^.dato);
			cambio(inicio,cantidad_de_nodos(inicio));
			writeln(inicio^.dato);	
				while p<>nil do
				begin
				writeln(p^.dato);
				p:=p^.sig;
				end;
end.
