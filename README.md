# HR Data Analysis Using SQL (PostgreSQL)
Simple HR data analysis project using PostgreSQL to find insights about employees, salary, and performance.

## Overview
This project is about analyzing HR (Human Resource) data using PostgreSQL.
The main aim is to understand employee details like salary, department, performance, and reasons for leaving the company.

By using SQL queries, I have found different insights that can help HR teams make better decisions.

## Project Objectives
1. To check how employees are divided across departments.
2. To find which department gives higher salaries.
3. To see employee performance and satisfaction level.
4. To understand why employees leave the company.
5. To practice SQL queries like filtering, joining, grouping, and subqueries.
   
## Dataset
link: https://www.kaggle.com/datasets/rhuebner/human-resources-data-set

## Tools Used
PostgreSQL – for writing and running queries.
HRDataset_v14.csv – dataset from Kaggle.

## Schema 
```sql
drop table if exists Employee;
create table Employee
(
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
```
## Solutions
### 1. Display all employee details from the HR dataset.

```sql
select * from employee;
```
### 2.Find the total number of employees in the company.
```sql
select count(empid)from employee;
```

### 3.List all unique departments available.
```sql
select distinct department from employee;
```
## 4.Show the names and job titles of employees who work in the IT department.

```sql
select employee_name, positions as Job_tittle
from employee 
where department = 'IT/IS';
```

## 5.Retrieve details of employees hired after the year 2015.
```sql
select Employee_Name, DateofHire from employee
where DateofHire > '2015/12/31'
order by DateofHire;
```
## 6.Find how many employees are in each department.
```sql
select count(employee_name) as employee_count, department
from employee
group by department
order by employee_count desc ;
```
## 7.Calculate the average salary for each department.
```sql
select department, round (Avg(salary),2)as avg_salary
from employee
group by department
order by avg_salary desc;
```
## 8.Display the top 5 highest-paid employees in the company.
```sql
select employee_name, salary
from employee
order by salary desc 
limit 5;
```
## 9.Find the total number of male and female employees.
```sql
select GenderID as sex, count(*)
from employee
group by GenderID
```
## 10.List all employees who are no longer working in the company.
```sql
select employee_name, EmploymentStatus
from employee
where EmploymentStatus <> 'Active';
```
## 11.Identify departments where the average salary is greater than ₹70,000.
```sql
select department, Avg(salary)as avg_salary
from employee
group by department
having Avg(salary) > 70000
order by avg_salary desc;
```
## 12.Find each manager’s total team salary expense.
```sql
select Managername, 
sum(salary) as total_team_salary
from employee
group by Managername
order by total_team_salary desc;
```
## 13.Display employees whose performance score is “Exceeds Expectations.”
```sql
select employee_name, department, positions, PerformanceScore
from employee
where PerformanceScore = 'Exceeds'
```
## 14.Find the number of employees hired each year.
```sql
select count(employee_name) as Num_hires, DateofHire
from employee
group by DateofHire
order by DateofHire ;
```
## 15.Identify the top 3 departments with the highest number of terminations.
```sql
select department, count (Termd) as termination_count
from employee
where Termd = '1'
group by department
order by termination_count desc
limit 3;
```
