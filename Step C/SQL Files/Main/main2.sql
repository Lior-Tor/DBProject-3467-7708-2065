DECLARE
    v_sale_id NUMBER := 100400;
    v_sale_date DATE := SYSDATE;
    v_total_amount NUMBER := 100;
    v_customer_id NUMBER := 197;
    v_employee_id NUMBER := 572;
    v_total_sales NUMBER;
BEGIN
    -- Call the procedure insert_new_sale
    insert_new_sale(v_sale_id, v_sale_date, v_total_amount, v_customer_id, v_employee_id);

    -- Call the function calculate_total_sales
    v_total_sales := calculate_total_sales(v_customer_id);

    DBMS_OUTPUT.PUT_LINE('Total sales for customer ' || v_customer_id || ' is ' || v_total_sales);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
