        PROGRAM UVA_PRODUCTOR
      IMPLICIT NONE
C --- Declaración de variables
      CHARACTER*1 TIPO
      INTEGER TAM
      REAL PRECIO_INICIAL, PRECIO_FINAL, KILOS, AJUSTE

C --- Entrada de datos
      PRINT *, 'Precio inicial por kilo (ej. 2.50):'
      READ *, PRECIO_INICIAL

      PRINT *, 'Tipo de uva (A o B):'
      READ *, TIPO

C --- Convertir a mayúscula si viene en minúscula (ASCII)
      IF (ICHAR(TIPO) .GE. ICHAR('a') .AND.
     &    ICHAR(TIPO) .LE. ICHAR('z')) THEN
         TIPO = CHAR(ICHAR(TIPO) - 32)
      ENDIF

      PRINT *, 'Tamaño de uva (1 o 2):'
      READ *, TAM

      PRINT *, 'Kilos entregados:'
      READ *, KILOS

C --- Validaciones
      IF ((TIPO .NE. 'A' .AND. TIPO .NE. 'B') .OR.
     &    (TAM .NE. 1 .AND. TAM .NE. 2) .OR.
     &    PRECIO_INICIAL .LT. 0.0 .OR. KILOS .LT. 0.0) THEN
         PRINT *, 'Error: datos invalidos.'
         PRINT *, 'Presione ENTER para salir...'
         READ(*,*)
         STOP
      ENDIF

C --- Ajuste de precio
      IF (TIPO .EQ. 'A') THEN
         IF (TAM .EQ. 1) THEN
            AJUSTE = 0.20
         ELSE
            AJUSTE = 0.30
         ENDIF
      ELSE IF (TIPO .EQ. 'B') THEN
         IF (TAM .EQ. 1) THEN
            AJUSTE = -0.30
         ELSE
            AJUSTE = -0.50
         ENDIF
      ENDIF

C --- Cálculos finales
      PRECIO_FINAL = PRECIO_INICIAL + AJUSTE

C --- Salida de resultados
      PRINT *
      PRINT '(A, F8.2)', 'Precio final por kilo: $', PRECIO_FINAL
      PRINT '(A, F10.2)', 'Total a recibir:      $', PRECIO_FINAL*KILOS

C --- Pausa antes de salir
      PRINT *
      PRINT *, 'Presione ENTER para salir...'
      READ(*,*)

      END PROGRAM UVA_PRODUCTOR


