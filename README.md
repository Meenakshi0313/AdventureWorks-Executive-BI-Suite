# AdventureWorks: Global Sales & Manufacturing Intelligence Suite


## 📊 Project Overview
This project transforms raw transactional data from the AdventureWorks 2025 database into a comprehensive, 7-page business intelligence suite. It provides stakeholders with actionable insights into executive health, customer behavior, supply chain efficiency, and employee performance.

**The Business Challenge**
The organization needed a centralized "Single Source of Truth" to monitor global operations, identify revenue leaks in the supply chain, and evaluate the ROI of various promotional campaigns.

--- 

## 🛠️ Technical Stack

- **Database:** SQL Server (AdventureWorks 2025 .bak)

- **ETL:** SQL Views (Data extraction & transformation)

- **Visualization:** Power BI

- **Modeling:** Star Schema with 11+ tables (Fact & Dimension)

- **Advanced Analytics:** DAX (Dynamic Measures), Pareto Analysis, Trend Forecasting.

---

## 🏗️ The Data Architecture

**1. SQL Transformation (The Foundation)**
   
Instead of loading raw tables, I engineered **SQL Views** to pre-aggregate data and ensure high performance.

- Handled data cleaning for customer demographics.

- Calculated complex inventory metrics (Inbound vs. Outbound) at the source.

- Key SQL Techniques: Joins, CTEs, Data Type Casting, and View Materialization.

**2. Data Modeling**
   
The Power BI model follows a **Star Schema** design for optimal performance:

- **Fact Tables:** Internet Sales, Reseller Sales, Product Inventory, Sales Quotas.

- **Dimension Tables:** Product, Date, Customer, Territory, Employee, Promotion.

  <details>
  <summary> Data Model </summary>
  <br>
  <img src="Assets/Data-Model.png" width="900" alt="Data Model">
  </details>

---

### 📈 Dashboard Deep-Dive

<details>
<summary><b>1. Navigation Hub (Home Page)</b></summary>
<br>
<p align="center">
  <img src="Assets/Home-Page.png" width="100%" alt="Home Page">
</p>
<br>
The entry point of the suite, designed for high-level accessibility.

- **Purpose:** Acts as a central router for stakeholders (Executives, Supply Chain Managers, HR).

- **Design:** Features a clean, button-based UI for seamless navigation across all 6 specialized reporting pages.
</details>

<details>
<summary><b>2. Executive Overview</b></summary>
<br>
<p align="center">
  <img src="Assets/Executive-Overview.png" width="100%" alt="Executive Overview">
</p>
<br>
The "Big Picture" view for C-suite stakeholders to monitor organizational health.

**Core Metrics:** Tracks Total Revenue ($2.03M), Profit Margin (42.19%), and Order Volume.

**Global Reach:** A Donut Chart breaks down market share, showing the United States (50%) and Australia (18%) as lead territories.

**Revenue Concentration:** Features a Pareto Analysis (80/20 Rule) showing that Mountain and Touring bikes drive the vast majority of income.
</details>

<details>
<summary><b>3. Product Analysis</b></summary>
<br>
<p align="center">
  <img src="Assets/Product-Analysis.png" width="100%" alt="Product Analysis">
</p>
<br>A granular look at inventory performance and product-level profitability.

- **Metrics:** Analyzes Average Selling Price ($427.44) and a critical Return Rate (80.38%).

- **Strategic Plotting:** Uses a Price Positioning vs. Profitability scatter plot to identify "Star" products versus underperformers.

- **Volume Trends:** A combination bar/line chart tracks volume growth against return rates to monitor quality control.
</details>

<details>
<summary><b>4. Customer Insights</b></summary>
<br>
<p align="center">
  <img src="Assets/Customer-Insights.png" width="100%" alt="Customer Insights">
</p>
<br>
Demographic and behavioral segmentation to refine marketing efforts.

- **Value Matrix:** A scatter plot analyzing Frequency vs. Spending across occupations, identifying "Professional" and "Management" roles as the highest-value segments.

- **Geographic Distribution:** A Treemap visualizing customer density by country.

- **Elite Customer Tracking:** A filtered list of top-tier customers by revenue, contrasted against their CAC (Customer Acquisition Cost).
</details>

