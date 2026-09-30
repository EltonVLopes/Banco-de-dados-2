-- BD Exercicio de revisao
-- 2 Semestre, 1° Bimestre

create database bd_Exrevisao0302;

use bd_Exrevisao0302;

create table tb_paciente
(matricula int not null primary key,
paciente char(50),
telefone char(11),
endereco char(30));

create table tb_exame
(cd_exame int not null primary key,
exame char(30));

create table tb_convenio
(cd_convenio int not null primary key,
convenio char(30));

create table rl_exame_paciente
(cd_exame int not null,
cd_convenio int not null,
matricula int not null,
dt_exame date,
primary key (cd_exame, cd_convenio, matricula));

alter table rl_exame_paciente
add constraint fk_matricula foreign key(matricula)
references tb_paciente (matricula);

alter table rl_exame_paciente
add constraint fk_cd_exame foreign key (cd_exame)
references tb_exame (cd_exame);

alter table rl_exame_paciente
add constraint fk_cd_convenio foreign key (cd_convenio)
references tb_convenio (cd_convenio);

-- populaçao banco de dados
select * from tb_exame;

insert into tb_exame  
(cd_exame, exame)  
values 
(1,'Mamografia'), 
(2,'Desintometria óssea' ), 
(3,'RM - Ressonância Magnética' ), 
(4,'Tomografia Computadorizada' ), 
(5,'Ultra-sonografia' ), 
(6,'Ecografia tridimensional'),  
(7,'Ecodopler' );

select * from tb_convenio;

insert into tb_convenio  
(cd_convenio, convenio)  
values 
(1,'Qualicorp'), 
(2,'Allianz' ), 
(3,'Cassi' ), 
(4,'Bradesco' );  

select * from tb_paciente;

insert into tb_paciente  
(matricula, paciente, telefone, endereco) 
values 
(1,'Joao','22101010','Rua 10'), 
(2,'Maria','22101011','Rua 11' ), 
(3,'Carlos','22101012','Rua 12' ), 
(4,'Paula','22101013','Rua 13' ), 
(5,'Ricardo','22101014' ,'Rua 14'), 
(6,'Hugo','22101015','Rua 15'),  
(7,'Pedro' ,'22101016','Rua 16');

select * from rl_exame_paciente;

insert into rl_exame_paciente 
(cd_exame, cd_convenio, matricula, dt_exame) 
values 
(1,1,1,  '2021-01-01'), 
(2,2,2,  '2021-01-02'), 
(3,3,3,  '2021-01-03'), 
(4,1,4,  '2021-01-04'), 
(5,2,1,  '2021-01-05'), 
(6,3,2,  '2021-01-06'), 
(7,1,3,  '2021-01-07'), 
(1,1,4,  '2021-01-08');

-- Incluir paciente   Matricula = 8 Paciente  =  Paulo Cunha Telefone = 20143040 Endereço = Rua 60 
select * from tb_paciente;

insert into tb_paciente  
(matricula, paciente, telefone, endereco) 
values 
(8, 'Paulo Cunha', '20143040', 'Rua 60');

-- Alterar paciente  Paulo Cunha para João Cunha na tabela tb_paciente
select * from tb_paciente;

update tb_paciente
set paciente = 'João Cunha'
where matricula = 8;

-- lista rl_exame_paciente quando cd_exame = 1
select rl.cd_exame, rl.cd_convenio, rl.matricula, rl.dt_exame, E.cd_exame
from rl_exame_paciente rl inner join tb_exame E
on rl.cd_exame = E.cd_exame
where E.cd_exame in (1);

-- Excluir cd_exame = 7 (tb_exame) (vê se é possível ? Explique ? ) 
select * from tb_exame;

delete from tb_exame
where cd_exame = 7;
-- não é possivel por causa da integridade referencial

-- Alterar o paciente Joao –(Matricula = 8)  Endereço = Rua 30 
select * from tb_paciente;
update tb_paciente
set endereco = 'Rua 30'
where matricula = 8;