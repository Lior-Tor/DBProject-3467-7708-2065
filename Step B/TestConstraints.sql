-- Attempt to insert a new customer with an existing email address.
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail)
VALUES (401, 'John Doe', 'anne.garner@anheuserbusch.uk');

-- Attempt to insert a new product with a Price of 0.
INSERT INTO Products (ProductID, ProductName, Price, TypeOfProduct)
VALUES (101, 'Test Product', 0, 'Electronics');

-- Attempt to insert a new inventory record with a Quantity of 0.
INSERT INTO Inventory (InventoryID, ProductID, Quantity, LastRestockedDate, SupplierID)
VALUES (301, 101, 0, SYSDATE, 201);
