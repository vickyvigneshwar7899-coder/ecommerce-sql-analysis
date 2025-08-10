
SELECT * 
FROM orders
LIMIT 10;

SELECT p.category_name AS ProductCategory,
       SUM(oi.unit_price * oi.quantity) AS TotalSales
FROM order_items AS oi
JOIN products AS p ON oi.product_id = p.id
GROUP BY p.category_name;

SELECT c.id AS CustomerID, c.name AS CustomerName,
       SUM(o.total_amount) AS TotalSpend
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY TotalSpend DESC
LIMIT 5; 

SELECT YEAR(order_date) AS Year,
       MONTH(order_date) AS Month,
       SUM(total_amount) AS MonthlySales
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;

SELECT p.id AS ProductID, p.name AS ProductName
FROM products AS p
LEFT JOIN order_items AS oi ON p.id = oi.product_id
WHERE oi.order_id IS NULL;

SELECT o.id AS OrderID, o.customer_id AS CustomerID, o.order_date AS OrderDate
FROM orders AS o
LEFT JOIN payments AS p ON p.order_id = o.id
WHERE p.id IS NULL;

CREATE VIEW top_selling_products AS
SELECT p.id AS ProductID, p.name AS ProductName,
       SUM(oi.quantity) AS TotalSold
FROM order_items AS oi
JOIN products AS p ON oi.product_id = p.id
GROUP BY p.id, p.name
ORDER BY TotalSold DESC;
