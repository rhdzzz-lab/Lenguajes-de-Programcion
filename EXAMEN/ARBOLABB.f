      PROGRAM ARBOLABB
C     ARBOL BINARIO DE BUSQUEDA CON ARREGLOS (SIN PUNTEROS) - F77
C     INSERTAR Y RECORRER: PREORDEN, INORDEN, POSTORDEN (ITERATIVOS)
      INTEGER MAXN
      PARAMETER (MAXN=200)
      INTEGER N, I, X, ROOT, SIZE
      INTEGER KEY(MAXN), LFT(MAXN), RGT(MAXN)
      CHARACTER*1 PAUSA

C     INICIALIZAR ESTRUCTURAS
      DO 10 I = 1, MAXN
         KEY(I) = 0
         LFT(I) = 0
         RGT(I) = 0
10    CONTINUE
      ROOT = 0
      SIZE = 0

      WRITE(*,*) 'Cuantos numeros insertar (max 200)?'
      READ(*,*) N
      IF (N .LT. 0) N = 0
      IF (N .GT. MAXN) N = MAXN
      IF (N .GT. 0) WRITE(*,*) 'Introduce ', N, ' numeros:'

      DO 100 I = 1, N
         READ(*,*) X
         CALL INSERT_BST(X, ROOT, SIZE, KEY, LFT, RGT, MAXN)
100   CONTINUE

      WRITE(*,*) '--- PREORDEN ---'
      CALL PREORDER_IT(ROOT, KEY, LFT, RGT)

      WRITE(*,*) '--- INORDEN ----'
      CALL INORDER_IT(ROOT, KEY, LFT, RGT)

      WRITE(*,*) '--- POSTORDEN ---'
      CALL POSTORDER_IT(ROOT, KEY, LFT, RGT)

      WRITE(*,*) 'Presiona ENTER para salir...'
      READ(*,'(A)') PAUSA
      END


C--------------------------------------------------------------
C   INSERT_BST: Insercion iterativa en ABB con indices
C--------------------------------------------------------------
      SUBROUTINE INSERT_BST(X, ROOT, SIZE, KEY, LFT, RGT, MAXN)
      INTEGER X, ROOT, SIZE, MAXN
      INTEGER KEY(*), LFT(*), RGT(*)
      INTEGER CUR, PAR, NEWID

C     ARBOL VACIO
      IF (ROOT .EQ. 0) THEN
         IF (SIZE .GE. MAXN) RETURN
         SIZE = SIZE + 1
         NEWID = SIZE
         KEY(NEWID) = X
         LFT(NEWID) = 0
         RGT(NEWID) = 0
         ROOT = NEWID
         RETURN
      END IF

C     BUSCAR POSICION
      CUR = ROOT
      PAR = 0
200   CONTINUE
      IF (CUR .NE. 0) THEN
         PAR = CUR
         IF (X .LT. KEY(CUR)) THEN
            CUR = LFT(CUR)
         ELSE IF (X .GT. KEY(CUR)) THEN
            CUR = RGT(CUR)
         ELSE
C           DUPLICADO: NO INSERTAR
            RETURN
         END IF
         GOTO 200
      END IF

C     INSERTAR NUEVO NODO
      IF (SIZE .GE. MAXN) RETURN
      SIZE = SIZE + 1
      NEWID = SIZE
      KEY(NEWID) = X
      LFT(NEWID) = 0
      RGT(NEWID) = 0

      IF (X .LT. KEY(PAR)) THEN
         LFT(PAR) = NEWID
      ELSE
         RGT(PAR) = NEWID
      END IF
      RETURN
      END


C--------------------------------------------------------------
C   PREORDER_IT: Preorden iterativo con pila (stack)
C   Algoritmo: push(root); while !empty { n=pop; visit; push(der); push(izq) }
C--------------------------------------------------------------
      SUBROUTINE PREORDER_IT(ROOT, KEY, LFT, RGT)
      INTEGER ROOT, KEY(*), LFT(*), RGT(*)
      INTEGER S(200), TOP, NODE

      IF (ROOT .EQ. 0) RETURN
      TOP = 0
      TOP = TOP + 1
      S(TOP) = ROOT

300   CONTINUE
      IF (TOP .GT. 0) THEN
         NODE = S(TOP)
         TOP = TOP - 1
         WRITE(*,*) KEY(NODE)

         IF (RGT(NODE) .NE. 0) THEN
            TOP = TOP + 1
            S(TOP) = RGT(NODE)
         END IF
         IF (LFT(NODE) .NE. 0) THEN
            TOP = TOP + 1
            S(TOP) = LFT(NODE)
         END IF

         GOTO 300
      END IF
      RETURN
      END


C--------------------------------------------------------------
C   INORDER_IT: Inorden iterativo con pila
C   Algoritmo: while (curr!=0 or !empty) { push izqs; node=pop; visit; curr=der }
C--------------------------------------------------------------
      SUBROUTINE INORDER_IT(ROOT, KEY, LFT, RGT)
      INTEGER ROOT, KEY(*), LFT(*), RGT(*)
      INTEGER S(200), TOP, CUR

      TOP = 0
      CUR = ROOT

400   CONTINUE
      IF (CUR .NE. 0 .OR. TOP .GT. 0) THEN
         IF (CUR .NE. 0) THEN
            TOP = TOP + 1
            S(TOP) = CUR
            CUR = LFT(CUR)
         ELSE
            CUR = S(TOP)
            TOP = TOP - 1
            WRITE(*,*) KEY(CUR)
            CUR = RGT(CUR)
         END IF
         GOTO 400
      END IF
      RETURN
      END


C--------------------------------------------------------------
C   POSTORDER_IT: Postorden iterativo con dos pilas (s1, s2)
C   Algoritmo:
C     push(root en s1);
C     while s1: n=pop(s1); push(n en s2); push(izq en s1); push(der en s1)
C     luego imprimir s2 (pop)
C--------------------------------------------------------------
      SUBROUTINE POSTORDER_IT(ROOT, KEY, LFT, RGT)
      INTEGER ROOT, KEY(*), LFT(*), RGT(*)
      INTEGER S1(200), S2(200), T1, T2, NODE

      IF (ROOT .EQ. 0) RETURN
      T1 = 0
      T2 = 0
      T1 = T1 + 1
      S1(T1) = ROOT

500   CONTINUE
      IF (T1 .GT. 0) THEN
         NODE = S1(T1)
         T1 = T1 - 1

         T2 = T2 + 1
         S2(T2) = NODE

         IF (LFT(NODE) .NE. 0) THEN
            T1 = T1 + 1
            S1(T1) = LFT(NODE)
         END IF
         IF (RGT(NODE) .NE. 0) THEN
            T1 = T1 + 1
            S1(T1) = RGT(NODE)
         END IF

         GOTO 500
      END IF

C     IMPRIMIR EN ORDEN POSTORDEN DESDE S2
510   CONTINUE
      IF (T2 .GT. 0) THEN
         WRITE(*,*) KEY(S2(T2))
         T2 = T2 - 1
         GOTO 510
      END IF
      RETURN
      END

