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
