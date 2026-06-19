# /*

PROJECT: E-Commerce SQL Case Study
FILE: subqueries.sql

DESCRIPTION:
This file demonstrates the use of SQL Subqueries
to solve business problems involving comparisons,
ranking, and filtering based on aggregated values.

SQL CONCEPTS COVERED:

1. Scalar Subqueries
2. Nested Subqueries
3. Derived Tables
4. Aggregate Comparisons

BUSINESS OBJECTIVE:
Identify high-value products and customers by
comparing records against averages and maximum values.
======================================================

*/

# /*

TOPIC: Premium Product Analysis

QUESTION:
Which product has the highest price?

PURPOSE:
Identify the most expensive product in the catalog.

BUSINESS USE:
Supports premium product analysis and pricing
strategy evaluation.

EXPECTED INSIGHT:
The product returned by the query represents the
highest-priced offering in the catalog.
=======================================

*/

SELECT
product_name,
price
FROM products
WHERE price =
(
SELECT MAX(price)
FROM products
);

# /*

TOPIC: Above Average Pricing Analysis

QUESTION:
Which products are priced above the average
product price?

PURPOSE:
Identify products whose prices exceed the catalog
average.

BUSINESS USE:
Supports premium product segmentation and helps
identify high-value inventory.

EXPECTED INSIGHT:
Products returned by the query are positioned above
the average pricing level.
==========================

*/

SELECT
product_name,
price
FROM products
WHERE price >
(
SELECT AVG(price)
FROM products
)
ORDER BY price DESC;

# /*

TOPIC: Highest Spending Customer Analysis

QUESTION:
Who is the highest spending customer?

PURPOSE:
Identify the customer contributing the highest
overall revenue.

BUSINESS USE:
Supports customer loyalty programs, retention
strategies, and VIP customer identification.

EXPECTED INSIGHT:
The returned customer represents the highest revenue
contributor in the dataset.
===========================

*/

SELECT
customer_name,
total_spent
FROM
(
SELECT
c.customer_name,
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_name
) customer_spending
WHERE total_spent =
(
SELECT MAX(total_spent)
FROM
(
SELECT
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_name
) spending
);

# /*

TOPIC: High Value Customer Analysis

QUESTION:
Which customers spend more than the average
customer?

PURPOSE:
Identify customers whose total spending exceeds
the average spending level.

BUSINESS USE:
Supports customer segmentation, targeted marketing,
and loyalty program planning.

EXPECTED INSIGHT:
Customers returned by the query represent the
business's most valuable customer segment.
==========================================

*/

SELECT
customer_name,
total_spent
FROM
(
SELECT
c.customer_name,
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_name
) customer_totals
WHERE total_spent >
(
SELECT AVG(total_spent)
FROM
(
SELECT
SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_name
) averages
);
