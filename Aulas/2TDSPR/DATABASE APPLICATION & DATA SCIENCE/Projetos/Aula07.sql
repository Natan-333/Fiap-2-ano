CREATE TABLE aluno (
    ra CHAR(9) CONSTRAINT aluno_pk_ PRIMARY KEY,
    nome VARCHAR2(50)
);

INSERT INTO aluno (ra, nome) VALUES ('123456781', 'Antonio Alves');
INSERT INTO aluno (ra, nome) VALUES ('123456782', 'Beatriz Bernades');
INSERT INTO aluno (ra, nome) VALUES ('123456783', 'Cl?udio Cardoso');

SELECT * FROM aluno;

/* Habilitando a sa?da de dados de um block PL */
SET SERVEROUTPUT ON;

-- Selecionar um usu?rio atrav?s do ra
DECLARE
    V_RA CHAR(9) := '123456782';
    V_NOME VARCHAR(50);
BEGIN
    SELECT nome INTO V_NOME FROM aluno WHERE ra = V_RA;
    DBMS_OUTPUT.PUT_LINE('O nome do aluno ?: ' || V_NOME);
END;

-- Inserindo um usu?rio
DECLARE
    V_RA CHAR(9) := '123456784';
    V_NOME VARCHAR(50) := 'Daniela Fornelas';
BEGIN
    INSERT INTO aluno (ra, nome) VALUES (V_RA, V_NOME);
END;

-- Atualizando um usu?rio
DECLARE
    V_RA CHAR(9) := '123456784';
    V_NOME VARCHAR(50) := 'Daniela Fornelas TESTE';
BEGIN
    UPDATE aluno SET nome = V_NOME WHERE ra = V_RA;
END;


-- Apagando um usu?rio
DECLARE
    V_RA CHAR(9) := '123456784';
BEGIN
    DELETE FROM aluno WHERE ra = V_RA;
END;



CREATE TABLE produto (
    id_pro NUMBER(3) CONSTRAINT id_pk PRIMARY KEY,
    ds_pro VARCHAR(30) CONSTRAINT ds_nn_uk NOT NULL UNIQUE,
    pr_pro NUMBER(8, 2) CONSTRAINT pr_nn NOT NULL,
    qtd_pro NUMBER(8, 2) CONSTRAINT qtd_nn NOT NULL
);

INSERT INTO produto (id_pro, ds_pro, pr_pro, qtd_pro) VALUES (1, 'Pneu', 350.56, 100);
INSERT INTO produto (id_pro, ds_pro, pr_pro, qtd_pro) VALUES (2, 'Multimidia', 2380.60, 5);
INSERT INTO produto (id_pro, ds_pro, pr_pro, qtd_pro) VALUES (3, 'Chaveiro', 12.40, 150);

SELECT pr_pro FROM produto WHERE id_pro = 1;
 
-- Comprando produto
DECLARE
    V_ID_PRODUTO NUMBER(3) := &codigo_produto;
    V_QTD_COMPRA NUMBER(8, 2) := &quantidade_compra;
    V_VALOR_PRO  NUMBER(8, 2);
    V_DESC_PRO VARCHAR(30);
BEGIN
    SELECT ds_pro, pr_pro INTO V_DESC_PRO, V_VALOR_PRO FROM produto WHERE id_pro = V_ID_PRODUTO;
    DBMS_OUTPUT.PUT_LINE('Quantidade:  ' || V_QTD_COMPRA);
    DBMS_OUTPUT.PUT_LINE('Valor do produto:  ' || V_VALOR_PRO);
    DBMS_OUTPUT.PUT_LINE('Descri??o do produto:  ' || V_DESC_PRO);
    DBMS_OUTPUT.PUT_LINE('Valor a ser pago:  ' || V_VALOR_PRO * V_QTD_COMPRA);
END;

-- Dando baixa no produto
DECLARE
    V_ID_PRODUTO NUMBER(3) := &codigo_produto;
    V_QTD_COMPRA NUMBER(8, 2) := &quantidade_compra;
    V_VALOR_PRO  NUMBER(8, 2);
    V_DESC_PRO VARCHAR(30);
    V_QTD_PRO NUMBER(8, 2);
