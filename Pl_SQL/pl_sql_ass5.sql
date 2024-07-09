Set Serveroutput On;
Set Verify Off;
Set Define On;


Declare
    Cursor Employee_Cursor (P_Dept_Id Employees.Department_Id%Type) Is
        Select Employee_Id, Salary
        From Employees
        Where Department_Id = P_Dept_Id
        For Update Of Salary;

    V_Dept_Id Employees.Department_Id%Type;
    V_Employee_Id Employees.Employee_Id%Type;
    V_Salary Employees.Salary%Type;
    
Begin
    For  V_Dept_Id In  (60, 80, 90) Loop
        
        Open Employee_cursor(V_Dept_Id);
        Loop
            Fetch Employee_cursor Into V_Employee_Id, V_Salary;
            Exit When Employee_Cursor%Notfound;
            Update Employees
            Set Salary = Salary * 1.1
            Where Current Of Employee_Cursor;
        End Loop;
        
        Close Employee_Cursor;
    End Loop;
    Commit;  
END;
/





