# /*

PROJECT: E-Commerce SQL Case Study
FILE: schema.sql

DESCRIPTION:
This script creates the database schema for an
E-Commerce Analytics Project.

TABLES CREATED:

1. customers
2. products
3. orders
4. order_items
5. payments

DATABASE OBJECTIVE:
Provide a structured relational database for
customer, product, sales, and revenue analysis.

=========================================================
*/

# /*

TOPIC: Customer Table Creation

QUESTION:
How can customer information be stored in a
structured format?

PURPOSE:
Create a table to store customer details including
name, email, city, and signup date.

BUSINESS USE:
Supports customer segmentation, customer retention
analysis, purchase behavior analysis, and geographic
reporting.

EXPECTED INSIGHT:
Provides a centralized source of customer data for
business intelligence and analytics.
====================================

*/

CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
city VARCHAR(50),
signup_date DATE DEFAULT CURRENT_DATE
);

# /*

TOPIC: Product Table Creation

QUESTION:
How can product catalog information be stored and
managed?

PURPOSE:
Create a table to store product details including
name, category, and price.

BUSINESS USE:
Supports product performance analysis, category
analysis, inventory planning, and revenue reporting.

EXPECTED INSIGHT:
Provides a structured product catalog for sales and
profitability analysis.
=======================

*/

CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50),
price DECIMAL(10,2) NOT NULL
);

# /*

TOPIC: Order Table Creation

QUESTION:
How can customer purchase transactions be recorded?

PURPOSE:
Create a table to store order-level information and
link orders to customers.

BUSINESS USE:
Supports order tracking, customer purchase analysis,
sales reporting, and operational monitoring.

EXPECTED INSIGHT:
Enables analysis of customer purchasing activity and
order lifecycle management.
===========================

*/

CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
customer_id INT REFERENCES customers(customer_id),
order_date DATE DEFAULT CURRENT_DATE,
order_status VARCHAR(20)
);

# /*

TOPIC: Order Item Table Creation

QUESTION:
How can individual products within an order be
tracked?

PURPOSE:
Create a table that stores product-level transaction
details for every order.

BUSINESS USE:
Supports product sales analysis, revenue calculation,
basket analysis, and inventory management.

EXPECTED INSIGHT:
Provides detailed visibility into what products are
being purchased and in what quantities.
=======================================

*/

CREATE TABLE order_items (
order_item_id SERIAL PRIMARY KEY,
order_id INT REFERENCES orders(order_id),
product_id INT REFERENCES products(product_id),
quantity INT NOT NULL,
price_per_unit DECIMAL(10,2) NOT NULL
);

# /*

TOPIC: Payment Table Creation

QUESTION:
How can payment transactions be associated with
customer orders?

PURPOSE:
Create a table to store payment information including
payment method and transaction amount.

BUSINESS USE:
Supports revenue reporting, financial analysis,
payment method analysis, and transaction auditing.

EXPECTED INSIGHT:
Provides financial transaction data necessary for
business performance measurement.
=================================

*/

CREATE TABLE payments (
payment_id SERIAL PRIMARY KEY,
order_id INT REFERENCES orders(order_id),
payment_method VARCHAR(30),
amount DECIMAL(10,2) NOT NULL
);

# /*

TOPIC: Schema Verification

QUESTION:
Were all database tables created successfully?

PURPOSE:
Verify that all required tables exist in the public
schema.

BUSINESS USE:
Ensures the database structure is complete and ready
for data population and analytical reporting.

EXPECTED INSIGHT:
All five tables should be visible and available for
data insertion and business analysis.
=====================================

*/

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
