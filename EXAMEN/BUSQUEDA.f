      PROGRAM BUSQUEDA
      INTEGER N, I, X, POS
      PARAMETER (MAX=100)
      INTEGER A(MAX)
      CHARACTER*1 PAUSA
      INTEGER BINSEARCH

      WRITE(*,*) 'Cuantos numeros (max 100)?'
      READ(*,*) N

      WRITE(*,*) 'Introduce los ', N, ' numeros:'
      DO 10 I = 1, N
         READ(*,*) A(I)
10    CONTINUE

      WRITE(*,*) 'Introduce el numero a buscar:'
      READ(*,*) X

C --- BUSQUEDA LINEAL ---
      POS = -1
      DO 20 I = 1, N
         IF (A(I) .EQ. X) THEN
            POS = I
            GOTO 30
         END IF
20    CONTINUE
30    CONTINUE

      IF (POS .NE. -1) THEN
         WRITE(*,*) 'Lineal: encontrado en la posicion ', POS
      ELSE
         WRITE(*,*) 'Lineal: no encontrado'
      END IF

C --- BUSQUEDA BINARIA (arreglo ordenado) ---
      CALL SORT(A, N)
      POS = BINSEARCH(A, N, X)
      IF (POS .NE. -1) THEN
         WRITE(*,*) 'Binaria: encontrado en la posicion (ordenado)=', POS
      ELSE
         WRITE(*,*) 'Binaria: no encontrado'
      END IF

      WRITE(*,*) 'Presiona ENTER para salir...'
      READ(*,'(A)') PAUSA
      END


      SUBROUTINE SORT(A, N)
      INTEGER N, I, J, TMP
      INTEGER A(*)
      DO 200 I = 1, N-1
         DO 210 J = 1, N-I
            IF (A(J) .GT. A(J+1)) THEN
               TMP = A(J)
               A(J) = A(J+1)
               A(J+1) = TMP
            END IF
210      CONTINUE
200   CONTINUE
      RETURN
      END


      INTEGER FUNCTION BINSEARCH(A, N, X)
      INTEGER A(*), N, X, L, R, M
      L = 1
      R = N
      BINSEARCH = -1
100   IF (L .LE. R) THEN
         M = (L+R)/2
         IF (A(M) .EQ. X) THEN
            BINSEARCH = M
            RETURN
         ELSE IF (X .LT. A(M)) THEN
            R = M - 1
         ELSE
            L = M + 1
         END IF
         GOTO 100
      END IF
      RETURN
      END

