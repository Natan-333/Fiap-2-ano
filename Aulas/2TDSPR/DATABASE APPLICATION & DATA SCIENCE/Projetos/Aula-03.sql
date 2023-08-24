/* Aula 01 - Introdu??o blocos an?nimos */

/* Habilitando a sa?da de dados de um block PL */
SET SERVEROUTPUT ON

set verify off
/* 1? Programa */
BEGIN
    dbms_output.put_line('Hello world');
    DBMS_OUTPUT.PUT_LINE('Teste');
END;

/* V?riaveis */
DECLARE
    v1 NUMBER(2) := 10;
    v2 NUMBER(2) := 10;
    re NUMBER(3) := v1 + v2; -- Declarando e realizando opera??o
BEGIN
    dbms_output.put_line('RESULTADO: '||re);
END;


/* Entrada via teclado */
DECLARE
    -- Declara??o de vm
    -- Uso de v?riaveis de substitui??o
    v1 NUMBER(2) := &Valor_1;
    v2 NUMBER(2) := &Valor_2;
    re NUMBER(3) := v1 + v2;
BEGIN
    dbms_output.put_line('RESULTADO: '||re);
END;



-- Exerc?cio 01
DECLARE
    v_salario_minimo NUMBER(4) := &Salario_minimo;
    v_resultado NUMBER(4) := v_salario_minimo + (v_salario_minimo * 0.25);
BEGIN
    dbms_output.put_line('RESULTADO: '||v_resultado);
END;


-- Exerc?cio 02
DECLARE
    v_dolar NUMBER(4) := &Dolar;
    v_resultado NUMBER(4) := 45 * v_dolar;
BEGIN
    dbms_output.put_line('RESULTADO: '||v_resultado);
END;

-- Exerc?cio 03
DECLARE
    v_reais NUMBER(4) := &Reais;
    v_dolar NUMBER(4) := &Dolar;
    v_resultado NUMBER(4) := v_reais * v_dolar;
BEGIN
    dbms_output.put_line('RESULTADO: '||v_resultado);
END;

-- Exerc?cio 04
DECLARE
    v_valor_automovel NUMBER(4) := &Valor_automovel;
    v_juros NUMBER(4) := v_valor_automovel + (v_valor_automovel * 0.03);
    v_dez_vezes NUMBER(4) := v_juros / 10;
BEGIN
    dbms_output.put_line('JUROS: '||v_juros);
    dbms_output.put_line('EM 10x: '||v_dez_vezes);
END;


-- Exerc?cio 05
DECLARE
    v_valor_automovel NUMBER(6) := &Valor_automovel;
    v_valor_entrada NUMBER(6) := v_valor_automovel * 0.20 ;
    v_valor_restante NUMBER(6) := v_valor_automovel - v_valor_entrada;
    
    v_doze_vezes NUMBER(6) := (v_valor_restante + (v_valor_restante * 0.12)) / 12;
    v_seis_vezes NUMBER(6) := (v_valor_restante + (v_valor_restante * 0.15)) / 6;
    v_dezoito_vezes NUMBER(6) := (v_valor_restante + (v_valor_restante * 0.18)) / 18;
BEGIN
    dbms_output.put_line('EM 6x: '||v_seis_vezes);
    dbms_output.put_line('EM 12x: '||v_doze_vezes);
    dbms_output.put_line('EM 18x: '||v_dezoito_vezes);
END;

-- Estrutura de decis?o 14/08/23

--Exercicio 1
DECLARE
     v_sexo char(1) := upper('&sexo');
    BEGIN
    
     IF v_sexo = 'M' OR v_sexo = 'm' THEN
            dbms_output.put_line('Masculino');
     ELSIF v_sexo = 'F' OR v_sexo = 'f' THEN
            dbms_output.put_line('Feminino');
     Else
            dbms_output.put_line('Outros');
    End IF;
END;

