# /*

PROJECT: E-Commerce SQL Case Study
FILE: data.sql

DESCRIPTION:
This script populates the E-Commerce database with
sample data required for business analysis and
reporting.

DATA INCLUDED:

1. Customers
2. Products
3. Orders
4. Order Items
5. Payments

=========================================================
*/

# /*

TOPIC: Customer Data Population

QUESTION:
How can customer information be loaded into the
database for analysis?

PURPOSE:
Insert customer records including personal details,
location, and signup date.

BUSINESS USE:
Customer data is used for customer segmentation,
retention analysis, purchase behavior analysis,
and geographical insights.

EXPECTED INSIGHT:
Provides the foundation for understanding customer
demographics and purchasing patterns.
=====================================

*/

INSERT INTO customers (
customer_name,
email,
city,
signup_date
)
VALUES
('Rahul Sharma', '[rahul@gmail.com](mailto:rahul@gmail.com)', 'Hyderabad', '2025-01-10'),
('Priya Reddy', '[priya@gmail.com](mailto:priya@gmail.com)', 'Chennai', '2025-02-15'),
('Arjun Kumar', '[arjun@gmail.com](mailto:arjun@gmail.com)', 'Bangalore', '2025-03-05'),
('Sneha Patel', '[sneha@gmail.com](mailto:sneha@gmail.com)', 'Mumbai', '2025-04-20'),
('Vikram Singh', '[vikram@gmail.com](mailto:vikram@gmail.com)', 'Delhi', '2025-05-01');

# /*

TOPIC: Customer Data Verification

QUESTION:
Were customer records inserted successfully?

PURPOSE:
Verify customer records after data insertion.

BUSINESS USE:
Ensures customer information is available for
subsequent business analysis.

EXPECTED INSIGHT:
All customer records should be visible and ready
for analytical queries.
=======================

*/

SELECT * FROM customers;

# /*

TOPIC: Product Data Population

QUESTION:
How can product catalog information be loaded into
the database?

PURPOSE:
Insert product records including category and pricing
information.

BUSINESS USE:
Product data supports sales analysis, inventory
planning, revenue reporting, and category analysis.

EXPECTED INSIGHT:
A structured product catalog is available for
performance evaluation.
=======================

*/

INSERT INTO products (
product_name,
category,
price
)
VALUES
('Laptop', 'Electronics', 75000),
('Smartphone', 'Electronics', 35000),
('Headphones', 'Electronics', 2500),
('Running Shoes', 'Fashion', 4000),
('Backpack', 'Fashion', 1500);

# /*

TOPIC: Product Data Verification

QUESTION:
Were product records inserted successfully?

PURPOSE:
Verify product records after data insertion.

BUSINESS USE:
Ensures product information is available for sales
and revenue analysis.

EXPECTED INSIGHT:
All products should be visible and categorized
correctly.
==========

*/

SELECT * FROM products;

# /*

TOPIC: Order Data Population

QUESTION:
How can customer purchase transactions be recorded?

PURPOSE:
Insert order records associated with customers.

BUSINESS USE:
Order data is used for sales tracking, customer
purchase analysis, and order fulfillment monitoring.

EXPECTED INSIGHT:
Customer purchasing activity becomes available for
business reporting.
===================

*/

INSERT INTO orders (
customer_id,
order_date,
order_status
)
VALUES
(1, '2025-06-01', 'Delivered'),
(2, '2025-06-02', 'Delivered'),
(1, '2025-06-05', 'Shipped'),
(3, '2025-06-06', 'Delivered'),
(4, '2025-06-08', 'Processing');

# /*

TOPIC: Order Data Verification

QUESTION:
Were order records inserted successfully?

PURPOSE:
Verify order records after data insertion.

BUSINESS USE:
Ensures transaction records exist for customer
purchase analysis.

EXPECTED INSIGHT:
Orders should be linked correctly to customers and
contain valid statuses.
=======================

*/

SELECT * FROM orders;

# /*

TOPIC: Order Item Data Population

QUESTION:
Which products were purchased in each order?

PURPOSE:
Insert product-level transaction details for each
customer order.

BUSINESS USE:
Supports product performance analysis, revenue
calculation, and inventory planning.

EXPECTED INSIGHT:
Product purchases become traceable at the individual
order level.
============

*/

INSERT INTO order_items (
order_id,
product_id,
quantity,
price_per_unit
)
VALUES
(1, 1, 1, 75000),   -- Laptop
(1, 3, 1, 2500),    -- Headphones
(2, 2, 1, 35000),   -- Smartphone
(3, 5, 2, 1500),    -- Backpack
(4, 4, 1, 4000),    -- Running Shoes
(5, 3, 2, 2500);    -- Headphones

# /*

TOPIC: Order Item Data Verification

QUESTION:
Were order item records inserted successfully?

PURPOSE:
Verify product-level transaction records.

BUSINESS USE:
Ensures accurate product sales and revenue analysis.

EXPECTED INSIGHT:
Each order should contain valid product and quantity
information.
============

*/

SELECT * FROM order_items;

# /*

TOPIC: Payment Data Population

QUESTION:
How were customer orders paid for?

PURPOSE:
Insert payment transaction records associated with
orders.

BUSINESS USE:
Supports revenue reporting, financial analysis,
and payment method evaluation.

EXPECTED INSIGHT:
Payment records should accurately reflect order
values and customer payment preferences.
========================================

*/

INSERT INTO payments (
order_id,
payment_method,
amount
)
VALUES
(1, 'UPI', 77500),
(2, 'Credit Card', 35000),
(3, 'UPI', 3000),
(4, 'Debit Card', 4000),
(5, 'UPI', 5000);

# /*

TOPIC: Payment Data Verification

QUESTION:
Were payment records inserted successfully?

PURPOSE:
Verify payment transactions after data insertion.

BUSINESS USE:
Ensures financial data is available for revenue and
payment method analysis.

EXPECTED INSIGHT:
All payments should be correctly linked to orders and
ready for analytical reporting.
===============================

*/

SELECT * FROM payments;
