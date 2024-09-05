--Data Analysis (1):
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sl.salary
  FROM employees emp
  JOIN salaries sl
    ON emp.emp_no = sl.emp_no;

-- (2):
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date_formated) = 1986;

-- (3):
SELECT dpt.dept_no, dpt.dept_name, dpt_m.emp_no, emp.first_name, emp.last_name
  FROM departments dpt
  JOIN dept_managers dpt_m
    ON dpt.dept_no = dpt_m.dept_no
  JOIN employees emp
    ON dpt_m.emp_no = emp.emp_no;

-- (4):
SELECT dpt_e.dept_no, dpt_e.emp_no, emp.last_name, emp.first_name, dpt.dept_name
  FROM dept_emp dpt_e
  JOIN employees emp
    ON dpt_e.emp_no = emp.emp_no
  JOIN departments dpt
    ON dpt.dept_no = dpt.dept_no;

-- (5):
SELECT first_name, last_name, sex
  FROM employees
 WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- (6):
SELECT emp.emp_no, emp.first_name, emp.last_name
  FROM employees emp
  JOIN dept_emp dpt_e
    ON emp.emp_no = dpt_e.emp_no
  JOIN departments dpt
    ON dpt_e.dept_no = dpt.dept_no
 WHERE dpt.dept_name = 'Sales';

-- (7):
SELECT emp.emp_no, emp.first_name, emp.last_name, dpt.dept_name
  FROM employees emp
  JOIN dept_emp dpt_e
    ON emp.emp_no = dpt_e.emp_no
  JOIN departments dpt
    ON dpt_e.dept_no = dpt.dept_no
 WHERE dpt.dept_name IN ('Sales','Development');

-- (8):
SELECT last_name, COUNT(*) AS frequency
  FROM employees
GROUP BY last_name
ORDER BY frequency DESC;