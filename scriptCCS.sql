CREATE DATABASE CCS;
USE CCS;

CREATE TABLE estacionamento(
	id_estacionamento INT PRIMARY KEY AUTO_INCREMENT,
	nome_estacionamento VARCHAR(255) NOT NULL,
	cep CHAR(8) NOT NULL,
	numero_endereco VARCHAR(255) NOT NULL,
	telefone CHAR(11) NOT NULL
);

CREATE TABLE valor_estacionamento(
	id_preco INT PRIMARY KEY AUTO_INCREMENT,
    fk_estacionamento INT NOT NULL,
    FOREIGN KEY (fk_estacionamento) REFERENCES estacionamento(id_estacionamento),
    primeira_hora DECIMAL(5,2) NOT NULL,
    hora_adicional DECIMAL(5,2) NOT NULL,
    diaria DECIMAL(5,2) NOT NULL
);

CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
	fk_estacionamento INT NOT NULL,
    FOREIGN KEY (fk_estacionamento) REFERENCES estacionamento(id_estacionamento),
	nome_funcionario VARCHAR(255) NOT NULL,
    foto BLOB,
	email VARCHAR(255) NOT NULL,
	rg CHAR(9) NOT NULL,
	cpf CHAR(11) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	telefone CHAR(11) NULL,
	login_habilitado BINARY(1) NOT NULL,
	usuario_adm BINARY(1) NOT NULL
);

CREATE TABLE vaga(
	id_vaga INT PRIMARY KEY AUTO_INCREMENT,
	fk_estacionamento INT NOT NULL,
    FOREIGN KEY (fk_estacionamento) REFERENCES estacionamento(id_estacionamento),
    numero INT NOT NULL,
	andar INT NOT NULL
);

CREATE TABLE checkin_veiculo(
	id_checkin INT PRIMARY KEY AUTO_INCREMENT,
	fk_vaga INT NOT NULL,
    FOREIGN KEY (fk_vaga) REFERENCES vaga(id_vaga),
    placa CHAR(7) NOT NULL,
	modelo VARCHAR(255) NOT NULL,
	nome_cliente VARCHAR(255) NOT NULL,
	telefone_cliente CHAR(11) NOT NULL
);

CREATE TABLE historico(
	id_historico INT PRIMARY KEY AUTO_INCREMENT,
	fk_vaga INT NOT NULL,
    FOREIGN KEY (fk_vaga) REFERENCES vaga(id_vaga),
	fk_veiculo INT NOT NULL,
    FOREIGN KEY (fk_veiculo) REFERENCES checkin_veiculo(id_checkin),
	momento_registro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	status_registro VARCHAR(255) NOT NULL,
    CHECK (status_registro = "Checkin" OR status_registro = "Checkout"),
    valor_pago DECIMAL(5,2)
);

SELECT * FROM estacionamento;
SELECT * FROM valor_estacionamento;
SELECT * FROM funcionario;
SELECT * FROM vaga;
SELECT * FROM checkin_veiculo;
SELECT * FROM historico;

-- DROP DATABASE CCS;