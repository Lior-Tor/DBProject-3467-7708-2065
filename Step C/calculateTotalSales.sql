CREATE OR REPLACE FUNCTION calculate_total_sales(customer_id IN NUMBER)
RETURN NUMBER IS
    total_sales NUMBER := 0;
    CURSOR sales_cursor IS
        SELECT TotalAmount FROM Sales WHERE CustomerID = customer_id;
BEGIN
    -- Loop through each sale to calculate the total amount
    FOR sale IN sales_cursor LOOP
        total_sales := total_sales + sale.TotalAmount;
    END LOOP;
    RETURN total_sales;
EXCEPTION
    WHEN OTHERS THEN
        -- Raise error if there is an issue
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END calculate_total_sales;
/
