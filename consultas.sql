-- A) Clientes que NUNCA realizaram uma compra
SELECT 'A) Clientes sem compra' AS titulo, *
FROM (
  SELECT c.customer_id, c.first_name, c.last_name, c.email
  FROM customers c
  LEFT JOIN orders o ON o.customer_id = c.customer_id
  WHERE o.customer_id IS NULL
  ORDER BY c.customer_id
) q;

-- B) Produtos que NUNCA foram comprados
SELECT 'B) Produtos nunca comprados' AS titulo, *
FROM (
  SELECT p.product_id, p.product_name, p.model_year, p.list_price
  FROM products p
  LEFT JOIN order_items oi ON oi.product_id = p.product_id
  WHERE oi.product_id IS NULL
  ORDER BY p.product_id
) q;

-- C) Produtos SEM ESTOQUE (quantidade nula ou zero)
SELECT 'C) Produtos sem estoque (0 ou nulo)' AS titulo, *
FROM (
  SELECT p.product_id, p.product_name, COALESCE(s.quantity, 0) AS quantity
  FROM products p
  LEFT JOIN stocks s ON s.product_id = p.product_id
  WHERE s.quantity IS NULL OR s.quantity = 0
  ORDER BY p.product_id
) q;

-- D) Quantidade vendida por MARCA e LOJA
SELECT 'D) Vendas por marca e loja' AS titulo, *
FROM (
  SELECT b.brand_name, st.store_name, SUM(oi.quantity) AS total_vendido
  FROM order_items oi
  JOIN products p ON p.product_id = oi.product_id
  JOIN brands   b ON b.brand_id   = p.brand_id
  JOIN orders   o ON o.order_id   = oi.order_id
  JOIN stores   st ON st.store_id = o.store_id
  GROUP BY b.brand_name, st.store_name
  ORDER BY b.brand_name, st.store_name
) q;

-- E) Vendas por LOJA de UMA MARCA específica (troque a marca se quiser)
SELECT 'E) Vendas por loja para marca Trek' AS titulo, *
FROM (
  SELECT st.store_name, b.brand_name, SUM(oi.quantity) AS total_vendido
  FROM order_items oi
  JOIN products p ON p.product_id = oi.product_id
  JOIN brands   b ON b.brand_id   = p.brand_id
  JOIN orders   o ON o.order_id   = oi.order_id
  JOIN stores   st ON st.store_id = o.store_id
  WHERE b.brand_name = 'Trek'     -- altere aqui se desejar
  GROUP BY st.store_name, b.brand_name
  ORDER BY st.store_name
) q;

-- F) Funcionários que NÃO estão relacionados a pedidos
SELECT 'F) Funcionários sem pedidos' AS titulo, *
FROM (
  SELECT s.staff_id, s.first_name, s.last_name, s.email
  FROM staffs s
  LEFT JOIN orders o ON o.staff_id = s.staff_id
  WHERE o.staff_id IS NULL
  ORDER BY s.staff_id
) q;
