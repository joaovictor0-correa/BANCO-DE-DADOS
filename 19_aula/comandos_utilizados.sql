USE loja;

SELECT * from pedido;

SELECT * from pedido
where cliente_nome like "Carlos%";

SELECT pedido.id as Pedido, pedido.cliente_nome, pedido.data_pedido,
pedido_item.id_estoque, pedido_item.quantidade 
FROM pedido JOIN pedido_item
ON pedido.id = pedido_item.id_pedido
where pedido.cliente_nome like "Carlos%"; 

CREATE VIEW Vendas AS 
SELECT pedido.id as Pedido, pedido.cliente_nome, pedido.data_pedido,
pedido_item.id_estoque, pedido_item.quantidade 
FROM pedido JOIN pedido_item
ON pedido.id = pedido_item.id_pedido;

SELECT * FROM Vendas;



