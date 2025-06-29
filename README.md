# Superstore-Sales-Analysis-
# 🛍️ Superstore Sales Analysis – SQL Project

## 📌 Project Overview

This project performs a comprehensive SQL-based analysis on the **Superstore dataset**, a popular dataset that tracks retail transactions including order details, customer data, product categories, and profitability.

Using SQL, we extract key business insights that help understand customer behavior, sales trends, top-performing products, and regional performance. This project is valuable for developing data querying skills and solving real-world business problems with SQL.

---

## 🗃️ Dataset Summary

- **Table Name:** `superstore`
- **Key Columns:**
  - `Order ID`, `Order Date`, `Ship Mode`, `Customer Name`, `Customer ID`
  - `Segment`, `City`, `State`, `Region`, `Product Name`, `Category`, `Sub-Category`
  - `Sales`, `Quantity`, `Discount`, `Profit`

---

## 🎯 Key Business Questions Answered

### 🔹 Orders & Customers
- Total number of rows and unique orders
- Orders shipped via “Second Class”
- Customers from California
- Customers with more than 2 orders
- Number of unique customers

### 🔹 Sales & Profit Insights
- Total sales per category
- Total profit for specific sub-categories (e.g., Chairs)
- Top 5 products by total sales
- Orders with negative profit
- Cities where sales exceeded ₹10,000
- Sub-categories with no discounts
- Products with zero sales and profit

### 🔹 Regional & Date Analysis
- Average discount by region
- Quantity sold per sub-category
- States with the lowest average sales per order
- Earliest and latest order dates

### 🔹 Advanced Ranking
- Top 3 profitable sub-categories in each category
- Most profitable product in each sub-category (using CTE)
- Customer profit ranking by region

---

## 🧠 SQL Concepts Used

- `GROUP BY`, `HAVING`, `ORDER BY`
- Aggregate functions: `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`
- Filtering with `WHERE`
- `DISTINCT` for uniqueness
- Window functions: `RANK() OVER (...)`
- Common Table Expressions (CTEs)
- Subqueries and Nested Queries

---

## 📌 Sample Highlight Queries

### ✅ 1. Top 3 Sub-Categories by Profit in Each Category

```sql
SELECT *
FROM (
  SELECT 
    Category, 
    `Sub-Category`, 
    SUM(Profit) AS total_profits,
    RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS rk
  FROM superstore
  GROUP BY Category, `Sub-Category`
) AS ranked_subs
WHERE rk <= 3;
```

### ✅ 2. Most Profitable Product in Each Sub-Category (Using CTE)

```sql
WITH ao AS (
  SELECT 
    `sub-category`, 
    `product name`, 
    SUM(profit) AS total_profit,
    RANK() OVER (PARTITION BY `sub-category` ORDER BY SUM(profit) DESC) AS rank_in_subcategory
  FROM superstore
  GROUP BY `sub-category`, `product name`
)
SELECT * 
FROM ao
WHERE rank_in_subcategory = 1;
```

---

## 📊 Sample Output

| Sub-Category | Product Name                   | Total Profit | Rank |
|--------------|--------------------------------|--------------|------|
| Binders      | Eldon Expressions Shelf        | 5000.50      | 1    |
| Phones       | Cisco SPA 501G VoIP Phone      | 7200.00      | 1    |
| Chairs       | Global Deluxe Stacking Chair   | 7450.75      | 1    |

*Sample data for illustration only*

---

## 🧾 Project Folder Structure (Recommended)

```
superstore-sql-project/
│
├── sql/
│   └── superstore_analysis.sql
│
├── README.md
└── dataset/
    └── superstore.csv (if applicable)
```

---

---

## 📊 Power BI Dashboard

I also created an interactive Power BI dashboard to visualize the Superstore insights.

📁 File: `powerbi/superstore_dashboard.pbix`

### Key Dashboard Features:
- Total Sales, Profit, Quantity (KPI Cards)
- Sales and Profit by Category and Sub-Category
- Sales Trend by Order Date
- Regional Sales Performance (Map)
- Top 10 Products by Sales
- Filters for Segment, Region, and Ship Mode

*To view the dashboard, download the `.pbix` file and open it using [Power BI Desktop](https://powerbi.microsoft.com/desktop/).*

---



## ✅ Conclusion

This project demonstrates how SQL can be used effectively to:
- Explore real-world business datasets
- Generate valuable insights
- Apply advanced SQL techniques like window functions and CTEs

It’s an excellent beginner-to-intermediate level project for improving SQL skills.

---

## 🚀 Future Enhancements

- Add Power BI or Tableau dashboards for visualizing insights
- Perform customer segmentation using RFM Analysis
- Analyze shipping delays or delivery performance using `Order Date` and `Ship Date`

---

## 🧑‍💻 Author

Rahul Suthar 

SQL Analyst | Data Enthusiast  

📧 rahulsuthar.2027@gmail.com

---
