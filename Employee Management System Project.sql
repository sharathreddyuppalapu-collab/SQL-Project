USE EMPDB;

-- Table 1: Job Department
CREATE TABLE JobDepartment (
    Job_ID INT PRIMARY KEY,
    jobdept VARCHAR(50),
    name VARCHAR(100),
    description TEXT,
    salaryrange VARCHAR(50)
);

SELECT * FROM Jobdepartment;

-- Table 2: Salary/Bonus
CREATE TABLE SalaryBonus (
    salary_ID INT PRIMARY KEY,
    Job_ID INT,
    amount DECIMAL(10,2),
    annual DECIMAL(10,2),
    bonus DECIMAL(10,2),
    CONSTRAINT fk_salary_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(Job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- Table 3: Employee
CREATE TABLE Employee (
    emp_ID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    contact_add VARCHAR(100),
    emp_email VARCHAR(100) UNIQUE,
    emp_pass VARCHAR(50),
    Job_ID INT,
    CONSTRAINT fk_employee_job FOREIGN KEY (Job_ID)
        REFERENCES JobDepartment(Job_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- Table 4: Qualification
CREATE TABLE Qualification (
    QualID INT PRIMARY KEY,
    Emp_ID INT,
    Position VARCHAR(50),
    Requirements VARCHAR(255),
    Date_In DATE,
    CONSTRAINT fk_qualification_emp FOREIGN KEY (Emp_ID)
        REFERENCES Employee(emp_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table 5: Leaves
CREATE TABLE Leaves (
    leave_ID INT PRIMARY KEY,
    emp_ID INT,
    date DATE,
    reason TEXT,
    CONSTRAINT fk_leave_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table 6: Payroll
CREATE TABLE Payroll (
payrollID INT PRIMARY KEY,
emp_ID INT,
jobID INT,
salary_ID INT,
leaveID INT,
date DATE,
report TEXT,
totalamount DECIMAL(10,2),
CONSTRAINT fkpayroll_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_payroll_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(job_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_payroll_salary FOREIGN KEY (salary_ID) REFERENCES
SalaryBonus(salary_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_payroll_leave FOREIGN KEY (leave_ID) REFERENCES Leaves(leave_ID)
ON DELETE SET NULL ON UPDATE CASCADE
);



INSERT INTO JobDepartment (Job_ID, jobdept, name, description, salaryrange) VALUES
(61, 'Engineering', 'Cloud Architect', 'Designing and managing cloud infrastructure.', '$110000 - $160000'),
(62, 'Finance', 'Tax Specialist', 'Managing corporate tax compliance and strategy.', '$75000 - $110000'),
(63, 'IT', 'Cybersecurity Analyst', 'Protecting company networks from digital threats.', '$85000 - $130000'),
(64, 'Marketing', 'SEO Strategist', 'Optimizing web content for search engine rankings.', '$55000 - $90000'),
(65, 'Operations', 'Supply Chain Manager', 'Overseeing logistics and vendor relationships.', '$80000 - $125000'),
(66, 'Legal', 'Compliance Officer', 'Ensuring the company adheres to legal standards.', '$70000 - $115000'),
(67, 'HR', 'Diversity & Inclusion Lead', 'Developing workplace culture and equality programs.', '$65000 - $100000'),
(68, 'Sales', 'Account Executive', 'Managing high-value client relationships.', '$60000 - $140000'),
(69, 'Engineering', 'QA Engineer', 'Testing software for bugs and performance issues.', '$65000 - $105000'),
(70, 'IT', 'DevOps Engineer', 'Bridging the gap between dev and operations.', '$95000 - $145000'),
(71, 'Finance', 'Internal Auditor', 'Reviewing internal financial controls.', '$60000 - $95000'),
(72, 'Marketing', 'Content Producer', 'Creating multimedia marketing assets.', '$50000 - $85000'),
(73, 'Operations', 'Facility Manager', 'Overseeing office maintenance and safety.', '$55000 - $85000'),
(74, 'Sales', 'Inside Sales Rep', 'Generating leads through remote outreach.', '$45000 - $80000'),
(75, 'Engineering', 'Data Engineer', 'Building data pipelines and warehouses.', '$100000 - $155000'),
(76, 'HR', 'Recruitment Coordinator', 'Managing the end-to-end hiring process.', '$50000 - $80000'),
(77, 'IT', 'Database Admin', 'Maintaining database health and security.', '$85000 - $130000'),
(78, 'Legal', 'Paralegal', 'Supporting legal research and documentation.', '$45000 - $75000'),
(79, 'Finance', 'Investment Analyst', 'Evaluating market trends for investments.', '$90000 - $150000'),
(80, 'Sales', 'Regional Sales Director', 'Overseeing sales teams across the territory.', '$120000 - $200000');



INSERT INTO SalaryBonus (salary_ID, Job_ID, amount, annual, bonus) VALUES
(61, 61, 60500, 726000, 86400),
(62, 62, 57500, 690000, 61300),
(63, 63, 58200, 698400, 67400),
(64, 64, 55200, 662400, 42500),
(65, 65, 57800, 693600, 63000),
(66, 66, 57100, 685200, 56300),
(67, 67, 56400, 676800, 52900),
(68, 68, 56800, 681600, 208800),
(69, 69, 56200, 674400, 45300),
(70, 70, 59400, 712800, 69500),
(71, 71, 56100, 673200, 50600),
(72, 72, 54800, 657600, 40000),
(73, 73, 55000, 660000, 49500),
(74, 74, 54200, 650400, 193600),
(75, 75, 59800, 717600, 73200),
(76, 76, 54900, 658800, 44800),
(77, 77, 58500, 702000, 61900),
(78, 78, 54300, 651600, 37900),
(79, 79, 58900, 706800, 66200),
(80, 80, 63500, 762000, 164600);

INSERT INTO Employee (emp_ID, firstname, lastname, gender, age, contact_add, emp_email, emp_pass, Job_ID) VALUES
(61, 'Liam', 'Parker', 'M', 34, '707 Cedar St, WA', 'liam.p@example.com', 'pass1', 61),
(62, 'Emma', 'Sullivan', 'F', 29, '101 Birch Ln, OR', 'emma.s@example.com', 'pass2', 62),
(63, 'Noah', 'Vance', 'M', 31, '202 Oak Rd, CA', 'noah.v@example.com', 'pass3', 63),
(64, 'Ava', 'Redmond', 'F', 27, '303 Pine Ter, TX', 'ava.r@example.com', 'pass4', 64),
(65, 'Mason', 'Drake', 'M', 42, '404 Maple Dr, FL', 'mason.d@example.com', 'pass5', 65),
(66, 'Sophia', 'Kent', 'F', 38, '505 Elm Ct, NY', 'sophia.k@example.com', 'pass6', 66),
(67, 'Logan', 'Blair', 'M', 33, '606 Ash Way, IL', 'logan.b@example.com', 'pass7', 67),
(68, 'Isabella', 'Frost', 'F', 30, '707 Willow Ave, NV', 'isa.f@example.com', 'pass8', 68),
(69, 'Ethan', 'Grant', 'M', 28, '808 Spruce St, AZ', 'ethan.g@example.com', 'pass9', 69),
(70, 'Mia', 'Sinclair', 'F', 35, '909 Walnut Ln, CO', 'mia.s@example.com', 'pass10', 70),
(71, 'Lucas', 'Hayes', 'M', 45, '111 Cherry St, GA', 'lucas.h@example.com', 'pass11', 71),
(72, 'Charlotte', 'Ross', 'F', 26, '222 Pear Rd, MI', 'char.r@example.com', 'pass12', 72),
(73, 'Jack', 'Porter', 'M', 40, '333 Apple St, VA', 'jack.p@example.com', 'pass13', 73),
(74, 'Amelia', 'Banks', 'F', 32, '444 Grape Blvd, PA', 'amelia.b@example.com', 'pass14', 74),
(75, 'Aiden', 'Brooks', 'M', 37, '555 Berry Ln, TN', 'aiden.b@example.com', 'pass15', 75),
(76, 'Harper', 'Reed', 'F', 29, '666 Lime Ct, NC', 'harper.r@example.com', 'pass16', 76),
(77, 'James', 'Ford', 'M', 36, '777 Lemon St, UT', 'james.f@example.com', 'pass17', 77),
(78, 'Evelyn', 'Cole', 'F', 41, '888 Orange Ave, KY', 'eve.c@example.com', 'pass18', 78),
(79, 'Benjamin', 'Nash', 'M', 39, '999 Melon Rd, SC', 'ben.n@example.com', 'pass19', 79),
(80, 'Scarlett', 'Young', 'F', 44, '121 Plum Blvd, MD', 'scar.y@example.com', 'pass20', 80);

INSERT INTO Qualification (QualID, Emp_ID, Position, Requirements, Date_In) VALUES
(61, 61, 'Cloud Architect', 'AWS Certified Professional, 8 Years IT Exp', '2024-05-01'),
(62, 62, 'Tax Specialist', 'CPA License, MST Finance', '2024-05-01'),
(63, 63, 'Cybersecurity', 'CISSP, Ethical Hacker Cert', '2024-05-01'),
(64, 64, 'SEO Strategist', 'Google Analytics Cert, 3 Years Exp', '2024-05-01'),
(65, 65, 'Supply Chain Manager', 'APICS Cert, MBA Logistics', '2024-05-01'),
(66, 66, 'Compliance Officer', 'Juris Doctor, Compliance Cert', '2024-05-01'),
(67, 67, 'D&I Lead', 'HR Management Degree, Diversity Training', '2024-05-01'),
(68, 68, 'Account Executive', 'Bachelors in Marketing, Sales Excellence Award', '2024-05-01'),
(69, 69, 'QA Engineer', 'ISTQB Certification, Python Scripting', '2024-05-01'),
(70, 70, 'DevOps Engineer', 'Docker/Kubernetes Mastery, Linux Admin', '2024-05-01'),
(71, 71, 'Internal Auditor', 'CIA Certification, 10 Years Finance Exp', '2024-05-01'),
(72, 72, 'Content Producer', 'Adobe Creative Suite, Journalism Degree', '2024-05-01'),
(73, 73, 'Facility Manager', 'Safety Cert (OSHA), 5 Years Exp', '2024-05-01'),
(74, 74, 'Inside Sales', 'Communication Skills, CRM Experience', '2024-05-01'),
(75, 75, 'Data Engineer', 'Big Data Engineering, SQL Mastery', '2024-05-01'),
(76, 76, 'Recruiter', 'Bachelors in Psychology, Talent Sourcing', '2024-05-01'),
(77, 77, 'Database Admin', 'Oracle Certified, SQL Tuning', '2024-05-01'),
(78, 78, 'Paralegal', 'Legal Studies Diploma, Research Specialist', '2024-05-01'),
(79, 79, 'Investment Analyst', 'CFA Level II, Finance Honors', '2024-05-01'),
(80, 80, 'Sales Director', 'MBA, 15 Years Sales Leadership', '2024-05-01');


INSERT INTO Leaves (leave_ID, emp_ID, date, reason) VALUES
-- Employee 61 (3 Leaves)
(61, 61, '2024-01-10', 'Vacation'),
(62, 61, '2024-03-15', 'Medical Checkup'),
(63, 61, '2024-06-20', 'Family Event'),

-- Employee 62 (3 Leaves)
(64, 62, '2024-02-05', 'Fever'),
(65, 62, '2024-05-12', 'Internet Issue'),
(66, 62, '2024-08-10', 'Personal Work'),

-- Employee 63 (2 Leaves)
(67, 63, '2024-04-18', 'Sick Leave'),
(68, 63, '2024-09-22', 'Wedding'),

-- Employee 64 (2 Leaves)
(69, 64, '2024-01-25', 'Family Emergency'),
(70, 64, '2024-10-30', 'Vacation'),

-- Single Leaves for Employees 65 to 74
(71, 65, '2024-06-15', 'Jury Duty'),
(72, 66, '2024-07-10', 'Legal Matter'),
(73, 67, '2024-06-18', 'Personal Work'),
(74, 68, '2024-07-12', 'Vacation'),
(75, 69, '2024-06-20', 'Wedding'),
(76, 70, '2024-07-15', 'Medical Checkup'),
(77, 71, '2024-06-22', 'Sick Leave'),
(78, 72, '2024-07-18', 'Moving House'),
(79, 73, '2024-06-25', 'Dental Visit'),
(80, 74, '2024-07-28', 'Birthday');

INSERT INTO Payroll (payroll_ID, emp_ID, job_ID, salary_ID, leave_ID, date, report, total_amount) VALUES
-- Employees with Multiple Leaves (Linked to specific Leave IDs)
(61, 61, 61, 61, 63, '2024-06-30', 'Monthly Salary processed after Family Event leave', 60400.00),
(62, 62, 62, 62, 65, '2024-06-30', 'Monthly Salary processed after Internet Issue leave', 57500.00),
(63, 63, 63, 63, 67, '2024-06-30', 'Monthly Salary processed after Sick Leave', 58200.00),
(64, 64, 64, 64, 69, '2024-06-30', 'Monthly Salary processed after Family Emergency', 55200.00),

-- Employees with Single Leaves (IDs match EmpID)
(65, 65, 65, 65, 71, '2024-06-30', 'Monthly Salary processed', 57800.00),
(66, 66, 66, 66, 72, '2024-06-30', 'Monthly Salary processed', 57100.00),
(67, 67, 67, 67, 73, '2024-06-30', 'Monthly Salary processed', 56400.00),
(68, 68, 68, 68, 74, '2024-06-30', 'Monthly Salary processed', 56800.00),
(69, 69, 69, 69, 75, '2024-06-30', 'Monthly Salary processed', 56200.00),
(70, 70, 70, 70, 76, '2024-06-30', 'Monthly Salary processed', 59400.00),
(71, 71, 71, 71, 77, '2024-06-30', 'Monthly Salary processed', 56100.00),
(72, 72, 72, 72, 78, '2024-06-30', 'Monthly Salary processed', 54800.00),
(73, 73, 73, 73, 79, '2024-06-30', 'Monthly Salary processed', 55000.00),
(74, 74, 74, 74, 80, '2024-06-30', 'Monthly Salary processed', 54200.00),

-- Remaining employees (linking to their Salary/Job IDs)
(75, 75, 75, 75, NULL, '2024-06-30', 'Monthly Salary processed (No Leave)', 59800.00),
(76, 76, 76, 76, NULL, '2024-06-30', 'Monthly Salary processed (No Leave)', 54900.00),
(77, 77, 77, 77, NULL, '2024-06-30', 'Monthly Salary processed (No Leave)', 58500.00),
(78, 78, 78, 78, NULL, '2024-06-30', 'Monthly Salary processed (No Leave)', 54300.00),
(79, 79, 79, 79, NULL, '2024-06-30', 'Monthly Salary processed (No Leave)', 58900.00),
(80, 80, 80, 80, NULL, '2024-06-30', 'Monthly Salary processed (No Leave)', 63500.00);

show errors;

select * from qualification;
-- ------------------
-- EMPLOYEE INSIGHTS
-- ------------------

-- How many unique employees are currently in the system?

SELECT DISTINCT COUNT(emp_ID)
FROM EMPLOYEE;

-- Which departments have the highest number of employees?

SELECT 
    j.JobDept, COUNT(e.Emp_ID) AS EmployeeCount
FROM
    Employee e
        JOIN
    JobDepartment j ON e.Job_ID = j.Job_ID
GROUP BY j.JobDept
ORDER BY EmployeeCount DESC;


-- What is the average salary per department?

SELECT 
    j.JobDept, AVG(s.Amount) AS AverageMonthlySalary
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.JobDept
ORDER BY AverageMonthlySalary DESC;

-- Who are the top 5 highest-paid employees?

WITH SalaryRank AS (
SELECT e.FirstName, e.LastName,
sb.Amount,DENSE_RANK() OVER (ORDER BY sb.Amount DESC) as rnk
FROM Employee e
JOIN SalaryBonus sb ON e.Job_ID = sb.Job_ID
)
SELECT FirstName, LastName, Amount
FROM SalaryRank
WHERE rnk <= 5;


-- What is the total salary expenditure across the company?

SELECT SUM(Annual) AS TotalAnnualExpenditure 
FROM SalaryBonus;


-- ------------------------------------
-- JOB ROLE AND DEPARTMENT ANALYSIS
-- ------------------------------------

-- How many different job roles exist in each department?

SELECT 
    Jobdept, COUNT(DISTINCT name) AS Total_job_roles
FROM
    JobDepartment
GROUP BY Jobdept;

-- What is the average salary range per department?

SELECT 
    JobDept,
    AVG((CAST(REPLACE(SUBSTR(SalaryRange,2,INSTR(SalaryRange, ' -') - 2),',','')
        AS DECIMAL) + CAST(REPLACE(SUBSTR(SalaryRange,INSTR(SalaryRange, '-') + 3),',','')
        AS DECIMAL)) / 2) AS AvgDeptSalaryMidpoint
FROM
    JobDepartment
GROUP BY JobDept
ORDER BY AvgDeptSalaryMidpoint DESC;

-- Which job roles offer the highest salary?

SELECT 
    j.Name AS JobRole, s.Amount AS MonthlySalary
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
ORDER BY s.Amount DESC
LIMIT 5;

-- Which departments have the highest total salary allocation?


SELECT 
    j.JobDept, SUM(s.Annual) AS TotalAnnualAllocation
FROM
    JobDepartment j
        JOIN
    SalaryBonus s ON j.Job_ID = s.Job_ID
GROUP BY j.JobDept
ORDER BY TotalAnnualAllocation DESC;


-- ---------------------------------
-- QUALIFICATION AND SKILLS ANALYSIS
-- ---------------------------------

-- How many employees have at least one qualification listed?

SELECT 
    COUNT(DISTINCT Emp_ID) AS EmployeesWithQualifications
FROM
    Qualification;

-- Which positions require the most qualifications?

SELECT 
    Position,
    Requirements,
    (LENGTH(Requirements) - LENGTH(REPLACE(Requirements, ' ', '')) + 1) AS QualificationCount
FROM
    Qualification
ORDER BY QualificationCount DESC
LIMIT 5;


-- -----------------------------
 -- LEAVE AND ABSENCE PATTERNS
-- -----------------------------

-- Which year had the most employees taking leaves?

SELECT YEAR(Date) AS Year, COUNT(DISTINCT Emp_ID) AS EmpCount
FROM Leaves
GROUP BY Year
ORDER BY EmpCount DESC
LIMIT 1;

-- What is the average number of leave days taken by its employees per department?

SELECT 
    jd.JobDept, AVG(LeaveStats.LeavesTaken) AS Avg_Leaves
FROM
    JobDepartment jd
        JOIN
    Employee e ON jd.Job_ID = e.Job_ID
        LEFT JOIN
    (SELECT 
        Emp_ID, COUNT(*) AS LeavesTaken
    FROM
        Leaves
    GROUP BY Emp_ID) LeaveStats ON e.Emp_ID = LeaveStats.Emp_ID
GROUP BY jd.JobDept;

-- Which employees have taken the most leaves?

SELECT 
    Emp_ID, COUNT(*) AS TotalLeaves
FROM
    Leaves
GROUP BY Emp_ID
HAVING COUNT(*) > 1
ORDER BY TotalLeaves DESC;

-- What is the total number of leave days taken company-wide?

SELECT COUNT(*) FROM Leaves;



-- ----------------------------------
-- PAYROLL AND COMPENSATION ANALYSIS
-- ----------------------------------

-- What is the total monthly payroll processed?

SELECT 
    SUM(Total_Amount) 
FROM
    Payroll;

-- What is the average bonus given per department?

SELECT 
    j.JobDept, AVG(s.Bonus) AS AvgBonus
FROM
    SalaryBonus s
        JOIN
    JobDepartment j ON s.Job_ID = j.Job_ID
GROUP BY j.JobDept
ORDER BY AvgBonus DESC;

-- Which department receives the highest total bonuses?

SELECT 
    j.JobDept, SUM(s.Bonus) AS TotalBonuses
FROM
    SalaryBonus s
        JOIN
    JobDepartment j ON s.Job_ID = j.Job_ID
GROUP BY j.JobDept
ORDER BY TotalBonuses DESC
LIMIT 1;


-- What is the average value of total_amount after considering leave deductions?

SELECT AVG(Total_Amount) FROM Payroll;


SELECT * FROM jobdepartment;
show errors;

