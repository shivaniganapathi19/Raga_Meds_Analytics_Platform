# 💊 Raga Meds Analytics Platform

An end-to-end **pharmacy retail analytics platform** designed to transform transactional healthcare data into actionable business insights. The project combines **MySQL, SQL, Power BI, and DAX** to analyze sales, profitability, customers, inventory, suppliers, purchases, and geographical performance.

The platform includes an interactive **7-page Power BI dashboard** with executive KPIs, analytical visuals, DAX-driven AI-style insights, immediate business actions, city-level drill-through, and interactive report-page tooltips.

---

## 📌 Project Overview

Pharmacy businesses generate large volumes of sales, inventory, customer, supplier, and purchase data. Without centralized analytics, it can be difficult to monitor profitability, identify high-performing products, manage inventory risks, understand customer behavior, and evaluate geographical performance.

**Raga Meds Analytics Platform** transforms relational pharmacy data into a structured business intelligence solution that helps turn raw transactional data into meaningful business insights.

### End-to-End Workflow

**MySQL Database → SQL Analysis → Power BI Data Modeling → DAX Measures → Interactive Dashboard → Business Insights**

---

# 🎯 Business Objectives

* Monitor overall revenue and profitability
* Analyze sales and order performance
* Identify top-performing medicines and categories
* Monitor inventory value and stock availability
* Identify low-stock medicines
* Track medicines approaching expiry
* Analyze customer retention and purchasing behavior
* Identify high-value customers
* Evaluate geographical sales performance
* Analyze supplier and purchase performance
* Support data-driven business decisions

---

# 🗄️ Database

**Database Name:** `Raga_Meds_Analytics`

**Total Tables:** **9**

| # | Table            |
| - | ---------------- |
| 1 | Customers        |
| 2 | Categories       |
| 3 | Medicines        |
| 4 | Inventory        |
| 5 | Sales            |
| 6 | Sale_Details     |
| 7 | Suppliers        |
| 8 | Purchases        |
| 9 | Purchase_Details |

The database follows a relational structure with primary keys and relationships connecting customers, sales, medicines, inventory, suppliers, and purchases.

---

# 📊 Power BI Dashboard

The completed Power BI report contains **7 analytical views**.

## 1. 📈 Executive Overview

Provides a high-level summary of overall business performance.

### Key Metrics

* Total Revenue
* Total Profit
* Revenue Growth %
* Profit Margin %
* Total Orders
* Active Customers

### Analysis Includes

* Revenue Trend
* Top Revenue-Generating Categories
* New Customers Over Time
* Top Revenue-Generating Medicines
* AI Insight
* Immediate Action

---

## 2. 💰 Sales Analytics

Provides detailed analysis of sales performance and profitability.

### Key Metrics

* Revenue Growth %
* Average Profit per Order
* Total Quantity Sold
* Average Order Value

### Analysis Includes

* Monthly Revenue & Profit Trend
* Top Customers by Revenue
* Revenue by Payment Method
* Revenue, Profit & Profit Margin by Category
* Sales Performance Analysis

---

## 3. 📦 Inventory Analytics

Monitors inventory health and operational risks.

### Key Metrics

* Inventory Value
* Low Stock Medicines
* Total Medicines
* Expiring Medicines

### Analysis Includes

* Inventory by Category
* Low Stock Analysis
* Expiring Medicines
* Inventory Value by Supplier
* AI Insight
* Immediate Action

---

## 4. 👥 Customer Analytics

Analyzes customer behavior, retention, and purchasing patterns.

### Key Metrics

* Active Customers
* Repeat Customers
* Customer Retention Rate
* Average Revenue per Customer

### Analysis Includes

* Top Customers by Lifetime Value
* Customer Purchase Frequency
* Revenue by Age Group
* Repeat vs One-Time Customers
* Customer Retention Analysis
* AI Insight
* Immediate Action

---

## 5. 🗺️ Geographical Analytics

Analyzes geographical sales performance across cities using revenue, order volume, and interactive map visualization.

### Analysis Includes

* Revenue by City
* Orders by City
* Top Cities by Revenue
* Geographical Sales Distribution
* Interactive Geographical Map
* AI Insight
* Immediate Action

The page supports city-level exploration and helps identify high-performing and lower-performing markets.

---

## 6. 🏙️ City Details

A drill-through page providing detailed analysis for a selected city.

### Key Metrics

* Total Revenue
* Active Customers
* Total Orders
* Average Order Value

### Analysis Includes

* City Revenue Trend
* Top Revenue-Generating Categories
* Top Revenue-Generating Medicines
* Top Revenue-Generating Customers
* City-Specific AI Insight

---

## 7. 💡 City Tooltip

A compact report-page tooltip designed to provide additional city-level context while interacting with geographical visuals.

### Displays

* Revenue
* Active Customers
* Orders
* Average Order Value

This provides contextual information without requiring users to leave the geographical analysis page.

---

# 🤖 AI-Style Business Insights

The dashboard includes dedicated **AI Insight** and **Immediate Action** sections generated dynamically using DAX.

