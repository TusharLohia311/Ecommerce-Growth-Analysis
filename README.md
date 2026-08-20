# 🛒 E-Commerce Growth & Conversion Analysis

An end-to-end e-commerce analytics project using **SQL and Power BI** to analyze website performance, conversion funnels, traffic sources, product performance, cross-selling, refunds, and device-level behavior.

The project focuses on transforming raw e-commerce data into actionable business insights and recommendations.

---

## 📌 Project Overview

This project analyzes the performance of an e-commerce website across the period:

**March 19, 2012 → March 19, 2015**

The analysis covers:

- Website traffic and conversion
- Marketing channel performance
- Revenue, profit, and AOV trends
- Product performance and product expansion
- Cross-selling and multi-item orders
- Product refund rates
- Website conversion funnel
- Billing page A/B testing
- Desktop vs. mobile performance

The analysis was performed using **MySQL for data analysis** and **Power BI for interactive visualization and dashboard development**.

---

## 🎯 Business Objectives

The main objectives of this analysis were to:

1. Measure overall website conversion performance.
2. Identify traffic sources generating the most sessions and orders.
3. Analyze revenue, profit, and average order value trends.
4. Understand how product expansion affected sales.
5. Evaluate cross-selling performance and multi-item orders.
6. Identify products with higher refund rates.
7. Identify major drop-offs in the website conversion funnel.
8. Compare the performance of the original and redesigned billing pages.
9. Compare conversion performance between desktop and mobile users.
10. Translate the findings into actionable business recommendations.

---

## 🛠️ Tools & Technologies

- **MySQL** — Data analysis and business queries
- **Power BI** — Interactive dashboards and visualization
- **DAX** — Measures and calculated metrics
- **GitHub** — Project documentation and version control

---

## 📊 Key Business Metrics

| Metric | Result |
|---|---:|
| Website Sessions | **472,871** |
| Total Orders | **32,313** |
| Total Revenue | **$1.94M** |
| Overall Conversion Rate | **6.83%** |
| Desktop Conversion Rate | **8.50%** |
| Mobile Conversion Rate | **3.09%** |

---
---

## 🔍 SQL Analysis

The SQL analysis was structured into nine analytical sections covering the complete e-commerce business journey.

### Analysis Areas

| Section | Analysis |
|---|---|
| 01 | Time Horizon & Business Totals |
| 02 | Overall Website Conversion Rate |
| 03 | Traffic Channel Breakdown |
| 04 | Monthly Orders, Profit & Revenue Trend |
| 05 | Product Expansion & Cross-Selling |
| 06 | Refund Analysis |
| 07 | Website Conversion Funnel |
| 08 | Billing Page A/B Test |
| 09 | Device Conversion Rates |

### Key SQL Findings

- **472,871** website sessions generated **32,313 orders**.
- Overall website conversion rate was **6.83%**.
- Desktop users converted at **8.50%**, compared with **3.09%** for mobile users.
- The largest funnel drop occurred between the **Products page and Cart**, where conversion was **36.35%**.
- Cart → Shipping conversion was **67.91%**.
- Shipping → Billing conversion was **80.73%**.
- Billing → Receipt conversion was **62.07%**.
- Cross-selling generated **5,757 cross-sold orders** across the analyzed products.
- Product-level refund rates varied significantly, with **The Original Mr. Fuzzy** having the highest refund rate at **5.40%**.

### SQL Techniques Used

The project demonstrates:

- `JOIN` and `LEFT JOIN`
- `GROUP BY` and `ORDER BY`
- `COUNT(DISTINCT)`
- `CASE WHEN`
- `COALESCE`
- Aggregate functions
- Date functions
- Conditional aggregation
- Common Table Expressions (CTEs)
- Session-level funnel analysis
- Business KPI calculations

📄 **Complete SQL analysis:**  
`SQL/ecommerce_analysis.sql`

---
