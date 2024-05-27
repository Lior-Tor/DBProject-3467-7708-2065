CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR2(100),
    CustomerEmail VARCHAR2(100)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR2(100),
    Position VARCHAR2(50),
    HireDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR2(100),
    Price INT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR2(100),
    SupplierEmail VARCHAR2(100)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    DateOfSale DATE,
    TotalAmount INT,
    CustomerID INT,
    StaffID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastRestockedDate DATE,
    SupplierID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE InventoryUsage (
    SaleID INT,
    InventoryID INT,
    PRIMARY KEY (SaleID, InventoryID),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
);
