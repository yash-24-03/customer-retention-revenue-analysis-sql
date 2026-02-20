# 📊 Customer Retention & Revenue Analysis for an E-Commerce Platform (SQL)

## 📌 Project Overview

This project analyzes the **Olist Brazilian E-Commerce dataset** using SQL to evaluate customer retention, revenue performance, product insights, customer experience, and operational efficiency.

The objective is to extract meaningful business insights that support data-driven decision making in an E-commerce environment.

---

## 🗂 Dataset Information

The analysis is based on the **Olist Brazilian E-Commerce Public Dataset** available on Kaggle.

🔗 Dataset Source:  
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The dataset includes multiple relational tables such as:

- Customers
- Orders
- Order Items
- Payments
- Products
- Sellers
- Reviews
- Geolocation data

Due to GitHub file size limitations (25MB per file), the raw dataset files are not included in this repository.  
You can download the complete dataset directly from the Kaggle link above.

---

## 🔍 Business Problems Addressed

### 1️⃣ Customer Retention
- Identified repeat customers using order frequency analysis.
- Calculated the percentage of customers placing more than one order.
- Measured monthly retention rate using date-based SQL logic.

### 2️⃣ Revenue Analysis
- Calculated total revenue per month.
- Computed Average Order Value (AOV).
- Analyzed revenue contribution by payment type.

### 3️⃣ Product Performance
- Identified top 10 product categories by revenue.
- Determined categories with the highest cancellation rate.
- Evaluated best-selling products by volume and revenue.

### 4️⃣ Customer Experience
- Measured average review score per product category.
- Analyzed impact of delivery delays on customer satisfaction.
- Identified cities with lowest average ratings.

### 5️⃣ Operational Insights
- Calculated average delivery time.
- Compared on-time vs late deliveries.
- Evaluated seller performance based on fulfillment efficiency.

---

## 🛠 Technical Approach

- SQL Joins across multiple relational tables
- GROUP BY & aggregate functions (SUM, AVG, COUNT)
- Window functions for ranking and contribution analysis
- Date-based trend analysis
- KPI calculation for retention and revenue metrics

---

## 📈 Key Insights

- A small percentage of customers contribute disproportionately to total revenue.
- Late deliveries are associated with lower average review scores.
- Certain product categories show higher cancellation tendencies.
- Revenue trends reveal seasonal purchasing patterns.
- Seller performance directly impacts delivery timelines and customer satisfaction.

---

## 💼 Business Value

This project demonstrates how SQL can be used to:

- Analyze customer retention behavior
- Track revenue growth and AOV trends
- Identify operational inefficiencies
- Improve customer satisfaction
- Support data-driven strategic decisions

---

## 🚀 Future Improvements

- Develop a Power BI dashboard for visualization
- Implement advanced cohort retention analysis
- Perform predictive modeling for customer churn
