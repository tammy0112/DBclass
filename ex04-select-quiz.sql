/*
Q1. 'employees' table���� last_name, first_name, salary ��ȸ�ϱ�

Q2. 'jobs' table���� 'job_id'�� 'job_title' ��ȸ�ϱ�

Q3. 'departments' table���� 'department_id'�� 'department_name' ��ȸ�ϱ�

Q4. 'locations' table���� location_id�� city ��ȸ�ϱ�

Q5. 'employees' table����  salary�� 5000 �̻��� �������� first_name, salary ��ȸ�ϱ�

Q6. 'employees' table���� �ٹ� �������� 2005�� ������ �������� first_name�� hire_date�� ��ȸ�ϱ�
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
/*A6 �ٸ� ���
SELECT
    first_name,
    hire_date
FROM employees
WHERE hire_date > 'To_DATE('2005-01-01', 'YYYY-MM-DD');
*/