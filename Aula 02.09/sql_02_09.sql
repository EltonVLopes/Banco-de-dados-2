-- 02-09-26
-- Backup e restore
-- comandos de restrição

use bd_rh_0302;

select * from tb_funcionario
where funcionario = 'Ana Clara';

select * from tb_funcionario
where matricula = 1;

-- predicados and or

select * from tb_funcionario
where cd_cargo = 1 and cd_setor = 1;

select * from tb_funcionario
where cd_cargo = 1 or cd_setor = 1;

select * from tb_funcionario
where salario between 1000 and 6000;

select * from tb_funcionario
where funcionario like 'jose%';

-- lista todos funcionarios que contem a letra (a)
select * from tb_funcionario
where funcionario like '%a%';


select * from tb_funcionario
where cd_setor in (1,3);

-- Deixa em ordem alfabetica
select * from tb_funcionario
order by funcionario;
-- decrescente
select * from tb_funcionario
order by funcionario desc;

select * from tb_funcionario
order by cd_cargo, funcionario;

-- quantidade de registro
select * from tb_funcionario limit 2;

-- lista os 2 ultimos registros
select * from tb_funcionario;

select * from tb_funcionario
order by matricula desc limit 2;

select * from tb_funcionario;

-- distinet
-- valores distintos

select distinct cd_cargo from tb_funcionario;

-- Exercicios slide
--    01)  Alterar na tabela tb_funcionario  matricula = 1  salario (7000)

update tb_funcionario
set salario = 7000
where matricula = 1;

--    02)  Alterar – aumentar os salarios dos tb_funcionarios em 10%
select * from tb_funcionario
update tb_funcionario
set salario = salario * 1.1
where matricula < 20;
--    03)  Listar a tabela (tb_funcionario)  salario > 5000
select * from tb_funcionario

select * from tb_funcionario
where salario > 5000;

--    04) Lista os funcionários começa com a letra J
select * from tb_funcionario

select * from tb_funcionario
where funcionario like'j%';

--    05) Lista os funcionários que tem salario entre 5000 e 10000
select * from tb_funcionario

select * from tb_funcionario
where salario between 5000 and 10000;

--    06) Lista os funcionários do setor 1 e cargo 1
select * from tb_funcionario

select * from tb_funcionario
where cd_setor = 1 and cd_cargo = 1;


