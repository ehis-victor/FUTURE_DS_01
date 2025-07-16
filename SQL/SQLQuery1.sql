CREATE DATABASE Online_retail

USE Online_retail


IF OBJECT_ID('dbo.Ecommerce_sales', 'U') IS NOT NULL
    DROP TABLE dbo.Ecommerce_sales;

SELECT Invoice, 
	StockCode, 
	Description, 
	Quantity, 
	CAST (InvoiceDate AS DATETIME) AS InvoiceDate,
	Price,
	Customer_ID,
	Country,
	FORMAT(CAST(InvoiceDate AS DATETIME), 'yyyy-MM') AS YearMonth,
	Quantity * Price AS TotalPrice,
	DATEPART(HOUR, InvoiceDate) AS OrderHour
INTO dbo.Ecommerce_Sales
FROM (
	SELECT * FROM dbo.sales_2009_2010
	UNION ALL			
	SELECT * FROM dbo.sales_2010_2011
) AS Combined
WHERE 
	Description IS NOT NULL
	AND Customer_ID IS NOT NULL
	AND Quantity > 0
	AND Price > 0;

SELECT * FROM Ecommerce_Sales;

