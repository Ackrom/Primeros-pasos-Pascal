program lectura;
uses 
crt;
type
	 datos= record
		codigo:string[3];
		precio:string[5];
end;

var
	gg:text;
	pres:string;
	i,t:integer;
	
begin
assign(gg,'C:\Users\Usuario\Documents\Rockstar Games\Social Club\Profiles\autosignin.dat');
reset(gg);
	for i:=1 to 10 do
		begin
			readln(gg,pres);
			
			writeln(pres);
		end;
close(gg);

	for t:=1 to 80 do
		begin
		gotoxy(t,1);write('x');
		gotoxy(t,3);write('x');
		gotoxy(t,24);write('x');
		end;
	for t:=1 to 24 do
		begin
		gotoxy(1,t);write('x');
		gotoxy(10,t);write('x');
		gotoxy(20,t);write('x');
		gotoxy(30,t);write('x');
		gotoxy(40,t);write('x');
		end;
		readkey;
end.
