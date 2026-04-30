/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the adventure work. 
===============================================================================
Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: v_DimProduct
-- =============================================================================

IF OBJECT_ID('v_DimProduct', 'V') IS NOT NULL
    DROP VIEW v_DimProduct;
GO

CREATE OR ALTER VIEW v_DimProduct AS
SELECT 
    p.ProductKey AS [ProductKey],
    p.ProductAlternateKey AS [Product Code],
    p.EnglishProductName AS [Product Name],
    ISNULL(ps.EnglishProductSubcategoryName,'Unknown') AS [Subcategory],
    ISNULL(pc.EnglishProductCategoryName,'Unknown') AS [Category],
    p.Color AS [Color],
    p.Size AS [Size],
    p.ModelName AS [Model],
    p.StandardCost AS [Unit Cost],
    p.ListPrice AS [List Price]  
FROM DimProduct p
LEFT JOIN DimProductSubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
LEFT JOIN DimProductCategory pc ON ps.ProductCategoryKey = pc.ProductCategoryKey;
GO


-- =============================================================================
-- Create Dimension: v_DimReseller
-- =============================================================================

IF OBJECT_ID('v_DimReseller', 'V') IS NOT NULL
    DROP VIEW v_DimReseller;
GO

CREATE OR ALTER VIEW v_DimReseller AS
SELECT 
    r.ResellerKey AS [ResellerKey],
    r.ResellerName AS [Reseller Name],
    r.BusinessType AS [Business Type],
    r.YearOpened AS [Year Opened],
    r.NumberEmployees AS [Number Employees],
    g.City AS [City],
    g.EnglishCountryRegionName AS [Country]
FROM DimReseller r
LEFT JOIN DimGeography g ON r.GeographyKey = g.GeographyKey;
GO


-- =============================================================================
-- Create Dimension: v_DimCustomer
-- =============================================================================

IF OBJECT_ID('v_DimCustomer', 'V') IS NOT NULL
    DROP VIEW v_DimCustomer;
GO

CREATE VIEW v_DimCustomer AS
SELECT
    c.CustomerKey AS [CustomerKey],
    c.FirstName + ' ' + c.LastName AS [Customer Name],
    c.Gender AS [Gender],
    c.YearlyIncome AS [Yearly Income],
    DATEDIFF(YEAR, c.BirthDate, GETDATE()) AS [Age],
    c.EnglishEducation AS [Education],
    c.EnglishOccupation AS [Occupation],
   CASE WHEN c.HouseOwnerFlag = '1' THEN 'Yes' ELSE 'No' END AS [Home Owner],
    c.NumberCarsOwned AS [Number Cars Owned],
    c.DateFirstPurchase AS [First Purchase Date],
    g.City AS [City],
    g.StateProvinceName AS [State],
    g.EnglishCountryRegionName AS [Country]
FROM DimCustomer c
LEFT JOIN DimGeography g
    ON c.GeographyKey = g.GeographyKey;
    GO

-- =============================================================================
-- Create Dimension: v_DimEmployee
-- =============================================================================

    IF OBJECT_ID('v_DimEmployee', 'V') IS NOT NULL
    DROP VIEW v_DimEmployee;
GO

CREATE OR ALTER VIEW v_DimEmployee AS
SELECT 
    e.EmployeeKey AS [EmployeeKey],
    ISNULL(CAST(e.ParentEmployeeKey AS VARCHAR), 'Top Level') AS [ParentEmployeeKey],
    e.FirstName + ' ' + e.LastName AS [Employee Name],
    e.Title AS [Title],
    e.DepartmentName AS [Department],
    e.HireDate AS [Hire Date],
    DATEDIFF(YEAR, e.HireDate, GETDATE()) AS [Years of Service],
    CASE WHEN e.Gender = 'M' THEN 'Male' ELSE 'Female' END AS [Gender],
    CASE WHEN e.MaritalStatus = 'M' THEN 'Married' ELSE 'Single' END AS  [Marital Status],
    e.BaseRate AS [Base Rate],
    e.SalesTerritoryKey AS [SalesTerritoryKey],
    CASE 
        WHEN e.SalesPersonFlag = 1 THEN 'Sales' 
        ELSE 'Support' 
    END AS [Role Category],
    e.CurrentFlag AS [Current Flag]
FROM DimEmployee e
WHERE e.CurrentFlag = 1;
GO

-- =============================================================================
-- Create Dimension: v_DimDate
-- =============================================================================

IF OBJECT_ID('v_DimDate', 'V') IS NOT NULL
    DROP VIEW v_DimDate;
GO

CREATE VIEW v_DimDate AS
SELECT
    DateKey AS [DateKey],
    FullDateAlternateKey AS [Date],
    EnglishDayNameOfWeek AS [Day],
    DayNumberOfMonth AS [Day Number Of Month],
    EnglishMonthName AS [Month],
    MonthNumberOfYear AS [Month Number],
    CalendarQuarter AS [Quarter],
    CalendarYear AS [Year]
FROM DimDate
WHERE DateKey BETWEEN 20101201 AND 20140131;
GO

-- =============================================================================
-- Create Dimension: v_DimTerritory
-- =============================================================================

