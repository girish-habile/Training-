CREATE TABLE regions (
    region_id NUMBER PRIMARY KEY,
    region_name VARCHAR2(25) DEFAULT NULL
);

CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR2(40) DEFAULT NULL,
    region_id NUMBER NOT NULL,
    CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE
);

CREATE TABLE locations (
    location_id NUMBER PRIMARY KEY,
    street_address VARCHAR2(40) DEFAULT NULL,
    postal_code VARCHAR2(12) DEFAULT NULL,
    city VARCHAR2(30) NOT NULL,
    state_province VARCHAR2(25) DEFAULT NULL,
    country_id CHAR(2) NOT NULL,
    CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE
);

CREATE TABLE jobs (
    job_id NUMBER PRIMARY KEY,
    job_title VARCHAR2(35) NOT NULL,
    min_salary NUMBER(8, 2) DEFAULT NULL,
    max_salary NUMBER(8, 2) DEFAULT NULL
);

CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(30) NOT NULL,
    location_id NUMBER DEFAULT NULL,
    CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(20) DEFAULT NULL,
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id NUMBER NOT NULL,
    salary NUMBER(8, 2) NOT NULL,
    manager_id NUMBER DEFAULT NULL,
    department_id NUMBER DEFAULT NULL,
    CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
    dependent_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    relationship VARCHAR2(25) NOT NULL,
    employee_id NUMBER NOT NULL,
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE
);

ALTER TABLE employees
ADD prev_salary NUMBER(8, 2);






INSERT INTO regions(region_id,region_name) VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) VALUES (4,'Middle East and Africa');

 
/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);
 
/*Data for the table locations */

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

 
/*Data for the table jobs */

INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (20,'Purchasing Clerk2',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (21,'Purchasing Manager2',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (22,'Sales Manager2',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (23,'Sales Representative2',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (24,'Shipping Clerk2',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (25,'Stock Clerk2',2000.00,5000.00);

 
/*Data for the table departments */

INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);

 
 
/*Data for the table employees */
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (100, 'Steven', 'King', 'steven.king@sqltutorial.org', '515.123.4567', TO_DATE('1987-06-17', 'YYYY-MM-DD'), 4, 24000.00, NULL, 9);


INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (101, 'Neena', 'Kochhar', 'neena.kochhar@sqltutorial.org', '515.123.4568', TO_DATE('1989-09-21', 'YYYY-MM-DD'), 5, 17000.00, 100, 9);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (102, 'Lex', 'De Haan', 'lex.de haan@sqltutorial.org', '515.123.4569', TO_DATE('1993-01-13', 'YYYY-MM-DD'), 5, 17000.00, 100, 9);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (103, 'Alexander', 'Hunold', 'alexander.hunold@sqltutorial.org', '590.423.4567', TO_DATE('1990-01-03', 'YYYY-MM-DD'), 9, 9000.00, 102, 6);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (104, 'Bruce', 'Ernst', 'bruce.ernst@sqltutorial.org', '590.423.4568', TO_DATE('1991-05-21', 'YYYY-MM-DD'), 9, 6000.00, 103, 6);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (105, 'David', 'Austin', 'david.austin@sqltutorial.org', '590.423.4569', TO_DATE('1997-06-25', 'YYYY-MM-DD'), 9, 4800.00, 103, 6);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (106, 'Valli', 'Pataballa', 'valli.pataballa@sqltutorial.org', '590.423.4560', TO_DATE('1998-02-05', 'YYYY-MM-DD'), 9, 4800.00, 103, 6);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (107, 'Diana', 'Lorentz', 'diana.lorentz@sqltutorial.org', '590.423.5567', TO_DATE('1999-02-07', 'YYYY-MM-DD'), 9, 4200.00, 103, 6);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (108, 'Nancy', 'Greenberg', 'nancy.greenberg@sqltutorial.org', '515.124.4569', TO_DATE('1994-08-17', 'YYYY-MM-DD'), 7, 12000.00, 101, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (109, 'Daniel', 'Faviet', 'daniel.faviet@sqltutorial.org', '515.124.4169', TO_DATE('1994-08-16', 'YYYY-MM-DD'), 6, 9000.00, 108, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (110, 'John', 'Chen', 'john.chen@sqltutorial.org', '515.124.4269', TO_DATE('1997-09-28', 'YYYY-MM-DD'), 6, 8200.00, 108, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (111, 'Ismael', 'Sciarra', 'ismael.sciarra@sqltutorial.org', '515.124.4369', TO_DATE('1997-09-30', 'YYYY-MM-DD'), 6, 7700.00, 108, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (112, 'Jose Manuel', 'Urman', 'jose manuel.urman@sqltutorial.org', '515.124.4469', TO_DATE('1998-03-07', 'YYYY-MM-DD'), 6, 7800.00, 108, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (113, 'Luis', 'Popp', 'luis.popp@sqltutorial.org', '515.124.4567', TO_DATE('1999-12-07', 'YYYY-MM-DD'), 6, 6900.00, 108, 10);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (114, 'Den', 'Raphaely', 'den.raphaely@sqltutorial.org', '515.127.4561', TO_DATE('1994-12-07', 'YYYY-MM-DD'), 14, 11000.00, 100, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (115, 'Alexander', 'Khoo', 'alexander.khoo@sqltutorial.org', '515.127.4562', TO_DATE('1995-05-18', 'YYYY-MM-DD'), 13, 3100.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (116, 'Shelli', 'Baida', 'shelli.baida@sqltutorial.org', '515.127.4563', TO_DATE('1997-12-24', 'YYYY-MM-DD'), 13, 2900.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (117, 'Sigal', 'Tobias', 'sigal.tobias@sqltutorial.org', '515.127.4564', TO_DATE('1997-07-24', 'YYYY-MM-DD'), 13, 2800.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (118, 'Guy', 'Himuro', 'guy.himuro@sqltutorial.org', '515.127.4565', TO_DATE('1998-11-15', 'YYYY-MM-DD'), 13, 2600.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (119, 'Karen', 'Colmenares', 'karen.colmenares@sqltutorial.org', '515.127.4566', TO_DATE('1999-08-10', 'YYYY-MM-DD'), 13, 2500.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (120, 'Matthew', 'Weiss', 'matthew.weiss@sqltutorial.org', '650.123.1234', TO_DATE('1996-07-18', 'YYYY-MM-DD'), 19, 8000.00, 100, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (121, 'Adam', 'Fripp', 'adam.fripp@sqltutorial.org', '650.123.2234', TO_DATE('1997-04-10', 'YYYY-MM-DD'), 18, 8200.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (122, 'Payam', 'Kaufling', 'payam.kaufling@sqltutorial.org', '650.123.3234', TO_DATE('1995-05-01', 'YYYY-MM-DD'), 18, 7900.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (123, 'Shanta', 'Vollman', 'shanta.vollman@sqltutorial.org', '650.123.4234', TO_DATE('1997-10-10', 'YYYY-MM-DD'), 18, 6500.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (124, 'Kevin', 'Mourgos', 'kevin.mourgos@sqltutorial.org', '650.123.5234', TO_DATE('1999-11-16', 'YYYY-MM-DD'), 18, 5800.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (125, 'Julia', 'Nayer', 'julia.nayer@sqltutorial.org', '650.124.1214', TO_DATE('1997-07-16', 'YYYY-MM-DD'), 17, 3200.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (126, 'Irene', 'Mikkilineni', 'irene.mikkilineni@sqltutorial.org', '650.124.1224', TO_DATE('1998-09-28', 'YYYY-MM-DD'), 17, 2700.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (127, 'James', 'Landry', 'james.landry@sqltutorial.org', '650.124.1334', TO_DATE('1999-01-14', 'YYYY-MM-DD'), 17, 2400.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (128, 'Steven', 'Markle', 'steven.markle@sqltutorial.org', '650.124.1434', TO_DATE('1999-03-08', 'YYYY-MM-DD'), 17, 2200.00, 120, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (129, 'Laura', 'Bissot', 'laura.bissot@sqltutorial.org', '650.124.5234', TO_DATE('1997-08-20', 'YYYY-MM-DD'), 15, 3300.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (130, 'Mozhe', 'Atkinson', 'mozhe.atkinson@sqltutorial.org', '650.124.6234', TO_DATE('1997-10-30', 'YYYY-MM-DD'), 15, 2800.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (131, 'James', 'Marlow', 'james.marlow@sqltutorial.org', '650.124.7234', TO_DATE('1999-02-16', 'YYYY-MM-DD'), 15, 2500.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (132, 'TJ', 'Olson', 'tj.olson@sqltutorial.org', '650.124.8234', TO_DATE('1999-04-10', 'YYYY-MM-DD'), 15, 2100.00, 114, 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (133, 'Jason', 'Mallin', 'jason.mallin@sqltutorial.org', '650.127.1934', TO_DATE('1996-06-14', 'YYYY-MM-DD'), 16, 3300.00, 122, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (134, 'Michael', 'Rogers', 'michael.rogers@sqltutorial.org', '650.127.1834', TO_DATE('1998-08-26', 'YYYY-MM-DD'), 16, 2900.00, 122, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (135, 'Ki', 'Gee', 'ki.gee@sqltutorial.org', '650.127.1734', TO_DATE('1999-12-12', 'YYYY-MM-DD'), 16, 2400.00, 122, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (136, 'Hazel', 'Philtanker', 'hazel.philtanker@sqltutorial.org', '650.127.1634', TO_DATE('2000-02-06', 'YYYY-MM-DD'), 16, 2200.00, 122, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (137, 'Renske', 'Ladwig', 'renske.ladwig@sqltutorial.org', '650.121.1234', TO_DATE('1993-07-14', 'YYYY-MM-DD'), 19, 3600.00, 123, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (138, 'Stephen', 'Stiles', 'stephen.stiles@sqltutorial.org', '650.121.2034', TO_DATE('1997-10-26', 'YYYY-MM-DD'), 18, 3200.00, 123, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (139, 'John', 'Seo', 'john.seo@sqltutorial.org', '650.121.2019', TO_DATE('1998-02-12', 'YYYY-MM-DD'), 18, 2700.00, 123, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (140, 'Joshua', 'Patel', 'joshua.patel@sqltutorial.org', '650.121.1834', TO_DATE('1998-04-06', 'YYYY-MM-DD'), 18, 2500.00, 123, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (141, 'Trenna', 'Rajs', 'trenna.rajs@sqltutorial.org', '650.121.8009', TO_DATE('1995-10-17', 'YYYY-MM-DD'), 18, 3500.00, 124, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (142, 'Curtis', 'Davies', 'curtis.davies@sqltutorial.org', '650.121.2994', TO_DATE('1997-01-29', 'YYYY-MM-DD'), 18, 3100.00, 124, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (143, 'Randall', 'Matos', 'randall.matos@sqltutorial.org', '650.121.2874', TO_DATE('1998-03-15', 'YYYY-MM-DD'), 18, 2600.00, 124, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (144, 'Peter', 'Vargas', 'peter.vargas@sqltutorial.org', '650.121.2004', TO_DATE('1998-07-09', 'YYYY-MM-DD'), 18, 2500.00, 124, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (145, 'John', 'Russell', 'john.russell@sqltutorial.org', '011.44.1344.429268', TO_DATE('1996-10-01', 'YYYY-MM-DD'), 19, 14000.00, 100, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (146, 'Karen', 'Partners', 'karen.partners@sqltutorial.org', '011.44.1344.467268', TO_DATE('1997-01-05', 'YYYY-MM-DD'), 19, 13500.00, 100, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (147, 'Alberto', 'Errazuriz', 'alberto.errazuriz@sqltutorial.org', '011.44.1344.429278', TO_DATE('1997-03-10', 'YYYY-MM-DD'), 19, 12000.00, 100, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (148, 'Gerald', 'Cambrault', 'gerald.cambrault@sqltutorial.org', '011.44.1344.619268', TO_DATE('1999-01-15', 'YYYY-MM-DD'), 19, 11000.00, 100, 5);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (149, 'Eleni', 'Zlotkey', 'eleni.zlotkey@sqltutorial.org', '011.44.1344.429018', TO_DATE('2000-01-29', 'YYYY-MM-DD'), 19, 10500.00, 100, 5);


-- error
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (150, 'Matthew', 'Weiss', 'matthew.weiss@sqltutorial.org', '650.123.1234', TO_DATE('1996-07-18', 'YYYY-MM-DD'), 20, 8000.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (151, 'Adam', 'Fripp', 'adam.fripp@sqltutorial.org', '650.123.2234', TO_DATE('1997-04-10', 'YYYY-MM-DD'), 20, 8200.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (152, 'Payam', 'Kaufling', 'payam.kaufling@sqltutorial.org', '650.123.3234', TO_DATE('1995-05-01', 'YYYY-MM-DD'), 20, 7900.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (153, 'Shanta', 'Vollman', 'shanta.vollman@sqltutorial.org', '650.123.4234', TO_DATE('1997-10-10', 'YYYY-MM-DD'), 20, 6500.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (154, 'Kevin', 'Mourgos', 'kevin.mourgos@sqltutorial.org', '650.123.5234', TO_DATE('1999-11-16', 'YYYY-MM-DD'), 20, 5800.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (155, 'Julia', 'Nayer', 'julia.nayer@sqltutorial.org', '650.124.1214', TO_DATE('1997-07-16', 'YYYY-MM-DD'), 21, 3200.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (156, 'Irene', 'Mikkilineni', 'irene.mikkilineni@sqltutorial.org', '650.124.1224', TO_DATE('1998-09-28', 'YYYY-MM-DD'), 21, 2700.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (157, 'James', 'Landry', 'james.landry@sqltutorial.org', '650.124.1334', TO_DATE('1999-01-14', 'YYYY-MM-DD'), 21, 2400.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (158, 'Steven', 'Markle', 'steven.markle@sqltutorial.org', '650.124.1434', TO_DATE('1999-03-08', 'YYYY-MM-DD'), 21, 2200.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (159, 'Laura', 'Bissot', 'laura.bissot@sqltutorial.org', '650.124.5234', TO_DATE('1997-08-20', 'YYYY-MM-DD'), 22, 3300.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (160, 'Mozhe', 'Atkinson', 'mozhe.atkinson@sqltutorial.org', '650.124.6234', TO_DATE('1997-10-30', 'YYYY-MM-DD'), 22, 2800.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (161, 'James', 'Marlow', 'james.marlow@sqltutorial.org', '650.124.7234', TO_DATE('1999-02-16', 'YYYY-MM-DD'), 22, 2500.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (162, 'TJ', 'Olson', 'tj.olson@sqltutorial.org', '650.124.8234', TO_DATE('1999-04-10', 'YYYY-MM-DD'), 22, 2100.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (163, 'Jason', 'Mallin', 'jason.mallin@sqltutorial.org', '650.127.1934', TO_DATE('1996-06-14', 'YYYY-MM-DD'), 23, 3300.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (164, 'Michael', 'Rogers', 'michael.rogers@sqltutorial.org', '650.127.1834', TO_DATE('1998-08-26', 'YYYY-MM-DD'), 23, 2900.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (165, 'Ki', 'Gee', 'ki.gee@sqltutorial.org', '650.127.1734', TO_DATE('1999-12-12', 'YYYY-MM-DD'), 23, 2400.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (166, 'Hazel', 'Philtanker', 'hazel.philtanker@sqltutorial.org', '650.127.1634', TO_DATE('2000-02-06', 'YYYY-MM-DD'), 23, 2200.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (167, 'Renske', 'Ladwig', 'renske.ladwig@sqltutorial.org', '650.121.1234', TO_DATE('1993-07-14', 'YYYY-MM-DD'), 24, 3600.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (168, 'Stephen', 'Stiles', 'stephen.stiles@sqltutorial.org', '650.121.2034', TO_DATE('1997-10-26', 'YYYY-MM-DD'), 24, 3200.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (169, 'John', 'Seo', 'john.seo@sqltutorial.org', '650.121.2019', TO_DATE('1998-02-12', 'YYYY-MM-DD'), 24, 2700.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (170, 'Joshua', 'Patel', 'joshua.patel@sqltutorial.org', '650.121.1834', TO_DATE('1998-04-06', 'YYYY-MM-DD'), 24, 2500.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (171, 'Trenna', 'Rajs', 'trenna.rajs@sqltutorial.org', '650.121.8009', TO_DATE('1995-10-17', 'YYYY-MM-DD'), 24, 3500.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (172, 'Curtis', 'Davies', 'curtis.davies@sqltutorial.org', '650.121.2994', TO_DATE('1997-01-29', 'YYYY-MM-DD'), 24, 3100.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (173, 'Randall', 'Matos', 'randall.matos@sqltutorial.org', '650.121.2874', TO_DATE('1998-03-15', 'YYYY-MM-DD'), 24, 2600.00, 100, 4);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) 
VALUES (174, 'Peter', 'Vargas', 'peter.vargas@sqltutorial.org', '650.121.2004', TO_DATE('1998-07-09', 'YYYY-MM-DD'), 24, 2500.00, 100, 4);



UPDATE employees
SET prev_salary = 55001.00
WHERE employee_id = 100;

UPDATE employees
SET prev_salary = 55002.00
WHERE employee_id = 101;

UPDATE employees
SET prev_salary = 55020.00
WHERE employee_id = 102;

UPDATE employees
SET prev_salary = 55300.00
WHERE employee_id = 103;

UPDATE employees
SET prev_salary = 4000.00
WHERE employee_id = 104;

UPDATE employees
SET prev_salary = 55000.00
WHERE employee_id = 105;

UPDATE employees
SET prev_salary = 55000.00
WHERE employee_id = 106;

UPDATE employees
SET prev_salary = 55020.00
WHERE employee_id = 107;

UPDATE employees
SET prev_salary = 55000.00
WHERE employee_id = 108


UPDATE employees
SET prev_salary = 55020.00
WHERE employee_id = 109

UPDATE employees
SET prev_salary = 55300.00
WHERE employee_id = 110;
