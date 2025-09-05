      PROGRAM TABLAMULTIPLICAR
C     TABLA DE MULTIPLICAR EN FORTRAN 77 (FORMATO FIJO .F)
      INTEGER N, I
      CHARACTER*1 PAUSA

      WRITE(*,*) 'Introduce un numero:'
      READ(*,*) N

      WRITE(*,*) 'Tabla de multiplicar del ', N

      DO 100 I = 1, 10
         WRITE(*,'(I3, A, I2, A, I5)') N, ' x ', I, ' = ', N*I
100   CONTINUE

      WRITE(*,*) 'Presiona ENTER para salir...'
      READ(*,'(A)') PAUSA
      END

