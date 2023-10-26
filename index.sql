create schema cc1m2610;
use cc1m2610;
show databases;
create table alunos(
id int unique primary key not null auto_increment,
nome varchar(50) not null,
data_nascimento date not null,
genero enum('M','F') not null,
email varchar(100) not null
);
alter table curso
modify column deparamento int,
add constraint curso_departamento foreign key(departamento) references departamento(id);
create table professor(
id int unique primary key not null auto_increment,
nome varchar(50) not null,
especialidade varchar(50) not null,
contratacao date not null
);
create table curso(
id int unique primary key not null auto_increment,
nome varchar(50) not null,
creditos int not null,
departamento varchar(50) not null,
id_professor int not null,
constraint curso_professor foreign key (id_professor) references professor(id)
);
create table matricula(
id int unique primary key not null auto_increment,
id_aluno int not null,
id_curso int not null,
data_matricula date not null,
constraint matri_aluno foreign key(id_aluno) references aluno(id),
constraint matri_curso foreign key(id_curso) references curso(id)
);
create table departamento(
id int unique primary key not null auto_increment,
nome varchar(50) not null
);
alter table curso
modify column departamento int,
add constraint curso_departamento foreign key(departamento) references departamento(id)
