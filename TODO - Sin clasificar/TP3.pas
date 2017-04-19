program tp3;
uses 
crt;
type
dato=record
	nombre:string[10];
	ci:integer;
	all:real;
	end;
var
algo: file of dato;
i:integer;
g:dato;
begin
assign(algo,'algo.dat');
rewrite(algo);
for i:=1 to 10 do
begin
g.ci:=i;
write(algo,g);
end;
seek(algo,9);
read(algo,g);
writeln(g.ci);
close(algo);
end.
