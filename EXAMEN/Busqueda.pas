program Busqueda;
uses crt;

const
  MAX = 100;
var
  A: array[1..MAX] of integer;
  N, I, X, Pos: integer;

function BusquedaLineal(X: integer; N: integer): integer;
var i: integer;
begin
  for i := 1 to N do
    if A[i] = X then
    begin
      BusquedaLineal := i;
      exit;
    end;
  BusquedaLineal := -1;
end;

procedure OrdenarBurbuja(N: integer);
var i, j, tmp: integer;
begin
  for i := 1 to N-1 do
    for j := 1 to N-i do
      if A[j] > A[j+1] then
      begin
        tmp := A[j];
        A[j] := A[j+1];
        A[j+1] := tmp;
      end;
end;

function BusquedaBinaria(X: integer; N: integer): integer;
var L, R, M: integer;
begin
  L := 1; R := N;
  BusquedaBinaria := -1;
  while L <= R do
  begin
    M := (L+R) div 2;
    if A[M] = X then
    begin
      BusquedaBinaria := M;
      exit;
    end
    else if X < A[M] then
      R := M - 1
    else
      L := M + 1;
  end;
end;

begin
  clrscr;
  write('Cuantos numeros (max 100)? ');
  readln(N);

  writeln('Introduce los ', N, ' numeros:');
  for I := 1 to N do
    readln(A[I]);

  write('Numero a buscar: ');
  readln(X);

  Pos := BusquedaLineal(X, N);
  if Pos <> -1 then
    writeln('Lineal: encontrado en la posicion ', Pos)
  else
    writeln('Lineal: no encontrado');

  OrdenarBurbuja(N);
  Pos := BusquedaBinaria(X, N);
  if Pos <> -1 then
    writeln('Binaria: encontrado en la posicion (ordenado)=', Pos)
  else
    writeln('Binaria: no encontrado');

  writeln('Presiona ENTER para salir...');
  readln;
end.
