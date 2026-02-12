/*
Purpose:
To enable meaningful inventory aging analysis, purchase order dates are
logically shifted forward by 11 years using DATEADD within analytical
queries. This preserves original AdventureWorks data while simulating
long-term stock behavior.
*/
USE Purchase
GO
WITH LastPurchase AS (
    SELECT
        pod.ProductID,
        MAX(DATEADD(YEAR, 11, poh.OrderDate)) AS AdjustedLastOrderDate
    FROM PurchaseOrderDetail pod
    JOIN PurchaseOrderHeader poh
        ON pod.PurchaseOrderID = poh.PurchaseOrderID
    GROUP BY pod.ProductID
)
SELECT
    p.ProductID,
    p.Name AS ProductName,
    ISNULL(DATEDIFF(DAY, lp.AdjustedLastOrderDate, '2025-09-30'),-1) AS DaysSinceLastPurchase,
    CASE
        WHEN lp.AdjustedLastOrderDate IS NULL THEN 'Never Purchased'
        WHEN DATEDIFF(DAY, lp.AdjustedLastOrderDate, '2025-09-30') > 300 THEN 'Dead Stock'
        WHEN DATEDIFF(DAY, lp.AdjustedLastOrderDate, '2025-09-30') BETWEEN 100 AND 300 THEN 'Slow Moving'
        ELSE 'Active'
    END AS InventoryStatus
FROM Product p
JOIN LastPurchase lp
    ON p.ProductID = lp.ProductID;
GO