-- Exercicio 2 - Remake do exercicio de presta??o
DECLARE
    v_valor_automovel NUMBER(6) := &Valor_automovel;
    v_valor_entrada NUMBER(6) := v_valor_automovel * 0.20 ;
    v_valor_restante NUMBER(6) := v_valor_automovel - v_valor_entrada;
    v_escolha number(2) := &v_6_12_18;
    
    v_doze_vezes NUMBER(6) := (v_valor_restante + (v_valor_restante * 0.12)) / 12;
    v_seis_vezes NUMBER(6) := (v_valor_restante + (v_valor_restante * 0.15)) / 6;
    v_dezoito_vezes NUMBER(6) := (v_valor_restante + (v_valor_restante * 0.18)) / 18;
BEGIN
     IF v_escolha = 6 THEN
            dbms_output.put_line('6x: '||v_seis_vezes);
     ELSIF v_escolha = 12 THEN
            dbms_output.put_line('12x: '||v_doze_vezes);
     ELSIF v_escolha = 18 THEN
            dbms_output.put_line('18x: '||v_dezoito_vezes);
     Else
            dbms_output.put_line('S? ? poss?vel 6x,12x,18x para consultar valores.');
    End IF; 
END;

-- Exercicio 3 FIAP
DECLARE
   v_checkpoint1 NUMBER := &v_check1;
   v_checkpoint2 NUMBER := &v_check2; 
   v_checkpoint3 NUMBER := &v_check3; 
   v_challenge NUMBER := &v_challenge;    
   v_prova_global NUMBER := &v_gl; 
   v_media NUMBER;

   v_menor_nota NUMBER;
   v_desconto NUMBER;

BEGIN
  
   v_menor_nota := LEAST(v_checkpoint1, v_checkpoint2, v_checkpoint3);

   v_desconto := v_menor_nota * 0.2;

   v_media := ((v_checkpoint1 + v_checkpoint2 + v_checkpoint3 - v_desconto) * 0.2 +
               v_challenge * 0.2 +
               v_prova_global * 0.6);

   
   IF v_media < 0 THEN
      v_media := 0;
   ELSIF v_media > 10 THEN
      v_media := 10;
   END IF;

   -- Exibir a m?dia calculada
   DBMS_OUTPUT.PUT_LINE('M?dia de Notas da FIAP: ' || v_media);
END;
/

-- 21/08/23

CREATE TABLE aluno(
    ra char(9) constraint aluno_pk primary key,
    nome varchar2(50)
);

BEGIN
INSERT INTO aluno (ra,nome) values('111222333','Antonio Alves');
INSERT INTO aluno (ra,nome) values('111222334','Vitinha');
INSERT INTO aluno (ra,nome) values('111222335','Claudinho');
END;

DECLARE
    V_ra CHAR(9) :='111222334';
    V_nome VARCHAR2(50);
BEGIN
    SELECT nome INTO V_nome FROM ALUNO WHERE ra=V_ra;
    DBMS_OUTPUT.PUT_LINE('O nome do aluno é:'||V_nome);
END;

-- Exemplo insert
DECLARE
    V_ra CHAR(9) :='111222338';
    V_nome VARCHAR2(50):= 'Daniela Dorneles';
BEGIN
    INSERT INTO ALUNO (ra,nome) VALUES(V_ra,V_nome);
END;

-- Exemplo Update
DECLARE
    V_ra CHAR(9) :='111222338';
    V_nome VARCHAR2(50):= 'Daniela Dornelines';
BEGIN
    UPDATE ALUNO SET nome =V_nome WHERE ra=V_ra;
END;

-- Exemplo DELETE
DECLARE
    V_ra CHAR(9) :='111222338';
BEGIN
    DELETE FROM ALUNO WHERE ra=V_ra;
END;

-- Exercicio 00

CREATE TABLE produto(
    id_pro number(3) CONSTRAINT id_pk primary key,
    ds_pro varchar(30) CONSTRAINT ds_nn_uk NOT NULL UNIQUE,
    pr_pro number(8,2) CONSTRAINT pr_nn NOT NULL,
    qtd_pro number(8,2) CONSTRAINT qtd_nn NOT NULL
);

