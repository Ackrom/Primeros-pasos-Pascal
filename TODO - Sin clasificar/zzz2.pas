program arrays;
uses
crt;
const
c=100;
var
nump,cantidad,preb: array[1..c] of integer;
des:array[1..100] of real;
esp: array[0..10] of string[11];
x,z,y,dd,sf1,sf2,i,sf3,sf4,sf5,sf6,con:integer;
cp:integer;
total,iva,precio:real;
f1,f2,f3,f4,f5,f6:string;

begin
cp:=0;
precio:=0;
x:=0;
con:=1;
//=========================================BLOQUE 1=================================
//================================Recolección de información========================
//En esta parte del código se recolecta toda la información que tiene que introducir el usuario.
			while(con=1) do
			begin
			x:=x+1;
			z:=1;
			dd:=0;
			  writeln('Numero del producto:');
			  readln(nump[x]);
//Algoritmo usado para evitar que se repitan dos números de producto 
//===============================================================================					
				while z<x do
					begin
					dd:=0;
					for i:=1 to x-1 do
					begin
					if nump[i]=nump[x] then
						begin
						dd:=1;
						repeat
						writeln('El numero de producto que introdujo ya existe');
						readln(nump[x])
						until nump[i]<>nump[x];
						end;
					end;
					if dd=0 then
					break
					end;
			  writeln('Cantidad:');
			  readln(cantidad[x]);
			  writeln('Precio:');
			  readln(preb[x]);
//=====================================DESCUENTO=================================
							if cantidad[x]>=12 then
								des[x]:=(preb[x]*12)/100;
//===============================================================================


//Se le pregunta al usuario si va a introducir otro producto(si=1 no=0) en el caso de que 
//por error introduzca un número distinto de 1 o 0 se le repite la pregunta. 				
				writeln('¿va a introducir otro producto? si=1 no=0');
				readln(con);
			if ((not(con=0)) and (not(con=1)))theN
			  while((not(con=0)) and (not(con=1)))do
			  begin
			if ((not(con=0)) and (not(con=1)))then
			  writeln('SI=1 NO=0');
			  readln(con)
			end;			
end;
//================================================================================
//======================================BLAOQUE 2=================================
//Esta sección del código tiene como objetivo realizar las operaciones matemáticas.
while(z<=x)do
  begin
  precio:=precio+(preb[z]-des[z]);
  cp:=cp+cantidad[z];
  z:=z+1;
  end;
	iva:=((precio)*12)/100;
	total:=(precio+iva);

//===============================================================================
//====================================BLOQUE 3===================================
//En este bloque se procede a realizar el cuadro de la factura y a mostrar por 
//pantalla la misma con todos los datos que se piden.

esp[0]:='';
esp[1]:=' ';
esp[2]:='  ';
esp[3]:='   ';
esp[4]:='    ';
esp[5]:='     ';
esp[6]:='      ';
esp[7]:='       ';
esp[8]:='        ';
esp[9]:='         ';
esp[10]:='          ';

writeln('-------------------------------------------------------------------');
writeln('|N  produc.|Prec. unit|Cant.     |I.V.A.    |Descunt.  |Total.    |');
writeln('|----------|----------|----------|----------|----------|----------|');
y:=1;
while(y<=x)do
begin
Str(nump[y],f1);
Str(preb[y],f2);
Str(cantidad[y],f3);
Str(iva:5:2,f4);
Str(des[y]:5:2,f5);
Str(total:5:2,f6);

sf1:=10-length(f1);
sf2:=10-length(f2);
sf3:=10-length(f3);
sf4:=10-length(f4);
sf5:=10-length(f5);
sf6:=10-length(f6);
writeln('|',nump[y],esp[sf1],'|',preb[y],esp[sf2],'|',cantidad[y],esp[sf3],'|',esp[10],'|',des[y]:5:2,esp[sf5],'|',esp[10],'|');
y:=y+1;
end;
writeln('|-----------------------------------------------------------------|');
writeln('|',esp[10],'|',esp[10],'|',esp[10],'|',f4,esp[sf4],'|',esp[10],'|',f6,esp[sf6],'|');
writeln('|-----------------------------------------------------------------|');
readkey;
end.
