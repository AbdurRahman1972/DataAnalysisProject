USE Purchase

ALTER TABLE product
ADD CONSTRAINT PK_Product
PRIMARY KEY (ProductID);
GO

ALTER TABLE  ProductSubCategory
ADD CONSTRAINT PK_ProductSubcategory
PRIMARY KEY (ProductSubcategoryID);
GO

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_ProductSubcategory
FOREIGN KEY (ProductSubCategoryID)
REFERENCES ProductSubCategory(ProductSubCategoryID);
GO

ALTER TABLE ProductCategory
ADD CONSTRAINT PK_ProductCategory 
PRIMARY KEY (ProductCategoryID)

ALTER TABLE ProductSubCategory
ADD CONSTRAINT FK_Productcategory
FOREIGN KEY (ProductCategoryID)
REFERENCES ProductCategory(ProductCategoryID)
GO

ALTER TABLE Vendor
ADD CONSTRAINT PK_Vendor
PRIMARY KEY (BusinessEntityID)
GO

ALTER TABLE ProductVendor
ADD CONSTRAINT PK_ProductVendor
PRIMARY KEY (ProductID, BusinessEntityID)
GO

ALTER TABLE ProductVendor
ADD CONSTRAINT FK_ProductVendor_Product
FOREIGN KEY (Productid)
REFERENCES Product(ProductID)
GO

ALTER TABLE ProductVendor
ADD CONSTRAINT FK_ProductVendor_Vendor
FOREIGN KEY (BusinessEntityId)
REFERENCES Vendor(BusinessEntityID)
GO

ALTER TABLE PurchaseOrderHeader
ADD CONSTRAINT PK_PurchaseOrderHeader
PRIMARY KEY (PurchaseOrderID)
GO

ALTER TABLE PurchaseOrderDetail
ADD CONSTRAINT PK_PurchaseOrderDetail
PRIMARY KEY (PurchaseOrderDetailID)
GO

ALTER TABLE PurchaseOrderDetail
ADD CONSTRAINT FK_PurchaseOrderDetail_PurchaseOrderHeader
FOREIGN KEY (PurchaseOrderID)
REFERENCES PurchaseOrderHeader(PurchaseOrderId)

ALTER TABLE PurchaseOrderDetail
ADD CONSTRAINT FK_PurchaseOrderDetail_Product
FOREIGN KEY (ProductID)
REFERENCES Product(ProductId)
GO

ALTER TABLE PurchaseOrderHeader
ADD CONSTRAINT FK_PurchaseOrderHeader_Vendor
FOREIGN KEY (VendorId)
REFERENCES Vendor(BusinessEntityID)