IF OBJECT_ID('v_DimTerritory', 'V') IS NOT NULL
    DROP VIEW v_DimTerritory;
GO

    CREATE VIEW v_DimTerritory AS
SELECT
    SalesTerritoryKey AS [SalesTerritoryKey],
    SalesTerritoryRegion AS [Region],
    SalesTerritoryCountry AS [Country],
    SalesTerritoryGroup AS [Group]
FROM DimSalesTerritory;
GO

-- =============================================================================
-- Create Dimension: v_DimPromotion
-- =============================================================================

IF OBJECT_ID('v_DimPromotion', 'V') IS NOT NULL
    DROP VIEW v_DimPromotion;
GO

CREATE VIEW v_DimPromotion AS
SELECT
    PromotionKey AS [PromotionKey],
    EnglishPromotionName AS [Promotion Name],
    EnglishPromotionType AS [Promotion Type],
    EnglishPromotionCategory AS [Promotion Category],
    DiscountPct AS [Discount Percent],
    StartDate AS [Start Date],
    EndDate AS [End Date]
FROM DimPromotion;
GO

-- =============================================================================
-- Create Fact Table: v_FactProductInventory
-- =============================================================================

IF OBJECT_ID('v_FactProductInventory', 'V') IS NOT NULL
    DROP VIEW v_FactProductInventory;
GO

CREATE VIEW v_FactProductInventory AS
SELECT 
    ProductKey AS [ProductKey],
    DateKey AS [DateKey],
    MovementDate AS [Movement Date],
    UnitCost AS [Unit Cost],
    UnitsIn AS [Units In],
    UnitsOut AS [Units Out],
    UnitsBalance AS [Units Balance]
FROM FactProductInventory
WHERE DateKey BETWEEN 20101201 AND 20140131;;
GO

-- =============================================================================
-- Create Fact Table: v_FactSalesQuota
-- =============================================================================

IF OBJECT_ID('v_FactSalesQuota ', 'V') IS NOT NULL
    DROP VIEW v_FactSalesQuota ;
GO

CREATE OR ALTER VIEW v_FactSalesQuota AS
SELECT 
    DATEFROMPARTS(
        (DateKey / 10000), 
        (DateKey % 10000) / 100, 
        (DateKey % 100)
    ) AS [Actual Date],
    EmployeeKey AS [EmployeeKey],
    SalesAmountQuota AS [Sales Amount Quota]
FROM FactSalesQuota ; 
GO

-- =============================================================================
-- Create Fact Table: v_InternetFactSales
-- =============================================================================

IF OBJECT_ID('v_InternetFactSales', 'V') IS NOT NULL
    DROP VIEW v_InternetFactSales;
GO

CREATE OR ALTER VIEW v_InternetFactSales AS
SELECT 
    f.SalesOrderNumber AS [Sales Order Number],
    f.SalesOrderLineNumber AS [Sales Order Line Number],
    f.OrderDateKey AS [OrderDateKey],
    f.CustomerKey AS [CustomerKey],
    f.ProductKey AS [ProductKey],
    f.PromotionKey AS [PromotionKey], 
    f.SalesTerritoryKey AS [SalesTerritoryKey],    
    f.OrderQuantity AS [Order Quantity],
    f.UnitPrice AS [Unit Price],
    f.DiscountAmount AS [Discount Amount],   
    f.SalesAmount AS [Sales Amount],
    f.TotalProductCost AS [Total Cost],
    (f.SalesAmount - f.TotalProductCost) AS [Profit Amount],
    p.EnglishPromotionName AS [Promotion Name],
    
    ISNULL(r.SalesReasonName, 'Normal Sale') AS [Sales Reason],
    CASE 
        WHEN r.SalesReasonReasonType = 'Other' THEN 1 
        WHEN r.SalesReasonName = 'Price' THEN 1 
        ELSE 0 
    END AS [Is Return Flag]
FROM FactInternetSales f
LEFT JOIN DimPromotion p ON f.PromotionKey = p.PromotionKey
LEFT JOIN FactInternetSalesReason fisr  ON f.SalesOrderNumber = fisr.SalesOrderNumber
LEFT JOIN DimSalesReason r ON fisr.SalesReasonKey = r.SalesReasonKey;
GO


-- =============================================================================
-- Create Fact Table: v_FactResellerSales
-- =============================================================================

IF OBJECT_ID('v_FactResellerSales', 'V') IS NOT NULL
    DROP VIEW v_FactResellerSales;
GO

CREATE OR ALTER VIEW v_FactResellerSales AS
SELECT 
    SalesOrderNumber AS [Sales Order Number],
    OrderDateKey AS [OrderDateKey],
    ResellerKey AS [ResellerKey],
    ProductKey AS [ProductKey],
    EmployeeKey AS [EmployeeKey],
    SalesTerritoryKey AS [SalesTerritoryKey],
    OrderQuantity AS [Order Quantity],
    UnitPrice AS [Unit Price],
    SalesAmount AS [Reseller Sales],
    TotalProductCost AS [Reseller Cost],
    (SalesAmount - TotalProductCost) AS [Reseller Profit]
FROM FactResellerSales;
