use HR


-- 
SELECT e.last_name , d.department_id ,d.department_name
from employees e 
JOIN departments d
ON e.department_id = d.department_id

--
SELECT j.* , e.employee_id , l.location_id , d.department_id 
from employees e
JOIN jobs j 
ON e.job_id = j.job_id
JOIN departments d
ON d.department_id = e.department_id
JOIN locations l
ON d.location_id = l.location_id
where d.department_id = '8'

SELECT e.last_name , d.department_name, l.location_id , l.city
from employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id

--
SELECT e.last_name , d.department_name
from employees e
JOIN departments d
ON e.department_id = d.department_id
where e.last_name LIKE '%[a-z]%'


--
SELECT e.last_name, e.job_id , d.department_id , d.department_name , l.city
from employees e
JOIN departments d 
ON e.department_id = d.department_id
JOIN locations l 
on d.location_id = l.location_id
where l.city ='Toronto'

SELECT e.last_name as Employee ,e.employee_id as Emp# , m.last_name as Manager , m.employee_id as #Mgr
from employees e
JOIN employees m
ON e.manager_id = m.employee_id

--
SELECT e.last_name as Employee ,e.employee_id as Emp# , m.last_name as Manager , m.employee_id as #Mgr
from employees e
left outer JOIN employees m
ON e.manager_id = m.employee_id


--
SELECT 
    e1.last_name AS Employee_Last_Name, 
    e1.department_id AS Department_Number,
    e2.last_name AS Colleague_Last_Name
FROM 
    employees e1
JOIN 
    employees e2 ON e1.department_id = e2.department_id
where e1.last_name <> e2.last_name


--
select first_name , last_name , hire_date 
from employees
where hire_date >(select hire_date from employees where first_name ='Daniel')


--
select e.first_name as Employee , 
e.employee_id as Emp,
e.hire_date as Hired ,
m.first_name as Manager,
m.hire_date as Mgr_Hired
from employees e
JOIN employees m 
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date

--
select (max(salary)) as Maximum,
min(salary) as Minimum,
Sum(salary) as Sum,
avg(salary) as Average 
from employees

--
select job_id as job,
(max(salary)) as Maximum,
min(salary) as Minimum,
Sum(salary) as Sum,
avg(salary) as Average 
from employees
GROUP BY job_id;

--
SELECT 
    e1.last_name AS Employee_Last_Name, 
    e1.job_id AS job_Number,
    e2.last_name AS Colleague_Last_Name
FROM 
    employees e1
JOIN 
    employees e2 ON e1.job_id = e2.job_id
where e1.last_name <> e2.last_name

--
select count(manager_id) as Managers
from Employees

--
select max(salary) - min(salary)
as DIFFERENCE FROM Employees


--
select manager_id , min(salary) 
from employees 
where manager_id IS NOT NULL
GROUP BY manager_id 
HAVING 
    MIN(salary) > 6000
order by min(salary) DESC

--
SELECT d.department_name as Name, l.city as Location , count(e.employee_id) as Number_of_people,round(avg(e.salary),2 ) as Salary 
from employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
on d.location_id = l.location_id
GROUP BY d.department_name , l.city

SELECT 
    j.job_title AS Job,
    e.department_id AS Department_Number,
    e.salary AS Salary,
    SUM(e.salary) OVER (PARTITION BY j.job_title) AS Total_Salary
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
WHERE 
    e.department_id IN (2, 5, 8, 9)
ORDER BY 
    j.job_title, e.department_id;


---

SELECT 
    e.last_name AS "Last Name",
    j.job_title AS Job,
    d.department_name AS "Department Name"
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id

--
SELECT 
    d.department_name AS "DEPARTMENT\nNAME",
    e.last_name AS "EMPLOYEE\nNAME",
    e.hire_date AS "START\nDATE",
    e.salary AS "SALARY",
    (e.salary * 12) AS "ANNUAL\nSALARY"
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
ORDER BY 
    d.department_name, e.last_name;



