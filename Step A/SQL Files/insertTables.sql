-- Insert data into Customers
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (1, 'John Doe', 'john.doe@example.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (2, 'Jane Smith', 'jane.smith@example.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (3, 'Alice Johnson', 'alice.johnson@example.com');

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (1, 'Michael Brown', 'Manager', TO_DATE('2020-01-15', 'YYYY-MM-DD'));
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (2, 'Emily Davis', 'Sales Associate', TO_DATE('2019-05-23', 'YYYY-MM-DD'));
INSERT INTO Employees (EmployeeID, EmployeeName, Position, HireDate) VALUES (3, 'Robert Wilson', 'Cashier', TO_DATE('2021-08-10', 'YYYY-MM-DD'));

-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, TypeOfProduct, Price) VALUES (1, 'Laptop', 'Electronics', 1000);
INSERT INTO Products (ProductID, ProductName, TypeOfProduct, Price) VALUES (2, 'Smartphone', 'Electronics', 700);
INSERT INTO Products (ProductID, ProductName, TypeOfProduct, Price) VALUES (3, 'Tablet', 'Electronics', 300);

-- Insert data into Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (1, 'Tech Supplies Co.', 'contact@techsupplies.com');
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (2, 'Gadget World', 'info@gadgetworld.com');
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (3, 'Device Hub', 'support@devicehub.com');

-- Insert data into Inventory
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (1, 50, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (2, 100, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 2, 2);
INSERT INTO Inventory (InventoryID, Quantity, LastRestockedDate, ProductID, SupplierID) VALUES (3, 200, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 3, 3);

-- Insert data into Sales
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (1, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 1000, 1, 1);
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (2, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 700, 2, 2);
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID) VALUES (3, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 300, 3, 3);

-- Insert data into SalesProducts
INSERT INTO SalesProducts (SalesProductsID, SaleID, ProductID, Quantity) VALUES (1, 1, 1, 1);
INSERT INTO SalesProducts (SalesProductsID, SaleID, ProductID, Quantity) VALUES (2, 1, 2, 2);
INSERT INTO SalesProducts (SalesProductsID, SaleID, ProductID, Quantity) VALUES (3, 2, 1, 1);
INSERT INTO SalesProducts (SalesProductsID, SaleID, ProductID, Quantity) VALUES (4, 3, 3, 3);
