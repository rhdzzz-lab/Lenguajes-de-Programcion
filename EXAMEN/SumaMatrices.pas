program SumaMatrices;
uses crt;

const
  MAX = 10;
var
  A, B, C: array[1..MAX,1..MAX] of integer;
  n, m, i, j: integer;

begin
  clrscr;
  write('Introduce numero de filas (max 10): ');
  readln(n);
  write('Introduce numero de columnas (max 10): ');
  readln(m);

  writeln('Introduce los elementos de la matriz A:');
  for i := 1 to n do
    for j := 1 to m do
      readln(A[i,j]);

  writeln('Introduce los elementos de la matriz B:');
  for i := 1 to n do
    for j := 1 to m do
      readln(B[i,j]);

  { suma }
  for i := 1 to n do
    for j := 1 to m do
      C[i,j] := A[i,j] + B[i,j];

  writeln('Resultado (A+B):');
  for i := 1 to n do
  begin
    for j := 1 to m do
      write(C[i,j]:6);
    writeln;
  end;

  writeln('Presiona ENTER para salir...');
  readln;
end.
