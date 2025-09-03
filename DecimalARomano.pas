program DecimalARomano;
uses crt;
var
  num: integer;
begin
  clrscr;
  write('Introduce un numero decimal: ');
  readln(num);

  write('En romano es: ');
  while num >= 1000 do begin write('M'); num := num - 1000; end;
  if num >= 900 then begin write('CM'); num := num - 900; end;
  if num >= 500 then begin write('D'); num := num - 500; end;
  if num >= 400 then begin write('CD'); num := num - 400; end;
  while num >= 100 do begin write('C'); num := num - 100; end;
  if num >= 90 then begin write('XC'); num := num - 90; end;
  if num >= 50 then begin write('L'); num := num - 50; end;
  if num >= 40 then begin write('XL'); num := num - 40; end;
  while num >= 10 do begin write('X'); num := num - 10; end;
  if num = 9 then begin write('IX'); num := num - 9; end;
  if num >= 5 then begin write('V'); num := num - 5; end;
  if num = 4 then begin write('IV'); num := num - 4; end;
  while num >= 1 do begin write('I'); num := num - 1; end;

  writeln;
  readln;
end.
