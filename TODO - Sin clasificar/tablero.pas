program tablero;
uses
crt;
var
x,y,i:integer;
begin
	x:=0;
	y:=1;
	for i:=1 to 50 do
		begin
		x:=x+1;
				gotoxy(x,y);writeln(chr(219));
					if x>11 then
						begin
							y:=y+1;
							x:=0;
						end;
				
					
		end;

end.