### 💡 AI Insight

Provides concise, data-driven summaries that highlight important business patterns and positive performance.

### 📌 Immediate Action

Highlights areas requiring management attention and converts analytical findings into practical business actions.

This creates a clear analytical narrative:

**What the data tells us → What the business should do next**

> **Note:** The current implementation uses DAX-driven AI-style insights. A dedicated Generative AI assistant is planned as a future enhancement.

---

# 🧮 DAX & Power BI

Key DAX concepts implemented include:

* Measures
* `SUM`
* `SUMX`
* `CALCULATE`
* `FILTER`
* `RELATED`
* `FORMAT`
* `TOPN`
* `MAXX`
* Time-based calculations
* Profit calculations
* Revenue calculations
* Customer metrics
* Inventory metrics
* Dynamic AI Insight measures

### Power BI Features

* Interactive slicers
* Data modeling
* Drill-through
* Report-page tooltips
* Data-driven formatting
* Interactive dashboard navigation

---

# 🛠️ SQL Concepts Demonstrated

The SQL analysis demonstrates practical analytical SQL techniques including:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `INNER JOIN`
* Aggregate Functions
* `CASE`
* Subqueries
* CTEs
* Window Functions
* `DENSE_RANK()`
* `LAG()`
* Running Totals
* `COUNT(DISTINCT)`
* `NULLIF()`
* `ROUND()`
* Date Functions
* Ranking Analysis
* Trend Analysis

---

# 📊 Business Insights

The platform helps identify:

* Top-performing medicines
* Highest-revenue categories
* High-value customers
* Customer retention patterns
* Low-stock medicines
* Medicines approaching expiry
* High-performing cities
* Lower-performing markets
* Revenue concentration
* Supplier contribution
* Purchase trends
* Profitability patterns

---

# 🛠️ Technologies Used

### Currently Implemented

* **MySQL**
* **SQL**
* **Power BI**
* **DAX**
* **Git**
* **GitHub**

### Planned Enhancements

* Python
* Pandas
* NumPy
* Matplotlib
* Exploratory Data Analysis
* Machine Learning
* Streamlit
* Generative AI

---

# 📁 Project Structure

```text
Raga_Meds_Analytics_Platform/
│
├── README.md
│
├── SQL/
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Data_Loading_Guide.sql
│   ├── 04_Executive_KPIs.sql
│   ├── 05_Customer_Analytics.sql
│   ├── 06_Inventory_Analytics.sql
│   ├── 07_Sales_Analytics.sql
│   ├── 08_Purchase_Analytics.sql
│   └── 09_Supplier_Analytics.sql
│
├── Documentation/
│   ├── 01_Project_Overview.md
│   ├── 02_Database_Schema.md
│   ├── 03_SQL_Query_Summary.md
│   └── 04_Project_Insights.md
│
├── PowerBI/
│   └── Raga_Meds_Analytics_Dashboard.pbix
│
└── Screenshots/
    ├── Executive_Overview.png
    ├── Sales_Analytics.png
    ├── Inventory_Analytics.png
    ├── Customer_Analytics.png
    ├── Geographical_Analytics.png
    ├── City_Details.png
    └── City_Tooltip.png
```

---

# 🚀 Future Enhancements

The next development phase will extend the platform beyond descriptive analytics.

## 🐍 Python EDA

* Data cleaning
* Exploratory data analysis
* Statistical analysis
* Visualization
* Business pattern discovery

## 🤖 Machine Learning

Potential applications include:

* Medicine demand forecasting
* Inventory prediction
* Sales forecasting
* Customer segmentation
* Expiry-risk analysis

## 🌐 Streamlit

Development of an interactive web application combining:

**SQL + Python + Machine Learning + Business Analytics**

## ✨ Generative AI

A business-focused AI assistant may be added to help users interpret analytics and generate actionable recommendations from the underlying business data.

The goal is to use AI where it provides **genuine business value**, rather than adding a generic chatbot.

---

# 📌 Project Highlights

* ✅ End-to-End Pharmacy Retail Analytics
* ✅ 9 Relational Database Tables
* ✅ SQL Business Analytics
* ✅ Advanced SQL Window Functions
* ✅ Power BI Dashboard
* ✅ 7 Analytical Dashboard Views
* ✅ DAX Measures
* ✅ Executive KPI Analysis
* ✅ Customer Analytics
* ✅ Inventory Analytics
* ✅ Geographical Analysis
* ✅ City-Level Drill-Through
* ✅ Interactive Report-Page Tooltip
* ✅ DAX-Driven AI-Style Business Insights
* ✅ Immediate Business Actions
* ✅ GitHub Documentation

---

# 👩‍💻 Developed By

**G. Gokul Shivani**

Aspiring Data Analyst | SQL | Python | Power BI | Business Intelligence

---

## ⭐ Project Goal

The long-term goal of **Raga Meds Analytics Platform** is to evolve from a business intelligence dashboard into a complete data-driven pharmacy analytics solution combining:

**SQL → Python → Machine Learning → Power BI → Streamlit → Generative AI**

```
```

