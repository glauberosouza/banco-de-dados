CREATE TABLE estado (
	idt INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
	sigla VARCHAR(2) NOT NULL,
    regiao ENUM('NORTE', 'NORDESTE', 'CENTRO-OESTE', 'SUDESTE', 'SUL') NOT NULL,
    populacao DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(idt),
    UNIQUE KEY(nome),
    UNIQUE KEY(sigla)
);
-- INSERT ÚNICO
INSERT INTO estado (nome, sigla, regiao, populacao) VALUES ('ACRE', 'AC', 'NORTE', 0.83);

-- INSERT MÚLTIPLO
INSERT INTO estado
	(nome, sigla, regiao, populacao)
VALUES
	('Alagoas','AL','NORDESTE', 0.38),
    ('Amapá', 'AP', 'NORTE', 0.08),
    ('Amazonas', 'AM', 'NORTE',0.06),
    ('Bahia', 'BA', 'NORDESTE',5.34 ),
    ('Ceará', 'CE', 'NORDESTE',0.02),
    ('Distrito Federal', 'DF', 'CENTRO-OESTE', 0.04),
    ('Espírito Santo', 'ES', 'SUDESTE',0.02),
    ('Goiás', 'GO', 'CENTRO-OESTE',0.78),
    ('Maranhao', 'MA', 'NORDESTE',0.00),
    ('Mato Grosso', 'MT', 'CENTRO-OESTE', 0.34),
    ('Mato Grosso do Sul', 'MS', 'CENTRO-OESTE',0.71),
    ('Minas Gerais', 'MG', 'SUDESTE', 1.12),
    ('Pará', 'PA', 'NORTE', 0.36),
    ('Paraíba', 'PB', 'NORDESTE',0.03),
    ('Parana', 'PR', 'SUL',1.22),
    ('Pernambuco', 'PE', 'NORDESTE',0.47),
    ('Piauí', 'PI', 'NORDESTE',0.22),
    ('Rio de Janeiro', 'RJ', 'SUDESTE',6.72),
    ('Rio Grande do Norte', 'RN', 'NORDESTE',0.51),
    ('Rio Grande do Sul', 'RS', 'SUL',1.32),
    ('Rondônia', 'RO', 'NORTE',0.81),
    ('Roraima', 'RR', 'NORTE',0.52),
    ('Santa Catarina', 'SC', 'SUL',0.01),
    ('São Paulo', 'SP', 'SUDESTE',5.10),
    ('Sergipe', 'SE', 'NORDESTE',0.29),
    ('Tocantins', 'TO', 'NORTE',0.55);
    
     --QUERIES
    -- SELECIONE TODOS OS VALORES DA TABELA ESTADOS
        SELECT * FROM estado;
    -- SELECIONE APENAS OS NOMES E SIGLAS DE TODOS OS ESTADOS
        SELECT nome, sigla FROM estado;
    -- SELECIONE O NOME DE TODOS OS ESTADOS, PORÉM NA RESPOSTA A COLUNA NOME DEVE SER CHAMAR NOME DO ESTADO
    	SELECT nome AS 'NOME DO ESTADO' FROM estado;
    -- SELECIONE TODOS OS ESTADOS QUE PERTENCEM A REGIÃO NORDESTE
    	SELECT * FROM estado WHERE regiao = 'NORDESTE';
    -- SELECIONE TODOS OS ESTADOS CUJA A POPULAÇÃO SEJA MAIOR QUE 10 MILHÕES
    	SELECT * FROM estado WHERE populacao > 5;
    -- SELECIONE TODOS OS ESTADOS CUJA A POPULAÇÃO SEJA MAIOR QUE 10 MILHÕES EXIBINDO EM ORDEM CRESCENTE
    	SELECT * FROM estado WHERE populacao > 1 ORDER BY populacao ASC;

    --UPDATE and SET
    UPDATE estado SET nome  = 'Maranhão' WHERE nome = 'Maranhao';
	UPDATE	estado SET nome = 'Paraná', populacao = 11.08 WHERE nome = 'Parana';
	-- DELETE
	DELETE FROM estado WHERE nome = 'Veneza';

    -- QUERY
	 SELECT
     	regiao AS 'Região',
    	SUM(populacao) AS 'Total'
     FROM
     	estado
     GROUP BY
     	regiao
     ORDER BY total DESC;

    SELECT AVG(populacao) AS 'Média' FROM estado;

    -- CREATED A NEW TABLE
    CREATE TABLE cidade (
    	idt INT UNSIGNED NOT NULL AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL,
        area DECIMAL(8,2),
        idt_estado INT UNSIGNED NOT NULL,
    	PRIMARY KEY(idt),
        FOREIGN KEY(idt_estado) REFERENCES estado(idt)
    );
    
 -- QUERY IN 2 TABLES AT THE SAME TIME
SELECT
	c.nome AS 'Cidade', e.nome AS 'Estado', regiao AS 'Região'
FROM
	estado e JOIN cidade c ON e.idt = c.idt_estado;

    -- CREATED A NEW TABLE prefeito
CREATE TABLE prefeito(
	idt INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(225) NOT NULL,
    idt_cidade INT UNSIGNED,
    PRIMARY KEY(idt),
    FOREIGN KEY(idt_cidade) REFERENCES cidade(idt),
    UNIQUE(idt_cidade)
);

     -- ADDING prefeitos TO cidades
INSERT INTO prefeito(nome, idt_cidade)
VALUES ('Lula', (SELECT idt FROM cidade WHERE nome='Jacarei')),
	   ('Bolsonaro', (SELECT idt FROM cidade WHERE nome='Caldas Novas')),
       ('Putin', null);
