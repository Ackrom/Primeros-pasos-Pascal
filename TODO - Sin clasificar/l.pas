program modulo;
uses
crt;
const
SOLUCIONES:array[1..50] of string[1] = ('3','3','4','5','4','5','3','5','3','4','4','2','3','2','5','1','5','2','2','3','4','5','3','3','3','2','5','5','1','2','1','4','1','2','5','5','4','1','5','5','5','3','4','5','3','3','4','4','1','4');
type
estudiantes=record
	ci:string[8];
	nombre:string[150];
	sexo:char;
	fNacimiento:string[11];
	zona:string[150];
	respuestas:array[1..50] of string[1];
	nota:integer;
	codigo:integer;
	admitido:boolean;
	razon:string;
	end;
DPTO=RECORD
		CodDPTO:integer;
		DescDPTO:String[100];
		Escala:integer;
		Capacidad:Integer;
	end;
PERSONA=RECORD
		CEDULA:STRING[8];
		NOMBRE:STRING[50];
		SEXO:CHAR;
		FECHANAC:STRING[10];//DD-MM-AAAA
		ZONA:STRING[35];
		OP1,OP2,OP3:INTEGER;
	end;
listado=record
	ci:string[8];
	nombre:string[150];
	nota:integer;
	razon:string;
	codigo:integer;
	sexo:char;
	end;
personasv2=file of estudiantes;	
departamento=file of DPTO;
personas=file of PERSONA;
listadoG= file of listado;
listadoNoAdmitido= file of listado;
arreglo1=array[0..9] of integer;
arreglo2=array[1..52] of string;
		procedure desglosadorL(var a:string;c:string;var b:arreglo2);
		var
		numero,i:integer;
begin
i:=1;
					while a <> '' do
						begin
							
							numero:=pos(c,a);
							if numero <> 0 then
								begin
									b[i]:=copy(a,1,numero-1);
									delete(a,1,numero);
								end
								else
									begin
										b[i]:=a;
										delete(a,1,length(a));
									end;
							i:=i+1;
						end;
end;

		procedure captura(var a:text;var b:string);
		var
		ciclo:boolean;
		buf:char;
		i:integer;
begin

	ciclo:=true;
	i:=0;
	while ciclo=true do
	begin
		read(a,buf);
		if ( buf in ['0'..'9'] )or (buf=',') then
			begin
				b:=b+buf;
				if buf=',' then
				i:=i+1;
			end;
		if i=51 then
		begin
		read(a,buf);
		b:=b+buf;
		ciclo:=false;
		end;
	end;
	
end;

	function buscar(ci:string):integer;
	var
	archivo:personasv2;
	buf:estudiantes;
	ciclo:boolean;
begin
	assign(archivo,'C:\Users\Usuario\Desktop\TP3\TP1 INTEGRAL\ARCHIVOS\personav2.DAT');
	reset(archivo);
	ciclo:=true;
	while not(eof(archivo)) and ciclo do
		begin
			read(archivo,buf);
				if buf.ci=ci then
					begin
						ciclo:=false;
						buscar:=filepos(archivo)-1;
					end;
		end;
	close(archivo);
end;
	procedure corregir(var buf_pv2:estudiantes;buf_notas:arreglo2);
	var
	I:integer;
begin
	for i:=1 to 50 do
		begin
			buf_pv2.respuestas[i]:=buf_notas[2+i];
			if buf_notas[2+i]=SOLUCIONES[i] then//(correccion)
				begin
					buf_pv2.nota:=buf_pv2.nota+2;
				end;
		end;
end;
	procedure actualizacion(var cap:arreglo1;var esc:arreglo1);
	var
	a:departamento;
	c:personasv2;
	f:personas;
	buf_Pv2:estudiantes;
	buf_P:PERSONA;
	dep:DPTO;
	i:integer;
