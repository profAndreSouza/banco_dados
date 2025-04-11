-- PARTE 1
-- 1. Liste todos os produtos ordenados pelo nome.
SELECT * FROM produtos ORDER BY nome ASC;

-- 2. Liste os produtos com preço maior que R$ 100,00.
SELECT * FROM produtos WHERE preco > 100;

-- 3. Liste os produtos da categoria "Livros".
SELECT p.* FROM produtos p INNER JOIN categorias c
ON p.categoria_id = c.id WHERE LOWER(c.nome) LIKE 'livros';

SELECT * FROM produtos WHERE categoria_id IN 
	(SELECT id FROM categorias WHERE LOWER(nome) LIKE 'livros');

-- 4. Liste os 5 produtos mais caros.
SELECT * FROM produtos ORDER BY preco DESC LIMIT 5;

-- 5. Liste todos os nomes distintos de categorias com produtos cadastrados.
SELECT DISTINCT c.nome FROM produtos p INNER JOIN categorias c
ON p.categoria_id = c.id;


-- PARTE 2
-- 1. Liste o nome de cada produto e sua respectiva categoria.
SELECT c.nome AS categoria, p.nome AS produto
FROM produtos p INNER JOIN categorias c ON p.categoria_id = c.id
ORDER BY categoria, produto;

-- 2. Liste o nome do cliente, data da venda e os nomes dos produtos comprados.
SELECT v.id AS venda, c.nome AS cliente, v.data_venda, p.nome AS produto
FROM clientes c
INNER JOIN vendas v ON c.id = v.cliente_id
INNER JOIN itens_venda i ON v.id = i.venda_id
INNER JOIN produtos p ON i.produto_id = p.id;


SELECT v.id AS venda, c.nome AS cliente, v.data_venda, 
       STRING_AGG(p.nome, ', ') AS produtos
FROM clientes c
INNER JOIN vendas v ON c.id = v.cliente_id
INNER JOIN itens_venda i ON v.id = i.venda_id
INNER JOIN produtos p ON i.produto_id = p.id
GROUP BY v.id, c.nome, v.data_venda;

-- 3. Liste o total de itens vendidos por produto (nome e quantidade total).
SELECT nome, SUM(quantidade) AS total
FROM produtos p INNER JOIN itens_venda i ON p.id = i.produto_id
GROUP BY nome ORDER BY nome;

-- 4. Liste o valor total gasto por cada cliente (cliente e valor).
SELECT nome AS cliente, SUM(quantidade * preco_unitario) AS total
FROM clientes c
INNER JOIN vendas v ON c.id = v.cliente_id
INNER JOIN itens_venda i ON v.id = i.venda_id
GROUP BY nome ORDER BY nome;

-- 5. Liste o número total de vendas por estado do cliente.
SELECT estado, DATE_PART('month', v.data_venda) AS mes, COUNT(v.id) as vendas
FROM clientes c INNER JOIN vendas v ON c.id = v.cliente_id
GROUP BY estado, mes ORDER BY vendas DESC, estado ASC;


-- 6. Liste o número de produtos por categoria, do maior para o menor.
SELECT c.nome AS categoria, COUNT(p.id) AS quantidade
FROM produtos p RIGHT JOIN categorias c ON p.categoria_id = c.id
GROUP BY c.nome ORDER BY quantidade DESC, categoria ASC;


-- PARTE 3
-- 1. Qual é o produto mais vendido (em quantidade)?
SELECT nome, SUM(quantidade) AS total
FROM produtos p INNER JOIN itens_venda i ON p.id = i.produto_id
GROUP BY nome ORDER BY total DESC, nome
LIMIT 1;



WITH 
	vendas_totais AS (
		SELECT nome, SUM(quantidade) AS total
		FROM produtos p INNER JOIN itens_venda i ON p.id = i.produto_id
		GROUP BY nome
	),
	maior_venda AS (
		SELECT MAX(total) AS max_vendido
		FROM vendas_totais
	)
	
SELECT vt.nome, vt.total
FROM vendas_totais vt INNER JOIN maior_venda mv ON vt.total = mv.max_vendido;

