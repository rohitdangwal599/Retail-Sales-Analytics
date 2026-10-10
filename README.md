# Retail Sales Analytics & Insights (2023)

End-to-end commercial Power BI analytics platform evaluating multi-category retail performance, customer value segmentation (RFM-style banding), and demographic purchasing behaviors.

---

## 📄 Executive Report & Portfolio Assets
* **Interactive PDF Report:** [Download High-Res PDF Report](docs/Retail_Sales_Insight_BI_2023.pdf)
* **Power Query ETL Pipelines:** 
  * `01_Retail_Sales_Fact_ETL.pq` (Data cleaning, date enrichment, and age banding)
  * `02_Customer_Band_Summary.pq` (Customer value tier aggregations)
  * `03_Band_Category_Summary.pq` (Cross-category revenue distribution)
* **DAX Formulas:** `DAX_Measures.dax`

---

## 🏗️ Data Architecture & Modeling
![Data Model View](04 Model View.png)
* **Schema Design:** Centralized transaction table (`retail_sales_dataset`) linked via relational foreign keys to dimension and summary aggregations (`Band_summary`, `Customer_band_summary`, `Band_category_summary`).
* **Relationship Integrity:** Formatted with explicit 1-to-Many (`1:*`) cardinalities and single-direction filter propagation to prevent circular dependencies and maintain optimal DAX performance.

---

## 📊 Executive Overview & Dashboard Suite

### 1. Executive Overview
![Executive Overview](01 Retail Sales Analytics.png)
* **High-Level KPI Tracking:** Monitors annual revenue trends, average selling price (€201.54), and order volumes (Average Qty: 3)[cite: 9].
* **Seasonality & Demographics:** Identifies peak sales velocity periods and captures a gender revenue split showing Male spend at 56.62% (€25,305) versus Female at 43.38% (€19,385).

### 2. Customer Behavior Drivers
![Customer Behavior Drivers](02 Customer Behaviour Drivers.png)
* **Customer Value Banding:** Evaluates High, Medium, and Low value customer tiers against financial returns.
* **Core Commercial Insight:** **High-value customers drive 62.06% (€283K) of total revenue** through significantly larger basket sizes and an average items-per-order ratio of 4.0.
* **Demographic Breakdown:** Maps category preferences across age brackets (18–55), highlighting that Electronics dominate the 35–44 age demographic at €36K in sales.

### 3. Product Insights & Positioning
![Product Insights](03 Product Insights.png)
* **Volume vs. Value Analysis:** Compares total revenue against units sold to separate volume-driven products from premium positions.
* **Category Intelligence:** **Electronics** leads total revenue (€157K, 849 units), whereas **Beauty** displays strong premium positioning with higher revenue-per-unit performance despite lower transaction volumes.

---

## 🛠️ Technical Architecture & Interactivity
* **ETL Engine:** Built using Power Query (M Language) for flat-file ingestion, data type casting, conditional age categorization, and customer value banding.
* **Data Modeling:** Relational model integrating sales fact tables with customer demographic lookup logic.
* **Dynamic Slicers:** Engineered with cross-filtering capability to allow users to isolate specific time horizons and evaluate real-time propagation across demographic and revenue charts[cite: 9, 11].
