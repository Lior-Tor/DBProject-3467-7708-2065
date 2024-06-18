CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR2(100),
    CustomerEmail VARCHAR2(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Position VARCHAR2(100),
    HireDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR2(100),
    TypeOfProduct VARCHAR2(100),
    Price INT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR2(100),
    SupplierEmail VARCHAR2(100)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    Quantity INT,
    LastRestockedDate DATE,
    ProductID INT,
    SupplierID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Sales (
    SaleID INT,
    DateOfSale DATE,
    TotalAmount INT,
    CustomerID INT,
    EmployeeID INT,
    PRIMARY KEY (SaleID, CustomerID, EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE SalesProducts (
    SalesProductsID INT PRIMARY KEY,
    SaleID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
