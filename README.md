# Employee Management System(SQL-Project)

## 📌 Overview
The **Employee Management System** is a SQL-based project designed to manage and analyze employee-related data efficiently. It includes modules for employee records, departments, salaries, qualifications, leaves, and payroll.

This project demonstrates strong skills in:
- Database design  
- SQL queries  
- Data analysis  
- Relational database management  

---

## 🏗️ Database Schema

The system consists of the following tables:

### 1. JobDepartment
Stores job roles and department details  
**Fields:** `Job_ID`, `jobdept`, `name`, `description`, `salaryrange`

### 2. SalaryBonus
Contains salary and bonus information  
**Fields:** `salary_ID`, `Job_ID`, `amount`, `annual`, `bonus`

### 3. Employee
Stores employee personal details  
**Fields:** `emp_ID`, `firstname`, `lastname`, `gender`, `age`, `contact_add`, `emp_email`, `emp_pass`, `Job_ID`

### 4. Qualification
Stores employee qualifications  
**Fields:** `QualID`, `Emp_ID`, `Position`, `Requirements`, `Date_In`

### 5. Leaves
Tracks employee leave records  
**Fields:** `leave_ID`, `emp_ID`, `date`, `reason`

### 6. Payroll
Handles salary processing and reports  
**Fields:** `payroll_ID`, `emp_ID`, `job_ID`, `salary_ID`, `leave_ID`, `date`, `report`, `total_amount`

---

## 🔗 Relationships

- One **JobDepartment** → Many **Employees**  
- One **JobDepartment** → SalaryBonus  
- One **Employee** → Many **Leaves**  
- One **Employee** → Many **Qualifications**

**Payroll links:**
- Employee  
- Job  
- Salary  
- Leave  

---

## ⚙️ Features

- ✅ Employee data management  
- ✅ Department and job role tracking  
- ✅ Salary and bonus calculations  
- ✅ Leave management system  
- ✅ Payroll processing  
- ✅ Advanced SQL analytics queries  

---

## 📈 SQL Analysis Included

### 👨‍💼 Employee Insights
- Total number of employees  
- Employees per department  
- Top 5 highest-paid employees  
- Total salary expenditure  

### 🏢 Department Analysis
- Job roles per department  
- Average salary per department  
- Highest-paying job roles  

### 🎓 Qualification Analysis
- Employees with qualifications  
- Positions with highest requirements  

### 🏖️ Leave Analysis
- Leave trends by year  
- Average leaves per department  
- Employees with most leaves  

### 💰 Payroll Analysis
- Total payroll processed  
- Average bonus per department  
- Department with highest bonuses  

---

## 🛠️ Technologies Used

- SQL (MySQL)  
- Relational Database Concepts  

---

## 🚀 How to Run

```sql
-- Create database
CREATE DATABASE EMPDB;

-- Use database
USE EMPDB;

-- Verify tables
SHOW TABLES;
```

### Steps:
1. Open MySQL Workbench (or any SQL tool)  
2. Execute the `.sql` file  
3. Run analysis queries  

---

## 📂 Project Structure

```
Employee-Management-System/
│
├── Employee Management System Project.sql
└── README.md
```

---

## 📌 Sample Use Cases

- HR analytics dashboard  
- Payroll management system  
- Employee tracking system   

---
## 📊 Dataset
 
- ☁️ External Link: [Download Full Dataset](https://drive.google.com/drive/folders/1jFFJEGioPj2k4hW0MhWi4_6ZveHrh5cX?usp=drive_link)

## 👨‍💻 Author

**Uppalapu Sharath Reddy**


