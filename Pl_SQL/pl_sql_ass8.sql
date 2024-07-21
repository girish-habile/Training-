SET serveroutput ON;
--1
CREATE OR REPLACE
  FUNCTION calculate_area(
      LENGTH IN NUMBER,
      width  IN NUMBER)
    RETURN NUMBER
  IS
    area NUMBER;
  BEGIN
    area := LENGTH * width;
    RETURN area;
  END;
  /
  DECLARE
    V_length NUMBER := 30;
    V_width  NUMBER := 40;
    V_area   NUMBER;
  BEGIN
    V_area := calculate_area(V_length, V_width);
    DBMS_OUTPUT.PUT_LINE('Area of rectangle: ' || V_area);
  END;
  /
  --2
CREATE OR REPLACE
FUNCTION reverse_string(
    P_string IN VARCHAR2)
  RETURN VARCHAR2
IS
  r_string VARCHAR2(100) := '';
BEGIN
  FOR i IN REVERSE 1..LENGTH(P_string)
  LOOP
    r_string := r_string || SUBSTR(P_string, i, 1);
  END LOOP;
  RETURN r_string;
END;
/
DECLARE
  V_string  VARCHAR2(100);
  V_reverse VARCHAR2(100);
BEGIN
  V_string  := 'Girish';
  V_reverse := reverse_string(V_string);
  DBMS_OUTPUT.PUT_LINE('Given: ' || V_string || ' | Reversed: ' || V_reverse);
END;
/
--3
CREATE OR REPLACE
FUNCTION safe_division(
    numerator   IN NUMBER,
    denominator IN NUMBER)
  RETURN NUMBER
IS
  result NUMBER;
BEGIN
  IF denominator = 0 THEN
    RETURN NULL;
  ELSE
    result := numerator / denominator;
    RETURN result;
  END IF;
END;
/
DECLARE
  numerator       NUMBER;
  denominator     NUMBER;
  division_result NUMBER;
BEGIN
  numerator       := 1000000;
  denominator     := 5;
  division_result := safe_division(numerator, denominator);
  DBMS_OUTPUT.PUT_LINE('numerator: ' || numerator || ' '|| 'denominator: ' || denominator ||' '|| 'Division: ' || division_result);
  numerator       := 10;
  denominator     := 0;
  division_result := safe_division(numerator, denominator);
  DBMS_OUTPUT.PUT_LINE('numerator: ' || numerator ||' '||'denominator: ' || denominator ||' '|| 'Division: ' || division_result);
END;
/
--4
CREATE OR REPLACE
FUNCTION get_employee_count(
    dept_id IN NUMBER)
  RETURN NUMBER
IS
  emp_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO emp_count FROM employees WHERE department_id = dept_id;
  RETURN emp_count;
EXCEPTION
WHEN NO_DATA_FOUND THEN
  RETURN 0;
END;
/
DECLARE
  department_id  NUMBER := 3;
  employee_count NUMBER;
BEGIN
  employee_count := get_employee_count(department_id);
  DBMS_OUTPUT.PUT_LINE('Number of employees in department ' || department_id || ': ' || employee_count);
END;
/
--5
CREATE OR REPLACE
FUNCTION get_employee_salary(
    emp_id IN NUMBER)
  RETURN NUMBER
IS
  emp_salary         NUMBER;
  employee_not_found EXCEPTION;
BEGIN
  SELECT salary INTO emp_salary FROM employees WHERE employee_id = emp_id;
  RETURN emp_salary;
EXCEPTION
WHEN NO_DATA_FOUND THEN
  RAISE employee_not_found;
END;
/
DECLARE
  emp_id NUMBER := 120;
  salary NUMBER;
BEGIN
  salary := get_employee_salary(emp_id);
  DBMS_OUTPUT.PUT_LINE('Salary of employee ' || emp_id || ': ' || salary);
END;
/
--6
CREATE OR REPLACE
FUNCTION calculate_discount(
    total_amount IN NUMBER)
  RETURN NUMBER
IS
  discount_amount NUMBER;
BEGIN
  IF total_amount    < 1000 THEN
    discount_amount := total_amount * 0.05;
  ELSIF total_amount BETWEEN 1000 AND 5000 THEN
    discount_amount := total_amount * 0.10;
  ELSIF total_amount > 5000 THEN
    discount_amount := total_amount * 0.15;
  ELSE
    discount_amount := 0;
  END IF;
  RETURN discount_amount;
END;
/
DECLARE
  total_amount NUMBER := 4500;
  discount     NUMBER;
BEGIN
  discount := calculate_discount(total_amount);
  DBMS_OUTPUT.PUT_LINE('Total Amount: ' || total_amount || ' | Discount Amount: ' || discount);
END;
/
--7
CREATE OR REPLACE
PACKAGE employee_pkg
IS
  PROCEDURE insert_employee(
      p_employee_id   IN NUMBER,
      p_first_name    IN VARCHAR2,
      p_last_name     IN VARCHAR2,
      p_email         IN VARCHAR2,
      p_phone_number  IN VARCHAR2,
      p_hire_date     IN DATE,
      p_job_id        IN VARCHAR2,
      p_salary        IN NUMBER,
      p_manager_id    IN NUMBER,
      p_department_id IN NUMBER );
  FUNCTION calculate_salary(
      p_hours_worked IN NUMBER,
      p_hourly_rate  IN NUMBER )
    RETURN NUMBER;
  PROCEDURE update_job_title(
      p_employee_id   IN NUMBER,
      p_new_job_title IN VARCHAR2 );
  FUNCTION get_employee_count_in_department(
      p_department_id IN NUMBER )
    RETURN NUMBER;
END employee_pkg;
/
CREATE OR REPLACE
PACKAGE BODY employee_pkg
IS
PROCEDURE insert_employee(
    p_employee_id   IN NUMBER,
    p_first_name    IN VARCHAR2,
    p_last_name     IN VARCHAR2,
    p_email         IN VARCHAR2,
    p_phone_number  IN VARCHAR2,
    p_hire_date     IN DATE,
    p_job_id        IN VARCHAR2,
    p_salary        IN NUMBER,
    p_manager_id    IN NUMBER,
    p_department_id IN NUMBER )
IS
BEGIN
  INSERT
  INTO employees
    (
      employee_id,
      first_name,
      last_name,
      email,
      phone_number,
      hire_date,
      job_id,
      salary,
      manager_id,
      department_id
    )
    VALUES
    (
      p_employee_id,
      p_first_name,
      p_last_name,
      p_email,
      p_phone_number,
      p_hire_date,
      p_job_id,
      p_salary,
      p_manager_id,
      p_department_id
    );
END insert_employee;
FUNCTION calculate_salary
  (
    p_hours_worked IN NUMBER,
    p_hourly_rate  IN NUMBER
  )
  RETURN NUMBER
IS
  v_salary NUMBER;
BEGIN
  v_salary := p_hours_worked * p_hourly_rate;
  RETURN v_salary;
END calculate_salary;
PROCEDURE update_job_title
  (
    p_employee_id   IN NUMBER,
    p_new_job_title IN VARCHAR2
  )
IS
BEGIN
  UPDATE employees
  SET job_title     = p_new_job_title
  WHERE employee_id = p_employee_id;
  COMMIT; -- Commit the transaction
END update_job_title;
FUNCTION get_employee_count_in_department(
    p_department_id IN NUMBER )
  RETURN NUMBER
IS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM employees
  WHERE department_id = p_department_id;
  RETURN v_count;
END get_employee_count_in_department;
END employee_pkg;
/ 

--