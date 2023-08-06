/*
JOIN
    SQL���� �� �� �̻��� table���� ���õ� ����� ����
NATURAL JOIN
    �� table���� ������ ����/�̸��� ��ġ�ϴ� ���� �������
    �ڵ����� table join ����
*/
/*
SELECT
    department_id,
    department_name,
    location_id,
    city --location table���� �����Դ�
FROM departments
NATURAL JOIN locations;
*/
/*
--USING(): ������ �ϰ��� �ϴ� �� ��Ȯ�� ���
SELECT
    employee_id,
    last_name,
    location_id,
    department_id
FROM employees 
JOIN departments USING (department_id)
--departments table���� department_id�� ������ join
*/
/*
--ON: join ���� ����
SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.location_id
FROM employees e JOIN departments d
--table employees�� ��Ī e, table departments�� ��Ī d
ON e.department_id = d.department_id;
--table employees�� department_id��
--table departments�� deparment_id�� ���� ���鸸 ��������
*/
/*
--ON �� ����� 3-way ����
SELECT
    e.employee_id,
    e.last_name,
    d.department_name,
    l.city
FROM employees e 
JOIN departments d
ON e.department_id=d.department_id
JOIN locations l
ON d.location_id=l.location_id
ORDER BY l.city
*/
/*
--oracle������ �̷��� �ص� �����ϴ�
SELECT e.employee_id, e.last_name, d.department_id
FROM employees e, departments d
WHERE e.department_id=d.department_id;
*/
/*
--JOIN�� �߰� ���� ����
SELECT 
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.location_id
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
AND e.manager_id=149;
--e.employee_id=d.department_id�̰� e.manager_id=149��
--e.employee_id, e.last_name.... ��������
--AND ��� WHERE�� �ᵵ ����
*/
/*
--ON�� ����ϴ� SELF JOIN
SELECT
    worker.last_name as emp,
    manager.last_name as mgr
FROM employees worker
JOIN employees manager
ON worker.manager_id=manager.employee_id
--ex. ���� A, B, C / A ��� �Ŵ��� B / B�� ���� �Ŵ��� C
--emp: A - mgr: B / emp:B - mgr: C
*/
/*
Nonequijoin
    ��ȣ ������ ���� �ٸ� �����ڸ� �����ϴ� join ����
*/
/*
CREATE TABLE job_grades (
grade_level CHAR(1),
lowest_sal NUMBER(8, 2) NOT NULL,
highest_sal NUMBER(8, 2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTANT jobgrades_grade_pk PRIMARY KEY (grade_level);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

SELECT * FROM job_grades
*/
/*
SELECT 
    e.last_name, 
    e.salary, 
    j.grade_level
FROM employees e
JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;
*/
--INNER JOIN�� OUTER JOIN
--INNER JOIN: ��ġ���� �ʴ� ���� ������� ����(������)
--OUTER JOIN: �� ���̺��� ���� ������� �ٸ� ���̺��� ������ ���� ����� �����Ͽ� ��ȯ
/*
--LEFT OUTER JOIN
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
LEFT OUTER JOIN departments d
--JOIN�� �������� ���� table(employees)�� ���� �ϴ� �� ���
ON e.department_id=d.department_id;
--�׸��� ON ������ �����ϴ� d.department_name ���
--departments table�� �����Ǵ� ���� ��� employees �� �� ���

SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;
--�̷��� �� �� department_id�� null�� ����� ��µ��� ����

SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id(+);
--�̷��Ե� ������ �ϴ�

--RIGHT OUTER JOIN
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
--JOIN�� �������� ������ table(departments)�� ���� �ϴ� �� ���
ON e.department_id=d.department_id;
--�׸��� ON ������ �����ϴ� e.last_name, e.department_id ���
--employees table�� �����Ǵ� ���� ��� departments �� �� ���

--FULL OUTER JOIN: �����Ǵ� �� ��� ��� �� ���
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id=d.department_id;
*/
--Cartesian Product: JOIN ������ �߸��ǰų� ������ ��� ����� ��� ���� ���� ǥ��
--CROSS JOIN: �� table�� ���� �� ����
SELECT
    last_name,
    department_name
FROM employees
CROSS JOIN departments; --����� �� ��� ���






