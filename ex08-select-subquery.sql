/*
--SUBQUERY: SELECT 안에 SELECT
SELECT
    last_name,
    salary
FROM employees
WHERE salary>(SELECT salary FROM employees WHERE last_name='Abel');

--SUBQUERY에서 그룹함수 사용
SELECT
    last_name,
    job_id,
    salary
FROM employees
WHERE salary=(SELECT MIN(salary) FROM employees);
*/
/*
여러 행 SUBQUERY
IN: 리스트의 임의 멤버와 같음
ANY
    =, <>, <, >, <=, >= 연산자가 앞에
    <ANY: 최대값보다 작음
    >ANY: 최소값보다 큼
    =ANY: IN
ALL
    >ALL: 최대값보다 큼
    <ALL: 최소값보다 작음
*/
/*
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary<ANY(SELECT salary FROM employees WHERE job_id='IT_PROG')
--MAX와 같다
AND job_id <> 'IT_PROG';

SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary<All(SELECT salary FROM employees WHERE job_id='IT_PROG')
--MIN과 같다
AND job_id <> 'IT_PROG';
*/
/*
--EXISTS 연산자:SUBQUERY에서 최소 1새의 행 반환 시 TRUE
SELECT * FROM departments d
WHERE NOT EXISTS --department_id NOT IN 과 같다
        (SELECT * FROM employees e
        WHERE e.department_id=d.department_id
*/
/*
SUBQUERY의 null값
    반환된 값 중 하나가 null이면 전체 querey 행 반환 않함
    null값을 비교하는 모든 조건은 결과가 null이기 때문에
*/
SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
                                        (SELECT mgr.manager_id
                                        FROM employees mgr);

SELECT * FROM jobs

