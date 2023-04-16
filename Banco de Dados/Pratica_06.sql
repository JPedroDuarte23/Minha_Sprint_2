CREATE DATABASE pratica_6;
USE pratica_6 ;

CREATE TABLE Cliente (
  idCliente INT PRIMARY KEY AUTO_INCREMENT,
  nome_cliente VARCHAR(45),
  sobrenome_cliente VARCHAR(45),
  telefone_fixo VARCHAR(45),
  telefone_celular VARCHAR(45),
  bairro VARCHAR(45) 
  );
CREATE TABLE Pet (
  idPet INT AUTO_INCREMENT,
  nome_pet VARCHAR(45),
  Tipo VARCHAR(45),
  raca VARCHAR(45),
  dtNasc DATE,
  fk_Cliente INT,
  constraint pk_Pet_Cliente PRIMARY KEY (idPet, fk_Cliente),
  CONSTRAINT fk_Pet_Cliente FOREIGN KEY (fk_Cliente) REFERENCES Cliente (idCliente)
    ) auto_increment = 100;
    
    
INSERT INTO Cliente
VALUES
(Null, 'Roberto', 'Andrade', '4433-4433', '94433-4433', 'Mooca'),
(Null, 'Valdemir', 'Andrade', '4455-4455', '94455-4455', 'Vila Prudente'),
(Null, 'João', 'Maranho', '3422-2101', '94255-5542', 'Olimpico');

INSERT INTO Pet 
VALUES 
(Null, 'trovão', 'cachorro', 'bulldog', '2004-04-12', 1),
(Null, 'Princesa', 'cachorro', 'Golden Retriever', '2020-02-19', 3),
(Null, 'Morgana', 'gato', 'Persa', '2019-06-25', 1);

SELECT * FROM cliente;
SELECT * FROM pet;

ALTER TABLE cliente MODIFY COLUMN nome_cliente VARCHAR(50);
SELECT * FROM pet WHERE Tipo = 'cachorro';
SELECT nome_pet, dtNasc FROM pet;
SELECT * FROM pet ORDER BY nome_pet ASC;
SELECT * FROM cliente ORDER BY bairro DESC;
SELECT * FROM cliente WHERE sobrenome_cliente = 'Andrade';
UPDATE cliente SET telefone_fixo = '3443-5665' WHERE idCliente = 1;
SELECT * FROM cliente;

SELECT * FROM pet JOIN cliente
ON idCliente = fk_Cliente;

SELECT * FROM pet JOIN cliente
ON idCliente = fk_Cliente
WHERE nome_cliente = 'Roberto';

SELECT * FROM pet;
DELETE FROM pet WHERE idPet = 101;
SELECT * FROM pet;

DROP TABLE pet;
DROP TABLE cliente;

CREATE TABLE Pessoa(
  idPessoa INT PRIMARY KEY,
  nome VARCHAR(45),
  dtNasc DATE,
  profissao VARCHAR(45)
  );


CREATE TABLE Gastos (
  idGastos INT AUTO_INCREMENT,
  data_gasto DATE ,
  valor VARCHAR(45) NULL,
  descrição VARCHAR(45) NULL,
  fk_idPessoa INT NOT NULL,
  CONSTRAINT pk_Pessoa_Gastos PRIMARY KEY (idGastos, fk_idPessoa),
  CONSTRAINT fk_Gastos_Pessoa1 FOREIGN KEY (fk_idPessoa) REFERENCES Pessoa (idPessoa)
);

INSERT INTO Pessoa
VALUES 
(1, 'João', '1990-05-12', 'Designer'),
(2, 'Maria', '2002-09-13', 'Advogado'),
(3, 'Rafael', '2000-04-04', 'Advogado');

INSERT INTO Gastos
VALUES
(NULL, '2023-04-03','R$20', 'Shampoo', 1),
(NULL, '2023-04-01', 'R$30', 'Condicionador', 2),
(NULL, '2023-02-23', 'R$50', 'Pizza', 1);

SELECT * FROM Pessoa
WHERE profissao = 'Advogado';

SELECT * FROM Gastos 
WHERE descrição = 'Shampoo';

SELECT * FROM Pessoa JOIN Gastos
ON idPessoa = fk_idPessoa;

SELECT * FROM Pessoa JOIN Gastos
ON idPessoa = fk_idPessoa
WHERE nome = 'João';

UPDATE pessoa SET profissao = 'Nadador'
WHERE idPessoa = 2;
SELECT * FROM pessoa;

DELETE FROM Pessoa WHERE idPessoa = 3;

--  EX3  --
CREATE DATABASE PraticaFuncionario;
USE PraticaFuncionario;

CREATE TABLE Setor (
  idSetor INT PRIMARY KEY AUTO_INCREMENT,
  nome_setor VARCHAR(45),
  andar INT 
);

CREATE TABLE Funcionario (
  idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
  nome_funcionario VARCHAR(45),
  telefone VARCHAR(45),
  salario INT,
  fk_Setor INT,
  CONSTRAINT chk_salario CHECK (salario > 0),
  CONSTRAINT fk_Funcionario_Setor FOREIGN KEY (fk_Setor) REFERENCES Setor(idSetor)
    );

