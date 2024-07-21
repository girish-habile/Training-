SET Serveroutput ON;
Set Verify Off;
SET Define ON;


--1
Declare
V_Name Employees.First_Name%Type;
V_Last_Name Employees.Last_Name%Type;
V_Date Employees.Hire_Date%Type;

Cursor Employee_Cursor Is
 Select First_Name , Last_Name , Hire_Date From Employees;
 
Begin
Open Employee_Cursor;
Loop
Fetch Employee_Cursor Into V_Name , V_Last_Name, V_Date;
Exit When employee_cursor%rowcount <3 And Employee_Cursor%Notfound;
Dbms_Output.Put_Line('First Name: '||V_Name);
Dbms_Output.Put_Line('Last Name: '||V_Last_Name);
Dbms_Output.Put_Line('Hire Date: '||V_Date);
End Loop;
Close Employee_Cursor;
end;
/


--2
Declare
V_Name Employees.First_Name%Type;
V_Salary Employees.Salary%Type;
Begin
loop emp_rec in (select first_name , salary from employees) loop
v_name := emp_rec.employee_name;
v_salary := emp_record.salary;
v_salary := v_salary * 1.1;
dbms_output.put_line('Employee: '||v_name||', Salary: '||v_salary);
end loop;
end;



--3
Declare 
V_Name Departments.Department_Name%Type;
V_Mgr_Id Employees.Manager_Id%Type;
Cursor Department_Cursor Is 
Select D.Department_Name , E.Manager_Id 
   From Employees E Join
      Departments D On 
      D.Department_Id = E.Department_Id;
Begin
Open Department_Cursor;
Loop
 Fetch Department_Cursor Into V_Name , V_Mgr_Id;
    Exit When Department_Cursor%Notfound;
    Dbms_Output.Put_Line('Departemnt Name: '||V_Name);
    Dbms_Output.Put_Line('Manager Id: ' ||V_Mgr_Id);
    End Loop;
Close Department_Cursor;
end;

--4
Declare
V_Name Employees.First_Name%Type;
V_Dept_Id Departments.Department_Id%Type;
V_Dept_Name Departments.Department_Name%Type;

Cursor Department_Cursor Is
   Select Department_Id , Department_Name From 
     Departments;
     
Cursor Employee_Cursor Is 
    Select First_Name From 
     Employees  Where Department_Id = V_Dept_Id;

Begin

Open Department_Cursor;
Loop
Exit When Department_Cursor%Notfound;
Fetch Department_Cursor Into V_Dept_Id ,V_Dept_Name;
Dbms_Output.Put_Line('Departemnt Id: '||V_Dept_Id);
Dbms_Output.Put_Line('Department Name: '||V_Dept_Name);
Open Employee_Cursor;
Loop
Exit When Employee_Cursor%Notfound;
Fetch Employee_Cursor Into V_Name;
Dbms_Output.Put_Line('employee Name: '||V_Name);
End Loop;
Close Employee_Cursor;

End Loop;
end;
