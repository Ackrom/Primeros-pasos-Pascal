program ggg;
uses 
crt;
var
mac:string;
don:integer;
al:integer;
begin
mac:='123..4';
delete(mac,4,1);
writeln(mac);
val(mac,don,al);
writeln(al);
end.
