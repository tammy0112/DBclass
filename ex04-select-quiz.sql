/*
Q1. 'employees' table에서 last_name, first_name, salary 조회하기

Q2. 'jobs' table에서 'job_id'와 'job_title' 조회하기

Q3. 'departments' table에서 'department_id'와 'department_name' 조회하기

Q4. 'locations' table에서 location_id와 city 조회하기

Q5. 'employees' table에서  salary가 5000 이상인 직원들의 first_name, salary 조회하기

Q6. 'employees' table에서 근무 시작일이 2005년 이후인 직원들의 first_name과 hire_date를 조회하기
*/
/*A1
SELECT
    last_name,
    first_name,
    salary
FROM employees;
*/
/*A2
SELECT
    job_id,
    job_title
FROM jobs;
*/
/*A3
SELECT
    department_id,
    department_name
FROM departments;
*/
/*A4
SELECT
    location_id,
    city
FROM locations;
*/
/*A5
SELECT
    first_name,
    salary
FROM employees
WHERE salary>=5000;
*/
/*A6
SELECT
    first_name,
    hire_date
FROM employees
WHERE hire_date > '05/01/01';
*/
/*A6 다른 방법
SELECT
    first_name,
    hire_date
FROM employees
WHERE hire_date > 'To_DATE('2005-01-01', 'YYYY-MM-DD');
*/