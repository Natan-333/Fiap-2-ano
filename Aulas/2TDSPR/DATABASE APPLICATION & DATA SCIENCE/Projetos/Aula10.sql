CREATE OR REPLACE FUNCTION soma (p1 IN NUMBER, p2 IN NUMBER)
    RETURN NUMBER
    
    IS
        total NUMBER(4);
    BEGIN
        total := p1 + p2;
    RETURN total;
END;

SELECT soma(1, 1) FROM dual;


SET SERVEROUTPUT ON;


DECLARE
    nota1 NUMBER(3) := 10;
    nota2 nota1%type := 10;
    resul nota1%type;
BEGIN
    resul := soma(nota1, nota2);
    dbms_output.put_line('Resultado: '|| resul);
END;








drop table boletim cascade constraints;

create table Boletim (
    Rm number(3) not null,
    Nome_Comp varchar2(20) not null,
    C_Hora number(3) not null,
    Nota1 number(4,2) not null,
    Nota2 number(4,2) not null,
    Nota3 number(4,2) not null,
    Media number(4,2),
    Faltas number(3) not null,
    Situacao varchar2(40)
);



INSERT ALL
  INTO boletim VALUES (135, 'DB Application', 200, 10, 10, 10, null, 0, null)
  INTO boletim VALUES (135, 'IA', 180, 7.5, 7.5, 8.0, null, 170, null)
  INTO boletim VALUES (135, 'ChatBot', 180, 1.0, 2.5, 1.5, null, 18, null)
  INTO boletim VALUES (135, 'UX', 200, 2.5, 1.0, 1.5, null, 170, null)
  INTO boletim VALUES (135, 'Mobile', 200, 4.0, 5.0, 4.5, null, 20, null)
SELECT * FROM dual;
commit;

-- Fun??o
CREATE OR REPLACE FUNCTION media(n1 IN NUMBER, n2 IN NUMBER, n3 IN NUMBER)
    RETURN NUMBER

    IS
        total NUMBER(4,2);
    BEGIN
        total := (n1 + n2 + n3) / 3;
    RETURN total;
END;

-- Cursor
DECLARE
    CURSOR c_calcula IS SELECT * FROM boletim;
    resultado NUMBER(3,1);
BEGIN
    FOR v_calcula IN c_calcula LOOP
        resultado := media(v_calcula.nota1, v_calcula.nota2, v_calcula.nota3);
        DBMS_OUTPUT.PUT_LINE(resultado);
        UPDATE boletim
        SET Media = resultado
        WHERE nota1 = V_calcula.nota1
          AND nota2 = V_calcula.nota2
          AND nota3 = V_calcula.nota3;
    END LOOP;
END;


SELECT * FROM boletim;
