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
[View SQL Analysis](https://github.com/TusharLohia311/Ecommerce-Growth-Analysis/blob/main/SQL/Ecommerce-SQL_Analysis.sql)

---
---
## 📊 Power BI Dashboard

The SQL analysis was transformed into an interactive Power BI dashboard consisting of three analytical pages.

### Page 1 — Executive Audit

Provides a high-level overview of:

- Total sessions
- Total orders
- Total revenue
- Overall conversion rate
- Traffic-source performance
- Revenue and order trends
- Device performance

### Page 2 — Conversion Funnel

Analyzes the customer journey from website visit to completed purchase:

**Sessions → Products → Cart → Shipping → Billing → Order**

Key funnel metrics:

| Funnel Stage | Sessions | Conversion |
|---|---:|---:|
| Total Sessions | 472,871 | — |
| Products | 261,231 | 55.24% |
| Cart | 94,953 | 36.35% |
| Shipping | 64,484 | 67.91% |
| Billing | 52,058 | 80.73% |
| Receipt | 32,313 | 62.07% |

### Page 3 — Product & Quality Analysis

Focuses on:

- Product orders and revenue
- Product profitability
- Cross-selling performance
- Multi-item orders
- Refund rates
- Refund trends over time

---
## 🖼️ Dashboard Preview

### 01 — Executive Audit

![Executive Audit](./Screenshots/01%3A%20executive_audit.png)

### 02 — Conversion Funnel

![Conversion Funnel](./Screenshots/02%3A%20conversion_funnel.png)

### 03 — Product & Quality Analysis

![Product & Quality Analysis](./Screenshots/03%3A%20product_quality.png)

---
---

## 💡 Key Business Insights

### 1. Strong Desktop vs. Mobile Conversion Gap

Desktop users generated a conversion rate of **8.50%**, while mobile users converted at only **3.09%**.

This represents a **5.41 percentage-point gap**, despite mobile users accounting for a significant share of total website sessions.

**Recommendation:**  
Investigate the mobile checkout experience, page speed, usability, and payment flow to identify friction points affecting mobile customers.

---

### 2. Product-to-Cart Is the Largest Funnel Bottleneck

The website recorded:

**472,871 sessions → 261,231 product views → 94,953 cart visits → 64,484 shipping → 52,058 billing → 32,313 orders**

The Product → Cart conversion rate was only **36.35%**, making it one of the most significant points of customer drop-off.

**Recommendation:**  
Improve product pages through stronger product information, clearer calls-to-action, pricing visibility, reviews, and more effective cross-selling.

---

### 3. Billing Page Redesign Shows Stronger Performance

The redesigned **Billing-2** page achieved a higher conversion rate than the original billing page.

**Billing-2: ~63%**  
**Original Billing: ~45%**

This indicates that the redesigned billing experience may have reduced friction during checkout.

**Recommendation:**  
Continue using the better-performing billing experience while monitoring results through controlled A/B testing.

---

### 4. Cross-Selling Represents a Significant Opportunity

The analysis identified **5,757 cross-sold orders** out of **32,313 total orders**.

Cross-selling therefore represents an important component of the purchasing journey.

**Recommendation:**  
Promote complementary products at appropriate points in the customer journey, particularly for products with stronger cross-sell attachment rates.

---

### 5. Refund Performance Varies by Product

Refund rates differed considerably across products.

**The Original Mr. Fuzzy** recorded the highest product-level refund rate at **5.40%**, while **The Hudson River Mini Bear** had the lowest at **0.86%**.

**Recommendation:**  
Investigate the reasons behind higher refunds for specific products, including product expectations, quality issues, product descriptions, and customer feedback.

---

## 🎯 Business Recommendations

Based on the analysis, the key priorities are:

| Priority | Recommendation | Expected Business Impact |
|---|---|---|
| 🔴 High | Improve mobile conversion | Increase orders from mobile traffic |
| 🔴 High | Optimize Product → Cart conversion | Reduce major funnel drop-off |
| 🟠 Medium | Continue optimizing billing experience | Improve checkout completion |
| 🟠 Medium | Strengthen cross-selling | Increase items and revenue per order |
| 🟡 Medium | Investigate high-refund products | Reduce revenue leakage and improve customer experience |

---
---

## 📁 Project Structure

```text
Ecommerce-Growth-Analysis/
│
├── SQL/
│   └── ecommerce_analysis.sql
│
├── Screenshots/
│   ├── 01: executive_audit.png
│   ├── 02: conversion_funnel.png
│   └── 03: product_quality.png
│
└── README.md
```
---
## 📥 Power BI Dashboard File

The complete interactive Power BI report is available here:

[Download Power BI Dashboard](https://1drv.ms/u/c/ab3671b5aadbe0ee/IQDrKfyaADFnSoTI3K1YY6XSAb_Eguh7s01JcfE8jzCwpaU?e=xij7Z3)

> Note: The `.pbix` file is hosted externally because the file size exceeds GitHub's browser upload limit.
---
## 👤 Author

**Tushar Lohia**

Aspiring Data Analyst | SQL | Power BI | Excel | Business Analytics
