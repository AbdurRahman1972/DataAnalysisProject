# Inventory Management Project

Inventory Management Project

## OVERVIEW

This project demonstrates an end-to-end inventory analytics solution built using T-SQL (SQL Server) and Power BI.
Using the Microsoft AdventureWorks dataset, a transactional (OLTP) database was transformed into an analytical model to monitor inventory health, supplier performance, and product demand trends.

The goal of the project is to simulate a real-world supply chain analytics environment by designing a data warehouse schema, creating analytical SQL views, and developing an interactive Power BI dashboard.

Business Problem

- Monitor current stock levels by product
- Detect low-stock, overstock, and slow-moving items
- Calculate inventory aging and days in stock
- Analyze supplier delivery performance
- Provide SQL views for direct integration with Power BI dashboards

Data Sources

The following tables were extracted and recreated inside a new database Purchase:
•	Production.Product
•	Production.ProductSubcategory
•	Production.ProductCategory
•	Purchasing.PurchaseOrderHeader
•	Purchasing.PurchaseOrderDetail
•	Purchasing.Vendor
•	Purchasing.ProductVendor

Technologies Used
•	SQL Server (T-SQL)
•	AdventureWorks Database
•	Power BI Desktop
•	Dimensional Modeling (Star Schema)
•	DAX (Data Analysis Expressions)
•	Data Warehousing Concepts


Data Warehouse Design
A Star Schema was designed for analytical reporting.
Dimension Tables
•	DimProduct
•	DimProductSubcategory
•	DimProductCategory
•	DimVendor
•	DimLocation
•	DimDate
•	DimProductVendor
Fact Tables
•	FactInventorySnapshot
•	FactInventoryAging
•	Fact30DaysRollingAverage
•	FactVendorPerformance
•	FactPurchaseOrderDetail
Inventory Aging was modeled as a periodic snapshot fact table connected to the Date dimension via SnapshotDate to enable time-based stock health analysis.

Data Preparation & SQL Transformations


Date Simulation
To enable meaningful inventory aging analysis, purchase order dates were logically shifted forward by 11 years using DATEADD within analytical queries, preserving the original AdventureWorks data while simulating long-term stock behavior.
Data Cleaning
•	Uncategorized products were excluded from product-level segmentation.
•	Missing values were handled using controlled joins and default records (e.g., Unknown Subcategory).
•	Validation queries were created to check data integrity.

Analytical SQL Views
Key analytical views were created:
•	vw_InventoryByCategory
•	vw_InventoryAging
•	vw_ProductDemandRolling30
•	vw_VendorPerformance
These views act as the data source for Power BI.


Power BI Dashboard
Page 1 — Inventory Overview
•	KPI Cards (Total Product, Inventory Value, Quantity, Dead Stock %)
•	Inventory by Category (Column Chart)
•	Stock Status Distribution (Donut Chart)
•	Stock Quantity<500 by Product Subcategory (Bar chart) 
Page 2 — Inventory Aging Analysis
KPI Cards(Average Days in Inventory, Dead stock product Count, Slow Moving Product Count , Risk Inventory %)
•	Matrix Aging Stock Value > 90 days by product Category
•	Dead / Slow / Active Stock Analysis (Pie Chart)
•	Average Days Since Last Purchase
Page 3 — Demand Trends
•	Rolling 30-Day Demand (Line Chart)
•	Top Fast Movers
•	Slow Moving Products
•	Latest vs Average Demand KPIs
Page 4 — Supplier Performance
•	KPI Card (On-Time Delivery %, Order Frequency Rate, Rejection % , Average Lead Time
•	Accepted and supplied quantity comparison (Stacked Area Chart interact with Slicer)
•	Supplied and Rejection Quantity Comparison ( Line and Cluster Column Chart interact with slicer
•	Rejection quantity by Vendor (Top ten)(Tree Map Chart)
Stacked Area chart, Line and Cluster Column Chart filter with tree map)

 
Project Structure

AdventureWorks-Inventory-Analytics
│
├── data/
│   └── data.sql
│
├── sql/
│   ├── create_tables.sql
│   ├── create_views.sql
│   ├── exploratory_queries.sql
│   └── validation_checks.sql
│
├── powerbi/
│   └── InventoryDashboard.pbix
│
└── README.md

exploratory_queries.sql → analysis queries used during data exploration
validation_checks.sql → data quality and integrity checks

How to Run the Project
1.	Restore or install AdventureWorks database in SQL Server
2.	Create a new database: Purchase
3.	Run data.sql to populate tables
4.	Execute create_views.sql
5.	Open InventoryDashboard.pbix in Power BI
6.	Update SQL Server connection
7.	Refresh data

What This Project Demonstrates
8.	SQL data transformation and modeling
9.	Data warehouse star schema design
10.	Business KPI creation
11.	Power BI dashboard development
12.	Real-world inventory analytics



