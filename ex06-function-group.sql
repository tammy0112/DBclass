/*
group 함수
    AVG(): 평균
    MAX(): 최대값
    MIN(): 최소값
    SUM(): 합계
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
--COUNT(): null이 아닌 모든 행 갯수 반환
SELECT
    COUNT(*) as total_employees
FROM employees
WHERE department_id=50;

SELECT
    COUNT(NVL(commission_pct, 0)) as non_null_commission_count
FROM employees
WHERE department_id=50;
*/
