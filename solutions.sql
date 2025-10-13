drop table if exists Employee;
create table Employee(
Employee_Name varchar(30),
EmpID int,
MarriedID int,
MaritalStatusID	int,
GenderID	int,
EmpStatusID	int,
DeptID	int,
PerfScoreID	int,
FromDiversityJobFairID	int,
Salary	int,
Termd	int,
PositionID	int,
Positions	varchar(30),
Statee	Varchar (2),
Zip	int,
DOB	date,
Sex	varchar(1),
MaritalDesc	varchar(11),
CitizenDesc	varchar(20),
HispanicLatino varchar (3),
RaceDesc varchar (32),
DateofHire	date,
DateofTermination	date,
TermReason	varchar(32),
EmploymentStatus varchar(22),
Department	varchar(20),
ManagerName	varchar (18),
ManagerID	int,
RecruitmentSource	varchar(23),
PerformanceScore	varchar (17),
EmpSatisfaction	 int,
SpecialProjectsCount	int,
LastPerformanceReview_Date	date,
DaysLateLast30	int,
Absences int
);

----------------------
--1. Display all employee details from the HR dataset.

select * from employee;

--2.Find the total number of employees in the company.

select count(empid)from employee;

--3.List all unique departments available.

select distinct department from employee;

--4.Show the names and job titles of employees who work in the IT department.

select employee_name, positions as Job_tittle
from employee 
where department = 'IT/IS';

--5.Retrieve details of employees hired after the year 2015.

select Employee_Name, DateofHire from employee
where DateofHire > '2015/12/31'
order by DateofHire;

--6.Find how many employees are in each department.

select count(employee_name) as employee_count, department
from employee
group by department
order by employee_count desc ;

--7.Calculate the average salary for each department.

select department, round (Avg(salary),2)as avg_salary
from employee
group by department
order by avg_salary desc;

--8.Display the top 5 highest-paid employees in the company.

select employee_name, salary
from employee
order by salary desc 
limit 5;

--9.Find the total number of male and female employees.

select GenderID as sex, count(*)
from employee
group by GenderID

--10.List all employees who are no longer working in the company.

select employee_name, EmploymentStatus
from employee
where EmploymentStatus <> 'Active';

--11.Identify departments where the average salary is greater than ₹70,000.

select department, Avg(salary)as avg_salary
from employee
group by department
having Avg(salary) > 70000
order by avg_salary desc;

--12.Find each manager’s total team salary expense.

select Managername, 
sum(salary) as total_team_salary
from employee
group by Managername
order by total_team_salary desc;

--13.Display employees whose performance score is “Exceeds Expectations.”

select employee_name, department, positions, PerformanceScore
from employee
where PerformanceScore = 'Exceeds'

--14.Find the number of employees hired each year.

select count(employee_name) as Num_hires, DateofHire
from employee
group by DateofHire
order by DateofHire ;

--15.Identify the top 3 departments with the highest number of terminations.

select department, count (Termd) as termination_count
from employee
where Termd = '1'
group by department
order by termination_count desc
limit 3;

--------------------------