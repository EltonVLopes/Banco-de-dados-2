-- 11-11-2026
-- revisao com aprofundamento do Stored Procedure


-- 1 crie um sp - sp_01A()
-- que liste nr_pedido, dt_pedido, veiculo, valor_pedido

use bd_pedido_0302;


delimiter $$
create procedure sp_01a()
begin 

   select P.nr_pedido, P.dt_pedido, V.veiculo, P.valor_pedido 
   from tb_pedido P inner join tb_veiculo V 
   on P.cd_veiculo = V.cd_veiculo; 
  
end $$ 

delimiter ; 

call sp_01a();

-- Criar uma sp_02A  para Incluir cliente 
-- 1 lista os clientes
-- incluir o cd_cliente e cliente
-- 2 lista os clientes
-- cd_cliente = 7 e cliente = (olivia nobrega)
select * from tb_cliente;

delimiter $$
create procedure sp_02A(in vcd_cliente int, in vcliente char(30))
begin
select * from tb_cliente;

insert into tb_cliente
 (cd_cliente, cliente)
values
(vcd_cliente, vcliente);

select * from tb_cliente;
end $$
delimiter ;

call sp_02A(7, 'Olivia Nobrega');

-- crie uma sp
-- descobrir qual é a ultima chave primaria
-- soma +1
-- incluir registro

delimiter %% 
create procedure sp_02b(in vcliente char(30))
begin 
-- quero descobrir o ultimo valor para chave primaria 
declare vcd_cliente int; 

-- lista os clientes
   select * from tb_cliente; 

-- descobrir quem é o o maior valor 
	select max(cd_cliente) +1  into vcd_cliente from tb_cliente; 

-- inserir na tb_cliente 
   insert into tb_cliente 
   (cd_cliente, cliente)
   values 
   (vcd_cliente, vcliente); 

-- lista os clientes
   select * from tb_cliente; 

end %%
delimiter ; 

call sp_02b ('Isabella Nobrega');

-- Exercicio 
-- 01
-- Criar uma stored procedure - sp_07A  para listar 
-- (nr_pedido, dt_pedido, cliente, valor_pedido, comissao) tb_pedido e tb_cliente
 
 delimiter $$
 create procedure sp_07A()
 begin 
	select P.nr_pedido, P.dt_pedido, C.cliente, P.valor_pedido, P.comissao 
    from tb_pedido P inner join tb_cliente C
    on P.cd_cliente = C.cd_cliente;
 end $$
 delimiter ;
 
 call sp_07A();
-- 02
-- Criar uma stored procedure - sp_07B  para Alterar o nome do cliente
-- in – código do cliente, novo nome

delimiter %%
create procedure sp_07B(in vcd_cliente int, in v_newcliente char(30))
begin

select * from tb_cliente;

update tb_cliente
set cliente = v_newcliente
where cd_cliente = vcd_cliente;

select * from tb_cliente
order by cd_cliente;
end %%
delimiter ;

call sp_07B(1, 'Neymar');

-- 03
-- Criar uma sp_07C - Na tabela tb_vendedor  (cd_vendedor INT, vendedor CHAR(30)), 
-- crie uma Stored Procedure que 
-- liste os vendedores  identifique o maior cd_vendedor. 
-- insira um novo vendedor recebido por parâmetro, utilizando cd_vendedor + 1, 
-- liste novamente todos os registros.

delimiter %%
create procedure sp_07C(in v_new_vendedor char(30))
begin
declare vcd_vendedor int;
    select * from tb_vendedor order by cd_vendedor;
    
    select max(cd_vendedor) +1 into vcd_vendedor from tb_vendedor;
    
    insert into tb_vendedor
    (cd_vendedor, vendedor)
    values
    (vcd_vendedor, v_new_vendedor);
    
    select * from tb_vendedor order by cd_vendedor;
    
end %%
delimiter ;

call sp_07C('Pedro Ryan');
