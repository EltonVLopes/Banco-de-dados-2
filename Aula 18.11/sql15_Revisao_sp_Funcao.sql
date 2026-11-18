-- 18-11-2026
-- revisao SP
-- funçoes

-- exercicios de sp

use bd_pedido_0302;
-- exercicico de SP 
-- 01  Criar uma stored procedure - sp_10 
-- para Alterar o nome do cliente
-- in – código do cliente, novo nome

delimiter $$
create procedure sp_10(in Vcd_cliente int, in Vcliente char(30))
begin

select * from tb_cliente;

select * from tb_cliente where cd_cliente = Vcd_cliente;

update tb_cliente
set cliente = Vcliente
where cd_cliente = Vcd_cliente;

select * from tb_cliente;
end $$
delimiter ;

call sp_10(8,'Isabella Medeiros');

-- 02 Criar uma sp_11 - 
-- Na tabela tb_vendedor  (cd_vendedor INT, vendedor CHAR(30)), 
-- crie uma Stored Procedure que 
-- 1 liste os clientes 
-- 2 identifique o maior cd_vendedor. 
-- 3 insira um novo vendedor recebido por parâmetro, 
-- utilizando cd_vendedor + 1, 
-- 4 liste novamente todos os registros.

select * from tb_vendedor;
delimiter %%
create procedure sp_11D(in Vvendedor char(30))
begin 
declare Vcd_vendedor int; 

     -- 1 listar os vendedores
     select * from tb_vendedor; 
     
     -- 2 descobrir qual é a proxima chave primaria
     select max(cd_vendedor) + 1 into Vcd_vendedor from tb_vendedor; 
     
     -- 3 inserir os vendedores 
     insert into tb_vendedor 
     (cd_vendedor, vendedor) 
     values 
     (Vcd_vendedor, Vvendedor); 
     
     -- 4 listar os vendedores
     select * from tb_vendedor; 

end %% 
delimiter ; 
call sp_11D('Brincadeira');

-- funcao

-- 1  
-- Lista nr_pedido, dt_pedido, valor_pedido,  
-- funcao  MAIOR VALOR DE VENDA,  
-- (MAIOR VALOR DE VENDA - valor_pedido)  DIFERENÇA

delimiter $$ 
create function fc_maior()
returns decimal(8,2)
deterministic 
begin 
    declare maior decimal(8,2);
    
    select max(valor_pedido) into maior from tb_pedido; 
    return(maior);
end $$
delimiter ;

select fc_maior() as maior;

select nr_pedido, valor_pedido, 
       fc_maior(),
       fc_maior() - valor_pedido as diferenca
       from tb_pedido;
       
-- Lista a quantidade de registro por determinado cd_veiculo

select count(*) from tb_pedido 
where cd_veiculo = 1; 

delimiter $$ 
create function fc_qtd(Vcd_veiculo int)
returns int
deterministic 
begin 
   declare qtd int;
   
   select count(*) into qtd from tb_pedido 
   where cd_veiculo = Vcd_veiculo; 
   return(qtd);
   
end $$ 
delimiter ; 

select fc_qtd(1) as quantidade; 

select nr_pedido, dt_pedido, cd_veiculo, 
       fc_qtd(cd_veiculo) as quantidade from tb_pedido;
       
-- Exercicio 

-- 01  Criar uma função - fc_ex_01  para listar o ano da pessoa mais velha

select max(year(dt_nascimento)) idade from tb_funcionario; 


delimiter %%
create function fc_velha() 
returns int
deterministic
begin 
  declare Vano int; 
  select min(year(dt_nascimento)) into Vano from tb_funcionario; 
  return(Vano);
end %%
delimiter ; 

select fc_velha() AnoMaisVelho;

-- Lista matricula, funcionário, fc_ex_01, ano, dt_nascimento tb_funcionario 
select matricula, funcionario, fc_velha() AnoMaisVelho, 
       year(dt_nascimento) ano, 
       dt_nascimento from tb_funcionario;





