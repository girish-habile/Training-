SET Serveroutput ON;
SET Verify OFF;
SET Define ON;

--1
Declare
V_Name Employees.First_Name%Type;
V_Count Number := 1;
Begin
For Emp_Rec In (Select First_Name From Employees) Loop
  V_Name := Emp_Rec.First_Name;
  Dbms_Output.Put_Line(V_Count||' '||V_Name);
  V_Count := V_Count +1;
  End Loop;
End;
/



--2
DECLARE
  V_Id Employees.Employee_Id%Type;
  V_Name Employees.First_Name%Type;
  V_Email Employees.Email%Type;
  V_Salary Employees.Salary%Type;
  V_Date Employees.Hire_Date%Type;
  V_Phone Employees.Phone_Number%Type;
BEGIN
  V_Id := '&Emp_id';
  SELECT Employee_Id,
    First_Name,
    Email,
    Salary,
    Hire_Date,
    Phone_Number
  INTO V_Id,
    V_Name,
    V_Email,
    V_Salary,
    V_Date,
    V_Phone
  FROM Employees
  WHERE Employee_Id = V_Id;
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || V_Id);
  DBMS_OUTPUT.PUT_LINE('Name: ' || V_Name);
  DBMS_OUTPUT.PUT_LINE('Email: ' || V_Email);
  DBMS_OUTPUT.PUT_LINE('Salary: ' || V_Salary);
  DBMS_OUTPUT.PUT_LINE('Hire Date: ' || V_Date);
  DBMS_OUTPUT.PUT_LINE('Phone Number: ' || V_Phone);
END;



--3
DECLARE
  V_Id Departments.Department_Id%Type;
  V_Name Departments.Department_Name%Type;
  V_Loc_Id Departments.Location_Id%Type;
BEGIN
  V_Id     := &id;
  V_Name   := '&Department_name';
  V_Loc_Id := &Location_id;
  UPDATE Departments
  SET department_name = V_Name,
    location_id       = V_Loc_Id
  WHERE department_id = V_Id;
  DBMS_OUTPUT.PUT_LINE('Update successful for Department ID: ' || V_Id);
  Dbms_Output.Put_Line('New Department Name: ' || V_Name);
  DBMS_OUTPUT.PUT_LINE('New Location ID: ' || V_Loc_Id);
End;
/

--4
DECLARE
  V_Id Employees.Employee_Id%Type;
  V_Name Employees.First_Name%Type;
  V_Email Employees.Email%Type;
  V_Salary Employees.Salary%Type;
  V_Date Employees.Hire_Date%Type;
  V_Phone Employees.Phone_Number%Type;
BEGIN
  V_Id := '&Emp_id';
  SELECT First_Name,
    Email,
    Salary,
    Hire_Date,
    Phone_Number
  INTO V_Name,
    V_Email,
    V_Salary,
    V_Date,
    V_Phone
  FROM Employees
  WHERE Employee_Id = V_Id;
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || V_Id);
  DBMS_OUTPUT.PUT_LINE('Name: ' || V_Name);
  DBMS_OUTPUT.PUT_LINE('Email: ' || V_Email);
  DBMS_OUTPUT.PUT_LINE('Salary: ' || V_Salary);
  DBMS_OUTPUT.PUT_LINE('Hire Date: ' || V_Date);
  DBMS_OUTPUT.PUT_LINE('Phone Number: ' || V_Phone);
EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || V_Id);
End;
/


--6
Declare
V_Dept_Id Employees.Department_Id%Type;
V_Emp_Id Employees.Employee_Id%Type;
V_First_Name Employees.First_Name%Type;
V_Last_Name Employees.Last_Name%Type;
V_Salary Employees.Salary%Type;
 V_Employee_Found Boolean := False;
Cursor Emp_Cursor Is
  Select Employee_Id , First_Name, Last_Name, Salary
  From Employees
  Where Department_Id = V_Dept_Id;
Begin
V_Dept_Id := '&departement_id';

Open Emp_Cursor;

  LOOP
        Fetch Emp_Cursor Into V_Emp_Id, V_First_Name, V_Last_Name, V_Salary;
        
        
        Exit When Emp_Cursor%Notfound;
        Dbms_Output.Put_Line('Employee ID: ' || V_Emp_Id);
        Dbms_Output.Put_Line('First Name: ' || V_First_Name);
        Dbms_Output.Put_Line('Last Name: ' || V_Last_Name);
        Dbms_Output.Put_Line('Salary: ' || V_Salary);
        
        v_employee_found := TRUE;
    End Loop;
    
     If Not V_Employee_Found Then
        DBMS_OUTPUT.PUT_LINE('No employees found by this department id');
    END IF;
    
    CLOSE emp_cursor;

End;
/


--7
Declare 
V_Id Employees.Employee_Id%Type;
V_Salary Employees.Salary%Type;
Cursor Emp_Cursor Is
  Select E.Employee_Id , E.Salary From 
  Employees E Join
  Departments D
  On E.Department_Id = D.Department_Id
  Where D.Department_Name ='Sales';
  
Begin
Open Emp_Cursor;

  Loop
        Fetch Emp_Cursor Into V_Id, V_Salary;
        Exit When Emp_Cursor%Notfound;
        Dbms_Output.Put_Line('Employee ID: ' || V_Id);
        Dbms_Output.Put_Line('Salary: '||V_Salary);
        V_Salary := V_Salary*1.1;
        Dbms_Output.Put_Line(' Updated Salary: ' || V_Salary);
        
    End Loop;
    
    Close Emp_Cursor;

End;
/


--8
Declare
    V_count NUMBER;
BEGIN
    DELETE FROM employees
    WHERE salary < 3000
    And Hire_Date < Add_Months(Sysdate, -60); 
    V_Count := Sql%Rowcount;
    DBMS_OUTPUT.PUT_LINE('Number of employees deleted: ' || V_count);
    
   
END;
/

--9
DECLARE
    v_employee_id   employees.employee_id%TYPE;
    v_first_name    employees.first_name%TYPE;
    v_last_name     employees.last_name%TYPE;
    v_email         employees.email%TYPE;
    v_phone_number  employees.phone_number%TYPE;
    v_hire_date     employees.hire_date%TYPE;
    v_job_id        employees.job_id%TYPE;
    v_salary        employees.salary%TYPE;
    v_manager_id    employees.manager_id%TYPE;
    v_department_id employees.department_id%TYPE;
Begin
    V_Employee_Id   := 176;
    V_First_Name    := 'Girish';
    V_Last_Name     := 'tundwal';
    v_email         := 'girishtundwal2003@gmail.com';
    V_Phone_Number  := '1234567890';
    v_hire_date     := TO_DATE('2003-03-01', 'YYYY-MM-DD');
    v_job_id        := 'IT_PROG';
    v_salary        := 60000;
    v_manager_id    := 100;
    v_department_id := 90;
    INSERT INTO employees (
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
    ) VALUES (
        v_employee_id,
        v_first_name,
        v_last_name,
        v_email,
        v_phone_number,
        v_hire_date,
        v_job_id,
        v_salary,
        v_manager_id,
        v_department_id
    );

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Record inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting record: ' || SQLERRM);
        ROLLBACK; 
END;
/
