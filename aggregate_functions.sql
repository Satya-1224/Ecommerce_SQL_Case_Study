# /*

PROJECT: E-Commerce SQL Case Study
FILE: aggregate_functions.sql

DESCRIPTION:
This file demonstrates the use of SQL Aggregate
Functions to summarize and analyze business data.

AGGREGATE FUNCTIONS COVERED:

1. COUNT()
2. AVG()
3. MAX()
4. MIN()

BUSINESS OBJECTIVE:
Generate meaningful business insights from customer,
order, and payment data using aggregate calculations.
=====================================================

*/

# /*

TOPIC: Order Count Analysis

QUESTION:
How many orders have been placed in total?

PURPOSE:
Calculate the total number of orders recorded in
the system.

BUSINESS USE:
Helps measure overall transaction volume and
business activity.

EXPECTED INSIGHT:
Provides a high-level view of total customer orders
processed by the business.
==========================

*/

SELECT
COUNT(*) AS total_orders
FROM orders;

# /*

TOPIC: Customer Order Frequency Analysis

QUESTION:
How many orders has each customer placed?

PURPOSE:
Calculate the number of orders placed by each
customer.

BUSINESS USE:
Identify the most active customers and support
customer loyalty initiatives.

EXPECTED INSIGHT:
Customers with higher order counts demonstrate
greater engagement with the business.
=====================================

*/

SELECT
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;

# /*

TOPIC: Average Payment Analysis

QUESTION:
What is the average payment amount?

PURPOSE:
Calculate the average value of all customer payments.

BUSINESS USE:
Helps estimate the average transaction value and
supports revenue forecasting.

EXPECTED INSIGHT:
Provides a benchmark for understanding typical
customer spending behavior.
===========================

*/

SELECT
AVG(amount) AS average_payment
FROM payments;

# /*

TOPIC: Highest Transaction Analysis

QUESTION:
What is the highest payment recorded?

PURPOSE:
Identify the maximum payment amount received from
a customer transaction.

BUSINESS USE:
Helps identify high-value transactions and premium
customer purchases.

EXPECTED INSIGHT:
Highlights the largest revenue-generating transaction
within the dataset.
===================

*/

SELECT
MAX(amount) AS highest_payment
FROM payments;

# /*

TOPIC: Lowest Transaction Analysis

QUESTION:
What is the lowest payment recorded?

PURPOSE:
Identify the minimum payment amount received from
a customer transaction.

BUSINESS USE:
Helps understand the lower boundary of transaction
values and customer spending.

EXPECTED INSIGHT:
Highlights the smallest transaction present in the
dataset.
========

*/

SELECT
MIN(amount) AS lowest_payment
FROM payments;

# /*

TOPIC: Average Customer Spending Analysis

QUESTION:
What is the average spending amount for each customer?

PURPOSE:
Calculate the average payment value associated with
each customer.

BUSINESS USE:
Supports customer segmentation by identifying
customers with higher average spending patterns.

EXPECTED INSIGHT:
Customers with higher average spending may represent
premium or high-value customer segments.
========================================

*/

SELECT
c.customer_name,
AVG(p.amount) AS average_spend
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_name
ORDER BY average_spend DESC;
