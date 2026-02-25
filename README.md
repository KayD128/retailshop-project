# retailshop-project analysis using SQL
This project is a summary of the sales of a retail shop within a year. The columns include; the invoice numbers, invoice date, customer id, Stock Code, Description, Quantity, Unit Price, Country and revenue. It is summarised using only PostgreSQL. The goal is to answer critical business questions that can help improve revenue and understand customer purchasing behavior.

The table was set up by creating a table in the database with the column names and importing the csv file into the database.

## Objectives
- Analyze overall sales performance
- Understand customer purchasing patterns
- Evaluate revenue trends over time
- Detect anomalies such as returns and what to do with them

## Dataset Description
InvoiceNo - Invoice Number. Mixture of figures and letters. It is not a unique identifier,
StockCode - This is for the product,
Description - Description of each product,
Quantity - The number of product sold,
InvoiceDate - This is the date and time the transactions were carried out,
UnitPrice - Price for each product
CustomerID - Customer identifier,
Country - Country where each product was bought

Number of rows - 541909

[CREATE TABLE Retail (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(70),
	Quantity INT,
	InvoiceDate TIMESTAMP,
	UnitPrice NUMERIC(10,2)
    CustomerID INT,
	Country VARCHAR(50)
);]

## Data Cleaning and preparation
The following steps were performed:

- Investigated rows with no CustomerID. I cannot drop them, they were too many. So I decided to leave them and regarded them as ghost or Unknown customers.
- Filtered out records with zero or negative UnitPrice and Quantity, and made it into 2 datasets. The negative values in Quantity are the returns (they would be used later in analysis). While the one in UnitPrice were dropped since they are just 2.
- Converted InvoiceDate to proper timestamp format
- Created a new column:
  - Revenue = Quantity * UnitPrice


## Sales Analysis
## Questions asked and answers for each
- How many invoices, products, and customers do we have?: Number of customers is 4,372. Number of distinct invoice is 25,900. Stock Code - 4,070.

- What date range does the data cover?: "2010-12-01 08:26:00" and "2011-12-09 12:50:00".

- Any negative quantities (returns/refunds)?: 10,624 rows with negative Quantity.


### Data Cleaning & Prep (Very SQL-relevant)
- Handling null customer IDs: Description (1454) and CustomerID (135080) has null values.

- Filtering invalid prices: 


### Sales & Revenue Analysis:
Create Revenue: I created the net revenue and gross revenue. Net revenue = 9,747,747.934. Gross revenue = 10,666,684.544

**Questions**:

- Revenue by day/month/year: With a figure of; 1,509,496.33, the highest revenue is gotten in November, 2011. The least is February, 2011 with 523,631.89. Thursday brings in the highest revenue while Sunday brings in the least.


### Product Analysis
To understand what sells best.

**Questions:**

- Top-selling products by quantity: "PAPER CRAFT , LITTLE BIRDIE"

- Most profitable products by revenue: "DOTCOM POSTAGE"

- Products with frequent returns (negative quantity): "PAPER CRAFT, LITTLE BIRDIE" - -80995


### Customer Analysis
Very valuable for business decisions.

**Questions:**

- Top customers by revenue: The top customer is 14646 with 280206.02 in revenue.

- Repeat vs one-time customers: There are more repeat customers than one-time customers

- Average spend per customer: 


### Time-Based Analysis

**Questions:**

- Sales by day of week: Thursday and Tuesday are the highest revenue but Friday and Sunday are the lowest revenue.

- Growth over time: No growth over time. Everything seems random.

**Questions:**

- How much revenue is lost to returns?: -896812.49

- Which products are returned most?: Description - "Manual", Stock Code - "M".

- Which countries generate the most revenue?: United Kingdom
  