<details>
<summary><b>5. Supply Chain Operations</b></summary>
<br>
<p align="center">
  <img src="Assets/Supply-Chain.png" width="100%" alt="Supply Chain">
</p>
<br>
Operational analysis focused on stock efficiency and revenue protection.

- **Flow Monitoring:** A dual-axis "Inbound vs. Outbound" trend line to spot seasonal bottlenecks.

- **Inventory Health:** Tracks Inventory Turnover (11.5x) and "Net Stock Position."

- **Revenue Impact:** A specialized scatter plot highlighting how "Inventory Deficits" in categories like Accessories lead to missed revenue opportunities.
</details>

<details>
<summary><b>6. Employee Performance</b></summary>
<br>
<p align="center">
  <img src="Assets/Employee-Performance.png" width="100%" alt="Employee Performance">
</p>
<br>
HR and Sales leadership view to monitor workforce efficiency and quota attainment.

- **Efficiency Metrics:** Tracks Quota Attainment % (8.01%) and Profit per Employee ($3.38K).

- **Compensation Structure:** A bar chart segmenting the workforce by Salary Band (Entry to Executive).

- **Sales Leaderboard:** A "Revenue vs. Profit" bar chart identifying top-performing agents like Linda Mitchell and Shu Ito.
</details>

<details>
<summary><b>7. Promo Analysis</b></summary>
<br>
<p align="center">
  <img src="Assets/Promo-Analysis.png" width="100%" alt="Promo Analysis">
</p>
<br>
- **Discount Impact:** Compares Total Promo Sales ($662K) against the Total Discount cost ($34K).

- **ROI Matrix:** A scatter plot identifying which promotions (e.g., "Volume Discounts") have the highest return on investment.

- **Seasonality:** A line-and-cluster chart analyzing how discount rates correlate with sales volume fluctuations throughout the year.
</details>

---

## 💡 Key Business Insights

- **Revenue Concentration:** 80% of revenue is generated by the top 20% of product models (primarily Mountain Bikes), suggesting a need for focused inventory management.

- **Inventory Bottlenecks:** Significant revenue impact discovered due to inventory deficits in the "Accessories" category during peak months.

- **Regional Performance:** The United States accounts for 50.12% of global sales, with Australia following as a strong secondary market at 18.03%.

---

## 📥 Project Assets & Downloads

Please use the links below to review the project files:

* 📊 **[Download Power BI Dashboard (.pbix)](Report_and_Dashboard/AdventureWorks_Executive_Suite.pbix)** - *Requires Power BI Desktop to view data model and DAX*
* 📄 **[Download Project Summary (PDF)](Report_and_Dashboard/AdventureWorks_Executive_Suite.pdf)** - *A comprehensive report of insights and methodology*
* 💻 **[View SQL Scripts](Sql-Scripts/AdventureWork_Gold_Layer_View.sql)** - *Database views and transformation logic*
* 🗄️ **[Source Data (.bak)](AdventureWorks2025_Source/AdventureWorksDW2025.bak)** - *(24.1 MB)*

---

## 💡 Strategic Business Recommendations

Based on the data analyzed in the AdventureWorks Intelligence Suite, the following actions are recommended:

- **Inventory Optimization (Supply Chain):** Address the critical stock deficits in the **Accessories** category, specifically for "Front Brakes" and "Mountain Tire Tubes." These items currently show the highest revenue impact due to deficits. Implementing a **Safety Stock Buffer** of 15% for these high-turnover components could prevent stockouts during peak periods.

- **Customer Retention & Marketing (Customer Insights):** The "Professional" and "Management" occupation segments represent the highest average spending. I recommend launching a **Targeted Loyalty Program** specifically for these demographics to increase "Units per Transaction," which currently sits at **15.03**.

- **Product Quality Control (Product Analysis):** The **80.38% Return Rate** is a significant outlier that requires immediate investigation. A deep-dive audit into the manufacturing or shipping process of the most returned models is necessary to protect the current profit margin of **42.19%**.

- **Promotional Strategy (Promo Analysis):** The "Volume Discount" promotions demonstrated a significantly higher ROI compared to other categories. Marketing spend should be reallocated from low-performing seasonal clearing events toward **Volume-Based Incentives** to maximize net profit impact.

---

## Author: Meenakshi Singh

Data Analyst | SQL Engineering | Power BI Architecture

  ---
  


