/*
This script recreates the dataset used in the AdventureWorks Inventory Analytics project.

Prerequisite:
AdventureWorks2019 database must be installed in SQL Server.

The script copies required tables into a new database named "Purchase"
so the analytical views and Power BI dashboard can run independently
without modifying the original AdventureWorks database.
*/


IF DB_ID('Purchase') IS NULL
    CREATE DATABASE Purchase;
GO

USE Purchase;
GO

SELECT *
INTO dbo.Product
FROM AdventureWorks2019.Production.Product;

SELECT *
INTO dbo.ProductSubcategory
FROM AdventureWorks2019.Production.ProductSubcategory;

SELECT *
INTO dbo.ProductCategory
FROM AdventureWorks2019.Production.ProductCategory;

SELECT *
INTO dbo.PurchaseOrderHeader
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader;

SELECT *
INTO dbo.PurchaseOrderDetail
FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail;

SELECT *
INTO dbo.Vendor
FROM AdventureWorks2019.Purchasing.Vendor;

SELECT *
INTO dbo.ProductVendor
FROM AdventureWorks2019.Purchasing.ProductVendor;


SELECT COUNT(*) AS ProductCount FROM Product;
SELECT COUNT(*) AS PurchaseOrders FROM PurchaseOrderHeader;
SELECT COUNT(*) AS PurchaseOrderDetails FROM PurchaseOrderDetail;