create database AtividadeOracle
default character set utf8;

use AtividadeOracle;

create table categoria(
categoria_id tinyint(3) primary key not null,
nome varchar(25),
ultima_atualizacao timestamp 
);

create table cliente(
cliente_id smallint(3) primary key not null,
loja_id tinyint(3),
primeiro_nome varchar(45),
ultimo_nome varchar(50),
email varchar(50),
endereço_id smallint(5),
ativo tinyint(1),
data_criacao datetime,
ultima_atuaizacao timestamp,
constraint FK_loja foreign key (loja_id) references loja (loja_id),
constraint FK_endereco foreign key (endereco_id) references endereco
(endereco_id)
);

create table funcionario(
funcionario_id tinyint(3) primary key not null,
primero_nome varchar(45),
ultimo_nome varchar(45),
endereco_id smallint(5),
foto blob,
email varchar(50),
loja_id tinyint(3),
ativo tinyint(1),
usuario varchar(16),
senha varchar(40),
ultima_atualizacacao timestamp,
constraint FK_endereco foreign key (endereco_id) references endereco
(endereco_id),
constraint FK_loja foreign key (loja_id) references loja (loja_id)
);

create table filme_categoria(
filme_id smallint(5),
categoria_id tinyint(3),
ultima_atualizacao timestamp,
constraint FK_filmcategoria primary key (filme_id, cadegoria_id),
constraint FK_filme foreign key (filme_id) references filme (filme_id),
constraint FK_categoria foreign key categoria (categoria_id) 
references categoria_id
);

create table endereco(
endereco_id smallint(5) primary key not null,
endereco varchar(50),
enderoco2 varchar(50),
bairro varchar(20),
cidade_id smallint(5),
cep varchar(10),
telefone varchar(20),
ultima_atualicao timestamp,
constraint FK_cidade foreign key (cidade_id) references 
cidade (cidade_id)
);

create table loja(
loja_id tinyint(3) primary key,
gerente_id tinyint(3),
endereco_id smallint(5),
ultima_atulazacao timestamp,
constraint FK_endereco foreign key (endereco_id) 
references endereco (endereco_id)
);

create table cidade (
cidade_id smallint(5) primary key,
cidade varchar(50),
pais_id smallint(5),
ultima_atualizacao timestamp,
constraint FK_pais foreign key (pais_id) references pais (pais_id)
);

create table pagamento(
pagamento_id smallint(5) primary key,
cliente_id smallint(5),
funcionario_id tinyint(3),
aluguel_id int(11),
valor decimal(5,2),
data_de_pagamento datetime,
ultima_atualizacao timestamp,
constraint FK_cliente foreign key (cliente_id) 
references cliente (cliente_id),
constraint FK_funcionario foreign key (funcionario_id) 
references funcionario (funcionario_id),
constraint FK_aluguel foreign key (aluguel_id) 
references aluguel (aluguel_id)
);

create table inventario(
inventario_id mediumint(8) primary key,
filme_id smallint(5),
loja_id smallint(5),
ultima_atualizacao timestamp,
constraint FK_filme foreign key (filme_id) references filme (filme_id),
constraint FK_loja foreign key (loja_id) references loja (loja_id)
);

create table aluguel(
aluguel_id int(11) primary key,
data_de_aluguel datetime,
inventario_id mediumint(8),
cliente_id smallint(5),
data_de_devolucao datetime,
funcionario_id tinyint(3),
ultima_atualizacao timestamp,
constraint FK_inventario foreign key (inventario_id) 
references inventario (inventario_id),
constraint FK_cliente foreign key (cliente_id) 
references loja (cliente_id),
constraint FK_funcionario foreign key (funcionario_id) 
references funcionario (funcionario_id)
);

create table filme_texto(
filme_id smallint(6) primary key,
titulo varchar(255),
descricao text
);

create table pais(
pais_id smallint(5),
pais varchar(50),
ultima_atualizacao timestamp
);

create table ator(
ator_id smallint(5) primary key,
primeiro_nome varchar(45),
ultimo_nome varchar(45),
ultima_atualizacao timestamp
);

create table filme_ator(
ator_id smallint(5),
filme_id smallint(5),
ultima_atualizacao timestamp,
constraint FK_atorfilme primary key (ator_id, filme_id),
constraint FK_ator foreign key (ator_id) references ator_id,
constraint FK_filme foreign key (filme_id) references filme (filme_id)
);

create table idioma(
idioma_id tinyint(3) primary key not null,
nome char(20),
ultima_atulizacao timestamp
);

create table filme(
filme_id smallint(5) primary key,
titulo varchar(255),
descricao text,
ano_de_lancamento year(4),
idioma_id tinyint(3),
idioma_original_id tinyint(3),
duracao_da_locacao tinyint(3),
preco_da_locacao decimal(4,2),
classificacao enum('18 anos''menor de 18'),
recursos_especiais set('som''brilho'),
ultima_atualizacao timestamp,
constraint FK_idioma foreign key (idioma_id) references idioma (idioma_id),
constraint FK_idioma_original foreign key (idioma_original_id) 
references idioma_original (idioma_original_id)
 );