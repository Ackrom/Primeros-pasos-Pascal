program dddd;
uses
crt;
type tnodo=^nodo;
	nodo=record
		x1:integer;
		y1:integer;
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
		gg^.x1:=g^.x1;
		gg^.y1:=g^.y1;
		gg:=gg^.ant;
		g:=g^.ant;
	end;
	end;


var
x:integer;
inicio,p:tnodo;
tecla:char;
pj:string;
begin
x:=3;
tecla:='d';
pj:='@';


inicio:=nil;
		for x:=1 to 25 do
			begin
				new(p);
				p^.x1:=x;
				p^.y1:=1;
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


while tecla <> '' do
	begin
		while (not keypressed) do
			begin
			
				if tecla = 'w' then
					begin
					cambio(inicio,cantidad_de_nodos(inicio));
					p:=inicio;
					p^.y1:=p^.y1-1;
							while p<>nil do
								begin
									gotoxy(p^.x1,p^.y1);writeln(pj);
									p:=p^.sig;
								end;
					delay(250);
					end;
				if tecla = 'a' then
					begin
					cambio(inicio,cantidad_de_nodos(inicio));
					p:=inicio;
					p^.x1:=p^.x1-1;
					while p<>nil do
								begin
									gotoxy(p^.x1,p^.y1);writeln(pj);
									p:=p^.sig;
								end;
					delay(250);
					end;
				if tecla = 's' then
					begin
					cambio(inicio,cantidad_de_nodos(inicio));
					p:=inicio;
					p^.y1:=p^.y1+1;
					while p<>nil do
								begin
									gotoxy(p^.x1,p^.y1);writeln(pj);
									p:=p^.sig;
								end;
					delay(250);
					end;
				if tecla = 'd' then
					begin
					cambio(inicio,cantidad_de_nodos(inicio));
					p:=inicio;
					p^.x1:=p^.x1+1;
					while p<>nil do
								begin
									gotoxy(p^.x1,p^.y1);writeln(pj);
									p:=p^.sig;
								end;
					delay(250);
					end;
				clrscr;
			end;
			repeat
			tecla:=readkey;
			until (tecla='a')or(tecla='s')or(tecla='d')or(tecla='w');
	end;
end.
