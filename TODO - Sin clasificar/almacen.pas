program almacen;
uses 
crt;
type

	tipo_de_dato =record
			codigo:string[5];
			nombre:string[20];
			precio:real;
			existencia:integer;
		end;
	procedure menup(var a:integer);
		var
		tecla:char;
		posicion:integer;
		ciclo:boolean;
		begin
		ciclo:=true;
		posicion:=1;
		window(1,1,80,25);
		textbackground(blue);
		clrscr;
		window(30,5,49,14);
		textbackground(cyan);
		clrscr;
		while(ciclo=true)do
			begin
			clrscr;
		gotoxy(1,4+posicion);write('>>>');
		gotoxy(18,4+posicion);write('<<<');
		gotoxy(1,1);write('Almacen El Emperador');
		gotoxy(8,5);write('Agregar');
		gotoxy(7,6);write('Eliminar');
		gotoxy(4,7);write('Modificaciones');
		gotoxy(7,8);write('Recuperar');
		gotoxy(7,9);write('Consumos');
		
					repeat
						begin
						tecla:=readkey;
						end
					until (tecla=#28)or(tecla=#72)or(tecla=#80)or(tecla=#27);
			if tecla=#80then
				posicion:=posicion+1;
			if tecla=#72then
				posicion:=posicion-1;
			if tecla=#27then
				begin
				ciclo:=false;
				posicion:=0;
				end;
			if posicion=6 then
				posicion:=1;
			if posicion=0then
				posicion:=5;
			
			end;
			a:=posicion;
		end;
		procedure agregar(var a:array of tipo_de_dato);
			begin
			window(1,1,80,25);
		textbackground(blue);
		clrscr;
			window(2,2,79,24);
		textbackground(cyan);
		clrscr;
		gotoxy(1,1);write('Codigo');
		gotoxy(20,1);write('nombre');
		gotoxy(40,1);write('Precio');
		gotoxy(60,1);write('Existencia');
			end;
			var
			pos:integer;
			datos:array[1..20] of tipo_de_dato;
	begin
	cursoroff;
	menup(pos);
	agregar(datos);
	readkey;
	end.
