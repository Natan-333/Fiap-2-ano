SET SERVEROUTPUT ON;

CREATE TABLE funcionario (
    cd_fun NUMBER(2) PRIMARY KEY,
    nm_fun VARCHAR2(20),
    salario NUMBER(10,2),
    dt_adm DATE    
);

BEGIN
    INSERT INTO funcionario (cd_fun, nm_fun, salario, dt_adm) VALUES (1, 'Marcel', 10000, '17-APR-23');
    INSERT INTO funcionario (cd_fun, nm_fun, salario, dt_adm) VALUES (2, 'Claudia', 16000, '02-OCT-23');
    INSERT INTO funcionario (cd_fun, nm_fun, salario, dt_adm) VALUES (3, 'Joaquim', 5500, '10-JUL-23');
    INSERT INTO funcionario (cd_fun, nm_fun, salario, dt_adm) VALUES (4, 'Valéria', 73000, '06-JUN-23');
COMMIT;
END;

DECLARE
    v_cd number(2) := &cd_fun;
    v_nome varchar2(20);
    v_salario number(10,2);
    
begin
    SELECT nm_fun, salario into V_NOME, V_SALARIO FROM funcionario where cd_fun = v_cd;
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || v_salario);
END;


-- Cursor
declare
    cursor c_exibe is select nm_fun, salario from funcionario;
    v_exibe c_exibe%rowtype;
begin
    open c_exibe;
    loop
        fetch c_exibe into v_exibe;
    exit when c_exibe%notfound;
    DBMS_OUTPUT.PUT_LINE('NOME: ' || V_EXIBE.nm_fun ||  ' - Salário: ' || V_EXIBE.salario);
    end loop;
    close c_exibe;
end;

-- CURSOR USANDO FOR
DECLARE 
    cursor c_exibe is select nm_fun, salario from funcionario;
BEGIN
    FOR v_exibe IN c_exibe LOOP
    DBMS_OUTPUT.PUT_LINE('NOME: ' || V_EXIBE.nm_fun ||  ' - Salário: ' || V_EXIBE.salario);
    END LOOP;
END;


DECLARE
    cursor c_exibe is select * from funcionario;
BEGIN
    FOR v_exibe IN c_exibe LOOP
    UPDATE funcionario SET tempo = sysdate - v_exibe.dt_adm WHERE cd_fun = v_exibe.cd_fun;
    END LOOP;
END;
