-- Adding Constraints

-- 1. Add a UNIQUE constraint to the CustomerEmail column in the Customers table.
ALTER TABLE Customers
ADD CONSTRAINT customer_email UNIQUE (CustomerEmail);

-- 2. Add a CHECK constraint to ensure the Price in the Products table is greater than 0.
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

-- 3. Add a CHECK constraint to ensure the Quantity in the Inventory table is greater than 0.
ALTER TABLE Inventory
ADD CONSTRAINT chk_quantity CHECK (Quantity > 0);

commit;
