SET serveroutput ON;
--1
CREATE OR REPLACE TRIGGER update_salary_trigger AFTER
  INSERT ON salary_change FOR EACH ROW DECLARE v_employee_id employees.employee_id%TYPE;
  v_current_salary employees.salary%TYPE;
  v_new_salary employees.salary%TYPE;
  BEGIN
    SELECT salary
    INTO v_current_salary
    FROM employees
    WHERE employee_id = :new.employee_id;
    v_new_salary     := v_current_salary * 1.10;
    UPDATE employees
    SET new_salary    = v_new_salary
    WHERE employee_id = :new.employee_id;
  END update_salary_trigger;
  /
  --2
CREATE OR REPLACE TRIGGER check_inventory_trigger BEFORE
  INSERT ON orders FOR EACH ROW DECLARE v_available_quantity products.available_quantity%TYPE;
  BEGIN
    SELECT available_quantity
    INTO v_available_quantity
    FROM products
    WHERE product_id = :new.product_id;
    IF :new.quantity > v_available_quantity THEN
      RAISE_APPLICATION_ERROR(-20001, 'Ordered quantity exceeds available quantity for Product ID: ' || :new.product_id);
    END IF;
  END check_inventory_trigger;
  /
  -3
CREATE OR REPLACE TRIGGER audit_inserts_trigger AFTER
  INSERT ON customer FOR EACH ROW BEGIN
  INSERT
  INTO audit_log
    (
      table_name,
      operation,
      customer_id,
      first_name,
      last_name,
      inserted_by,
      inserted_date
    )
    VALUES
    (
      'customer',
      'INSERT',
      :new.customer_id,
      :new.first_name,
      :new.last_name,
      USER,
      SYSDATE
    );
END audit_inserts_trigger;
/
--6
CREATE OR REPLACE TRIGGER update_manager_salary AFTER
  UPDATE ON employee FOR EACH ROW DECLARE v_manager_salary employee.salary%TYPE;
  BEGIN
    IF :new.manager_id IS NOT NULL THEN
      SELECT salary
      INTO v_manager_salary
      FROM employee
      WHERE employee_id   = :new.manager_id;
      IF :new.salary      > v_manager_salary THEN
        v_manager_salary := v_manager_salary * 1.10;
      ELSE
        v_manager_salary := v_manager_salary * 0.95;
      END IF;
      UPDATE employee
      SET salary        = v_manager_salary
      WHERE employee_id = :new.manager_id;
      COMMIT;
    END IF;
  END update_manager_salary;
  /
  --8
CREATE OR REPLACE TRIGGER employee_history_trigger BEFORE
  UPDATE ON employee FOR EACH ROW BEGIN
  INSERT
  INTO employee_history
    (
      employee_id,
      old_salary,
      old_job_title,
      update_date
    )
    VALUES
    (
      :old.employee_id,
      :old.salary,
      :old.job_title,
      SYSDATE
    );
END employee_history_trigger;
/
--9
CREATE OR REPLACE TRIGGER update_product_stock_trigger AFTER
  INSERT ON order_details FOR EACH ROW BEGIN
  UPDATE products
  SET stock_quantity = stock_quantity - :new.quantity
  WHERE product_id   = :new.product_id;
  COMMIT;
END update_product_stock_trigger;
/
