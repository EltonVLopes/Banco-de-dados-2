-- 14-10-2026
-- Consulta de agregação
-- transação
-- subquery

-- revisão de calculo
use bd_pedido_0302;
select * from tb_pedido;
-- Desafio 04 – consulta  para trazer Média das comissões –  dos carros vendidos do depois  do mês 07
select avg(comissao) Media_comissao from tb_pedido
where month(dt_pedido) > 7;

-- Exercicios
use bd_rh_0302;
-- 1	Lista o ano que o funcionário nasceu (matricula, funcionário, dt_nascimento e ano)
select * from tb_funcionario
select matricula, funcionario, dt_nascimento,
year (dt_nascimento) Ano_nascimento
from tb_funcionario;

-- 2	Lista quantos anos o funcionário tem (matricula, funcionário, dt_nascimento e quantos anos)
select matricula, funcionario, dt_nascimento,
	year(curdate()) - year(dt_nascimento) as Idade
from tb_funcionario;

-- 3	Lista o total de salario que a empresa paga aos funcionários. 
select sum(salario) Total_salario from tb_funcionario;

-- Consulta de agregação
use bd_pedido_0302;
select * from tb_pedido;
-- 1.A) Lista a quantidade de veiculos vendidos ?
select V.veiculo, count(P.nr_pedido) Qtd from 
tb_veiculo V inner join tb_pedido P 
on V.cd_veiculo = P.cd_veiculo
group by V.veiculo
order by Qtd desc;

-- 1.B) Lista a quantidade de vendas dos vendedores?
select V.vendedor, P.dt_pedido from
tb_vendedor V inner join tb_pedido P
on V.cd_vendedor = P.cd_vendedor
group by V.vendedor
order by qtd desc;

-- transação
-- Exemplo – 1 – atualiza valor_pedido em 10%
start transaction;
-- 1 
select * from tb_pedido;

-- 2 
update tb_pedido
set valor_pedido = valor_pedido * 1.1
where nr_pedido < 20;

-- 3 
select * from tb_pedido;

-- 4 atualizar
-- commit;

-- 5 desfazer
rollback;

-- 6
select * from tb_pedido;

-- Exemplo – 2 – excluir os pedidos - rollback

select * from tb_pedido; 

insert into tb_pedido
(nr_pedido, dt_pedido, cd_veiculo, cd_cliente, cd_vendedor, valor_pedido,comissao)
values
(1,'2019-01-10',1,2,3,52000,0),
(2,'2019-02-20',2,3,4,49000,0),
(3,'2019-03-30',3,4,5,109000,0),
(4,'2019-04-10',4,5,1,101000,0),
(5,'2019-05-20',5,5,1,69000,0),
(6,'2019-06-30',6,1,2,63000,0),
(7,'2019-07-10',1,4,5,52000,0),
(8,'2019-08-20',1,4,5,52000,0),
(9,'2019-09-30',1,4,5,52000,0),
(10,'2019-10-10',1,4,5,52000,0);

start transaction;

-- 1 select * from tb_pedido

-- 2
delete from tb_pedido
where nr_pedido < 20;

-- 3
select * from tb_pedido;

-- 4
 -- commit;

-- 5
rollback;

-- 6
select * from tb_pedido;

-- subquery

-- Lista os livros que estão acima da media?
use bd_livro_0302;
-- media
select avg(preco) from tb_livro;

select * from tb_livro
where preco > (select avg(preco) from tb_livro);

-- lista os livros que estão acima da media da editora novatec
select * from tb_editora where editora like 'nova%';
select avg(preco) from tb_livro where cd_editora=1;
select * from tb_livro where cd_editora =1;

-- exercicio
use bd_rh_0302;

-- 1 Liste os funcionarios que estao abaixo da media salarial
-- media
select avg(salario) from tb_funcionario
select * from tb_funcionario
where salario < (select avg(salario) from tb_funcionario);

-- 2 Lista o total de funcionarios por cargo
select c.cargo, count(f.matricula) qtd
from tb_cargo c inner join tb_funcionario f
on c.cd_cargo = f.cd_cargo
group by c.cargo;


