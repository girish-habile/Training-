Declare
    Cursor Employee_Cursor (P_Dept_Id Employees.Department_Id%Type) Is
        Select Employee_Id, Salary
        From Employees
        Where Department_Id = P_Dept_Id
        For Update Of Salary;

    V_Dept_Id Employees.Department_Id%Type;
    V_Employee_Id Employees.Employee_Id%Type;
    V_Salary Employees.Salary%Type;
    
    Cursor Dept_Ids Is 
    Select 60 dept_id From Dual
    Union 
    Select 80 From Dual
    Union Select 90 From Dual;
    
    
    
Begin
    For  v_dept_id in Dept_Ids Loop
    
    dbms_output.put_line(to_char(v_dept_id.dept_id));
        
        Open Employee_cursor(V_Dept_Id.dept_id);
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





