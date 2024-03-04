/* 
bloco pl insert,update delete não se esqueça da exception p/ pk
*/

set serveroutput on;

create table vendedor(
    id_vendedor number(4) primary key,
    nm_vendedor varchar(30) unique not null,
    sl_vendedor number(10,2)
);

create table venda(
    nr_venda number(4) primary key,
    dt_venda date not null,
    tt_venda number(10,2) not null,
    fk_vendedor references vendedor not null
);

create table produto(
    cd_produto number(4) primary key,
    ds_produto varchar(30) not null unique,
    pr_unit number(10,2),
    estoque number(10,2)
);

create table item_venda(
    fk_produto references produto not null,
    fk_venda references venda not null,
    qtd_produto number(10,2) not null,
    tt_item number(10,2) not null
);

/* 
Relatóprio bloco PL Mostrar o vendedor com seu salárioacrescido de 10% do valor de cada venda
*/

// Exemplo 01

CREATE OR REPLACE FUNCTION soma (p1 in number, p2 in number)
  RETURN number
IS
  total number(4);
BEGIN
    total := p1 + p2;
RETURN total;
END;
 
select soma(19,1) from dual;
 

// Exercício 01 (Acrescimo no salário minimo) 

declare
    nota1 number(3) := 10;
    nota2 nota1%type := 10;
    resul nota1%type;
begin
    resul := soma(nota1, nota2);
    dbms_output.put_line('Resultado: '|| resul);
end;

CREATE OR REPLACE FUNCTION calcular_novo_salario_minimo (
    salario_minimo_atual IN NUMBER
)
RETURN NUMBER
IS
    novo_salario NUMBER;
BEGIN
    novo_salario := salario_minimo_atual * 1.25; -- Aumento de 25%
    RETURN novo_salario;
END;


DECLARE
    salario_minimo_atual NUMBER :=  &salario_minimo;
    novo_salario_minimo NUMBER;
BEGIN
    novo_salario_minimo := calcular_novo_salario_minimo(salario_minimo_atual);
    DBMS_OUTPUT.PUT_LINE('Novo salário mínimo: ' || novo_salario_minimo);
END;





// Exercício 02

INSERT INTO vendedor (id_vendedor, nm_vendedor, sl_vendedor) VALUES (1, 'João', 2000);
INSERT INTO vendedor (id_vendedor, nm_vendedor, sl_vendedor) VALUES (2, 'Maria', 2500);
INSERT INTO vendedor (id_vendedor, nm_vendedor, sl_vendedor) VALUES (3, 'Pedro', 1800);



CREATE OR REPLACE PROCEDURE att_salarios IS
BEGIN
    FOR rec IN (SELECT id_vendedor, sl_vendedor FROM vendedor) LOOP
        UPDATE vendedor
        SET sl_vendedor = rec.sl_vendedor * 1.25 -- Aumento de 25%
        WHERE id_vendedor = rec.id_vendedor;
    END LOOP;
    COMMIT;
END att_salarios;

BEGIN
    att_salarios;
END;

BEGIN 
    SELECT * FROM vendedor;
END;

set serveroutput on
--Serve para visualizar os dados

set verify off
--Serve para mostrar o resultado direto