BEGIN
INSERT INTO PRODUTO (id_pro, ds_pro,pr_pro,qtd_pro) values(1,'Pneu',350.56,100);
INSERT INTO PRODUTO (id_pro, ds_pro,pr_pro,qtd_pro) values(2,'Multimidia',2380.60,5);
INSERT INTO PRODUTO (id_pro, ds_pro,pr_pro,qtd_pro) values(3,'Chaveiro',12.40,180);
END;

-- Baixa em um produto especifico 
declare
    v_idpro number(3) := &cd_produto;
    v_compra number(10,2) := &qtd_compra;
    v_dspro  varchar2(30);
    v_prpro  number(10,2);
    v_total  number(12,2);
begin
    select ds_pro, pr_pro into v_dspro, v_prpro from produto
    where id_pro = v_idpro;
    v_total := v_compra * v_prpro;
    dbms_output.put_line('Descrição do produto: '||v_dspro);
    dbms_output.put_line('Preço do produto: '||v_prpro);
    dbms_output.put_line('Qtd comprada: '||v_compra);
    dbms_output.put_line('Total da compra - R$: '||v_total);
end;

-- Atualização da tabela produto
declare
    v_idpro number(3) := &cd_produto;
    v_compra number(10,2) := &qtd_compra;
    v_dspro  varchar2(30);
    v_prpro  number(10,2);
    v_total  number(12,2);
    v_qtdpro number(10,2);
begin
    select ds_pro, pr_pro, qtd_pro into v_dspro, v_prpro, v_qtdpro
    from produto where id_pro = v_idpro;
    v_total := v_compra * v_prpro;
    update produto set qtd_pro = qtd_pro - v_compra
    where id_pro = v_idpro;
    dbms_output.put_line('Descrição do produto: '||v_dspro);
    dbms_output.put_line('Preço do produto: '||v_prpro);
    dbms_output.put_line('Qtd comprada: '||v_compra);
    dbms_output.put_line('Total da compra - R$: '||v_total);
end;

-- Ver se tem estoque
declare
    v_idpro number(3) := &cd_produto;
    v_compra number(10,2) := &qtd_compra;
    v_dspro  varchar2(30);
    v_prpro  number(10,2);
    v_total  number(12,2);
    v_qtdpro number(10,2);
begin
     select ds_pro, pr_pro, qtd_pro into v_dspro, v_prpro, v_qtdpro
     from produto where id_pro = v_idpro;
     v_total := v_compra * v_prpro;
        v_total := v_compra * v_prpro;
    if v_compra > v_qtdpro THEN
        dbms_output.put_line('Não tem estoque');
    else
        update produto set qtd_pro = qtd_pro - v_compra
        where id_pro = v_idpro;
        dbms_output.put_line('Descrição do produto: '||v_dspro);
        dbms_output.put_line('Preço do produto: '||v_prpro);
        dbms_output.put_line('Qtd comprada: '||v_compra);
        dbms_output.put_line('Total da compra - R$: '||v_total);
     END IF;
end;

-- Tenha opção de compra e venda
declare
    v_idpro number(3) := &cd_produto;
    v_compra number(10,2) := &qtd_compra;
    v_dspro  varchar2(30);
    v_prpro  number(10,2);
    v_total  number(12,2);
    v_qtdpro number(10,2);
begin
     select ds_pro, pr_pro, qtd_pro into v_dspro, v_prpro, v_qtdpro
     from produto where id_pro = v_idpro;
     v_total := v_compra * v_prpro;
        v_total := v_compra * v_prpro;
    if v_compra > v_qtdpro THEN
        dbms_output.put_line('Não tem estoque');
    elsif 
    else
        update produto set qtd_pro = qtd_pro - v_compra
        where id_pro = v_idpro;
        dbms_output.put_line('Descrição do produto: '||v_dspro);
        dbms_output.put_line('Preço do produto: '||v_prpro);
        dbms_output.put_line('Qtd comprada: '||v_compra);
        dbms_output.put_line('Total da compra - R$: '||v_total);
     END IF;
end;