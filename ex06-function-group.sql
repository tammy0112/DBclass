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
--day4
/*
--NVL 함수로 null 대체 후 AVG() 함수 사용
SELECT AVG(NVL(commission_pct, 0)) as avg_commission
FROM employees

--COUNT(DISTINCT expr)은 중복 값 제거 후 행 개수 반환
SELECT COUNT(DISTINCT department_id) as department_id_count
FROM employees;
*/
/*
GROUP BY
    여러 행을 지정된 칼럼 기준으로 그룹화 해 집계 함수 적용
HAVING
    GROUP BY 와 함께 사용되는 조건절, 구룹화된 대상에 조건 적용 시
    개별행의 조건인 WHERE와 달리 그룹의 조건
*/
/*
--부서별 평균 급여
SELECT
    department_id, --department_id로 그룹화 후
    AVG(salary) as avg_salary --그룹화 한 대상들의 salary를 평균낸다.
FROM employees
GROUP BY department_id;

--GROUP BY 절에서 여러 열을 기준으로 그룹화
SELECT 
    department_id,
    job_id,
    SUM(salary) as total_salary
FROM employees
WHERE department_id>=50
--일단 department_id가 50 이상인 대상들만 남기기
GROUP BY department_id, job_id 
--department_id 기준으로 그룹화하고 department_id가 같으면 job_id 기준으로 다시 그룹화
ORDER BY department_id;
--department_id 기준 정렬

--HAVING 절 사용
--부서별 최대 급여가 10000보다 큰 부서 찾기
SELECT
    department_id,
    MAX(salary) as max_salary
FROM employees
GROUP BY department_id
HAVING MAX(salary)>10000
ORDER BY max_salary
*/
/*
--직무별 총 급여가 13000보다 큰 직무를 찾습니다
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
--그룹함수 중첩
SELECT
    MAX(AVG(salary)) as max_avg_salary
FROM employees
GROUP BY department_id;
*/
















