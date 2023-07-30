/*
ORDER BY ��
    ORDER BY ���� ����Ͽ� �˻��� ���� ����
        ASC: ��������, �⺻��
        DESC: ��������
    SELECT ���� �� �������� ���

SELECT
    last_name,
    job_id,
    department_id,
    hire_date
FROM employees
ORDER BY hire_date;

--�������� ����
SELECT
    last_name,
    job_id,
    department_id,
    hire_date
FROM employees
ORDER BY hire_date DESC;

--�� alias ���� ����
SELECT
    employee_id,
    last_name,
    salary*12 as annsal
FROM employees
ORDER BY annsal;

--�� ���� ��ġ�� ����� ����
SELECT
    last_name,
    job_id,
    department_id,
    hire_date
FROM employees
ORDER BY 3; --1:last_name, 2:job_id, 3:department_id, 4:hire_date

--���� �� ���� ����
SELECT
    last_name,
    job_id,
    department_id,
    salary
FROM employees
ORDER BY department_id, salary DESC 
--department_id ���� ����, department_id�� ���ٸ� ���� �� ���� salary ���� ����
*/
/*
<SELECT�� �⺻ ����>
SELECT (DISTINCT) Į��1, Į��2, .... .5
FROM table�� .1
WHERE ������ .2
GROUP BY Į����.3
HAVING ������ .4
ORDER BY Į���� (ASC �Ǵ� DESC) .6
*/

















