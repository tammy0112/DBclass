/*
--SUBQUERY: SELECT �ȿ� SELECT
SELECT
    last_name,
    salary
FROM employees
WHERE salary>(SELECT salary FROM employees WHERE last_name='Abel');

--SUBQUERY���� �׷��Լ� ���
SELECT
    last_name,
    job_id,
    salary
FROM employees
WHERE salary=(SELECT MIN(salary) FROM employees);
*/
/*
���� �� SUBQUERY
IN: ����Ʈ�� ���� ����� ����
ANY
    =, <>, <, >, <=, >= �����ڰ� �տ�
    <ANY: �ִ밪���� ����
    >ANY: �ּҰ����� ŭ
    =ANY: IN
ALL
    >ALL: �ִ밪���� ŭ
    <ALL: �ּҰ����� ����
*/
/*
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary<ANY(SELECT salary FROM employees WHERE job_id='IT_PROG')
--MAX�� ����
AND job_id <> 'IT_PROG';

SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary<All(SELECT salary FROM employees WHERE job_id='IT_PROG')
--MIN�� ����
AND job_id <> 'IT_PROG';
*/
/*
--EXISTS ������:SUBQUERY���� �ּ� 1���� �� ��ȯ �� TRUE
SELECT * FROM departments d
WHERE NOT EXISTS --department_id NOT IN �� ����
        (SELECT * FROM employees e
        WHERE e.department_id=d.department_id
*/
/*
SUBQUERY�� null��
    ��ȯ�� �� �� �ϳ��� null�̸� ��ü querey �� ��ȯ ����
    null���� ���ϴ� ��� ������ ����� null�̱� ������
*/
SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
                                        (SELECT mgr.manager_id
                                        FROM employees mgr);

SELECT * FROM jobs

