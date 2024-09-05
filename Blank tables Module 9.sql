CREATE TABLE departments(
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE titles(
    title_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(20),
    birth_date TEXT, 
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1),
    hire_date TEXT,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE dept_emp(
    emp_no INT,
    dept_no VARCHAR(10),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE dept_managers(
    dept_no VARCHAR(10),
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries(
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

ALTER TABLE employees
ADD COLUMN hire_date_formated DATE,
ADD COLUMN birth_date_formated DATE;
UPDATE employees
SET hire_date_formated = TO_DATE(hire_date, 'MM/DD/YYYY');
UPDATE employees
SET birth_date_formated = TO_DATE(birth_date, 'MM/DD/YYYY');


