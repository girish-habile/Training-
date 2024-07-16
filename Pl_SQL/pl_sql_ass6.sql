SET Serveroutput ON;
SET Verify OFF;
SET Define ON;
--1
DECLARE
  CURSOR Emp_Cursor
  IS
    SELECT Employee_Id, Salary FROM Employees;
  V_Employee_Id Employees.Employee_Id%Type;
  V_Salary Employees.Salary%Type;
BEGIN
  OPEN Emp_Cursor;
  LOOP
    FETCH Emp_Cursor INTO V_Employee_Id, V_Salary;
    EXIT
  WHEN Emp_Cursor%Notfound;
    Dbms_Output.Put_Line(' Employee ID ' || V_Employee_Id);
    Dbms_Output.Put_Line('Original Salary: ' || V_Salary);
    IF V_Salary = 0 THEN
      Raise Zero_Divide;
    END IF;
    Dbms_Output.Put_Line('Updated Salary: ' || (V_Salary / 0));
  END LOOP;
  CLOSE Emp_Cursor;
EXCEPTION
WHEN Zero_Divide THEN
  Dbms_Output.Put_Line('Error: Cannot divide salary by zero for Employee ID:' || V_Employee_Id);
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
--3
DECLARE
Type Emp_Type
IS
  TABLE OF Employees.First_Name%Type INDEX BY Binary_Integer;
  Employee_Name Emp_Type;
  CURSOR Emp_Cursor
  IS
    SELECT First_Name FROM Employees;
BEGIN
  Open Emp_Cursor;
  FOR I IN 1..175
  LOOP
    FETCH Emp_Cursor INTO Employee_Name(I);
    EXIT
  WHEN Emp_Cursor%Notfound;
  END LOOP;
  CLOSE Emp_Cursor;
  Dbms_Output.Put_Line('Employee Names:');
  FOR I IN 1..Employee_Name.Count
  LOOP
    Dbms_Output.Put_Line(Employee_Name(I));
  END LOOP;
EXCEPTION
WHEN OTHERS THEN
  Dbms_Output.Put_Line('Error: ' || Sqlerrm);
END;
/

--4
Declare
Cursor Emp_Cursor Is Select First_Name ,Salary From Employees where salary > 10000;
V_name employees.first_name%type;
 V_Salary Employees.Salary%Type;
  
Begin
Open Emp_Cursor;
Loop
Fetch Emp_Cursor Into V_Name,V_Salary;
Exit When Emp_Cursor%Notfound;
Dbms_Output.Put_Line(V_Name||' have salary greater  than 10000: ' || V_Salary);
End Loop;
Close Emp_Cursor;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

--5
set serveroutput on; 
Declare
V_Employee_Id Employees.Employee_Id%Type;
V_First_Name Employees.First_Name%Type;
V_Last_Name Employees.Last_Name%Type;
Cursor Emp_Cursor Is Select Employee_Id, First_Name, Last_Name From Employees Where Employee_Id = 1234;
Begin
Open Emp_Cursor;
Fetch Emp_Cursor Into V_Employee_Id, V_First_Name, V_Last_Name;

--Select Employee_Id, First_Name, Last_Name Into V_Employee_Id, V_First_Name, V_Last_Name From Employees Where Employee_Id = 1234;
Dbms_Output.Put_Line('Employee ID: ' || V_Employee_Id);
Dbms_Output.Put_Line('First Name: ' || V_First_Name);
Dbms_Output.Put_Line('Last Name: ' || V_Last_Name);

EXCEPTION
    When No_Data_Found Then
        Raise_Application_Error(-20101, 'No employees found for the given criteria.');
        
    When Others Then
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

--6
Declare
V_Employee_Id Employees.Employee_Id%Type := 123; 
v_new_salary employees.salary%TYPE := 14000;
Begin
Update Employees
Set Salary = V_New_Salary
Where Employee_Id = V_Employee_Id;
If Sql%Rowcount > 1 Then
Raise_Application_Error(-20102, 'More than one employee found for the given criteria.');
Elsif Sql%Rowcount = 0 Then
Raise_Application_Error(-20103, 'No employee found for the given criteria.');
End If;
Exception
When Too_Many_Rows Then
Raise_Application_Error(-20102, 'More than one employee found for the given criteria.');
When No_Data_Found Then
Raise_Application_Error(-20103, 'No employee found for the given criteria.');
When Others Then
Raise_Application_Error(-20000, 'An error occurred: ' || Sqlerrm);
END;
/

--7
DECLARE
    V_Employee_Id Employees.Employee_Id%Type;
    V_Employee_Name Employees.First_Name%Type;
    V_Employee_Salary Employees.Salary%Type;
BEGIN
    V_Employee_Id := '&employee_id';

    IF V_Employee_Id < 0 THEN
        RAISE_APPLICATION_ERROR(-20202, 'Invalid employee ID entered.');
    END IF;

    SELECT First_Name, Salary
    INTO V_Employee_Name, V_Employee_Salary
    FROM Employees
    WHERE Employee_Id = V_Employee_Id;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || V_Employee_Name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || V_Employee_Salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20201, 'Employee ID not found.');

    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20000, 'An error occurred: ' || SQLERRM);
END;
/

--8
Declare
    v_department_id departments.department_id%TYPE := 8;
    v_department_name departments.department_name%TYPE := 'IT'; 
Begin
Insert Into Departments (Department_Id, Department_Name) Values (V_Department_Id, V_Department_Name);
Dbms_Output.Put_Line('Department created successfully.');
EXCEPTION
    When Dup_Val_On_Index Then
    Raise_Application_Error(-20301, 'Department ID already exists.');
    WHEN OTHERS THEN
    Raise_Application_Error(-20000, 'An error occurred: ' || Sqlerrm);
END;
/


