/*
���� ������
    ���� table, ������ ����� ����, �����ϴ� ������
    SELECT ����Ʈ�� ǥ������ Į�� ����, ������ ������ ��ġ�ؾ� ��
    UNION, UNION ALL, INTERSECT, MINUS
*/
--UNION: �� ���� ����� ��ġ�� �ߺ��� �� ����
SELECT
    employee_id,
    job_id
FROM employees
UNION --JOIN�� �޸� ���η� ����
SELECT 
    employee_id,
    job_id
FROM job_history;

--UNION ALL: �� ���� ����� �ߺ������� ���� ��ȯ
SELECT
    employee_id,
    job_id
FROM employees
UNION ALL
SELECT 
    employee_id,
    job_id
FROM job_history
ORDER BY employee_id;

--INTERSECT: ���� ���� ��ȯ
SELECT
    employee_id,
    job_id
FROM employees
INTERSECT
SELECT 
    employee_id,
    job_id
FROM job_history;

--MINUS: ù��° ���� ��� �� �ι�° �������� �������� �ʴ� ��� ��ȯ
SELECT
    employee_id,
    job_id
FROM employees
MINUS
SELECT 
    employee_id,
    job_id
FROM job_history;

--JOIN���� ���� �� table�� ������ UNION �ϱ�
SELECT
    location_id,
    department_name as "Department",
    TO_CHAR(NULL) "Warehouse location" --state_province ���� ������ null�� �����ֱ�
FROM departments
UNION
SELECT
    location_id,
    TO_CHAR(NULL) as "Department", --department_name ���� ������ null�� �����ֱ�
    state_province
FROM locations;

--�ٸ� ����
SELECT
    employee_id,
    job_id,
    salary
FROM employees
MINUS
SELECT 
    employee_id,
    job_id,
    0 --salary ���� ������ 0���� ���߱�
FROM job_history;
