program problema;
uses 
crt;
var
a:string;
b,c:integer;
begin
	readln(a);
	b:=pos(' ',a);
	delete(a,b,1);
	val(a,c);
	writeln((c div trunc(exp(((length(a)+1)-b)*ln(10))))+(c mod trunc(exp(((length(a)+1)-b)*ln(10)))));
end.
