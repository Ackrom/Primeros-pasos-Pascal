program beta;
uses 
crt;
var
GG,ggg:integer;
control:boolean;
		procedure nave(x:integer);
		begin
		gotoxy(x+33,21);writeln('A');
		gotoxy(x+32,22);writeln('A=A');
		gotoxy(x+31,23);writeln('A===A');
		gotoxy(x+30,24);writeln('A!!!!!A');
		end;



		function tecla:integer;
		var
		tcla:char;
		begin
		tcla:=readkey;
		case tcla of
		 'A','a':tecla:=-1;
		 'D','d':tecla:=1;
		 'p','P':tecla:=3;
		 else
		  tecla:=0;
		end;

		end;


begin
control:=true;
gg:=0;

while control=true do
	begin
	nave(gg);
	ggg:=tecla;
	if ggg=3 then
	control:=false
	else
	
	
	gg:=ggg+gg;
	if gg=-30 then
	gg:=gg+1;
	
	if gg=44 then
	gg:=gg-1;
	clrscr;
	end;
	
end.
