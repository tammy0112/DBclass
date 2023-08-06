/*
group �Լ�
    AVG(): ���
    MAX(): �ִ밪
    MIN(): �ּҰ�
    SUM(): �հ�
*/
/*
SELECT
    AVG(salary) as avg_salary,
    MAX(salary) as max_salary,
    MIN(salary) as min_salary,
    SUM(salary) as sum_salary
FROM employees
WHERE job_id LIKE '%REP%';
*/
/*
--COUNT(): null�� �ƴ� ��� �� ���� ��ȯ
SELECT
    COUNT(*) as total_employees
FROM employees
WHERE department_id=50;

SELECT
    COUNT(NVL(commission_pct, 0)) as non_null_commission_count
FROM employees
WHERE department_id=50;
*/
--day4
/*
--NVL �Լ��� null ��ü �� AVG() �Լ� ���
SELECT AVG(NVL(commission_pct, 0)) as avg_commission
FROM employees

--COUNT(DISTINCT expr)�� �ߺ� �� ���� �� �� ���� ��ȯ
SELECT COUNT(DISTINCT department_id) as department_id_count
FROM employees;
*/
/*
GROUP BY
    ���� ���� ������ Į�� �������� �׷�ȭ �� ���� �Լ� ����
HAVING
    GROUP BY �� �Բ� ���Ǵ� ������, ����ȭ�� ��� ���� ���� ��
    �������� ������ WHERE�� �޸� �׷��� ����
*/
/*
--�μ��� ��� �޿�
SELECT
    department_id, --department_id�� �׷�ȭ ��
    AVG(salary) as avg_salary --�׷�ȭ �� ������ salary�� ��ճ���.
FROM employees
GROUP BY department_id;

--GROUP BY ������ ���� ���� �������� �׷�ȭ
SELECT 
    department_id,
    job_id,
    SUM(salary) as total_salary
FROM employees
WHERE department_id>=50
--�ϴ� department_id�� 50 �̻��� ���鸸 �����
GROUP BY department_id, job_id 
--department_id �������� �׷�ȭ�ϰ� department_id�� ������ job_id �������� �ٽ� �׷�ȭ
ORDER BY department_id;
--department_id ���� ����

--HAVING �� ���
--�μ��� �ִ� �޿��� 10000���� ū �μ� ã��
SELECT
    department_id,
    MAX(salary) as max_salary
FROM employees
GROUP BY department_id
HAVING MAX(salary)>10000
ORDER BY max_salary
*/
/*
--������ �� �޿��� 13000���� ū ������ ã���ϴ�
SELECT
    job_id,
    SUM(salary) as total_salary
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>13000
ORDER BY total_salary
*/
/*
--�׷��Լ� ��ø
SELECT
    MAX(AVG(salary)) as max_avg_salary
FROM employees
GROUP BY department_id;
*/
















