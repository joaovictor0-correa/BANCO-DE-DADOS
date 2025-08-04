/*Crie uma view que liste todos os produtos, incluindo o nome da categoria e o nome da marca. 
A view deve ter as seguintes colunas: produto_id, produto_nome, categoria_nome, 
marca_nome.
Dica: Use JOINs entre as tabelas produto, categoria e marca.*/

use loja;
create view vw_produtos_completo as
select produto.id, produto.nome "Produto", categoria.nome "Categoria", marca.nome "Marca"
from produto join categoria on produto.id_categoria = categoria.id
join marca on produto.id_marca = marca.id
order by produto.id;

select * from vw_produtos_completo;

/*Exercício 2: vw_estoque_baixo
Crie uma view que mostre os produtos com quantidade em estoque menor ou igual a 5. A view deve listar produto_nome, tamanho, cor e quantidade.
Dica: Use JOINs entre produto e estoque, e adicione uma cláusula WHERE para filtrar a quantidade.*/

create view vw_estoque_baixo as
select produto.nome, estoque.tamanho, estoque.cor, estoque.quantidade
from produto join estoque on produto.id = estoque.id_produto
where estoque.quantidade<=5;

select * from vw_estoque_baixo;