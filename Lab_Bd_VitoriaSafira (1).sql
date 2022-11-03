create database Lab_db;
use Lab_db;

create table pessoa(
id int not null auto_increment,
nome_pessoa varchar(50),
cpf_pessoa int,
primary key (id)
)default charset = utf8;


insert into pessoa values
(DEFAULT, 'Safira', '897654768908'), 
(DEFAULT, 'Bianca', '112365789065'),
(DEFAULT, 'Sofia', '098760123465'), 
(DEFAULT, 'Gabriela', '085432145678'), 
(DEFAULT, 'Pedro', '765438907654'); 

