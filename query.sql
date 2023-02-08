-- Busque produtos quaisquer, limitados a 5;
SELECT * FROM produtos LIMIT 5;

-- Busque clientes quaisquer da loja, limitados a 3;
SELECT * FROM clientes LIMIT 3;

-- Busque o produto com nome Televisão 43"
SELECT * FROM produtos WHERE nome = 'Televisão 43"';

-- Adicione um novo produto chamado Macbook Pro 13" com preço R$ 17.000,00
INSERT INTO produtos (nome, preco) VALUES ('Macbook Pro 13"', 1700000);

-- Orlando Pequeno Jesus agora está banido. Remova-o da lista de clientes;
DELETE  FROM clientes WHERE nome = 'Orlando Pequeno Jesus';

-- O preço do produto Pelúcia Strange Planet com Gatinho agora é R$ 80,00. Atualize no banco;
UPDATE produtos SET preco = 8000 WHERE nome = 'Pelúcia Strange Planet com Gatinho';

-- Violão Lava ME 2. Altere seu preço para R$ 9800,00. Atualize o banco.
UPDATE produtos SET preco = 980000 WHERE nome = 'Violão Lava ME 2';

-- Lucca Santarém Branco. Modifique seu CPF para o valor correto: 04652651298;
UPDATE clientes SET cpf = '04652651298' WHERE nome = 'Lucca Santarém Branco';

-- Chico Buarque de Holanda comprou o produto Violão Lava ME 2. Adicione esse registro de compra na tabela compra;
INSERT INTO compras (id_cliente, id_produto) VALUES (8,10);

-- Olga Cascais Fortunato comprou dois Celular Topo de Linha. Adicione os registros de compra na tabela compra;
INSERT INTO compras (id_cliente, id_produto) VALUES (4,8);
INSERT INTO compras (id_cliente, id_produto) VALUES (4,8);

-- Martinha Lima Zambujal devolveu o produto Fone Topo de Linha. Remova este registro da tabela compra;
DELETE FROM compras WHERE id_cliente = 5 AND id_produto = 14;

-- Busque todos os produtos ordenados pelo preço, de forma crescente.
SELECT * FROM produtos ORDER BY preco ASC;

-- Busque os 3 produtos mais baratos
SELECT * FROM produtos ORDER BY preco ASC LIMIT 3;

-- Busque o produto com o maior preço;
SELECT * FROM produtos ORDER BY preco DESC LIMIT 1;

-- Busque o produto com o segundo menor preço. 
SELECT * FROM produtos ORDER BY preco ASC LIMIT 1 OFFSET 1;

-- Busque todos os produtos com Televisão no nome.
SELECT * FROM produtos WHERE nome LIKE '%Televisão%';

-- Busque todos os produtos com preço menor que R$1000,00. 
SELECT * FROM produtos WHERE preco < 100000;

-- Busque todos os produtos com Celular no nome e preço menor que R$2000,00.
SELECT * FROM produtos WHERE preco < 200000 AND nome LIKE'%Celular%';

-- Busque todos os clientes que não fizeram uma compra. 
SELECT * FROM clientes WHERE id NOT IN (SELECT id_cliente FROM compras);

-- Busque todos os produtos comprados por Benício Freire Sampaio
SELECT * FROM produtos WHERE id IN (SELECT id_produto FROM compras WHERE id_cliente = 2);
-- OU
SELECT * FROM produtos WHERE id IN (SELECT id_produto FROM compras WHERE id_cliente IN (SELECT id FROM clientes WHERE nome = 'Benício Freire Sampaio'));
