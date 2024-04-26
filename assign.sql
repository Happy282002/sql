-- q1 Display all information in the tables EMP and DEPT--
use hr;
select*from employees;
select*from departments;

-- q2 Display only the hire date and employee name for each employee.--
select first_name, hire_date from employees;

-- q3 Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title--
select concat(first_name,',',job_id) as employee_and_title from employees;

-- q4 Display the hire date, name and department number for all clerks.--
select hire_date, first_name, department_id from employees;

-- q5  Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 
select concat(first_name,',',last_name,',',email,',',phone_number,',',hire_date,',',job_id,',',salary,',',manager_id,',',department_id) as "the_output" from employees;  
select*from employees;

-- q6 Display the names and salaries of all employees with a salary greater than 2000.--
select first_name, salary from employees where salary>2000;

-- q7 Display the names and dates of employees with the column headers "Name" and "Start Date" --
select first_name as name, hire_date as start_date from employees;

-- q8 Display the names and hire dates of all employees in the order they were hired. --
select first_name,hire_date from employees order by hire_date asc;

-- q9 Display the names and salaries of all employees in reverse salary order.--
select first_name,salary from employees order by salary desc;

-- q10 Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
select first_name,department_id from employees order by salary desc;

-- q11 Display the last name and job title of all employees who do not have a manager 
select last_name,job_id from employees where manager_id is null;

-- q12 Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 
select*from employees;
select last_name,job_id,salary from employees where job_id in ('SA_REP','ST_CLERK') AND salary not in(2500,3500.5000);

-------------------------------------------------------------------------------------------
-- q1  Display the maximum, minimum and average salary and commission earned.   
select max(salary),min(salary),avg(salary),max(commission_pct),min(commission_pct),avg(commission_pct) from employees;

-- q2  Display the department number, total salary payout and total commission payout for 
-- each department.  
select sum(salary),sum(commission_pct) from employees where commission_pct is not null group by department_id;

-- q3 Display the department number and number of employees in each department. 
select sum(department_id),sum(employee_id) from employees;


-- q4  Display the department number and total salary of employees in each department.  
select sum(salary) as salary,department_id from employees group by department_id;

-- q5 Display the employee's name who doesn't earn a commission. Order the result set 
-- without using the column name
select first_name,commission_pct from employees where commission_pct is not null order by first_name asc;

-- q6 Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
select first_name,department_id,case when commission_pct is null then 'no commission' else commission_pct end as commission from employees;

-- q7  Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately 
select first_name,salary,case when commission_pct is not null then commission_pct*2 else 'no commission' end as commission from employees;

-- q8 Display the employee's name, department id who have the first name same as another employee in the same department 
select*from employees;
select first_name, department_id from employees where first_name = first_name;

-- q9 Display the sum of salaries of the employees working under each Manager.
use hr;
select sum(salary),manager_id from employees group by manager_id;  

-- q10  Select the Managers name, the count of employees working under and the department ID of the manager.
select count(manager_id) from employees where manager_id = employee_id group by manager_id;

-- q11 Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! 
use hr;
select concat(first_name,' ',last_name) as employee_name,department_id,salary,manager_id from employees where last_name like '_a%';

-- q12 Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.
select sum(salary) as salary from employees group by department_id;

-- q13  Select the maximum salary of each department along with the department id  
select department_id,max(salary) from employees group by department_id;

-- q14 Display the commission, if not null display 10% of salary, if null display a default value 1 
select commission_pct,case when commission_pct is not null then salary*0.10 else 1 end as commission from employees;


-----------------------------------------------------------------------------------------------------
-- q1  Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label. 
select mid(last_name,2,5) as last_name from employees ;
select upper(substring(first_name,1)) from employees;

-- q2 Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined. 
select concat(first_name,'-', last_name) as employee_name,hire_date from employees;

-- q3 Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 
select last_name as employee_lastname,case when salary*0.5>10000 then salary*1.1 + 1500 else salary*1.115+1500 end as bonus from employees;

-- q4  Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$!  
select concat(substring(employee_id,1,2), '00','e') as emp_id,department_id,salary,upper(case when replace(first_name,'z','$!') then first_name else replace  (first_name,'z','$!') end )as manager_name from employees;

