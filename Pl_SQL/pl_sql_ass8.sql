set serveroutput on;

--1
CREATE OR REPLACE FUNCTION calculate_area(length IN NUMBER, width IN NUMBER)
RETURN NUMBER IS
    area NUMBER;
BEGIN
    area := length * width;
    RETURN area;
END;
/

DECLARE
    V_length NUMBER := 30; 
    V_width NUMBER := 40;
    V_area NUMBER;
BEGIN
    V_area := calculate_area(V_length, V_width);
    DBMS_OUTPUT.PUT_LINE('Area of rectangle: ' || V_area);
END;
/

--2
CREATE OR REPLACE FUNCTION reverse_string(P_string IN VARCHAR2) 
RETURN VARCHAR2 IS
    r_string VARCHAR2(100) := '';
BEGIN
    FOR i IN REVERSE 1..LENGTH(P_string) LOOP
        r_string := r_string || SUBSTR(P_string, i, 1);
    END LOOP;
    RETURN r_string;
END;
/

DECLARE
    V_string VARCHAR2(100);
    V_reverse VARCHAR2(100);
BEGIN
    V_string := 'Girish';
    V_reverse := reverse_string(V_string);
    DBMS_OUTPUT.PUT_LINE('Given: ' || V_string || ' | Reversed: ' || V_reverse);
    
END;
/


--3
CREATE OR REPLACE FUNCTION safe_division(numerator IN NUMBER, denominator IN NUMBER) 
RETURN NUMBER IS
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
    numerator NUMBER;
    denominator NUMBER;
    division_result NUMBER;
BEGIN
    numerator := 1000000;
    denominator := 5;
    division_result := safe_division(numerator, denominator);
    DBMS_OUTPUT.PUT_LINE('numerator: ' || numerator || ' '|| 'denominator: ' || denominator ||' '|| 'Division: ' || division_result);
    
    
    numerator := 10;
    denominator := 0;
    division_result := safe_division(numerator, denominator);
    DBMS_OUTPUT.PUT_LINE('numerator: ' || numerator ||' '||'denominator: ' || denominator ||' '|| 'Division: ' || division_result);
    

END;
/

--4
CREATE OR REPLACE FUNCTION get_employee_count(dept_id IN NUMBER) 
RETURN NUMBER IS
    emp_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO emp_count
    FROM employees
    WHERE department_id = dept_id;

    RETURN emp_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/
DECLARE
    department_id NUMBER := 3;
    employee_count NUMBER;
BEGIN
    employee_count := get_employee_count(department_id);
    DBMS_OUTPUT.PUT_LINE('Number of employees in department ' || department_id || ': ' || employee_count);
END;
/

--5
CREATE OR REPLACE FUNCTION get_employee_salary(emp_id IN NUMBER) 
RETURN NUMBER IS
    emp_salary NUMBER;
    employee_not_found EXCEPTION;
BEGIN
    SELECT salary INTO emp_salary
    FROM employees
    WHERE employee_id = emp_id;
    
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
CREATE OR REPLACE FUNCTION calculate_discount(total_amount IN NUMBER) 
RETURN NUMBER IS
    discount_amount NUMBER;
BEGIN
    IF total_amount < 1000 THEN
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
    discount NUMBER;
BEGIN
    discount := calculate_discount(total_amount);
    DBMS_OUTPUT.PUT_LINE('Total Amount: ' || total_amount || ' | Discount Amount: ' || discount);
    
END;
/
