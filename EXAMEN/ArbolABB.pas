program ArbolABB;
uses crt;

type
  PNodo = ^TNodo;
  TNodo = record
    key : integer;
    izq : PNodo;
    der : PNodo;
  end;

procedure Insertar(var r: PNodo; x: integer);
begin
  if r = nil then
  begin
    new(r);
    r^.key := x; r^.izq := nil; r^.der := nil;
  end
  else if x < r^.key then
    Insertar(r^.izq, x)
  else if x > r^.key then
    Insertar(r^.der, x)
  else
    { duplicado: ignorar };
end;

procedure Preorden(r: PNodo);
begin
  if r = nil then exit;
  write(r^.key, ' ');
  Preorden(r^.izq);
  Preorden(r^.der);
end;

procedure Inorden(r: PNodo);
begin
  if r = nil then exit;
  Inorden(r^.izq);
  write(r^.key, ' ');
  Inorden(r^.der);
end;

procedure Postorden(r: PNodo);
begin
  if r = nil then exit;
  Postorden(r^.izq);
  Postorden(r^.der);
  write(r^.key, ' ');
end;

var
  n, i, x: integer;
  raiz: PNodo;

begin
  clrscr;
  raiz := nil;
  write('Cuantos numeros insertar? ');
  readln(n);
  writeln('Introduce ', n, ' numeros:');
  for i := 1 to n do
  begin
    readln(x);
    Insertar(raiz, x);
  end;

  writeln('Preorden:');   Preorden(raiz);   writeln;
  writeln('Inorden:');    Inorden(raiz);    writeln;
  writeln('Postorden:');  Postorden(raiz);  writeln;

  writeln('Presiona ENTER para salir...');
  readln;
end.
