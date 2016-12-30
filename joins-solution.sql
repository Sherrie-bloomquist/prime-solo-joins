-- 1. Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses
ON addresses.customer_id = customers.id;


-- 2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items
ON line_items.order_id = orders.id;


-- 3. Which warehouses have cheetos?
SELECT products.id FROM products WHERE description = 'cheetos'; --id = 5

SELECT warehouse.warehouse FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
WHERE warehouse_product.product_id = 5;


-- 4. Which warehouses have diet pepsi?
SELECT products.id FROM products WHERE description = 'diet pepsi'; --id = 6

SELECT warehouse.warehouse FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
WHERE warehouse_product.product_id = 6;


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers, count(orders.id) FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.id HAVING COUNT (*) >0;


-- 6. How many customers do we have?
SELECT count (*) FROM customers;


-- 7. How many products do we carry?
SELECT count (*) FROM products;


-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT products.id FROM products WHERE description = 'diet pepsi'; --id = 6
SELECT sum (on_hand) FROM warehouse_product WHERE product_id=6;
