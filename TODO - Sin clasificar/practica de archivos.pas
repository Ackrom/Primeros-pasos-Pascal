program practica;
uses 
crt;
var
archivo1:text;
ho,la:integer;
i:integer;
begin
assign(archivo1,'C:\Users\Usuario\Desktop\programacion\prueba.txt');
rewrite(archivo1);
for i:=1 to 10 do
begin
la:=random(1000);
ho:=random(1000);
write(archivo1,ho:3,'  ',la:3);
writeln(archivo1);
end;
close(archivo1);

end.
