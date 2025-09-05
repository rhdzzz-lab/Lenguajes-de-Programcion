program FactorialPascal;
uses crt;

const
  Base = 10000;            
  ChunkWidth = 4;
  MaxChunks = 5000;        

type
  TBigInt = record
    Len: integer;                    
    D: array[1..MaxChunks] of integer;
  end;

procedure SetBigOne(var A: TBigInt);
var
  I: integer;
begin
  A.Len := 1;
  A.D[1] := 1;
  for I := 2 to MaxChunks do
    A.D[I] := 0;
end;

procedure MulSmall(var A: TBigInt; K: integer; var Ok: boolean);
var
  I: integer;
  Carry, Temp: longint;
begin
  Carry := 0;
  for I := 1 to A.Len do
  begin
    Temp := longint(A.D[I]) * K + Carry;
    A.D[I] := Temp mod Base;
    Carry := Temp div Base;
  end;

  while Carry > 0 do
  begin
    if A.Len = MaxChunks then
    begin
      Ok := false;
      exit;
    end;
    Inc(A.Len);
    A.D[A.Len] := Carry mod Base;
    Carry := Carry div Base;
  end;

  Ok := true;
end;

procedure PrintBig(const A: TBigInt);
var
  I: integer;
  S: string;
begin
  write(A.D[A.Len]);  
  for I := A.Len - 1 downto 1 do
  begin
    Str(A.D[I], S);
    while Length(S) < ChunkWidth do
      S := '0' + S;  
    write(S);
  end;
  writeln;
end;

var
  Numero, I: integer;
  Big: TBigInt;
  Ok: boolean;

begin
  clrscr;
  write('Introduce un numero: ');
  readln(Numero);

  if Numero < 0 then
  begin
    writeln('Error: n debe ser >= 0.');
  end
  else
  begin
    SetBigOne(Big);
    for I := 2 to Numero do
    begin
      MulSmall(Big, I, Ok);
      if not Ok then
      begin
        writeln('El resultado excede la capacidad interna (', MaxChunks * ChunkWidth, ' digitos aproximados).');
        break;
      end;
    end;

    write(Numero, '! = ');
    PrintBig(Big);
  end;

  writeln;
  writeln('Presiona ENTER para salir...');
  readln;
end.
