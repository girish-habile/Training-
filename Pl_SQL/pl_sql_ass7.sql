Set Serveroutput On;


--1
create or replace procedure get_employees as
begin
for emp_rec in (select * from Employees) loop
   Dbms_output.put_line('Employee Id: '||emp_rec.employee_id);
   Dbms_output.put_line('Name : '||emp_rec.first_name);
   Dbms_output.put_line('Salary: '||emp_rec.Salary);
end loop;
end;

declare 
begin
  get_employees;
end;

--2
create or replace procedure get_employees(p_dept_id IN  employees.department_id%type) as
begin
for emp_rec in (select * from Employees where department_id = get_employees.p_dept_id) loop
   Dbms_output.put_line('Employee Id: '||emp_rec.employee_id);
   Dbms_output.put_line('Name : '||emp_rec.first_name);
   Dbms_output.put_line('Salary: '||emp_rec.Salary);
end loop;
end;

declare 
begin
  get_employees(3);
end;



--3
Create Or Replace Procedure Get_Employees_In_Dept (
P_Department_Id In Employees.Department_Id%Type)
As
V_Employee_Name Employees.First_Name%Type;
V_Employee_Salary Employees.Salary%Type;
Cursor Emp_Cursor Is Select First_Name, Salary From Employees Where Department_Id = P_Department_Id;
Begin
Open Emp_Cursor;
Loop
Fetch Emp_Cursor Into V_Employee_Name, V_Employee_Salary;
Exit When Emp_Cursor%Notfound;
Dbms_Output.Put_Line('Employee Name: ' || V_Employee_Name || ', Salary: ' || V_Employee_Salary);
End Loop;
Close Emp_Cursor;
End;
/

declare 
begin
  get_employees_in_dept(3);
end;

--5
Create Type Employee_Id_List As Table Of Number;
Create Or Replace Procedure Update_Salary_Batch (P_Employee_Ids IN Employee_Id_List, P_Percentage_Increase In Number)
As
Begin
    FOR i IN 1..p_employee_ids.COUNT LOOP
        UPDATE employees
        SET salary = salary * (1 + p_percentage_increase / 100)
        WHERE employee_id = p_employee_ids(i);
    END LOOP;
    
    
END;
/



DECLARE
    emp_ids employee_id_list := employee_id_list(100, 102, 103); 
    percentage_increase NUMBER := 10;
BEGIN
    UPDATE_SALARY_BATCH(emp_ids, percentage_increase);
    Dbms_Output.Put_Line('Salaries updated successfully.');
End;
/



