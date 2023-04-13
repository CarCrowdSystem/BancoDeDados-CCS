CREATE DATABASE CCS;
USE CCS;

CREATE TABLE estacionamento(
	id_estacionamento INT PRIMARY KEY AUTO_INCREMENT,
	nome_estacionamento VARCHAR(60) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	numero_endereco VARCHAR(10) NOT NULL,
	telefone VARCHAR(11) NOT NULL
);

CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
	fk_estacionamento INT NOT NULL,
    FOREIGN KEY (fk_estacionamento) REFERENCES estacionamento(id_estacionamento),
	nome_funcionario VARCHAR(60) NOT NULL,
	email VARCHAR(60) NOT NULL,
	rg VARCHAR(10) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	senha VARCHAR(45) NOT NULL,
	telefone VARCHAR(11) NULL,
	login_habilitado BINARY(1) NOT NULL,
	usuario_adm BINARY(1) NOT NULL
);

CREATE TABLE vaga(
	id_vaga INT PRIMARY KEY AUTO_INCREMENT,
	fk_estacionamento INT NOT NULL,
    FOREIGN KEY (fk_estacionamento) REFERENCES estacionamento(id_estacionamento),
	andar INT NOT NULL
);

CREATE TABLE checkin_veiculo(
	id_checkin_veiculo INT PRIMARY KEY AUTO_INCREMENT,
	fk_vaga INT NOT NULL,
    FOREIGN KEY (fk_vaga) REFERENCES vaga(id_vaga),
	nome_cliente VARCHAR(45) NOT NULL,
	telefone_cliente VARCHAR(11) NOT NULL,
	placa_carro VARCHAR(7) NOT NULL,
	modelo VARCHAR(45) NOT NULL
);

CREATE TABLE historico(
	id_historico INT PRIMARY KEY AUTO_INCREMENT,
	fk_vaga INT NOT NULL,
    FOREIGN KEY (fk_vaga) REFERENCES vaga(id_vaga),
	fk_veiculo INT NOT NULL,
    FOREIGN KEY (fk_veiculo) REFERENCES checkin_veiculo(id_checkin_veiculo),
	momento_registro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	status_registro VARCHAR(45) NOT NULL,
    CHECK (status_registro = "Check-In" OR status_registro = "Check-Out")
);

SELECT * FROM estacionamento;
SELECT * FROM funcionario;
SELECT * FROM vaga;
SELECT * FROM checkin_veiculo;
SELECT * FROM historico;