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
