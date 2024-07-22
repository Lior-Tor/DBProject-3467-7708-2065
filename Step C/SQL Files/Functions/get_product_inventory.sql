CREATE OR REPLACE FUNCTION get_product_inventory(product_id IN NUMBER)
RETURN SYS_REFCURSOR IS
    inventory_cursor SYS_REFCURSOR;
BEGIN
    -- Open a ref cursor to fetch the inventory records for a specific product
    OPEN inventory_cursor FOR
    SELECT * FROM Inventory WHERE ProductID = product_id;

    -- Return the ref cursor to the caller
    RETURN inventory_cursor;
EXCEPTION
    WHEN OTHERS THEN
        -- Raise an application error if any other exception occurs
        RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END get_product_inventory;
/
