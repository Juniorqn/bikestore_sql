-- PostgreSQL DDL para o modelo Bike Store (mínimo funcional)

DROP TABLE IF EXISTS order_items, orders, stocks, products, categories, brands,
                     customers, stores, staffs CASCADE;

CREATE TABLE customers (
  customer_id   SERIAL PRIMARY KEY,
  first_name    VARCHAR(50) NOT NULL,
  last_name     VARCHAR(50) NOT NULL,
  email         VARCHAR(120),
  street        VARCHAR(120),
  city          VARCHAR(60),
  state         VARCHAR(60),
  zip_code      VARCHAR(20)
);

CREATE TABLE stores (
  store_id    SERIAL PRIMARY KEY,
  store_name  VARCHAR(100) NOT NULL,
  phone       VARCHAR(30),
  street      VARCHAR(120),
  city        VARCHAR(60),
  state       VARCHAR(60),
  zip_code    VARCHAR(20)
);

CREATE TABLE staffs (
  staff_id    SERIAL PRIMARY KEY,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  email       VARCHAR(120),
  active      BOOLEAN DEFAULT TRUE,
  store_id    INT REFERENCES stores(store_id)
);

CREATE TABLE brands (
  brand_id    SERIAL PRIMARY KEY,
  brand_name  VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
  category_id   SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
  product_id   SERIAL PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  brand_id     INT REFERENCES brands(brand_id),
  category_id  INT REFERENCES categories(category_id),
  model_year   INT,
  list_price   NUMERIC(12,2) NOT NULL
);

CREATE TABLE stocks (
  store_id   INT REFERENCES stores(store_id),
  product_id INT REFERENCES products(product_id),
  quantity   INT DEFAULT 0,
  PRIMARY KEY (store_id, product_id)
);

CREATE TABLE orders (
  order_id     SERIAL PRIMARY KEY,
  customer_id  INT REFERENCES customers(customer_id),
  order_status SMALLINT DEFAULT 1,
  order_date   DATE NOT NULL,
  required_date DATE,
  shipped_date  DATE,
  store_id     INT REFERENCES stores(store_id),
  staff_id     INT REFERENCES staffs(staff_id)
);

CREATE TABLE order_items (
  order_id   INT REFERENCES orders(order_id) ON DELETE CASCADE,
  item_id    INT NOT NULL,
  product_id INT REFERENCES products(product_id),
  quantity   INT NOT NULL,
  list_price NUMERIC(12,2) NOT NULL,
  discount   NUMERIC(4,2) DEFAULT 0,
  PRIMARY KEY (order_id, item_id)
);

-- Índices úteis
CREATE INDEX idx_orders_customer   ON orders(customer_id);
CREATE INDEX idx_order_items_prod  ON order_items(product_id);
CREATE INDEX idx_products_brand    ON products(brand_id);
CREATE INDEX idx_orders_store      ON orders(store_id);

