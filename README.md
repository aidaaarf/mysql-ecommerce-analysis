# E-Commerce Customer Retention Analysis using MySQL 
### Project Overview

This project analyzes customer retention and repeat purchase behavior using the Brazilian E-Commerce Public Dataset by Olist.
The objective of this project is to identify customer retention patterns, customer lifetime value, and repeat purchase behavior using SQL and Python.
This project is designed as a portfolio project for Data Analyst roles and demonstrates practical business-oriented analytical skills.

# Business Questions

### This analysis aims to answer the following questions:

Why do customers not repeat orders?
What is the monthly customer retention rate?
Which customers are the most valuable?
How quickly do customers place repeat orders?
How does customer retention behave across cohorts?

# Dataset

### Dataset used:
Brazilian E-Commerce Public Dataset by Olist

### Dataset source:
Kaggle - Brazilian E-Commerce Dataset

# Tools & Technologies
### Database
- MySQL 8
- MySQL Workbench

# SQL Skills Demonstrated
- CTE (Common Table Expressions)
- JOIN
- Window Functions
- ROW_NUMBER
- LAG
- CASE WHEN
- DATE_FORMAT
- TIMESTAMPDIFF
- Aggregation
- Cohort Analysis

# Project Structure
```
ecommerce-customer-retention-analysis/
│
├── data/
│   ├── customers.csv
│   ├── orders.csv
│   └── order_items.csv
│
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_retention_analysis.sql
│   ├── 03_cohort_analysis.sql
│   ├── 04_customer_ltv.sql
│   └── 05_repeat_purchase_behavior.sql
└── README.md
```

# Database Tables Used
### customers
```
| column             | description                |
| ------------------ | -------------------------- |
| customer_id        | customer id                |
| customer_unique_id | unique customer identifier |
| customer_city      | customer city              |
| customer_state     | customer state             |
```

### orders
```
| column                   | description        |
| ------------------------ | ------------------ |
| order_id                 | order id           |
| customer_id              | customer reference |
| order_status             | order status       |
| order_purchase_timestamp | purchase timestamp |
```

### orders_item
```
| column        | description     |
| ------------- | --------------- |
| order_id      | order reference |
| price         | item price      |
| freight_value | shipping fee    |
```

# Analysis Performed
## 1. Data Cleaning
### Prepared cleaned transaction-level data for analysis.
### SQL Skills
- JOIN
- CTE
- Data transformation
- Filtering

## 2. Monthly Retention Analysis
### Analyzed how many customers returned in the following month after making a purchase.
### SQL Skills
- Self Join
- Aggregation
- Date manipulation
- Retention logic

## 3. Cohort Analysis
### Grouped customers by their first purchase month and tracked retention over time.
### SQL Skills
- Cohort Analysis
- TIMESTAMPDIFF
- CTE chaining

## 4. Customer Lifetime Value (LTV)
### Segmented customers based on total revenue contribution.
### SQL Skills
- CASE WHEN
- Aggregation
- Customer segmentation

## 5. Repeat Purchase Behavior
### Analyzed how long customers take before placing another order.
### SQL Skills
- ROW_NUMBER
- LAG
- Window Functions

# Key Insights
## 1. Customer Retention is Low
Most customers only purchase once and do not return in the following month.

## 2. The Largest Drop Happens After First Purchase
Customer retention drops significantly after the first transaction.
This suggests that post-purchase engagement is important.

## 3. Revenue is Concentrated Among Small Customer Segments
A small percentage of customers contribute a large portion of total revenue.

## 4. Fast Repeat Purchases Correlate with Better Retention
Customers who reorder within a shorter time period are more likely to become long-term customers.

# Business Recommendations
## Improve Post-Purchase Campaigns
Send personalized offers and promotions shortly after the first purchase.

## Build Loyalty Programs
Encourage repeat purchases using points, discounts, or rewards.

## Focus on High-Value Customers
Provide exclusive benefits to customers with high lifetime value.

## Reduce Churn Risk
Monitor customers with long purchase gaps and target them with re-engagement campaigns.

# Portfolio Project
This project was created as part of a Data Analyst portfolio project to demonstrate practical SQL analytics and business analysis skills using real-world e-commerce data.
