CREATE TABLE Products
(
  ProductID INT NOT NULL,
  Price INT NOT NULL,
  ProductName CHAR(30) NOT NULL,
  PRIMARY KEY (ProductID)
);

CREATE TABLE Customers
(
  CustomerID INT NOT NULL,
  CustomerName CHAR(30) NOT NULL,
  CustomerEmail CHAR(30) NOT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Employees
(
  EmployeeID INT NOT NULL,
  EmployeeName VARCHAR NOT NULL,
  Position VARCHAR NOT NULL,
  HireDate_ DATE NOT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Suppliers
(
  SupplierID INT NOT NULL,
  SupplierName VARCHAR(30) NOT NULL,
  SupplierEmail VARCHAR(30) NOT NULL,
  PRIMARY KEY (SupplierID)
);

CREATE TABLE Sales
(
  SaleID INT NOT NULL,
  DateOfSale DATE NOT NULL,
  TotalAmount INT NOT NULL,
  CustomerID INT NOT NULL,
  ProductID INT NOT NULL,
  PRIMARY KEY (SaleID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Store
(
  InventoryID INT NOT NULL,
  Quantity INT NOT NULL,
  LastRestockedDate DATE NOT NULL,
  ProductID INT NOT NULL,
  SupplierID INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (InventoryID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
