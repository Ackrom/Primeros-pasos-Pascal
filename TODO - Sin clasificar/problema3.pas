program problema3;
uses
crt;
var
a,b:string[8];
c,d:integer;
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
	
	writeln(d+c);
	writeln(d-c);
	writeln(d*c);
	writeln(d div c);
	writeln(d mod c);
end.
