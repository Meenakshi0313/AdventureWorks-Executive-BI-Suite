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


CREATE VIEW v_DimProduct AS
SELECT 
    p.ProductKey,
    p.ProductAlternateKey AS [Product Code],
    p.EnglishProductName AS [Product Name],
    ISNULL(ps.EnglishProductSubcategoryName,'Unknown') AS [Subcategory],
    ISNULL(pc.EnglishProductCategoryName,'Unknown') AS [Category],
    p.Color,
    p.Size,
    p.ModelName AS [Model]
FROM DimProduct p
LEFT JOIN DimProductSubcategory ps 
    ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
LEFT JOIN DimProductCategory pc 
    ON ps.ProductCategoryKey = pc.ProductCategoryKey;
    GO

-- =============================================================================
-- Create Dimension: v_DimCustomer
-- =============================================================================

IF OBJECT_ID('v_DimCustomer', 'V') IS NOT NULL
    DROP VIEW v_DimCustomer;
GO

CREATE VIEW v_DimCustomer AS
SELECT
    c.CustomerKey,
    c.FirstName + ' ' + c.LastName AS [Customer Name],
    c.Gender,
    c.YearlyIncome,
    c.EnglishEducation AS [Education],
    c.EnglishOccupation AS [Occupation],
    c.HouseOwnerFlag AS [Home Owner],
    c.NumberCarsOwned,
    c.DateFirstPurchase,
    g.City,
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
    e.EmployeeKey,
    e.ParentEmployeeKey,
    e.FirstName + ' ' + e.LastName AS [Employee Name],
    e.Title,
    e.DepartmentName,
    e.HireDate,
    -- Calculating Tenure in years for performance context
    DATEDIFF(YEAR, e.HireDate, GETDATE()) AS [Years of Service],
    e.Gender,
    e.MaritalStatus,
    e.BaseRate,
    -- Categorizing by territory for regional analysis
    e.SalesTerritoryKey,
    -- Useful for filtering dashboard page
    CASE 
        WHEN e.SalesPersonFlag = 1 THEN 'Sales' 
        ELSE 'Support/Admin' 
    END AS [Role Category],
    e.CurrentFlag
FROM DimEmployee e
WHERE e.CurrentFlag = 1; -- We only care about active employees
GO

-- =============================================================================
-- Create Dimension: v_DimDate
-- =============================================================================

IF OBJECT_ID('v_DimDate', 'V') IS NOT NULL
    DROP VIEW v_DimDate;
GO

IF OBJECT_ID('v_DimDate', 'V') IS NOT NULL
    DROP VIEW v_DimDate;
GO

CREATE VIEW v_DimDate AS
SELECT
    DateKey,
    FullDateAlternateKey AS [Date],
    EnglishDayNameOfWeek AS [Day],
    DayNumberOfMonth,
    EnglishMonthName AS [Month],
    MonthNumberOfYear AS [Month Number],
    CalendarQuarter AS [Quarter],
    CalendarYear AS [Year]
FROM DimDate
WHERE CalendarYear >= 2010; -- This safely prunes the empty years
GO

-- =============================================================================
-- Create Dimension: v_DimTerritory
-- =============================================================================

IF OBJECT_ID('v_DimTerritory', 'V') IS NOT NULL
    DROP VIEW v_DimTerritory;
GO

    CREATE VIEW v_DimTerritory AS
SELECT
    SalesTerritoryKey,
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
    PromotionKey,
    EnglishPromotionName AS [Promotion Name],
    EnglishPromotionType AS [Promotion Type],
    EnglishPromotionCategory AS [Promotion Category],
    DiscountPct AS [Discount Percent],
    StartDate,
    EndDate
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
    ProductKey,
    DateKey,
    MovementDate, -- Keeping this is great for daily trend analysis
    UnitCost,
    UnitsIn,
    UnitsOut,
    UnitsBalance
FROM FactProductInventory;
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
    ) AS ActualDate,
    EmployeeKey, 
    SalesAmountQuota
FROM FactSalesQuota
WHERE DateKey >= 20100101; -- Cleanly filter out old data
GO

-- =============================================================================
-- Create Fact Table: v_InternetFactSales
-- =============================================================================

IF OBJECT_ID('v_InternetFactSales', 'V') IS NOT NULL
    DROP VIEW v_InternetFactSales;
GO

CREATE VIEW v_InternetFactSales AS
SELECT 
    f.SalesOrderNumber,
    f.SalesOrderLineNumber,
    f.OrderDateKey,
    f.CustomerKey,
    f.ProductKey,
    f.PromotionKey, 
    f.SalesTerritoryKey,
    e.EmployeeKey, 
    f.OrderQuantity,
    f.UnitPrice,
    f.DiscountAmount,
    f.SalesAmount AS [Sales Amount],
    f.TotalProductCost AS [Total Cost],
    (f.SalesAmount - f.TotalProductCost) AS [Profit Amount],
    p.EnglishPromotionName AS [Promotion Name] 
FROM FactInternetSales f
LEFT JOIN DimEmployee e 
    ON f.SalesTerritoryKey = e.SalesTerritoryKey
LEFT JOIN DimPromotion p
    ON f.PromotionKey = p.PromotionKey;
GO
