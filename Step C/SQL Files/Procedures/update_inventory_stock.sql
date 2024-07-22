CREATE OR REPLACE PROCEDURE update_inventory_stock(product_id IN NUMBER, new_quantity IN NUMBER) IS
BEGIN
    -- Update the inventory quantity for a specific product
    UPDATE Inventory
    SET Quantity = new_quantity
    WHERE ProductID = product_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Raise error if there is an issue updating the inventory stock
        RAISE_APPLICATION_ERROR(-20003, 'Error updating inventory stock: ' || SQLERRM);
END update_inventory_stock;
/
