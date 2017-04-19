PROGRAM factura_nueva;
uses crt;
VAR
	CODE, LINEA, Nproducto, x,CANTIDAD: integer;
	PRECIOB, SUBT, TOTALF, IVA, DESCUENTO: real;
	RESPUESTA: char;
CONST
	IVA1 = 0.12;
	DESCUENTO1= 0.10;
	VALOR =205;
	VALOR2 =205;
BEGIN
	//HORIZONTAL
	for x:=2 to 50 do
	begin
	gotoxy (x, 1); WRITELN (chr(205));
	gotoxy (x, 4); WRITELN (chr(205));
	gotoxy (x,10); WRITELN (chr(205));
	end;
	//VERTICAL
	for x:=1 to 20 do
	begin
	gotoxy (1  ,x); WRITELN (chr(205));
	gotoxy (15 ,x); WRITELN (chr(205));
	gotoxy (30 ,x); WRITELN (chr(205));
	gotoxy (45 ,x); WRITELN (chr(205));
	gotoxy (60 ,x); WRITELN (chr(205));
	gotoxy (75 ,x); WRITELN (chr(205));
	gotoxy (90 ,x); WRITELN (chr(205));
	gotoxy (105,x); WRITELN (chr(205));
	end;
	//BARRA DE INFORMACION
	gotoxy (2,1); WRITELN ('numero del');
	gotoxy (2,2); WRITELN ('producto');
	gotoxy (14,1); WRITELN ('precio');
	gotoxy (14,2); WRITELN ('base');
	gotoxy (22,1); WRITELN ('cantidad del');
	gotoxy (22,2); WRITELN ('producto');
	gotoxy (37,1); WRITELN ('IVA 12 %');
	gotoxy (47,1); WRITELN ('SUBtotal');
	gotoxy (57,1); WRITELN ('descuento');
	gotoxy (67,1); WRITELN ('Total a pagar:');
	
	//LECTURAS
	RESPUESTA:= 'S';
	LINEA:=4;
	while (RESPUESTA<> 'N') do 
	begin
	gotoxy ( 3,LINEA); READLN (Nproducto); 
	gotoxy (15,LINEA); READLN (PRECIOB); 
	gotoxy (25,LINEA); READLN (CANTIDAD); 
	{gotoxy (39,LINEA); READLN (IVA);} 
	gotoxy (49,LINEA); READLN (SUBT); 
	gotoxy (61,LINEA); READLN (DESCUENTO); 
	gotoxy (68,10); READLN (TOTALF); 
	LINEA:= LINEA+1;
	gotoxy(2,23); WRITELN('DESEA AGREGAR OTRO PRODUCTO(S/N):');	
	RESPUESTA:=UPCASE(READKEY);	
	end;
	
END.
