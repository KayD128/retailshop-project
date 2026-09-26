
-- select * from public."Retail_clean";

-- Most profitable products by revenue
-- SELECT "Description", SUM("revenue") AS total_revenue
-- FROM public."Retail_clean"
-- GROUP BY "Description"
-- ORDER BY total_revenue DESC
-- LIMIT 20;

-- Products with frequent returns (negative quantity)
-- SELECT "Description", SUM("Quantity") AS total_neg_quantity
-- FROM public."Retail"
-- where "Quantity" < 0
-- GROUP BY "Description"
-- ORDER BY total_neg_quantity asc
-- LIMIT 20;

SELECT 
"InvoiceNo", "StockCode", "Description", "Quantity", "InvoiceDate", "UnitPrice", "CustomerID", "Country", "revenue",
COUNT(*) AS count
FROM public."Retail"
GROUP BY "InvoiceNo", "StockCode", "Description", "Quantity", "InvoiceDate", "UnitPrice", "CustomerID", "Country", "revenue"
HAVING COUNT(*) > 1;

