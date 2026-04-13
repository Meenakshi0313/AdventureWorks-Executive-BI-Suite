# AdventureWorks: Global Sales & Manufacturing Intelligence Suite

## 📌 Project Overview

This project transforms raw, fragmented transactional data into a **7-page, high-fidelity Executive Intelligence Suite**. Designed for a global manufacturing scale, this suite provides stakeholders with a "Command Center" view of the business—bridging the gap between high-level financial health and granular operational efficiency.

---


### 🔗 Quick Access

* 📊 [**View Executive Performance Report (PDF)**](Report_and_Dashboard/AdventureWorks_Executive_Suite.pdf)
  
* 🛠️ [**Download Power BI Dashboard (.pbix)**](Report_and_Dashboard/AdventureWorks_Executive_Suite.pbix)
  
* 💾 [**View SQL Gold-Layer Transformation Scripts**](Sql-Scripts/AdventureWork_Gold_Layer_View)

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
* **Data Pruning:** Filtered legacy datasets to focus on active employees and relevant fiscal cycles (2010+)

---

## 📊 Suite Insights (Click to expand)

<details>
<summary>🏠 <b>Home Page: Navigation Hub</b></summary>
<br>
![Home Page](Assets/Home-Page.png)
<br><br>
A centralized entry point featuring high-fidelity page navigators. This interface ensures an intuitive, app-like experience for stakeholders across all analytical domains.
</details>

<details>
<summary>📊 <b>Executive Overview: Financial Health</b></summary>
<br>
![Executive Overview](Assets/Executive-Overview.png)
<br><br>
* Analyzed **$44.35M in Total Sales** with 41.3% margin stability.
* Visualized global revenue distribution and identified "Road Bikes" as the $21.5M primary revenue driver.
</details>

<details>
<summary>📦 <b>Product Analysis: Pareto & Portfolio</b></summary>
<br>
![Product Analysis](Assets/Product-Analysis.png)
<br><br>
* Identified that the **top 30.2% of models** drive the majority of revenue.
* Used Portfolio Analysis to segment "Star" products from low-margin "Underperformers."
</details>

<details>
<summary>🌐 <b>Customer Insights: Behavioral Segmentation</b></summary>
<br>
![Customer Insights](Assets/Customer-Insights.png)
<br><br>
* Achieved a **37.14% Repeat Customer Rate** to measure brand loyalty.
* Engineered DAX Slicers to segment **"High Value" (>$5k)** demographics for targeted analysis.
</details>

<details>
<summary>🚚 <b>Supply Chain: Risk & Inventory Velocity</b></summary>
<br>
![Supply Chain](Assets/Supply-Chain.png)
<br><br>
* Identified **-4K net stock position** in high-demand lines to prevent revenue loss.
* Tracked **Inventory Turnover (4.4 rate)** to optimize warehouse allocation and replenishment cycles.
</details>

<details>
<summary>⭐ <b>Employee Performance: Compensation & Efficiency</b></summary>
<br>
![Employee Performance](Assets/Employee-Performance.png)
<br><br>
* **Workforce Structure:** Analyzed employee distribution across salary bands to monitor organizational overhead.
* **Performance vs. Opportunity:** Used scatter plots to identify high-efficiency sales representatives relative to their territory potential.
* **Quota Tracking:** Monitored **QTD Quota Attainment** with integrated sparkline trend analysis.
</details>

<details>
<summary>📣 <b>Promo Analysis: ROI & Strategy</b></summary>
<br>
![Promo Analysis](Assets/Promo-Analysis.png)
<br><br>
* Proved **Volume Discounts** drive $3.06M in sales with a lean 5.23% discount rate impact.
* **Promo ROI:** Correlated discount costs against revenue impact to identify the most effective marketing campaigns.
</details>

---

## 🛠️ Technologies Used

* **SQL Server:** T-SQL, Views, Schema Design.
* **Power BI:** Star Schema Modeling, Advanced DAX, Sparklines, UX/UI Design.
* **GitHub:** Version Control and Documentation.

---

# Author: Meenakshi Singh

Data Analyst | SQL Engineering | Power BI Architecture

  ---
  


