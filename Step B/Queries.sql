-- Select Queries

-- Query 1: Select the product with the highest price for each type of product. List the products in descending order of price.
SELECT p.ProductID, p.ProductName, p.Price, p.TypeOfProduct
FROM Products p
WHERE p.Price = (
    SELECT MAX(p2.Price) 
    FROM Products p2 
    WHERE p2.TypeOfProduct = p.TypeOfProduct
)
ORDER BY p.Price DESC;

-- Query 2: Group the sales by year and month, showing the total sales amount and average sales amount for each month.
SELECT 
    Year,
    Month,
    Total_Sales,
    Avg_Sales_Amount
FROM (
    SELECT 
        EXTRACT(YEAR FROM s.DateOfSale) AS Year,
        EXTRACT(MONTH FROM s.DateOfSale) AS Month,
        SUM(s.TotalAmount) AS Total_Sales,
        AVG(s.TotalAmount) AS Avg_Sales_Amount
    FROM 
        Sales s
    GROUP BY 
        EXTRACT(YEAR FROM s.DateOfSale),
        EXTRACT(MONTH FROM s.DateOfSale)
) MonthlyStats
ORDER BY 
    Year DESC, 
    Month DESC;

-- Query 3: List customers who have made purchases totaling more than $5,000 in the last year. Order by total amount spent.
SELECT c.CustomerID, c.CustomerName, c.CustomerEmail, SUM(s.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.DateOfSale >= TRUNC(SYSDATE) - INTERVAL '1' YEAR
GROUP BY c.CustomerID, c.CustomerName, c.CustomerEmail
HAVING SUM(s.TotalAmount) > 5000
ORDER BY TotalSpent DESC;

-- Query 4: List employees who have made the most sales transactions in the last year. Order by the number of sales transactions in descending order.
SELECT e.EmployeeID, e.EmployeeName, COUNT(s.SaleID) AS TotalSalesTransactions
FROM Employees e
JOIN Sales s ON e.EmployeeID = s.EmployeeID
WHERE s.DateOfSale >= TRUNC(SYSDATE) - INTERVAL '1' YEAR
GROUP BY e.EmployeeID, e.EmployeeName
ORDER BY TotalSalesTransactions DESC;



-- Delete Queries

-- Query 1: Delete sales records older than a specific date
-- This query deletes sales records that have a DateOfSale earlier than January 1, 2022.
-- It ensures the deletion of outdated sales records to keep the database up to date.
DELETE FROM Sales
WHERE DateOfSale < TO_DATE('01-01-2022', 'DD-MM-YYYY');

-- Query 2: Delete inventory records where quantity is zero
-- This query deletes inventory records where the quantity is zero.
-- It cleans up the inventory table by removing records that indicate no stock.
DELETE FROM Inventory
WHERE Quantity < 0;



-- Update Queries

-- Query 1: Update the position of employees who are currently 'Cashier' to 'Janitor'.
UPDATE Employees
SET Position = 'Janitor'
WHERE Position = 'Cashier';

-- 2. Update the price of all products by increasing it by 10% for products in the 'Electronics' category.
UPDATE Products
SET Price = Price * 1.10
WHERE TypeOfProduct = 'Electronics';



commit;
