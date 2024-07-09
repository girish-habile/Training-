--1
SELECT 
    d.department_id,
    d.department_name,
    AVG(e.salary) AS avg_salary,
    RANK() OVER (ORDER BY AVG(e.salary) DESC) AS salary_rank
FROM 
    employees e
    JOIN departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_id, d.department_name
ORDER BY 
    avg_salary DESC;

--2
SELECT 
e.first_name,
e.hire_date,
e.department_id,
Dense_rank() over (
partition by e.department_id 
order by TRUNC(MONTHS_BETWEEN(SYSDATE, e.hire_date) / 12) desc
) AS rnk
from
employees e;


--3
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    LEAD(e.salary) OVER (ORDER BY e.hire_date) - e.salary AS salary_diff_employee
FROM
    employees e;


--4
select 
emp.first_name,
emp.salary,
emp.employee_id,
emp.salary_diff
from (
select
e.first_name,
e.salary,
e.employee_id,
lead(e.salary,1,0) OVER (ORDER BY e.hire_date) - e.salary AS salary_diff
from 
employees e
) emp
order by 
emp.salary_diff desc

--5



