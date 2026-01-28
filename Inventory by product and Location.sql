use Purchase



SELECT * FROM ProductInventory 
SELECT * FROM Location 
SELECT * FROM product

----Current Inventory by product****
SELECT Pi.ProductID,P.Name AS ProductName, SUM(Quantity) as CurrentStock FROM ProductInventory AS Pi
JOIN Product AS P
ON Pi.ProductID = P.ProductID
GROUP BY Pi.ProductID,P.Name
ORDER BY Pi.ProductID

----Current Inventory Stock By Location

With Cte_LStoct AS
(SELECT  Pi.LocationID,SUM(Quantity) as CurrentStock FROM ProductInventory AS Pi
Group BY Pi.LocationID
)
SELECT C.LocationID, C.CurrentStock, L.Name From Cte_LStoct as C
Join Location as L
On C.LocationID = L.LocationID

