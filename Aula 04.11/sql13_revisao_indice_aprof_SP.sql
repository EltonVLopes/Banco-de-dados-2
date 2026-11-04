-- 04-11-2026
-- indice
-- Storad Procedure 

use bd_rh_0302;

show index from tb_funcionario;

-- apagar o indice idx_funcionario
drop index idx_funcionario on tb_funcionario;

select * from tb_funcionario
where matricula = 6;
-- 0.1 no plano de execução, pq foi feito uma pesquisa pelo campo chave/Indice

select * from tb_funcionario
where funcionario = 'Jose Alberto';
-- 0.85 no plano de execulção, foi maior pq a pesquisa nao foi feita pelo campo chave/ index

-- criar um indice no campo funcionario
create index idx_nome on tb_funcionario (funcionario);

-- lista os index
show index from tb_funcionario;

-- consulta apos criar novo index
select * from tb_funcionario
where funcionario = 'Jose Alberto';
-- 0.35 no plano de execução

-- exercicio
-- select * from tb_genero where genero = 'computacao';
-- vereificar o cost
-- pode melhorar?
-- criar o indice
-- melhorou quanto?
use bd_livro_0302;

select * from tb_genero
where genero = 'computacao';
-- 0.95 a consulta sem o indice

-- criar o indice
create index idx_genero on tb_genero (genero);

select * from tb_genero
where genero = 'computacao';
-- 0.35 apos a consulta com o novo indice

-- -- 2 exercicio 
use bd_livro_0302;

select L.isbn, L.titulo, E.editora from tb_livro L 
Inner join tb_editora E 
On L.cd_editora = E.cd_editora
Where E.editora = 'novatec';
-- 1.15 a consulta

create index idx_editora on tb_editora (editora);

show index from tb_editora;

-- consulta apos criação de indice
select L.isbn, L.titulo, E.editora from tb_livro L 
Inner join tb_editora E 
On L.cd_editora = E.cd_editora
Where E.editora = 'novatec';
-- 0.35 apos o novo index

-- 3 exercicio 
-- select * from tb_livro Where titulo = "Banco de dados";
-- verificar o cost 1.75
-- Pode melhorar? Sim
-- lista os indices
-- criar o indice
-- melhorou quanto? 0.35

select * from tb_livro Where titulo = "Banco de dados";
-- 1.45 sem idex

create index idx_titulo on tb_livro (titulo);

-- apos a criação do indice
select * from tb_livro Where titulo = "Banco de dados";
-- 0.35 consulta com o novo indice

-- Stored procedure SP
use bd_pedido_0302;

delimiter $$
create procedure sp_01R()
begin
	select * from tb_cliente limit 1;
	select * from tb_pedido limit 1;
	select * from tb_veiculo limit 1;
    select * from tb_vendedor limit 1;
end $$

delimiter ;

-- execultar SP Stored procedure
call sp_01R()

-- exercicio 2
-- crie uma stored procedure sp_02()
-- nr_pedido, dt_pedido, vl_pedido

delimiter %%
create procedure sp_02()
begin
select nr_pedido, dt_pedido, valor_pedido
from tb_pedido;

end %%
delimiter ;

call sp_02();

-- stored procedure com parametro

select * from tb_vendedor;
-- cd_vendedor ate o 5

delimiter ##
create procedure sp_ivendedor(vcd_vendedor int, 
                              vvendedor char(50))
begin 
   select * from tb_vendedor; 
   
   insert into tb_vendedor 
   (cd_vendedor, vendedor) 
   values 
   (vcd_vendedor, vvendedor); 
   
   select * from tb_vendedor; 
   
end ##

delimiter ; 


