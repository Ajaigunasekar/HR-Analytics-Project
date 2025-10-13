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
