-- 21-10-2026
-- Revisão
-- consulta de agregação
-- transacao
-- subquery
-- Exercicio

use bd_pedido_0302;

-- Consulta de agregação
-- quantos carros foram vendidos por cada vendedor

select V.vendedor, count(P.nr_pedido) qtd from 
tb_vendedor V inner join tb_pedido P
on P.cd_vendedor = V.cd_vendedor
group by V.vendedor
order by qtd desc;

--  trasação
-- atualizar valor_pedido em 10% - rollback

-- 1 
start transaction;

-- 2
select * from tb_pedido;

-- 3
update  tb_pedido
set valor_pedido = valor_pedido * 1.1
where nr_pedido < 20;

-- 4 
select * from tb_pedido;

-- 5
-- quero atuaçizar de fato da um commit

-- 6 desfazer
rollback

-- subquery
-- lista os veiculos que foram vendidos acima da média
select avg(valor_pedido) from tb_pedido; 

-- resposta
select V.veiculo, P.valor_pedido from 
tb_pedido P inner join tb_veiculo V 
on P.cd_veiculo = V.cd_veiculo 
where P.valor_pedido >= 
(select avg(valor_pedido) from tb_pedido);

-- Exercicios
use bd_rh_0302;
-- 01 - Lista os funcionários que estão abaixo da media salarial
-- media
select avg(salario) from tb_funcionario;
-- verificar os funcionarios
select funcionario, salario from tb_funcionario 
where salario < (select avg(salario) from tb_funcionario);

-- 02 – Lista o total de funcionários por cargo
select C.cargo, count(F.matricula) qtd from
tb_funcionario F inner join tb_cargo C
on F.cd_cargo = C.cd_cargo
group by C.cargo;

-- 03 - Lista  os funcionários, cargo com salario acima da média
select avg(salario) from tb_funcionario;

-- resultado 
-- lista funcionario, cargo, salario acima da media
select F.funcionario, C.cargo, F.salario from 
tb_funcionario F inner join tb_cargo C 
on F.cd_cargo = C.cd_cargo
where salario > (select avg(salario) from tb_funcionario);

-- 04 – Atualiza em 30% a mais o salario dos funcionários E desfaz a atualização.

start transaction
select * from tb_funcionario;

update tb_funcionario
set salario = salario *1.3
where matricula < 50;

select * from tb_funcionario;
rollback
select * from tb_funcionario;
-- 05 – Exclui todos os funcionários E desfaz a atualização.
start transaction
select * from tb_funcionario;
delete from tb_funcionario
where matricula < 50;
select * from tb_funcionario;
rollback
select * from tb_funcionario;

-- Comandos DCL
show databases;

-- lista os usuarios
select user from mysql.user;

-- verificar as permições do usuario
show grants for root@localhost;

-- criar um usuario
create user cliente@localhost identified by '1234';

-- dar acesso somente de seleção de select do BD_rh_0302. para cliente@localhost
grant select on bd_rh_0302.tb_funcionario to cliente@localhost;

grant select, delete, update, insert, on bd_rh_0302.* to cliente@localhost;

-- tirar o acesso
revoke delete, update, insert on bd_rh_0302.* from cliente@localhost;
