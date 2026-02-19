# retailshop-project
This project is a summary of the sales of a retail shop within a year. The columns include; the invoice numbers, invoice date, customer id, Stock Code, Description, Quantity, Unit Price, Country and revenue. It is summarised using only PostgreSQL.

The table was set up by creating a table in the database with the column names and importing the csv file into the database.
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

## Questions asked and answers for each
1.  How many invoices, products, and customers do we have?: [Select count(distinct "CustomerID") from public."Retail"; Select count(distinct "InvoiceNo") from public."Retail"; Select count(distinct "StockCode") from public."Retail";]

2.  What date range does the data cover?

3.  Any negative quantities (returns/refunds)?


### Data Cleaning & Prep (Very SQL-relevant)
4. Handling null customer IDs

5. Removing cancelled invoices

6. Filtering invalid prices


### Sales & Revenue Analysis:
Create Revenue: 

**Questions**:

7. Total revenue?

8. Revenue by day/month/year

9. Average order value (AOV)


### Product Analysis
Understand what sells best.

**Questions:**

10. Top-selling products by quantity

11. Most profitable products by revenue

12. Products with frequent returns (negative quantity)


### Customer Analysis
Very valuable for business decisions.

**Questions:**

13. Top customers by revenue

14. Repeat vs one-time customers

15. Average spend per customer


### Time-Based Analysis
Great for trends and seasonality.

**Questions:**

16. Sales by day of week

17. Peak sales months

18. Growth over time

**Questions:**

19. How much revenue is lost to returns?

20. Which products are returned most?


