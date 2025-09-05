program FibonacciPascal;
uses crt;

var
  n, i: integer;
  a, b, c: longint;

begin
  clrscr;
  write('Introduce el numero de terminos: ');
  readln(n);

  a := 0;
  b := 1;

  writeln('Serie de Fibonacci:');
  write(a, ' ');
  if n > 1 then
    write(b, ' ');

  for i := 3 to n do
  begin
    c := a + b;
    write(c, ' ');
    a := b;
    b := c;
  end;

  writeln;
  writeln('Presiona ENTER para salir...');
  readln;
end.
