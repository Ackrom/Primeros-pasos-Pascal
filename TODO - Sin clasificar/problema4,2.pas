program problema4;
uses
crt;
var
a,b:string[8];
c,d:integer;
ciclo:boolean;
begin
ciclo:=true;
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
		writeln(c+d);
	end;
end.
