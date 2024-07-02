CREATE TABLE Products
(
  ProductID INT NOT NULL,
  ProductName VARCHAR2(100) NOT NULL,
  Price INT NOT NULL,
  TypeOfProduct VARCHAR2(100) NOT NULL,
  PRIMARY KEY (ProductID)
);

CREATE TABLE Customers
(
  CustomerID INT NOT NULL,
  CustomerName VARCHAR2(100) NOT NULL,
  CustomerEmail VARCHAR2(100) NOT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Employees
(
  EmployeeID INT NOT NULL,
  EmployeeName VARCHAR2(100) NOT NULL,
  Position VARCHAR2(100) NOT NULL,
  HireDate DATE NOT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Suppliers
(
  SupplierID INT NOT NULL,
  SupplierName VARCHAR2(100) NOT NULL,
  SupplierEmail VARCHAR2(100) NOT NULL,
  PRIMARY KEY (SupplierID)
);

CREATE TABLE Sales
(
  SaleID INT NOT NULL,
  DateOfSale DATE NOT NULL,
  TotalAmount INT NOT NULL,
  CustomerID INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (SaleID, CustomerID, EmployeeID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Inventory
(
  InventoryID INT NOT NULL,
  Quantity INT NOT NULL,
  LastRestockedDate DATE NOT NULL,
  ProductID INT NOT NULL,
  SupplierID INT NOT NULL,
  PRIMARY KEY (InventoryID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE ProductSales
(
  SaleID INT NOT NULL,
  CustomerID INT NOT NULL,
  EmployeeID INT NOT NULL,
  ProductID INT NOT NULL,
  PRIMARY KEY (SaleID, CustomerID, EmployeeID, ProductID),
  FOREIGN KEY (SaleID, CustomerID, EmployeeID) REFERENCES Sales(SaleID, CustomerID, EmployeeID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
