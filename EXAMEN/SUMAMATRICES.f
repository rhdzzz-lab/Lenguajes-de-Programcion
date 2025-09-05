      PROGRAM SUMAMATRICES
C     SUMA DE DOS MATRICES EN FORTRAN 77 (FORMATO FIJO)
      INTEGER N, M, I, J
      PARAMETER (MAX=10)
      INTEGER A(MAX,MAX), B(MAX,MAX), C(MAX,MAX)
      CHARACTER*1 PAUSA

      WRITE(*,*) 'Introduce el numero de filas (max 10):'
      READ(*,*) N
      WRITE(*,*) 'Introduce el numero de columnas (max 10):'
      READ(*,*) M

      WRITE(*,*) 'Introduce los elementos de la matriz A:'
      DO 100 I = 1, N
         DO 110 J = 1, M
            READ(*,*) A(I,J)
110      CONTINUE
100   CONTINUE

      WRITE(*,*) 'Introduce los elementos de la matriz B:'
      DO 120 I = 1, N
         DO 130 J = 1, M
            READ(*,*) B(I,J)
130      CONTINUE
120   CONTINUE

C --- SUMA ---
      DO 140 I = 1, N
         DO 150 J = 1, M
            C(I,J) = A(I,J) + B(I,J)
150      CONTINUE
140   CONTINUE

      WRITE(*,*) 'Resultado (A+B):'
      DO 160 I = 1, N
         WRITE(*,1000) (C(I,J), J=1,M)
160   CONTINUE

1000  FORMAT(10(I6,1X))

      WRITE(*,*) 'Presiona ENTER para salir...'
      READ(*,'(A)') PAUSA
      END

