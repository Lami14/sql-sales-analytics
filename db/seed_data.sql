-- seed_data.sql
-- Insert sample data into customers, products, orders, and order_items

-- Customers
INSERT INTO customers (first_name, last_name, email, join_date) VALUES
('Alice','Smith','alice@example.com','2023-01-05'),
('Bob','Johnson','bob@example.com','2023-02-10'),
('Charlie','Brown','charlie@example.com','2023-03-15');

-- Products
INSERT INTO products (name, category, price) VALUES
('Laptop','Electronics',1200.00),
('Smartphone','Electronics',800.00),
('Desk Chair','Furniture',150.00),
('Notebook','Office Supplies',5.00);

-- Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1,'2023-01-15'),
(1,'2023-02-20'),
(2,'2023-03-05'),
(3,'2023-03-20');

-- Order items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1,1,1),
(1,4,3),
(2,2,2),
(3,3,1),
(3,4,5),
(4,1,1),
(4,2,1);
