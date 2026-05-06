# AdventureWorks: Global Sales & Manufacturing Intelligence Suite

## 📖 Project Overview
The organization required a centralized **"Single Source of Truth"** to bridge the gap between global sales performance and manufacturing efficiency. This project transforms raw transactional data into a high-fidelity, 9-page executive BI suite. 

By implementing a **T-SQL Gold Layer** and a custom **Power BI Executive Interface**, I provided stakeholders with a unified view of revenue health, supply chain bottlenecks, and marketing ROI.

---

## 🚀 Documentation & Quick Links
* 📊 **[Download Power BI Dashboard (.pbix)](Report_and_Dashboard/AdventureWorks_Executive_Suite.pbix)**
* 📄 **[Download Project Summary (PDF)](Report_and_Dashboard/AdventureWorks_Executive_Suite.pdf)**
* 💻 **[View SQL "Gold Layer" Scripts](Sql-Scripts/01_Gold_Reporting_Views.sql)**
* 🗄️ **[Source Data (.bak)](AdventureWorks2025_Source/AdventureWorksDW2025.bak)**

---

## 🖥️ Interactive Dashboard Suite
Click on any module below to view the high-resolution preview directly from the assets folder.

| Module | Analytical Focus | High-Res Preview |
| :--- | :--- | :--- |
| **01. Command Center** | Global Navigation & Entry Point | [🖼️ View](./Assets/01_Command-Center.png) |
| **02. Executive Overview** | C-Suite Financial & Pareto Health | [🖼️ View](./Assets/02_Executive-Overview.png) |
| **03. Product Profitability** | Unit Contribution & Price Erosion | [🖼️ View](./Assets/03_Product-Profitability-Analysis.png) |
| **04. Segment Insights** | Demographic & Income Distribution | [🖼️ View](./Assets/04_Segment-Insights.png) |
| **05. Logistics Intel** | Freight Ratios & Supply Velocity | [🖼️ View](./Assets/05_Logistic-Intel.png) |
| **06. Workforce Productivity** | Attainment & Org Health Metrics | [🖼️ View](./Assets/06_Workforce-Productivity.png) |
| **07. Marketing ROI** | Promo Lift & Incremental Profit | [🖼️ View](./Assets/07_Marketing-ROI.png) |
| **08. Service Efficiency** | Operational Pilot & Shift Success | [🖼️ View](./Assets/08_Service-Efficiency.png) |
| **09. Acquisition Strategy** | Market Growth & Lead Quality | [🖼️ View](./Assets/09_Acquisition-Strategy.png) |

<details>
  <summary>📸 **Click here to expand and view all screenshots in-line**</summary>

  ### 01. Command Center
  ![Command Center](./Assets/01_Command-Center.png)

  ### 02. Executive Overview
  ![Executive Overview](./Assets/02_Executive-Overview.png)

  ### 03. Product Profitability
  ![Product Profitability](./Assets/03_Product-Profitability-Analysis.png)

  ### 04. Segment Insights
  ![Segment Insights](./Assets/04_Segment-Insights.png)

  ### 05. Logistics Intel
  ![Logistics Intel](./Assets/05_Logistic-Intel.png)

  ### 06. Workforce Productivity
  ![Workforce Productivity](./Assets/06_Workforce-Productivity.png)

  ### 07. Marketing ROI
  ![Marketing ROI](./Assets/07_Marketing-ROI.png)

  ### 08. Service Efficiency
  ![Service Efficiency](./Assets/08_Service-Efficiency.png)

  ### 09. Acquisition Strategy
  ![Acquisition Strategy](./Assets/09_Acquisition-Strategy.png)
</details>

---

## 🛠️ Technical Stack & Architecture


### 1. SQL Engineering: The Gold Layer

Instead of loading raw tables, I engineered **T-SQL Views** to pre-aggregate data and ensure high performance:
* **Materialized Logic**: Shifted complex transformations from the BI tool to the database, optimizing refresh speeds.
* **Data Integrity**: Developed a "Gold Layer" architecture for clean, reporting-ready data contracts.

### 2. Advanced Data Modeling

The suite is powered by a robust **Star Schema** designed for massive scalability:
* **Fact Tables**: Internet Sales, Reseller Sales, Product Inventory, Sales Quotas, and Call Center Ops.
* **Dimension Tables**: 11+ tables providing rich attributes for Date, Customer, Employee, and Promotion.

![Data Model](./Assets/Data-Model.png)

### 3. UI/UX & Analytical Features

* **Semantic Sparklines**: Implemented high/low marker logic that adapts based on metric intent (e.g., Green for low costs, Red for high costs).
* **Pareto Analysis**: Integrated 80/20 rule visualizations to identify top-performing product models driving 80% of revenue.
* **Navigation Hub**: Built a centralized "Command Center" with synchronized slicers for a seamless, multi-page user experience.

---

## 📈 Key Business Insights
* **Revenue Concentration**: Pareto Analysis reveals that 80% of revenue is driven by a small subset of products, primarily Mountain Bikes.
* **Inventory Turnover**: Identified a **Dynamic Non-Moving Count of 18K units**, representing significant trapped capital.
* **Promotional Effectiveness**: The **Touring-1000 Promotion** resulted in a net gain loss of ($0.23M), suggesting an immediate shift in marketing strategy.
* **Workforce Stability**: High tenure in Production vs. high turnover in Sales highlights a critical area for HR intervention.

---

**Author:** Meenakshi Singh  
*Data Analyst | SQL Engineering | Power BI Architecture*


