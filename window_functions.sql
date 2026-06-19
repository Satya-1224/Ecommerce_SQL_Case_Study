# /*

PROJECT: E-Commerce SQL Case Study
FILE: window_functions.sql

DESCRIPTION:
This file demonstrates the use of SQL Window
Functions for ranking, ordering, and analytical
reporting without collapsing rows.

SQL CONCEPTS COVERED:

1. ROW_NUMBER()
2. RANK()
3. DENSE_RANK()
4. Common Table Expressions (CTEs)
5. Customer and Product Ranking

BUSINESS OBJECTIVE:
Rank customers and products based on spending,
revenue, and sales performance to support
data-driven business decisions.
===============================

*/

# /*

TOPIC: Customer Spending Ranking

QUESTION:
How can customers be ranked from highest spender
to lowest spender?

PURPOSE:
Assign a unique rank to each customer based on
their total spending.

BUSINESS USE:
Helps identify the most valuable customers for
loyalty programs and retention strategies.

EXPECTED INSIGHT:
Customers with the highest spending appear at the
top of the ranking.
===================

*/

WITH customer_spending AS
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
)

SELECT
customer_name,
total_spent,
ROW_NUMBER() OVER (
ORDER BY total_spent DESC
) AS customer_rank
FROM customer_spending;

# /*

TOPIC: Product Revenue Ranking

QUESTION:
Which products generate the highest revenue?

PURPOSE:
Rank products based on total revenue generated.

BUSINESS USE:
Supports product prioritization, inventory planning,
and marketing strategies.

EXPECTED INSIGHT:
Products contributing the most revenue appear at
the top of the ranking.
=======================

*/

WITH product_revenue AS
(
SELECT
p.product_name,
SUM(oi.quantity * oi.price_per_unit) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
)

SELECT
product_name,
revenue,
ROW_NUMBER() OVER (
ORDER BY revenue DESC
) AS revenue_rank
FROM product_revenue;

# /*

TOPIC: Customer Leaderboard

QUESTION:
How can customers be ranked using RANK()?

PURPOSE:
Generate a spending leaderboard while allowing ties
to share the same rank.

BUSINESS USE:
Useful for customer performance reporting and
leaderboard-style dashboards.

EXPECTED INSIGHT:
Customers with equal spending receive the same rank.
====================================================

*/

WITH customer_spending AS
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
)

SELECT
customer_name,
total_spent,
RANK() OVER (
ORDER BY total_spent DESC
) AS spending_rank
FROM customer_spending;

# /*

TOPIC: Dense Customer Ranking

QUESTION:
How can customers be ranked without gaps in the
ranking sequence?

PURPOSE:
Generate rankings using DENSE_RANK().

BUSINESS USE:
Useful when continuous ranking is required for
business reporting.

EXPECTED INSIGHT:
Customers with equal spending share the same rank,
while subsequent ranks remain consecutive.
==========================================

*/

WITH customer_spending AS
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
)

SELECT
customer_name,
total_spent,
DENSE_RANK() OVER (
ORDER BY total_spent DESC
) AS dense_rank
FROM customer_spending;

# /*

TOPIC: Second Highest Spending Customer

QUESTION:
Who is the second-highest spending customer?

PURPOSE:
Identify customers occupying the second position
in spending rankings.

BUSINESS USE:
Supports customer segmentation and recognition of
top-performing customers beyond the highest spender.

EXPECTED INSIGHT:
The query returns the customer immediately below
the highest spender.
====================

*/

WITH customer_spending AS
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
),

ranked_customers AS
(
SELECT
customer_name,
total_spent,
DENSE_RANK() OVER (
ORDER BY total_spent DESC
) AS rank_num
FROM customer_spending
)

SELECT
customer_name,
total_spent
FROM ranked_customers
WHERE rank_num = 2;

# /*

TOPIC: Top 3 Customers Analysis

QUESTION:
Who are the top 3 customers by total spending?

PURPOSE:
Identify the three highest-spending customers.

BUSINESS USE:
Supports VIP customer identification and targeted
marketing initiatives.

EXPECTED INSIGHT:
The result highlights the most valuable customers
based on revenue contribution.
==============================

*/

WITH customer_spending AS
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
),

ranked_customers AS
(
SELECT
customer_name,
total_spent,
ROW_NUMBER() OVER (
ORDER BY total_spent DESC
) AS customer_rank
FROM customer_spending
)

SELECT *
FROM ranked_customers
WHERE customer_rank <= 3;
