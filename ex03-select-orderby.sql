/*
ORDER BY 절
    ORDER BY 절을 사용하여 검색된 행을 정렬
        ASC: 오름차순, 기본값
        DESC: 내림차순
    SELECT 문의 맨 마지막에 사용

SELECT
    last_name,
    job_id,
    department_id,
    hire_date
FROM employees
ORDER BY hire_date;

--내림차순 정렬
SELECT
    last_name,
    job_id,
    department_id,
    hire_date
FROM employees
ORDER BY hire_date DESC;

--열 alias 기준 정렬
SELECT
    employee_id,
    last_name,
    salary*12 as annsal
FROM employees
ORDER BY annsal;

--열 숫자 위치를 사용한 정렬
SELECT
    last_name,
    job_id,
    department_id,
    hire_date
FROM employees
ORDER BY 3; --1:last_name, 2:job_id, 3:department_id, 4:hire_date

--여러 열 기준 정렬
SELECT
    last_name,
    job_id,
    department_id,
    salary
FROM employees
ORDER BY department_id, salary DESC 
--department_id 기준 정렬, department_id가 같다면 같은 것 끼리 salary 기준 정렬
*/
/*
<SELECT문 기본 구조>
SELECT (DISTINCT) 칼럼1, 칼럼2, .... .5
FROM table명 .1
WHERE 조건절 .2
GROUP BY 칼럼명.3
HAVING 조건절 .4
ORDER BY 칼럼명 (ASC 또는 DESC) .6
*/

















