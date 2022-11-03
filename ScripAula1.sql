create database banco;

use banco;

create table aluno (
	matricula int(11) not null auto_increment,
    nome varchar(50) null,
    idade int(11) null,
    primary key(matricula)
);
select * from aluno;
 insert into aluno values (0, 'Pedro', 20);
 insert into aluno values (0, 'Maria', 18);
 select nome from aluno where nome like 'm%';
 select count(matricula) from aluno;
 select max(idade) from aluno;
 update aluno set idade = 18 where matricula = 1;
 
 drop table aluno;
 drop database banco;

