# 📊 Customer Retention & Revenue Analysis for an E-Commerce Platform (SQL)

## 📌 Project Overview

This project analyzes the Olist E-Commerce dataset using SQL to evaluate customer retention, revenue performance, product insights, customer experience, and operational efficiency.

The objective is to extract meaningful business insights that support data-driven decision making in an E-commerce environment.

---

## 🗂 Dataset Information

The analysis is based on the **Olist Brazilian E-Commerce Public Dataset** from Kaggle.

The dataset consists of multiple relational tables including:

- Customers
- Orders
- Order Items
- Payments
- Products
- Sellers
- Reviews
- Geolocation data

The relational structure enables deep analytical exploration using SQL joins and aggregations.

---

## 🔍 Business Problems Solved

### 1️⃣ Customer Retention
- Identified repeat customers using order frequency analysis.
- Calculated the percentage of customers placing more than one order.
- Measured monthly retention rate using cohort-style logic.

### 2️⃣ Revenue Analysis
- Calculated total revenue per month.
- Computed Average Order Value (AOV).
- Analyzed revenue contribution by payment type.

### 3️⃣ Product Performance
- Identified top 10 product categories by revenue.
- Determined categories with highest cancellation rates.
- Evaluated best-selling products by volume and revenue.

### 4️⃣ Customer Experience
- Measured average review score per product category.
- Analyzed impact of delivery delays on customer satisfaction.
- Identified cities with lowest average ratings.

### 5️⃣ Operational Insights
- Calculated average delivery time.
- Compared on-time vs late deliveries.
- Evaluated seller performance based on fulfillment metrics.

---

## 🛠 Technical Approach

- SQL Joins across multiple relational tables
- GROUP BY & aggregate functions (SUM, AVG, COUNT)
- Window functions for ranking and contribution analysis
- Date-based analysis for monthly trends
- KPI calculations for retention and revenue tracking

---

## 📈 Key Insights

- A small percentage of customers contribute disproportionately to total revenue.
- Late deliveries are associated with lower average review scores.
- Certain product categories show higher cancellation tendencies.
- Revenue trends reveal seasonality patterns across months.
- Seller performance significantly impacts delivery timelines and customer ratings.

---

## 💼 Business Impact

This project demonstrates the application of SQL in:

- Customer retention analysis
- Revenue performance tracking
- Product category optimization
- Operational performance evaluation
- Customer satisfaction analysis

---

## 🚀 Future Improvements

- Build a Power BI dashboard for visualization
- Implement advanced cohort retention analysis
- Perform predictive modeling for churn forecasting