begin
assign(f,'C:\Users\Usuario\Desktop\TP3\TP1 INTEGRAL\ARCHIVOS\PERSONA.DAT');
assign(c,'C:\Users\Usuario\Desktop\TP3\TP1 INTEGRAL\ARCHIVOS\personav2.DAT');
assign(a,'C:\Users\Usuario\Desktop\TP3\TP1 INTEGRAL\ARCHIVOS\DPTO.DAT');
	reset(f);
	rewrite(c);
	while not(eof(f)) do
			begin
				read(f,buf_P);
				buf_Pv2.ci:=buf_P.CEDULA;
				buf_Pv2.nombre:=buf_P.NOMBRE;
				buf_Pv2.sexo:=buf_P.sexo;
				buf_Pv2.fNacimiento:=buf_P.FECHANAC;
				buf_Pv2.zona:=buf_P.ZONA;
				write(c,buf_Pv2);
			end;
	close(f);
	close(c);
			reset(a);
			i:=0;
		while not(eof(a)) do
			begin			
				read(a,dep);
				cap[i]:=dep.capacidad;
				esc[i]:=dep.escala;
				//esc[i]:=10;
				i:=i+1;
			end;
			close(a);
end;
	procedure clasificar(esc:arreglo1;var cap:arreglo1;buf_pv2:estudiantes;var buf_list:listado;var d:listadoG;var e:listadoNoAdmitido);
begin
if (buf_pv2.nota>= esc[buf_pv2.codigo]) and (cap[buf_pv2.codigo]<>0) then
		
		begin							
				buf_pv2.admitido:=true;
				cap[buf_pv2.codigo]:=cap[buf_pv2.codigo]-1;
				buf_pv2.razon:='Usted fue admitido';
				buf_list.nota:= buf_pv2.nota;
				buf_list.ci:=buf_pv2.ci;
				buf_list.nombre:=buf_pv2.nombre;
				buf_list.razon:=buf_pv2.razon;
				buf_list.codigo:=buf_pv2.codigo;
				buf_list.sexo:=buf_pv2.sexo;
				write(d,buf_list);
		end
		else
		begin
												
				buf_pv2.admitido:=false;
			if(cap[buf_pv2.codigo]=0) then
				buf_pv2.razon:='No hay suficientes cupos';
			if (buf_pv2.nota<= esc[buf_pv2.codigo]) then
				buf_pv2.razon:='Su calificacion no es suficiente para entrar el la carrera';	
				buf_list.nota:= buf_pv2.nota;
				buf_list.ci:=buf_pv2.ci;
				buf_list.nombre:=buf_pv2.nombre;
				buf_list.razon:=buf_pv2.razon;
				buf_list.codigo:=buf_pv2.codigo;
				buf_list.sexo:=buf_pv2.sexo;
				write(e,buf_list);
		end;	
end;
procedure opcion1();
	var
	b:text;
	d:listadoG;
	e:listadoNoAdmitid;
	nots:string;
	buf_notas:arreglo2;
	a:personasv2;
	buf_pv2:estudiantes;
	esc,cap:arreglo1;
	buf_list:listado;
	i:integer;
begin
actualizacion(cap,esc);
assign(d,'');
assign(e,'');
rewrite(d);
rewrite(e);
		for i:=1 to 1816 do
			begin
				captura(b,nots);
				desglosadorL(nots,',',buf_notas);
				seek(a,buscar(buf_notas[1]));
				read(a,buf_pv2);
				corregir(buf_pv2,buf_notas);
				clasificar(esc,cap,buf_pv2,buf_list,d,e);
			end;
close(d);
close(e);
end;
var
a:personasv2;
b:text;
est:estudiantes;
buf:string;
buf_notas:array[1..52] of string;
cap:array[0..9] of integer;
esc:array[0..9] of integer;
begin
	assign(b,'C:\Users\Usuario\Desktop\TP3\TP1 INTEGRAL\ARCHIVOS\EXAMS.TXT');
	reset(b);
	captura(b,buf);
	desglosadorL(buf,',',buf_notas);
	corregir(est,buf_notas);
	writeln(est.nota);
	actualizacion(cap,esc);
	writeln(cap[0]);
	writeln(cap[9]);
	close(b);
end.
