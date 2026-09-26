-- CREATE TABLE Retail (
--     InvoiceNo VARCHAR(50),
--     StockCode VARCHAR(50),
--     Description VARCHAR(70),
-- 	Quantity INT,
-- 	InvoiceDate TIMESTAMP,
-- 	UnitPrice NUMERIC(10,2)
--     CustomerID INT,
-- 	Country INT,
	    
-- );

-- Select * from public."Retail";

-- ALTER TABLE public."Retail"
-- ALTER COLUMN "Quantity" TYPE integer
-- USING "Quantity"::integer;

-- ALTER TABLE public."Retail"
-- ALTER COLUMN "InvoiceDate" TYPE TIMESTAMP
-- USING TO_TIMESTAMP("InvoiceDate", 'MM/DD/YYYY HH24:MI:SS AM');

-- ALTER TABLE public."Retail"
-- ALTER COLUMN "UnitPrice" TYPE NUMERIC
-- USING "UnitPrice"::NUMERIC;

-- ALTER TABLE public."Retail"
-- ALTER COLUMN "CustomerID" TYPE integer
-- USING "CustomerID"::integer;