BEGIN
    SELECT ds_pro, pr_pro, qtd_pro  
    INTO V_DESC_PRO, V_VALOR_PRO, V_QTD_PRO 
    FROM produto 
    WHERE id_pro = V_ID_PRODUTO;
    
    UPDATE produto 
    SET qtd_pro = V_QTD_PRO - V_QTD_COMPRA
    WHERE id_pro = V_ID_PRODUTO;
    
    DBMS_OUTPUT.PUT_LINE('Quantidade:  ' || V_QTD_COMPRA);
    DBMS_OUTPUT.PUT_LINE('Valor do produto:  ' || V_VALOR_PRO);
    DBMS_OUTPUT.PUT_LINE('Descri??o do produto:  ' || V_DESC_PRO);
    DBMS_OUTPUT.PUT_LINE('Valor a ser pago:  ' || V_VALOR_PRO * V_QTD_COMPRA);
END;


-- N?o permitindo compras a mais do estoque
DECLARE
    V_ID_PRODUTO NUMBER(3) := &codigo_produto;
    V_QTD_COMPRA NUMBER(8, 2) := &quantidade_compra;
    V_VALOR_PRO  NUMBER(8, 2);
    V_DESC_PRO VARCHAR(30);
    V_QTD_PRO NUMBER(8, 2);
BEGIN
    SELECT ds_pro, pr_pro, qtd_pro  
    INTO V_DESC_PRO, V_VALOR_PRO, V_QTD_PRO 
    FROM produto 
    WHERE id_pro = V_ID_PRODUTO;
    
    IF V_QTD_COMPRA > V_QTD_PRO THEN 
        DBMS_OUTPUT.PUT_LINE('Quantidade informada acima do estoque.');
    ELSE
        UPDATE produto 
        SET qtd_pro = V_QTD_PRO - V_QTD_COMPRA
        WHERE id_pro = V_ID_PRODUTO;
        
        DBMS_OUTPUT.PUT_LINE('Quantidade:  ' || V_QTD_COMPRA);
        DBMS_OUTPUT.PUT_LINE('Valor do produto:  ' || V_VALOR_PRO);
        DBMS_OUTPUT.PUT_LINE('Descri??o do produto:  ' || V_DESC_PRO);
        DBMS_OUTPUT.PUT_LINE('Valor a ser pago:  ' || V_VALOR_PRO * V_QTD_COMPRA);
    END IF;
END;


-- Compra ou venda
DECLARE
    V_ID_PRODUTO NUMBER(3) := &codigo_produto;
    V_COMPRA_OU_VENDA NUMBER(1) := &informe_a_opcao_1_compra_2_venda;
    V_QTD_COMPRA NUMBER(8, 2) := &quantidade_compra_ou_venda;
    V_VALOR_PRO  NUMBER(8, 2);
    V_DESC_PRO VARCHAR(30);
    V_QTD_PRO NUMBER(8, 2);
BEGIN
    SELECT ds_pro, pr_pro, qtd_pro  
    INTO V_DESC_PRO, V_VALOR_PRO, V_QTD_PRO 
    FROM produto 
    WHERE id_pro = V_ID_PRODUTO;
    
    IF V_COMPRA_OU_VENDA = 1 THEN
        UPDATE produto 
        SET qtd_pro = V_QTD_PRO + V_QTD_COMPRA
        WHERE id_pro = V_ID_PRODUTO;
    
    ELSIF V_QTD_COMPRA > V_QTD_PRO THEN 
        DBMS_OUTPUT.PUT_LINE('Quantidade informada acima do estoque.');
        
    ELSE
        UPDATE produto 
        SET qtd_pro = V_QTD_PRO - V_QTD_COMPRA
        WHERE id_pro = V_ID_PRODUTO;
        
        DBMS_OUTPUT.PUT_LINE('Quantidade:  ' || V_QTD_COMPRA);
        DBMS_OUTPUT.PUT_LINE('Valor do produto:  ' || V_VALOR_PRO);
        DBMS_OUTPUT.PUT_LINE('Descri??o do produto:  ' || V_DESC_PRO);
        DBMS_OUTPUT.PUT_LINE('Valor a ser pago:  ' || V_VALOR_PRO * V_QTD_COMPRA);
    END IF;
END;


select * from produto;
