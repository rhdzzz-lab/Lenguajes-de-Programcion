      PROGRAM FIBONACCI
C     SERIE DE FIBONACCI EN FORTRAN 77 (FORMATO FIJO)
      INTEGER N, I
      INTEGER*8 A, B, C
      CHARACTER*1 PAUSA

      WRITE(*,*) 'Introduce el numero de terminos:'
      READ(*,*) N

      A = 0
      B = 1

      WRITE(*,*) 'Serie de Fibonacci:'
      IF (N .GE. 1) WRITE(*,'(I0,1X)', ADVANCE='NO') A
      IF (N .GE. 2) WRITE(*,'(I0,1X)', ADVANCE='NO') B

      DO 100 I = 3, N
         C = A + B
         WRITE(*,'(I0,1X)', ADVANCE='NO') C
         A = B
         B = C
100   CONTINUE

      WRITE(*,*)  ! salto de linea
      WRITE(*,*) 'Presiona ENTER para salir...'
      READ(*,'(A)') PAUSA

      END

