select * from employees;
select * from products;
select * from orders;
select * from customers;







create table customerss(
	customerid INT primary key,
	firstname CHAR (20),
	lastname CHAR (20),
	country CHAR (50),
	score INT 
);

create table employeess(
	employeeid INT primary key,
	firstname CHAR (20),
	lastname CHAR (20),
	department CHAR (50),
	birthdate date, 
	gender CHAR (1),
	salary INT,
	managerid INT
	
); 

CREATE TABLE productss (
    productid   INT PRIMARY KEY,
    product     TEXT,
    category    TEXT,
    price       NUMERIC
);

-- Foreign key constraint of 3 other tables added to table orderss
CREATE TABLE orderss (
    orderid        INT PRIMARY KEY,
    productid      INT REFERENCES products(productid),
    customerid     INT REFERENCES customers(customerid),
    salespersonid  INT REFERENCES employees(employeeid),
    orderdate      DATE,
    shipdate       DATE,
    orderstatus    TEXT,
    shipaddress    TEXT,
    billaddress    TEXT,
    quantity       INT,
    sales          NUMERIC,
    creationTime   TIMESTAMP WITHOUT TIME ZONE
);


-- Delete the table customerss from the database
drop table customerss
-- Delete the table employeess from the database
drop table employeess
-- Delete the table orderss from the database
drop table orderss
-- Delete the table productss from the database
drop table productss

/*=================================================================================*/

-- one SQL query that returns a single row containing the count of rows in table customers
SELECT
  (SELECT COUNT(*) FROM customers )AS customers_count,
  (SELECT COUNT(*) FROM employees )AS employees_count,
  (SELECT COUNT(*) FROM products )AS products_count,
  (SELECT COUNT(*) FROM orders) AS orders_count; 


/*========COMPARISON OPERATOR (=, <>, >, <=), LOGICAL OPERATOR  ================= */

-- This query returns where the quantity is 3 or more,
-- OR the order status is 'shipped'.
SELECT * FROM orders where quantity >= 3 OR orderstatus = 'shipped'; 


-- Selects all records from the 'orders' table where the order date
-- is between January 1, 2025, and March 10, 2025.
SELECT * FROM orders where orderdate BETWEEN '2025-01-01' AND '2025-03-10';

-- Selects all records from the 'orders' table where the sales value
-- is between 10 and 60.
select * from orders where sales >= 10 AND sales <= 60; 

-- Selects all records from the 'orders' table where the order status
-- is not 'delivered' and the customer ID is 4.
Select * From orders Where NOT orderstatus = 'delivered' AND customerid = 4; 



/*========BETWEEN, IN, LIKE practice  ================= */
--Contains s (LIKE)
Select * from customers where firstname LIKE '%s%';

--SQL IN
Select firstname from customers where country IN ('Germany')

--BETWEEN
SELECT * FROM customers WHERE score BETWEEN 100 AND 500;



/*================================== INNER JOIN=============================================== */
SELECT 
    o.orderid,
    o.orderdate,
    p.product,
    c.firstname,
    o.quantity,
    o.sales
FROM orders o
INNER JOIN products p ON o.productid = p.productid
INNER JOIN customers c ON o.customerid = c.customerid
ORDER BY orderdate,orderid; 


/*================================== LEFT JOIN=============================================== */
select 
    p.productid,
    p.product,
    p.category,
    o.orderid,
    o.quantity,
    o.sales
from products p
left join orders o on p.productid = o.productid
order by quantity desc; 


-- Find the total sales by product (GROUP BY)=======================

SELECT 
    productid,
    SUM(sales) AS total_sales
FROM orders
GROUP BY productid
ORDER BY total_sales DESC;

--..Total number of orders handled by each employee --Total sales by product (descending)=======================
SELECT 
    salespersonid,
    COUNT(orderid) AS totalorders
FROM orders
GROUP BY salespersonid
ORDER BY totalorders DESC;



-- DUMMY PRODUCT 
-- Insert a new record with full column values

INSERT INTO products (productid, product, category, price)
VALUES 
    (106, 'Jackets', 'Clothing', 50);

-- Update orders where shipdate is null
update orders
set shipdate = orderdate + 5
where shipdate is null; 

-- Delete dummy product with  ID 106
DELETE FROM products
WHERE productid =106;
	