-- q5 Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 
select concat(upper(substring(last_name,1,1)),lower(substring(last_name,2))) as emp_name, length(last_name) as length from employees where last_name like'J%' or last_name like'A%' or last_name like 'M%' order by last_name;

-- q6 Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY 
select last_name,concat('$',lpad(salary,15,'$')) as salary from employees;

-- q7  Display the employee's name if it is a palindrome  
select first_name from employees where first_name = reverse(first_name);

-- q8 Display First names of all employees with initcaps.
select first_name from employees;
select concat(upper(substring(first_name,1,1)),lower(substring(first_name,2))) as first_name from employees;

-- q9 From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 
select mid( street_address,locate(' ',street_address)+1,locate
(' ',street_address,locate(' ',street_address)+1) - locate(' ',street_address)-1) as extracted_word from locations;

-- q10  Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name. 
select first_name,concat(lower(substring(first_name,1,1)),lower(last_name),'@systechusa.com') as email_address from employees;

  -- q11  Display the names and job titles of all employees with the same job as Trenna.  
select e.first_name,e.job_id from employees as e join employees as j on e.job_id = j.job_id where j.first_name = 'trenna';


-- q12  Display the names and department name of all employees working in the same city as Trenna.
select first_name,department_id from employees where department_id = (select department_id from employees where first_name = 'trenna');


-- q13  Display the name of the employee whose salary is the lowest.
select first_name,salary from employees where salary = (select min(salary) from employees);

-- q14  Display the names of all employees except the lowest paid.
select*from employees; 
select*from jobs;
select first_name,salary from employees where salary > (select min(salary) from employees);

-----------------------------------------------------------------------------------------------------------

-- q1 Write a query to display the last name, department number, department name for all employees
select e.last_name,e.department_id,d.department_name from employees as e join departments as d on e.department_id=d.department_id;

-- q2 Create a unique list of all jobs that are in department 40. Include the location of the department in the output. 
select*from jobs;
select*from employees;
select*from departments;
select  j.job_title,d.department_id,d.department_name,l.city as department_location from jobs j join employees e on j.job_id = e.job_id join departments d on e.department_id = d.department_id 
join locations l on d.location_id = l.location_id where d.department_id = 40;

-- q3 Write a query to display the employee last name,department name,location id and city of all employees who earn commission.   
select e.last_name,d.department_name,l.location_id from departments as d join employees as e on d.department_id = e.department_id join locations as l on d.location_id=l.location_id where e.commission_pct is not null;

-- q4  Display the employee last name and department name of all employees who have an 'a' in their last name
select e.last_name,d.department_name from employees as e join departments as d on e.employee_id=d.department_id where last_name like '%a%';

-- q5 Write a query to display the last name,job,department number and department name for all employees who work in ACCOUNTING. 
select*from jobs;
select*from departments;
select*from countries;
select*from employees; 
select e.last_name,e.job_id,e.department_id,d.department_name from employees as e join departments as d on e.department_id = d.department_id where d.department_name = 'accounting';

-- q6 Display the employee last name and employee number along with their manager's last name and manager number. 
select e.last_name,e.employee_id,d.manager_id from employees as e join departments as d on e.manager_id=d.manager_id;

-- q7  Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).
select*from employees;
select e.last_name,e.employee_id,d.manager_id,e.last_name as manager_lastname,e.phone_number as manager_phone_number from employees as e join departments as d on e.manager_id=d.manager_id where d.manager_id;

-- q8 . Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee(kochhar).
select last_name,department_id from employees where department_id = (select department_id from employees where last_name = 'kochhar');

-- q9 Create a query that displays the name,job,department name,salary,grade for all employees.  Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)   
select e.last_name,e.job_id,e.department_id,e.salary,
case when e.salary >= 50000 then 'a' when e.salary >=30000 then 'b' else 'c' end as grade from employees as e join departments as d on e.department_id = d.department_id;

-- q10  Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee 
-- name, emp_hire_date,manager name,man_hire_date
select e.first_name as employee_name,e.hire_date as emp_hire_date,d.manager_id as manager_id,e.first_name as manager_name,e.hire_date as manager_hire_date from employees as e join departments as d on e.manager_id = d.manager_id; 
select*from employees;
select*from departments;
