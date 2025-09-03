program Figuras;
uses crt;
var
  i, j, n: integer;
begin
  clrscr;
  n := 7;

  writeln('Cuadrado:');
  for i := 1 to n do
  begin
    for j := 1 to n do
      write('* ');
    writeln;
  end;

  writeln;
  writeln('Cruz:');
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      if (i = (n div 2)+1) or (j = (n div 2)+1) then
        write('* ')
      else
        write('  ');
    end;
    writeln;
  end;

  readln;
end.
