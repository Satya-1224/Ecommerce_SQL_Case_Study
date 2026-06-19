# /*

PROJECT: E-Commerce SQL Case Study
FILE: having_clause.sql

DESCRIPTION:
This file demonstrates the use of the HAVING clause
to filter grouped data after aggregation.

SQL CONCEPTS COVERED:

1. GROUP BY
2. HAVING
3. Aggregate Functions
4. Business Rule Filtering

BUSINESS OBJECTIVE:
Identify customers, products, payment methods,
and categories that satisfy specific performance
criteria.
=========

*/

# /*

TOPIC: Customer Order Frequency Analysis

QUESTION:
Which customers have placed more than one order?

PURPOSE:
Identify customers with multiple purchases.

BUSINESS USE:
Helps identify repeat customers and evaluate
customer loyalty.

EXPECTED INSIGHT:
Customers appearing in the result set have made
multiple purchases and may represent loyal customers.
=====================================================

*/

SELECT
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

# /*

TOPIC: Product Demand Analysis

QUESTION:
Which products have sold more than one unit?

PURPOSE:
Identify products with strong customer demand.

BUSINESS USE:
Supports inventory planning and product performance
evaluation.

EXPECTED INSIGHT:
Products appearing in the result have higher sales
volumes and stronger customer demand.
=====================================

*/

SELECT
p.product_name,
SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity) > 1
ORDER BY total_quantity_sold DESC;

# /*

TOPIC: Payment Method Revenue Analysis

QUESTION:
Which payment methods generated more than ₹5000
in revenue?

PURPOSE:
Identify high-performing payment methods based on
revenue contribution.

BUSINESS USE:
Supports payment gateway optimization and helps
understand customer payment preferences.

EXPECTED INSIGHT:
Payment methods generating higher revenue are more
important to customer transactions.
===================================

*/

SELECT
payment_method,
SUM(amount) AS total_revenue
FROM payments
GROUP BY payment_method
HAVING SUM(amount) > 5000
ORDER BY total_revenue DESC;

# /*

TOPIC: Category Profitability Analysis

QUESTION:
Which product categories generated more than
₹10,000 in revenue?

PURPOSE:
Identify categories contributing significantly to
overall revenue.

BUSINESS USE:
Supports inventory allocation, marketing investment,
and category expansion decisions.

EXPECTED INSIGHT:
High-performing categories represent key revenue
drivers for the business.
=========================

*/

SELECT
p.category,
SUM(oi.quantity * oi.price_per_unit) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
HAVING SUM(oi.quantity * oi.price_per_unit) > 10000;
