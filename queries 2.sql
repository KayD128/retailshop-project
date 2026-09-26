-- select count(*) from public."Retail";

-- select count(distinct "CustomerID")
-- from public."Retail";

-- select count(distinct "InvoiceNo")
-- from public."Retail";

-- select count(distinct "StockCode")
-- from public."Retail";

-- select max("InvoiceDate")
-- from public."Retail";

-- select count(*) 
-- from public."Retail"
-- where "Quantity" < 0;

-- Data cleaning
-- Description (1454) and CustomerID (135080) has null values

-- select 
-- sum(case when "CustomerID" is null then 1 else 0 end) as invoiceNo_nulls
-- from public."Retail";

-- select * 
-- from public."Retail"
-- where "CustomerID" is NULL;

-- select *
-- from public."Retail"
-- where "UnitPrice" > 0 and "Quantity" > 0;

-- CREATE TABLE public."Retail_clean" AS
-- SELECT *
-- FROM public."Retail"
-- WHERE "UnitPrice" > 0 and "Quantity" > 0;

-- select * from public."Retail_clean";

-- Only CustomerID (132220) is dirty now

-- select 
-- sum(case when "CustomerID" is null then 1 else 0 end) as invoiceNo_nulls
-- from public."Retail_clean";

-- alter table public."Retail"
-- add column revenue numeric;

-- update public."Retail"
-- set revenue = "Quantity" * "UnitPrice"

-- select sum(revenue) as total_revenue
-- from public."Retail_clean";

-- calculating revenue by month
-- SELECT 
--     TO_CHAR("InvoiceDate", 'Day') AS day_name,
--     SUM(revenue) AS total_revenue
-- FROM public."Retail_clean"
-- GROUP BY day_name
-- ORDER BY total_revenue DESC;

-- SELECT
--     DATE_TRUNC('month', "InvoiceDate") AS month,
--     SUM(revenue) AS monthly_revenue
-- FROM public."Retail"
-- GROUP BY 1
-- ORDER BY 1;

-- SELECT
--     DATE_TRUNC('year', "InvoiceDate") AS year,
--     SUM(revenue) AS yearly_revenue
-- FROM public."Retail_clean"
-- GROUP BY 1
-- ORDER BY 1;

-- Top Products by Quantity
-- SELECT "StockCode", "Description", SUM("Quantity") AS total_quantity_sold
-- FROM public."Retail_clean"
-- GROUP BY "StockCode", "Description"
-- ORDER BY total_quantity_sold DESC
-- LIMIT 10;

-- select "Description", "Quantity"
-- from public."Retail_clean"
-- where "Description" = 'PAPER CRAFT , LITTLE BIRDIE';