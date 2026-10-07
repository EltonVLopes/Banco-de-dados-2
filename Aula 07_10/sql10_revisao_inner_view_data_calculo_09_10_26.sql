-- 07-10-2026
-- Revisao com aprofundamento
-- inner join outer join
-- view
-- data
-- calculo
-- exercicio

-- Exercicio

use bd_rh_0302;
select * from tb_funcionario;
select * from tb_cargo;
-- 1	Lista os cargos que não tem funcionário 
select c.cargo,  f.funcionario
from tb_cargo c left outer join tb_funcionario f
on c.cd_cargo = f.cd_cargo
where f.funcionario is null;

-- 2	Lista o setor que não tem funcionário
select s.setor, f.funcionario from
tb_funcionario f right outer join tb_setor s
on f.cd_setor = s.cd_setor
where f.funcionario is null;

-- comandos com data
use bd_pedido_0302;

select dt_pedido,
year(dt_pedido) as Ano_pedido,
month(dt_pedido) as mes_pedido,
day(dt_pedido) as dia_pedido,
curdate() as data_abreviada,
datediff(curdate(), dt_pedido) as qtd_dias
from tb_pedido;

-- comandos de calculo
select comissao,
comissao+100 as '+100',
comissao*1.1 as '+10%',
comissao*0.5 as '-50%'
from tb_pedido;

-- Desafio
select * from tb_pedido;
-- Desafio 04 – consulta  para trazer Média das comissões –  dos carros vendidos do ANTES do mês 07
select avg(comissao) as comissao_07 from tb_pedido
where month(dt_pedido) < 7;

-- Exercicios
use bd_rh_0302;
-- 1	Lista o ano que o funcionário nasceu (matricula, funcionário, dt_nascimento e ano)
select matricula, funcionario, dt_nascimento, year(dt_nascimento) Ano_nascimento
from tb_funcionario;

-- 2	Lista quantos anos o funcionário tem (matricula, funcionário, quantos anos)
select matricula, funcionario, dt_nascimento,
year(now())- year(dt_nascimento) as idade
from tb_funcionario;

-- 3	Lista o total de salario que a empresa paga aos funcionários. 
select * from tb_funcionario;
select sum(salario) as total_salario from tb_funcionario;

--  01 Lista a media de salario que a empresa paga aos funcionários. 
 select avg(salario) as media_salario from tb_funcionario;
 
 
--  02 Lista os aniversariantes que nasceram antes do mês 07
select * from tb_funcionario
where month(dt_nascimento) < 7;