- Customer distribution by country: "Australia"	1259,
"Austria"	401,
"Bahrain"	19,
"Belgium"	2069,
"Brazil"	32,
"Canada"	151,
"Channel Islands" 758,
"Cyprus"	622,
"Czech Republic" 30,
"Denmark" 389,
"EIRE" 8196, 
"European Community"	61,
"Finland"	695,
"France"	8557,
"Germany"	9495,
"Greece"	146,
"Hong Kong"	288,
"Iceland"	182,
"Israel"	297,
"Italy"	803,
"Japan"	358,
"Lebanon"	45,
"Lithuania"	35,
"Malta"	127,
"Netherlands" 2371,
"Norway"	1086,
"Poland"	341,
"Portugal"	1519,
"RSA"	58,
"Saudi Arabia"	10,
"Singapore"	229,
"Spain"	2533,
"Sweden"	462,
"Switzerland"	2002,
"United Arab Emirates"	68,
"United Kingdom"	495478,
"Unspecified"	446,
"USA"	291,

### Some Key Insights
- In terms of month, the revenue is random. But for days of the week. The week days, more revenue is generated on weekdays than on weekends. In fact, there is no Sunday in the data.
- DOTCOM POSTAGE is probably a type of product or service. This is what generates revenue most, followed by cakes.
- Repeat customers generate more revenue than one-time buyers
- Negative quantities likely represent product returns.
- The number of Customer ID is a lot. So I believe they can't be known or **Unknown**. It can't be dropped since it is a necessary part of our analysis.
- Most orders come from UK. So location heavily affects the data. I believe the shop operates better in United Kingdom. If not, then they need to have a branch there.

### Sample SQL Queries
-- Table Creation

CREATE TABLE Retail (
     InvoiceNo VARCHAR(50),
     StockCode VARCHAR(50),
     Description VARCHAR(70),
 	Quantity INT,
 	InvoiceDate TIMESTAMP,
 	UnitPrice NUMERIC(10,2)
     CustomerID INT,
 	Country INT,
 );

-- Top Products by Quantity

SELECT "StockCode", "Description", SUM("Quantity") AS total_quantity_sold
FROM public."Retail_clean"
GROUP BY "StockCode", "Description"
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Checking for duplicates

SELECT 
"InvoiceNo", "StockCode", "Description", "Quantity", "InvoiceDate", "UnitPrice", "CustomerID", "Country", "revenue",
COUNT(*) AS count
FROM public."Retail"
GROUP BY "InvoiceNo", "StockCode", "Description", "Quantity", "InvoiceDate", "UnitPrice", "CustomerID", "Country", "revenue"
HAVING COUNT(*) > 1;

-- Repeat vs one-time customers

 WITH customer_orders AS (
     SELECT
         "CustomerID",
         COUNT(DISTINCT "InvoiceNo") AS total_orders,
 		sum("revenue") as total_revenue
     FROM public."Retail_clean"
     WHERE "CustomerID" IS NOT NULL
     GROUP BY "CustomerID"
 )


 SELECT
     CASE 
         WHEN total_orders = 1 THEN 'One-Time'
         ELSE 'Repeat'
     END AS customer_type,
     count(*) AS number_of_customers,
 	sum(total_revenue),
 	avg(total_revenue) as avg_rev
 FROM customer_orders
 GROUP BY 1;

-- Questions: Sales by day of week, Peak sales months, Growth over time

 SELECT
     EXTRACT(DOW FROM "InvoiceDate") AS day_number,
     TO_CHAR("InvoiceDate", 'Day') AS day_name,
     SUM("Quantity" * "UnitPrice") AS revenue
 FROM public."Retail"
 GROUP BY 1, 2
 ORDER BY 3;

 SELECT
     EXTRACT(MONTH FROM "InvoiceDate") AS month_number,
     SUM("Quantity" * "UnitPrice") AS total_revenue
 FROM public."Retail"
 WHERE "Quantity" > 0
   AND "UnitPrice" > 0
 GROUP BY 1
 ORDER BY total_revenue DESC;

### Future Improvements
- Build dashboards using Power BI
- Perform customer segmentation
- Use predictive models for sales forecasting on python
