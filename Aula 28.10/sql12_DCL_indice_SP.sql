-- 28-10-2026
-- revisao DCL
-- indice 
-- SP -- Stored procedure

-- DCL

-- listar o banco
show databases;

-- listar usuario
select user from mysql.user;

-- criar um usuario
create user Elton@localhost identified by '1234';

-- dar acesso somente de leitura (select)
grant select on bd_pedido_0302.* to Elton@localhost;

-- dar acesso a mais update ao elton
grant select, update on bd_pedido_0302.* to Elton@localhost; 

-- tirar acesso updade de elton
revoke update on bd_pedido_0302.* from Elton@localhost;

-- indice
use bd_rh_0302;

-- listar os indices
show index from tb_funcionario;

select * from tb_funcionario;

-- verificar a performace
select * from tb_funcionario
where funcionario = 'Jose Maria';
-- 0.85

-- criar um indice com funcionario
create index idx_funcionario on tb_funcionario (funcionario);

-- listar os indices apos a criação de um idx novo
show index from tb_funcionario;

-- verificar a performace apos o novo idx
select * from tb_funcionario
where funcionario = 'Jose Maria';
-- antes era 0.85 (Vermelho) para 0.35 (Verde) / como ver isso? no plano de Execução

-- SP - Stored Procedure
use bd_pedido_0302;

delimiter %%

create procedure sp_lista()
begin
	select * from tb_vendedor limit 1;
    select * from tb_pedido limit 1;
    select * from tb_veiculo limit 1;
    select * from tb_cliente limit 1;
end %%

delimiter ;

call sp_lista();




