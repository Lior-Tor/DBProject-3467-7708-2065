-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, Price, TypeOfProduct) VALUES (1, 'Laptop', 1000, 'Electronics');
INSERT INTO Products (ProductID, ProductName, Price, TypeOfProduct) VALUES (2, 'Phone', 700, 'Electronics');
INSERT INTO Products (ProductID, ProductName, Price, TypeOfProduct) VALUES (3, 'Desk', 200, 'Furniture');
INSERT INTO Products (ProductID, ProductName, Price, TypeOfProduct) VALUES (4, 'Chair', 100, 'Furniture');
INSERT INTO Products (ProductID, ProductName, Price, TypeOfProduct) VALUES (5, 'Monitor', 300, 'Electronics');

-- Insert data into Customers
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (1, 'John Doe', 'john.doe@example.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (2, 'Jane Smith', 'jane.smith@example.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (3, 'Alice Johnson', 'alice.johnson@example.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (4, 'Bob Brown', 'bob.brown@example.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (5, 'Charlie Green', 'charlie.green@example.com');

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (1, 'Emily White', 'Manager', TO_DATE('2019-03-15', 'YYYY-MM-DD'));
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (2, 'David Black', 'Salesperson', TO_DATE('2020-06-20', 'YYYY-MM-DD'));
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (3, 'Susan Blue', 'Clerk', TO_DATE('2021-01-10', 'YYYY-MM-DD'));
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (4, 'Michael Red', 'Salesperson', TO_DATE('2018-11-25', 'YYYY-MM-DD'));
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (5, 'Laura Yellow', 'Clerk', TO_DATE('2022-02-05', 'YYYY-MM-DD'));

-- Insert data into Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (1, 'Tech Supplies Co.', 'contact@techsupplies.com');
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (2, 'Office Essentials Inc.', 'support@officeessentials.com');
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (3, 'Furniture World', 'sales@furnitureworld.com');
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (4, 'Gadget Pros', 'info@gadgetpros.com');
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (5, 'Home Office Solutions', 'service@homeofficesolutions.com');

-- Insert data into Sales
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1300, 1, 1);
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (2, TO_DATE('2023-01-02', 'YYYY-MM-DD'), 700, 2, 2);
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (3, TO_DATE('2023-01-03', 'YYYY-MM-DD'), 300, 3, 3);
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (4, TO_DATE('2023-01-04', 'YYYY-MM-DD'), 100, 4, 4);
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (5, TO_DATE('2023-01-05', 'YYYY-MM-DD'), 200, 5, 5);

-- Insert data into Inventory
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (1, 50, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (2, 30, TO_DATE('2023-06-02', 'YYYY-MM-DD'), 2, 2);
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (3, 20, TO_DATE('2023-06-03', 'YYYY-MM-DD'), 3, 3);
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (4, 40, TO_DATE('2023-06-04', 'YYYY-MM-DD'), 4, 4);
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (5, 60, TO_DATE('2023-06-05', 'YYYY-MM-DD'), 5, 5);

-- Insert data into ProductSales
INSERT INTO ProductSales (SaleID, CustomerID, EmployeeID, ProductID) VALUES (1, 1, 1, 1);
INSERT INTO ProductSales (SaleID, CustomerID, EmployeeID, ProductID) VALUES (2, 2, 2, 2);
INSERT INTO ProductSales (SaleID, CustomerID, EmployeeID, ProductID) VALUES (3, 3, 3, 3);
INSERT INTO ProductSales (SaleID, CustomerID, EmployeeID, ProductID) VALUES (4, 4, 4, 4);
INSERT INTO ProductSales (SaleID, CustomerID, EmployeeID, ProductID) VALUES (5, 5, 5, 5);
