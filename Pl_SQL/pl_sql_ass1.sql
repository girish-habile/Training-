SET Serveroutput ON;
SET Verify OFF;
SET define ON;
--1
DECLARE
  v_salary NUMBER(5);
BEGIN
  V_SALARY := 5000;
  DBMS_OUTPUT.put_line('Salary  is ' || V_Salary);
END;
--2
DECLARE
  V_Length NUMBER(5);
  V_Width  NUMBER(5);
  V_Area   NUMBER(5);
BEGIN
  V_Length := 10;
  V_Width  := 5;
  V_Area   := V_Length * V_Width;
  DBMS_OUTPUT.put_line('Area of rectangle   is ' || V_Area);
END;
--3
ACCEPT x VARCHAR2(100) PROMPT 'Please enter your message:'
DECLARE
  MESSAGE VARCHAR2(100);
BEGIN
  MESSAGE :='&x';
  MESSAGE := UPPER(MESSAGE);
  DBMS_OUTPUT.PUT_LINE('Message: ' || MESSAGE);
END;
--4
Accept X NUMBER(5) PROMPT 'Enter num1';
ACCEPT y NUMBER(5) PROMPT 'Enter num2';
DECLARE
  Num1 NUMBER(5);
  Num2 NUMBER(5);
BEGIN
  Num1 := '&x';
  Num2 := '&y';
  Num1 := Num1 + Num2;
  Num2 := Num1 - Num2;
  Num1 := Num1 -Num2;
  Dbms_Output.Put_Line('Num1: '||Num1);
  Dbms_Output.Put_Line('Num2: '||Num2);
END;
--5
DECLARE
  emp_count NUMBER(5);
BEGIN
  SELECT COUNT(Employee_Id) INTO Emp_Count FROM Employees ;
  Dbms_Output.Put_Line('Number of Employees: ' || Emp_Count);
END;
--6
ACCEPT x VARCHAR2(50) PROMPT 'Enter Department Name:';
DECLARE
  v_name departments.department_name%TYPE;
  v_id departments.department_id%TYPE;
  v_loc_id departments.location_id%TYPE;
BEGIN
  v_name := '&x';
  SELECT department_id,
    location_id
  INTO v_id,
    v_loc_id
  FROM departments
  WHERE department_name = v_name;
  -- Display department details
  DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_id);
  DBMS_OUTPUT.PUT_LINE('Location ID: ' || v_loc_id);
END;
--7
DECLARE
  Avg_Salary NUMBER(10, 2);
BEGIN
  SELECT AVG(salary) INTO Avg_Salary FROM employees;
  DBMS_OUTPUT.PUT_LINE('Average Salary: ' || TO_CHAR(avg_salary, '99999.99'));
END;
--8
ACCEPT x PROMPT 'Enter Employee Id: ';
DECLARE
  emp_id        NUMBER;
  employee_name VARCHAR2(100);
BEGIN
  emp_id := '&x';
  SELECT First_Name
    || ' '
    || Last_Name
  INTO employee_name
  FROM employees
  WHERE employee_id = emp_id;
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || employee_name);
END;
--9
DECLARE
  V_EMPID      NUMBER;
  v_new_Salary NUMBER(8,2);
BEGIN
  V_EMPID     :='&enter_emp_id';
  v_new_salary:='&enter_salary';
  UPDATE EMPLOYEES SET SALARY=V_NEW_SALARY WHERE Employee_Id=V_Empid;
END;
