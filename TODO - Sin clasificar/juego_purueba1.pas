program prueba_de_juego;
uses
crt;
procedure movimientoDeLaNave;
var
mn:char;
begin

	  repeat
	  mn:=readkey;
	   case mn of
		'a','A':begin writeln('izquierda'); readkey;end;
		's','S':begin writeln('abajo'); readkey;end;
		'w','W':begin writeln('arriba'); readkey;end;
		'd','D':begin writeln('derecha'); readkey;end;
	  end;
	  until mn='ESC';
end;
var
tc,mn:char;
begin
  repeat
	  mn:=readkey;
	   case mn of
		'a','A':begin writeln('izquierda'); readkey;end;
		's','S':begin writeln('abajo'); readkey;end;
		'w','W':begin writeln('arriba'); readkey;end;
		'd','D':begin writeln('derecha'); readkey;end;
	  end;
	  until mn='ESC';


end.
