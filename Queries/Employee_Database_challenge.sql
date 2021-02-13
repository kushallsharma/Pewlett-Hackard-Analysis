-- DELIVERABLE # 1 --
-- Getting retirement titles info

SELECT em.emp_no, em.first_name, em.last_name, 
	   tt.title, tt.from_date, tt.to_date
INTO retirement_titles
FROM employees AS em
INNER JOIN titles AS tt
ON em.emp_no = tt.emp_no
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY em.emp_no;

SELECT * FROM retirement_titles;



-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;



-- Getting counts of retiring employees 

SELECT title, COUNT(emp_no)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM retiring_titles;



-- DELIVERABLE # 2 --

-- Getting mentorship eligible employees details


SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date,
	   de.from_date, de.to_date,
	   tt.title
INTO mentorship_eigibility
FROM employees AS em
LEFT JOIN dept_emp AS de
ON em.emp_no = de.emp_no
LEFT JOIN titles AS tt
ON (em.emp_no = tt.emp_no AND de.to_date = tt.to_date)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no, de.to_date DESC;







