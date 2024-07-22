CREATE OR REPLACE PROCEDURE insert_new_sale(sale_id IN NUMBER, sale_date IN DATE, total_amount IN NUMBER, customer_id IN NUMBER, employee_id IN NUMBER) IS
BEGIN
    -- Insert a new sale record into the Sales table
    INSERT INTO Sales (SaleID, DateOfSale, TotalAmount, CustomerID, EmployeeID)
    VALUES (sale_id, sale_date, total_amount, customer_id, employee_id);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Raise error if there is an issue inserting the new sale
        RAISE_APPLICATION_ERROR(-20004, 'Error inserting new sale: ' || SQLERRM);
END insert_new_sale;
/
