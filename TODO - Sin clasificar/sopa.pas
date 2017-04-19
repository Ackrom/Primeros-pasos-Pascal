program sopa;
uses
crt;
type
	con=record
		letra:string;
		exist:boolean;
		end;
var
letras_de_la_sopa: array[1..20,1..25] of char;
posicion:array[0..21,0..26] of con;
tt:text;
i,j,k:integer;
g:char;
palabra,letrabuff:string;
begin
Writeln('Introduzca la palabra que decea buscar');
readln(palabra);
palabra:=upcase(palabra);
clrscr;
assign(tt,'C:\Users\Usuario\Desktop\programacion\Archivo de Texto\SOPA.TXT');
reset(tt);
	for j:=1 to 20 do
		begin
			for i:=1 to 25 do
				begin
				if (i=1)and (j<>1) then
					begin	
						for k:=1 to 3 do
						begin
						read(tt,g);
						end;
					end
					else
					read(tt,g);
				letras_de_la_sopa[j,i]:=g;
				//gotoxy(i,j);writeln(letras_de_la_sopa[j,i]);
				end;
		end;
		for k:=1 to length(palabra) do
			begin
			letrabuff:=copy(palabra,k,1);
				for j:=1 to 20 do
				begin
					for i:=1 to 25 do
						begin
							if letrabuff=letras_de_la_sopa[j,i] then
								begin
								posicion[j,i].exist:=true;
								posicion[j,i].letra:=letrabuff;
								end;
								gotoxy(i,j);writeln(posicion[j,i].letra);
						end;
					end;
			end;
		
end.
