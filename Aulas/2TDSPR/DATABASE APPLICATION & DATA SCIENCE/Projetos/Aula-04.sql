SET SERVEROUTPUT ON

-- Loop
DECLARE  
    V_CONTADOR NUMBER(2) := 1;  
BEGIN  
LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
    V_CONTADOR := V_CONTADOR + 1;
EXIT WHEN V_CONTADOR > 20;  
END LOOP;  
END;

-- While
DECLARE  
    V_CONTADOR NUMBER(2) := 1;  
BEGIN  
WHILE V_CONTADOR <= 20 LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
    V_CONTADOR := V_CONTADOR + 1;
END LOOP;  
END;

-- For
BEGIN  
FOR V_CONTADOR IN 1 .. 20 LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
END LOOP;  
END;


-- For Reverse
BEGIN  
FOR V_CONTADOR IN REVERSE 1 .. 20 LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
END LOOP;  
END;


-- Tabuada LOPP
DECLARE 
    V_TABU NUMBER(3) := &tabuada;
    V_COUNT NUMBER(2) := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(V_TABU || ' x ' || V_COUNT || ' = ' || (V_TABU * V_COUNT));
        V_COUNT := V_COUNT + 1;
        EXIT WHEN V_COUNT > 10;
    END LOOP;
END;


-- Tabuada WHILE
DECLARE 
    V_TABU NUMBER(3) := &tabuada;
    V_COUNT NUMBER(2) := 0;
BEGIN
    WHILE V_COUNT <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_TABU || ' x ' || V_COUNT || ' = ' || (V_TABU * V_COUNT));
        V_COUNT := V_COUNT + 1;
    END LOOP;
END;


-- Tabuada FOR
DECLARE 
    V_TABU NUMBER(3) := &tabuada;
BEGIN
    FOR V_COUNT IN 0..10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_TABU || ' x ' || V_COUNT || ' = ' || (V_TABU * V_COUNT));
    END LOOP;
END;


-- Exercicio 01
DECLARE 
    V_INICIO NUMBER(3) := &numero_inicio;
    V_FINAL NUMBER(3) := &numero_final;
    V_PARES NUMBER(3) := 0;
    V_IMPARES NUMBER(3) := 0;
BEGIN
    FOR V_COUNT IN V_INICIO..V_FINAL LOOP
        IF (MOD(V_COUNT, 2) = 0) THEN
            V_PARES := V_PARES + 1;
        ELSE 
            V_IMPARES := V_IMPARES + 1;
        END IF;
    END LOOP;
    
     DBMS_OUTPUT.PUT_LINE('Números pares: ' || V_PARES);
     DBMS_OUTPUT.PUT_LINE('Números impares: ' || V_IMPARES);
END;