CREATE TABLE Acompanhante (
  idAcompanhante INT AUTO_INCREMENT,
  nome VARCHAR(45) ,
  relação VARCHAR(45) ,
  dtNasc DATE,
  fk_Funcionario INT,
  PRIMARY KEY (idAcompanhante, fk_Funcionario),
  CONSTRAINT fk_Acompanhante_Funcionario FOREIGN KEY (fk_Funcionario) REFERENCES Funcionario(idFuncionario)
    );
    
INSERT INTO setor 
VALUES 
    (Null, 'Vendas', 2),
    (Null, 'T.I.', 3);
    
INSERT INTO funcionario
VALUES 
    (NULL, 'Josué', '99775-9432', 2000, 1),
    (NULL, 'Monica', '98325-6993', 10000, 2),
    (NULL, 'Gabriel', '98756-3443', 5000, 2);
    
INSERT INTO acompanhante
VALUES
    (NULL, 'Dilcinha', 'Mãe', '1960-07-23', 1),
    (NULL, 'Cidinha', 'Amiga', '1990-09-09', 1), 
    (null, 'Maria', 'Irmã', '2000-01-26', 3);
    
SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

SELECT * FROM funcionario JOIN setor
	ON fk_Setor = idSetor;
    
SELECT * FROM setor JOIN funcionario
	ON idSetor = fk_Setor
	WHERE nome_setor = 'T.I.';
    
SELECT * FROM funcionario JOIN acompanhante
	ON idFuncionario = fk_Funcionario;

SELECT * FROM funcionario JOIN acompanhante 
	ON idFuncionario = fk_Funcionario
    WHERE nome_funcionario = 'Gabriel';

SELECT * FROM funcionario JOIN setor
	ON idSetor = fk_Setor
    JOIN acompanhante 
    ON idFuncionario = fk_funcionario;
    
CREATE DATABASE Treinador;
USE Treinador;

CREATE TABLE Treinador (
  idTreinador INT PRIMARY KEY  AUTO_INCREMENT,
  nome_treinador VARCHAR(45),
  telefone VARCHAR(45),
  email VARCHAR(45),
  experiencia VARCHAR(45),
  fk_Treinador INT ,
  CONSTRAINT fk_Treinador_Treinador FOREIGN KEY (fk_Treinador) REFERENCES Treinador(idTreinador)
) AUTO_INCREMENT = 10;

CREATE TABLE Nadador(
  idNadador INT PRIMARY KEY AUTO_INCREMENT,
  nome_nadador VARCHAR(45),
  estado VARCHAR(2),
  dtNasc DATE,
  fk_Treinador INT,
  CONSTRAINT fk_Nadador_Treinador FOREIGN KEY (fk_Treinador) REFERENCES Treinador(idTreinador)
) AUTO_INCREMENT = 100;

INSERT INTO Treinador (idTreinador, nome_treinador, telefone, email, experiencia)
VALUES
(NULL, 'Gabriel', '99889-9765','gabriel@outlook.com', 'novato'),
(NULL, 'Mario', '97654-3211', 'mario@gmail.com', 'experiente'),
(NULL, 'Cintia', '99669-0682', 'cintia@outlook.com', 'novato');

UPDATE treinador SET fk_Treinador = 11 WHERE idTreinador IN(10,12);
SELECT * FROM Treinador;

INSERT INTO nadador
VALUES 
(NULL, 'Jordan', 'BA', '1999-12-25', 12),
(NULL, 'Usain', 'SP', '1995-03-21', 12),
(NULL, 'Mateus', 'SC', '2003-02-23', 10),
(NULL, 'Julio', 'PR', '2003-02-23', 11);

SELECT * FROM treinador;
SELECT * FROM nadador;

SELECT * FROM nadador JOIN treinador
	ON idTreinador = nadador.fk_Treinador;
SELECT * FROM treinador JOIN nadador
	ON idTreinador = nadador.fk_Treinador
    WHERE nome_treinador = 'Cintia';
    
-- FUI ATRAS PARA VER COMO JUNTAR UMA TABELA NELA MESMA, JÁ QUE A MINHA PK E FK SÃO DA MESMA TABELA E CHEGUEI NO CÓDIGO ABAIXO:
    
SELECT * FROM treinador c1, treinador c2
	WHERE c1.idTreinador = c2.fk_Treinador AND c1.nome_treinador = 'Mario';
    
-- PRA FAZER A l) CHEGUEI NESSE SELECT, PELO QUE ENTENDI c1 E c2 SÃO IDENTIFICAÇÕES PARA A TABELA treinador 
-- PARA DIFERENCIAR NA JUNÇÃO
    
SELECT * FROM nadador JOIN treinador c2
	ON idTreinador = Nadador.fk_Treinador
    JOIN treinador c1
	ON c1.idTreinador = c2.fk_Treinador;
    
SELECT * FROM treinador c2 JOIN treinador c1
	ON c1.idTreinador = c2.fk_Treinador
	JOIN  nadador
	ON c2.idTreinador = Nadador.fk_Treinador;
    
-- FICOU BEM CONFUSO POR CONTA DAS IDENTIFICAÇÕES SEREM SOMENTE c1 E c2, EU PODERIA TER DADO OUTRO NOME PARA FACILITAR O JOIN

