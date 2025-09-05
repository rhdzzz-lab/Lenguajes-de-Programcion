      PROGRAM MAYORYMENOR
C     LEER N NUMEROS Y DETERMINAR EL MAYOR Y EL MENOR (FORTRAN 77)
      INTEGER N, I, NUM
      INTEGER MAX, MIN
      CHARACTER*1 PAUSA

      WRITE(*,*) 'Cuantos numeros quieres ingresar?'
      READ(*,*) N

      IF (N .LE. 0) THEN
         WRITE(*,*) 'Cantidad invalida.'
         STOP
      END IF

      WRITE(*,*) 'Introduce el primer numero:'
      READ(*,*) NUM
      MAX = NUM
      MIN = NUM

      DO 100 I = 2, N
         WRITE(*,*) 'Introduce el numero ', I, ':'
         READ(*,*) NUM
         IF (NUM .GT. MAX) MAX = NUM
         IF (NUM .LT. MIN) MIN = NUM
100   CONTINUE

      WRITE(*,*) 'Mayor = ', MAX
      WRITE(*,*) 'Menor = ', MIN

      WRITE(*,*) 'Presiona ENTER para salir...'
      READ(*,'(A)') PAUSA

      END
