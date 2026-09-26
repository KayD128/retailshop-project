-- select * from public."Retail_clean";

-- Most profitable products by revenue
-- SELECT "Description", SUM("revenue") AS total_revenue
-- FROM public."Retail_clean"
-- GROUP BY "Description"
-- ORDER BY total_revenue DESC
-- LIMIT 20;

-- Products with frequent returns (negative quantity)
-- "Adjust bad debt"
-- SELECT "Description", SUM("Quantity") AS total_neg_quantity
-- FROM public."Retail"
-- where "Quantity" < 0
-- GROUP BY "Description"
-- ORDER BY total_neg_quantity DESC
-- LIMIT 20;

-- They are returns, you can get gross sales and net sales. I have been doing 
-- gross all these while
-- select *
-- from public."Retail"
-- where "Quantity" < 0
-- order by "Quantity" ASC;

-- SELECT "Description", SUM("Quantity") AS total_neg_quantity
-- FROM public."Retail"
-- where "Quantity" < 0
-- GROUP BY "Description"
-- ORDER BY total_neg_quantity ASC
-- LIMIT 20;

-- Top customers by revenue
-- select "CustomerID", SUM("revenue") as total_revenue
-- from public."Retail_clean"
-- where "CustomerID" is not null
-- group by "CustomerID"
-- ORDER BY total_revenue DESC;

-- Repeat vs one-time customers
-- WITH customer_orders AS (
--     SELECT
--         "CustomerID",
--         COUNT(DISTINCT "InvoiceNo") AS total_orders,
-- 		sum("revenue") as total_revenue
--     FROM public."Retail_clean"
--     WHERE "CustomerID" IS NOT NULL
--     GROUP BY "CustomerID"
-- )

-- SELECT
--     CASE 
--         WHEN total_orders = 1 THEN 'One-Time'
--         ELSE 'Repeat'
--     END AS customer_type,
--     count(*) AS number_of_customers,
-- 	sum(total_revenue),
-- 	avg(total_revenue) as avg_rev
-- FROM customer_orders
-- GROUP BY 1;

-- Average spend per customer
-- select "CustomerID", round(avg("revenue"), 2) as avg_revenue
-- from public."Retail_clean"
-- where "CustomerID" is not null
-- group by "CustomerID"
-- order by avg_revenue desc;

-- Questions: Sales by day of week, Peak sales months, Growth over time
-- SELECT
--     EXTRACT(DOW FROM "InvoiceDate") AS day_number,
--     TO_CHAR("InvoiceDate", 'Day') AS day_name,
--     SUM("Quantity" * "UnitPrice") AS revenue
-- FROM public."Retail"
-- GROUP BY 1, 2
-- ORDER BY 3;

-- SELECT
--     DATE_TRUNC('month', "InvoiceDate") AS month,
--     sum(revenue) as revenue_sum
-- FROM public."Retail_clean"
-- GROUP BY 1
-- ORDER BY revenue_sum DESC;

-- SELECT
--     EXTRACT(MONTH FROM "InvoiceDate") AS month_number,
--     SUM("Quantity" * "UnitPrice") AS total_revenue
-- FROM public."Retail"
-- WHERE "Quantity" > 0
--   AND "UnitPrice" > 0
-- GROUP BY 1
-- ORDER BY total_revenue DESC;

-- SELECT
--     DATE_TRUNC('month', "InvoiceDate") AS month,
--     SUM("Quantity" * "UnitPrice") AS revenue,
--     SUM(SUM("Quantity" * "UnitPrice"))
--         OVER (ORDER BY DATE_TRUNC('month', "InvoiceDate"))
--         AS cumulative_revenue
-- FROM public."Retail"
-- WHERE "Quantity" > 0
--   AND "UnitPrice" > 0
-- GROUP BY 1
-- ORDER BY 1;

-- select "Description", "StockCode", count("Description") as desc_count
-- from public."Retail"
-- where "Quantity" <= 0
-- group by 1, 2 
-- order by desc_count desc;

select "Country", count("Country") from public."Retail"
group by 1;



