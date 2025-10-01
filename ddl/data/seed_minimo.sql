INSERT INTO brands (brand_name) VALUES ('Trek'), ('Giant'), ('Specialized');
INSERT INTO categories (category_name) VALUES ('Mountain'), ('Road'), ('Urban');

-- Lojas
INSERT INTO stores (store_name, phone, city, state, zip_code)
VALUES ('Loja Centro', '1111-1111', 'São Paulo', 'SP', '01000-000'),
       ('Loja Norte',  '2222-2222', 'São Paulo', 'SP', '02000-000');

-- Funcionários
INSERT INTO staffs (first_name, last_name, email, active, store_id)
VALUES ('Ana','Silva','ana@bikestore.com',TRUE,1),
       ('Bruno','Souza','bruno@bikestore.com',TRUE,1),
       ('Carlos','Pereira','carlos@bikestore.com',TRUE,2);

-- Clientes (Luiza não compra para testar consulta 1)
INSERT INTO customers (first_name, last_name, email, city, state)
VALUES ('João','Oliveira','joao@mail.com','São Paulo','SP'),
       ('Maria','Santos','maria@mail.com','São Paulo','SP'),
       ('Luiza','Costa','luiza@mail.com','Guarulhos','SP');

-- Produtos (Capacete não será comprado; Trek 300 ficará sem estoque)
INSERT INTO products (product_name, brand_id, category_id, model_year, list_price)
VALUES ('Bike Trek 100', 1, 1, 2024, 3500.00),
       ('Bike Giant 200',2, 2, 2023, 4200.00),
       ('Capacete Urban',3, 3, 2024, 200.00),
       ('Bike Trek 300', 1, 1, 2025, 5200.00);

-- Estoques (Trek 300 sem registro; Capacete com zero na loja 2)
INSERT INTO stocks (store_id, product_id, quantity)
VALUES (1, 1, 10),
       (1, 2, 5),
       (2, 1, 3),
       (2, 3, 0);

-- Pedidos (apenas João e Maria)
INSERT INTO orders (customer_id, order_status, order_date, store_id, staff_id)
VALUES (1, 1, CURRENT_DATE, 1, 1),
       (2, 1, CURRENT_DATE, 2, 3);

-- Itens (não incluir o Capacete)
INSERT INTO order_items (order_id, item_id, product_id, quantity, list_price, discount)
VALUES (1, 1, 1, 2, 3500.00, 0),
       (1, 2, 2, 1, 4200.00, 0.05),
       (2, 1, 1, 1, 3500.00, 0);
