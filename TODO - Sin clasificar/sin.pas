program hola;
uses
crt;
type
 tTecla= (enter, esc, arriba, abajo, izquierda, derecha, espacio, nada,S,N,P,F1);
var
i:integer;




Function LeerTecla: tTecla;
{Parecido al readkey, pero devuelve solo un valor que sea de utiidad para el programa (de tipo tTecla)}
Var
    car: char;
Begin
    car:= readkey;
    case car of
        #27: LeerTecla:= esc;
        #13: LeerTecla:= enter;
        's','S': LeerTecla:= S;
        'n','N': LeerTecla:= N;
        'p','P': LeerTecla:= P;
        #32: LeerTecla:= espacio;
        #0: begin
                  car:= readkey; {los casos de teclas de funci¢n}
                  case car of
                      #28: LeerTecla:= enter;
                      #72: LeerTecla:= arriba;
                      #80: LeerTecla:= abajo;
                      #75: LeerTecla:= izquierda;
                      #77: LeerTecla:= derecha;
                      #59: LeerTecla:= F1
                      else
                          LeerTecla:= nada
                  end
              end;
        else
            LeerTecla:= nada
    end
End;


begin
for i:=1 to 10 do
begin
writeln(i);
LeerTecla;
end;
end.
