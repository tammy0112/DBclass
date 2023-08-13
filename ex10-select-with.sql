/*
WITH
    : �������� ��� �ӽ� ����(CTE: Common Table Expression) �� ���
      �ַ� ������ ������ �����ϰ� ǥ���ϰų� �������� ���� �� ���
*/
--�μ��� ��� �޿� ���
WITH AvgSalByDept as (
    SELECT
        department_id,
        AVG(salary) as avg_salary
    FROM employees
    GROUP BY department_id) --�μ��� ��� �޿��� CTE�� �����α�
SELECT
    d.department_name,
    AvgSalByDept.avg_salary
FROM departments d
JOIN AvgSalByDept
ON d.department_id=AvgSalByDept.department_id;
--JOIN()���� ���� �������� �Ͱ� ���� ������� �ش� table�� ������ ����ؾ� �� ��� ���ϴ�

WITH RecrusiveCTE(id, name, manager_id, depth) as (
    SELECT
        employee_id,
        last_name,
        manager_id,
        0
        --employee_id�� id, last_name�� name...���� ����
    FROM employees
    WHERE manager_id is NULL --��� King
    --RecrusiveCTE table�� 100 / king / 100 / 0�� ����
    UNION ALL
    SELECT
        e.employee_id,
        e.last_name,
        e.manager_id,
        rc.depth+1
    FROM employees e
    INNER JOIN RecrusiveCTE rc
    ON e.manager_id=rc.id)
    --manager_id�� 100�� �����, 101�� ������� ��� Ž����
    --100, 101...�� manager_id�� �Ѿ �� ���� depth�� 1�� ����
SELECT
    id,
    name,
    manager_id,
    depth
FROM RecrusiveCTE;














