DECLARE
    v_product_id NUMBER := 10037;
    v_new_quantity NUMBER := 50;
    v_inventory_cursor SYS_REFCURSOR;
    v_inventory_record Inventory%ROWTYPE;
BEGIN
    -- Call the procedure update_inventory_stock
    update_inventory_stock(v_product_id, v_new_quantity);

    -- Call the function get_product_inventory
    v_inventory_cursor := get_product_inventory(v_product_id);

    LOOP
        FETCH v_inventory_cursor INTO v_inventory_record;
        EXIT WHEN v_inventory_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Product ID: ' || v_inventory_record.ProductID || 
                             ', Quantity: ' || v_inventory_record.Quantity ||
                             ', Last Restocked Date: ' || v_inventory_record.LastRestockedDate);
    END LOOP;

    CLOSE v_inventory_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
