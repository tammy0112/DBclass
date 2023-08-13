/*Q1.
�� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ*/
--A1.
SELECT
    w.last_name,
    m.last_name
FROM employees w
LEFT OUTER JOIN employees m
ON w.manager_id=m.employee_id
ORDER BY w.last_name;

--AA1.
SELECT
    e.last_name,
    m.last_name
FROM employees e
JOIN employees m
ON e.manager_id=m.employee_id;

/*Q2.
�� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ*/
--A2.
SELECT
    e.last_name,
    d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id=d.department_id
ORDER BY e.last_name;

--AA2.
SELECT
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;

/*Q3.
�� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�*/
--A3.
SELECT
    d.department_name,
    AVG(NVL(e.salary, 0)) as avg_salary
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY department_name
ORDER BY d.department_name;
/*Ǯ�� ����
1. departments���� department_name ��������
2. e.department_id=d.department_id�� e.salary ��������
3. department_name���� �׷�ȭ(id�� �ƴ� name���� �ؾ��Ѵ�)
4. e.salary���� ��� ���ϱ�
*/
--AA3.
SELECT
    d.department_name,
    AVG(e.salary) as avg_salary
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name;

/*Q4.
�� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ*/
--A4.
SELECT
    d.department_name,
    MAX(NVL(e.salary,0)) as max_salary
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY max_salary;

--AA4.
SELECT
    d.department_name,
    MAX(e.salary) as max_salary
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY d.department_name;

/*Q5.
�� ������ ��(last_name)�� �ش� ������ ���� �μ��� �ּ� �޿�(min_salary) ��ȸ*/
--A5.
SELECT
    e.last_name,
    MIN(s.salary) as min_salary
FROM employees e
JOIN employees s
ON s.department_id=e.department_id
GROUP BY e.last_name
ORDER BY min_salary, e.last_name;
--Q. �� GROUP BY�� e.department_id�� �־ ������ ���°�?
--A. �ϴ� self join�� �� ���� ����. 
--�׸��� ����� ����� �������� GROUP BY e.last_name�� �̸��� ���� ����鳢�� �׷�ȭ �� ����� ���� �ٸ���.

SELECT
    last_name,
    MIN(salary) as min_salary
FROM employees
GROUP BY department_id, last_name
ORDER BY min_salary, last_name;
--Q. �� ������ �°� �Ʒ��� Ʋ����?

--AA5.
SELECT
    e.last_name,
    d.min_salary
FROM employees e
JOIN (
    SELECT
        d.department_id,
        MIN(e.salary) as min_salary
    FROM departments d
    JOIN employees e
    ON d.department_id=e.department_id
    GROUP BY d.department_id) d --()�� �ϳ��� table�� �ν�
ON e.department_id=d.department_id
ORDER BY d.min_salary, e.last_name;
    

/*Q6.
�� �μ��� �̸�(department_name)�� �ش� �μ��� ���� ���� �� ���� ���� �޿�(highest_salary) ��ȸ*/
--A6.
SELECT
    d.department_name,
    MAX(e.salary) as max_salary
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY max_salary;

--AA6. AA5����

/*Q7.
�� ������ ��(last_name)�� �ش� ������ �Ŵ����� ��(last_name) �� �μ� �̸�(department_name) ��ȸ*/
--A7.
SELECT
    emp.last_name as worker,
    man.last_name as manager_id,
    d.department_name
FROM employees emp
LEFT OUTER JOIN employees man
ON emp.manager_id=man.employee_id
JOIN departments d
ON emp.department_id=d.department_id
ORDER BY worker;

--AA7.
SELECT
    e.last_name,
    m.last_name,
    d.department_name
FROM employees e
JOIN employees m
ON e.manager_id=m.employee_id
JOIN departments d
ON e.department_id=d.department_id;

/*Q8.
�� ������ ��(last_name)�� �ش� ������ ���� �μ��� �Ŵ����� ��(last_name) ��ȸ*/
--A8.
SELECT
    emp.last_name as worker,
    man.last_name as department_manager
FROM employees emp
LEFT OUTER JOIN departments d
ON emp.department_id=d.department_id
JOIN employees man
ON d.manager_id=man.employee_id
ORDER BY worker;

--AA8. ���� �̻��ϴ�. 184�� m.manager_id > m.employee_id �ٲ���
SELECT
    e.last_name as w_lastname,
    m.last_name as m_lastname
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
JOIN employees m
ON d.manager_id=m.manager_id;

/*Q9.
�� ������ ��(last_name)�� �ش� ������ ���� ��簡 �ִ� ��� ���� ����� ��(last_name) ��ȸ*/
--A9.
SELECT
    emp.last_name as worker,
    NVL2(emp.manager_id, man.last_name, 'none') as manager
FROM employees emp
LEFT OUTER JOIN employees man
ON emp.manager_id=man.employee_id
ORDER BY worker;

--AA9. AA8 ����

/*Q10.
������ �߿��� �޿�(salary)�� 10000 �̻��� �������� ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ*/
--A10.
SELECT
    e.last_name,
    e.salary,
    d.department_name
FROM employees e
LEFT OUTER  JOIN departments d
ON e.department_id=d.department_id
WHERE e.salary>=10000
ORDER BY e.last_name;

--AA10.
SELECT
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE e.salary>=10000;

/*Q11.
1) �� �μ��� �̸�(department_name), �ش� �μ��� �Ŵ����� ID(manager_id)�� �Ŵ����� ��(last_name),
    ������ ID(employee_id), ������ ��(last_name), �׸��� �ش� ������ �޿�(salary) ��ȸ
2) �������� �޿�(salary)�� �ش� �μ��� ��� �޿����� ���� �������� ��ȸ
3) ����� �μ� �̸��� ������ �޿��� ���� ������ ����*/
--A11. ����!
SELECT
    d.department_name,
    d.manager_id,
    man.last_name,
    emp.employee_id,
    emp.last_name,
    emp.salary
FROM departments d
JOIN employees man
ON d.manager_id=man.employee_id
JOIN(
    SELECT
        e.employee_id,
        e.last_name,
        e.salary,
        dd.department_name
    FROM employees e
    LEFT OUTER JOIN departments dd
    ON e.department_id=dd.department_id) emp
ON emp.department_name=d.department_name
JOIN (
    SELECT
        d.department_name,
        AVG(e.salary)
    FROM departments d
    JOIN employees e
    ON d.department_id=e.department_id
    GROUP BY d.department_name) aa
ON aa.department_name=emp.department_name
WHERE emp.salary>=aa.salary
ORDER BY d.department_name, emp.salary;

--AA11.
SELECT
    d.department_name,
    d.manager_id,
    m.last_name,
    e.employee_id,
    e.last_name,
    e.salary
FROM departments d
JOIN employees m
ON d.manager_id=m.employee_id
JOIN employees e
ON d.department_id=e.department_id
WHERE e.salary>(
                --�� �μ��� ��� �޿�
                SELECT
                    AVG(ee.salary)
                FROM employees ee
                WHERE ee.department_id=d.department_id)
ORDER BY d.department_name, e.salary;
