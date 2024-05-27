INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (1, 'John Doe', 'johndoe@example.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail) VALUES (2, 'Jane Smith', 'janesmith@example.com');

INSERT INTO Staff (StaffID, StaffName, Position, HireDate) VALUES (1, 'Alice Johnson', 'Cashier', TO_DATE('2020-01-15', 'YYYY-MM-DD'));
INSERT INTO Staff (StaffID, StaffName, Position, HireDate) VALUES (2, 'Bob Brown', 'Manager', TO_DATE('2019-03-10', 'YYYY-MM-DD'));

INSERT INTO Products (ProductID, ProductName, Price) VALUES (1, 'Laptop', 999);
INSERT INTO Products (ProductID, ProductName, Price) VALUES (2, 'Smartphone', 499);

INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (1, 'Tech Supplies Inc.', 'contact@techsupplies.com');
INSERT INTO Suppliers (SupplierID, SupplierName, SupplierEmail) VALUES (2, 'Gadget Wholesale', 'info@gadgetwholesale.com');

INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, StaffID) VALUES (1, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 1500, 1, 1);
INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, StaffID) VALUES (2, TO_DATE('2024-05-02', 'YYYY-MM-DD'), 750, 2, 2);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastRestockedDate, SupplierID) VALUES (1, 1, 50, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 1);
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastRestockedDate, SupplierID) VALUES (2, 2, 30, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 2);

INSERT INTO InventoryUsage (SaleID, InventoryID) VALUES (1, 1);
INSERT INTO InventoryUsage (SaleID, InventoryID) VALUES (2, 2);
