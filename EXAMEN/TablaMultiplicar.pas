program TablaMultiplicar;
uses crt;

var
  n, i: integer;

begin
  clrscr;
  write('Introduce un numero: ');
  readln(n);

  writeln('Tabla de multiplicar del ', n);
  for i := 1 to 10 do
    writeln(n, ' x ', i, ' = ', n * i);

  writeln('Presiona ENTER para salir...');
  readln;
end.
