-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT 
	pedidos.*, produtos.*
FROM
  	pedidos 
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos.id = produtos_pedidos.produto_id;

-- 2)
SELECT 
	produtos_pedidos.pedido_id
FROM
  	produtos_pedidos 
WHERE 
	produtos_pedidos.produto_id = 6;

-- 3)
SELECT
  clientes.nome as gostam_de_fritas
FROM
  clientes 
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
WHERE
  produtos_pedidos.produto_id = 6;

-- 4)
SELECT
  SUM(produtos.preço)
FROM
  pedidos 
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos.id = produtos_pedidos.produto_id
INNER JOIN clientes ON clientes.id = pedidos.cliente_id
WHERE
	clientes.nome LIKE 'Laura';

-- 5)
SELECT
  produtos.nome, COUNT(produtos_pedidos.produto_id)
FROM
  produtos
INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
GROUP BY
  produtos.nome;