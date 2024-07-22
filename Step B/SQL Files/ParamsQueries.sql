-- Query 1: Select customers who made purchases after a specified date.
-- Parameter: StartDate (DATE)
SELECT c.CustomerName, c.CustomerEmail, SUM(s.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.DateOfSale > TO_DATE('&StartDate', 'DD-MM-YYYY')
GROUP BY c.CustomerID, c.CustomerName, c.CustomerEmail
ORDER BY TotalSpent DESC;

-- Query 2: Select employees who made sales of a specified minimum amount.
-- Parameter: MinAmount (NUMBER)
SELECT e.EmployeeName, COUNT(s.SaleID) AS TotalSales, SUM(s.TotalAmount) AS TotalRevenue
FROM Employees e
JOIN Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING SUM(s.TotalAmount) > &<name=MinAmount default=5000 required=true>
ORDER BY TotalRevenue DESC;

-- Query 3: Select products within a specified price range and a specified type.
-- Parameters: MinPrice, MaxPrice, ProductType
SELECT p.ProductName, p.Price, p.TypeOfProduct
FROM Products p
WHERE p.Price BETWEEN &<name=MinPrice default=400 required=true>
AND &<name=MaxPrice default=500 required=true>
AND p.TypeOfProduct = '&<name=ProductType list="select distinct TypeOfProduct from Products" required=true>'
ORDER BY p.Price DESC;

-- Query 4: Select inventory items restocked by a specified supplier since a given date.
-- Parameters: SupplierName, RestockDate
SELECT p.ProductName, s.SupplierName, i.Quantity, i.LastRestockedDate
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
JOIN Suppliers s ON i.SupplierID = s.SupplierID
WHERE s.SupplierName = '&SupplierName'
AND i.LastRestockedDate > TO_DATE('&RestockDate', 'DD-MM-YYYY')
ORDER BY i.LastRestockedDate DESC;



commit;
