program MayorMenor;
uses crt;

var
  n, i, num, mayor, menor: integer;

begin
  clrscr;
  write('Cuantos numeros quieres ingresar? ');
  readln(n);

  if n <= 0 then
  begin
    writeln('Cantidad invalida.');
    readln;
    halt;
  end;

  write('Introduce el numero 1: ');
  readln(num);
  mayor := num;
  menor := num;

  for i := 2 to n do
  begin
    write('Introduce el numero ', i, ': ');
    readln(num);
    if num > mayor then
      mayor := num;
    if num < menor then
      menor := num;
  end;

  writeln('Mayor = ', mayor);
  writeln('Menor = ', menor);

  writeln('Presiona ENTER para salir...');
  readln;
end.
