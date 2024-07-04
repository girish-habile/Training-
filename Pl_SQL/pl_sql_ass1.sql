Set Serveroutput On;
Set Verify Off;
Set define on;
--1 
DECLARE
v_salary Number(5);
BEGIN
V_SALARY := 5000;
DBMS_OUTPUT.put_line('Salary  is ' || V_Salary);
END;


--2
Declare
V_Length Number(5);
V_Width Number(5);
V_Area Number(5);
Begin
V_Length := 10;
V_Width := 5;
V_Area := V_Length * V_Width;
DBMS_OUTPUT.put_line('Area of rectangle   is ' || V_Area);
end;

--3

ACCEPT x VARCHAR2(100) PROMPT 'Please enter your message:'
DECLARE
    message VARCHAR2(100);
Begin
   message :='&x';
    message := UPPER(message);

    DBMS_OUTPUT.PUT_LINE('Message: ' || message);
END;


--4 
Accept X Number(5) PROMPT 'Enter num1';
ACCEPT y Number(5) PROMPT 'Enter num2';
Declare
    Num1 Number(5);
    Num2 Number(5);
Begin
   Num1 := '&x';
   Num2 := '&y';
   Num1 := Num1 + Num2;
   Num2 := Num1 - Num2;
   Num1 := Num1 -Num2;
   Dbms_Output.Put_Line('Num1: '||Num1);
    Dbms_Output.Put_Line('Num2: '||Num2);
END;

--5
Declare 
emp_count NUMBER(5);
Begin
Select Count(Employee_Id) Into Emp_Count From Employees ;
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
    SELECT department_id, location_id
    INTO v_id, v_loc_id
    FROM departments
    WHERE department_name = v_name;

    -- Display department details
    DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Location ID: ' || v_loc_id);

END;


--7
DECLARE
    Avg_Salary Number(10, 2);
Begin
    SELECT AVG(salary)
    Into Avg_Salary
    FROM employees;
    DBMS_OUTPUT.PUT_LINE('Average Salary: ' || TO_CHAR(avg_salary, '99999.99'));
END;


--8

ACCEPT x PROMPT 'Enter Employee Id: ';

Declare
  emp_id NUMBER;
    employee_name VARCHAR2(100);
Begin
   emp_id := '&x';
    Select First_Name || ' ' || Last_Name
    INTO employee_name
    FROM employees
    WHERE employee_id = emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || employee_name);
END;


--9
DECLARE 
V_EMPID NUMBER;
v_new_Salary number(8,2);
BEGIN
V_EMPID :='&enter_emp_id';
v_new_salary:='&enter_salary';
UPDATE EMPLOYEES 
SET SALARY=V_NEW_SALARY
Where Employee_Id=V_Empid;
END;
