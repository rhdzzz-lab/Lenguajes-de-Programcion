      PROGRAM FACTORIALFORTRAN

      INTEGER N, I
      INTEGER*8 FACT
      CHARACTER*1 PAUSA

      WRITE(*,*) 'Introduce un numero:'
      READ(*,*) N

      FACT = 1
      DO 100 I = 2, N
         FACT = FACT * I
100   CONTINUE

      WRITE(*,*) 'Factorial:', FACT

      WRITE(*,*) 'Presiona ENTER para salir...'
      READ(*,'(A)') PAUSA

      END

