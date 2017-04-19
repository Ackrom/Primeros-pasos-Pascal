program calendario;
uses
crt;
var
nombre:string;
centrado,i:integer;
begin
cursoroff;
clrscr;
	Writeln('introduzca el nombre');
	readln(nombre);
	clrscr;
	centrado:=length(nombre) div 2;
			if (length(nombre) mod 2)>0 then
			centrado:=centrado+ 1;
textbackground(blue);
clrscr;
		window(38-centrado,10,42+centrado,15);
		textbackground(11);
		clrscr;
	
		
	for i:=1 to 5+centrado*2 do
	begin
	gotoxy(i,1);write('*');
	gotoxy(i,5);write('*');
	end;
	for i:=1 to 3 do
	begin
	gotoxy(1,i+1);write('*');
	gotoxy(5+centrado*2,i+1);write('*');
	end;
	gotoxy(3,3);write(nombre);
	


readkey;
end.
