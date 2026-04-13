# AdventureWorks: Global Sales & Manufacturing Intelligence Suite

## 📌 Project Overview

This project transforms raw, fragmented transactional data into a **7-page, high-fidelity Executive Intelligence Suite**. Designed for a global manufacturing scale, this suite provides stakeholders with a "Command Center" view of the business—bridging the gap between high-level financial health and granular operational efficiency.

---

## 🛠️ Technical Architecture

* **Data Modeling:** Engineered a high-performance **Star Schema** from a complex snowflake source, optimizing filter propagation for sub-second DAX visual rendering.
* **Advanced DAX Engineering:** Developed complex measures for behavioral analytics, including **Pareto (80/20) distributions**, **Inventory Velocity**, and dynamic **Quota Attainment** tracking.
* **UI/UX Design:** Implemented a "Dark Mode" aesthetic with an **App-like Navigation Hub**, synchronized slicers for cross-page state management, and F-pattern layouts to reduce cognitive load.

---

## 🗄️ SQL Engineering (The "Gold Layer")

To ensure a "Single Source of Truth," I developed a suite of **T-SQL Views** to serve as the semantic layer for the Power BI model.
* **Hierarchy Denormalization:** Flattened product and geography hierarchies using `LEFT JOIN` logic.
* **Business Logic Layer:** Offloaded heavy calculations (e.g., tenure and profit margins) to SQL to minimize DAX overhead.
* **Data Pruning:** Filtered legacy datasets to focus on active employees and relevant fiscal cycles (2010+).

[**🔗 View SQL Scripts Repository**](Sql-Scripts/AdventureWork_Gold_Layer_View)

---

## 📊 Suite Insights & Business Logic

### 🏠 Home Page (Command Center)

A centralized entry point featuring high-fidelity page navigators. This "App-style" interface ensures an intuitive user experience across all six analytical domains.

### 📊 Executive Overview

* **Market Share:** Analyzed **$44.35M in Total Sales**, with the US driving >50% of global revenue.
* **Stability:** Monitored a consistent **41.3% profit margin** across seasonal trends.

### 📦 Product Analysis

* **Pareto Optimization:** Identified that the **top 30.2% of models** drive the majority of revenue.
* **Portfolio Health:** Used Scatter Plots to segment "Star" products from "Underperformers."

### 🌐 Customer Insights

* **Retention:** Achieved a **37.14% Repeat Customer Rate**, a key KPI for brand loyalty.
* **Segmentation:** Engineered a DAX Slicer for **"High Value" (>$5,000 spend)** vs. "Standard" tiers.

### 🚚 Supply Chain Operations

* **Risk Mitigation:** Identified a **-4K net stock position**, flagging critical deficits in high-demand lines.
* **Operational Flow:** Mapped inventory deficits directly to revenue-at-risk for replenishment priority.

### ⭐ Employee Performance

* **Efficiency Logic:** Developed DAX to segment the sales force into **"Elite"** and **"At Risk"** categories.
* **Quota Tracking:** Monitored real-time progress against a **$51.4M global target**.

### 📣 Promo Analysis

* **ROI Evaluation:** Proved that **Volume Discounts** drive **$3.06M in sales** with a lean 0.17% discount impact.
* **Strategy:** Identified that Volume Discounts account for **97% of promotional revenue**.

---

## 🛠️ Technologies Used

* **SQL Server:** T-SQL, Views, Schema Design.
* **Power BI:** Star Schema Modeling, Advanced DAX, Sparklines, UX/UI Design.
* **GitHub:** Version Control and Documentation.

---

## 📄 Documentation

* [**View Full Project PDF**](Report_and_Dashboard/AdventureWorks_Executive_Suite.pdf)
* [**Download .PBIX File**](Report_and_Dashboard/AdventureWorks_Executive_Suite.pbix)

---

# Author: Meenakshi Singh

Data Analyst | SQL Engineering | Power BI Architecture

  ---
  


