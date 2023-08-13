/*
집합 연산자
    여러 table, 집합의 결과를 집합, 조합하는 연산자
    SELECT 리스트의 표현식은 칼럼 개수, 데이터 유형과 일치해야 함
    UNION, UNION ALL, INTERSECT, MINUS
*/
--UNION: 두 개의 결과를 합치고 중복된 행 제거
SELECT
    employee_id,
    job_id
FROM employees
UNION --JOIN과 달리 세로로 연결
SELECT 
    employee_id,
    job_id
FROM job_history;

--UNION ALL: 두 개의 결과를 중복값까지 전부 반환
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

--INTERSECT: 공통 값만 반환
SELECT
    employee_id,
    job_id
FROM employees
INTERSECT
SELECT 
    employee_id,
    job_id
FROM job_history;

--MINUS: 첫번째 쿼리 결과 중 두번째 쿼리에는 존재하지 않는 결과 반환
SELECT
    employee_id,
    job_id
FROM employees
MINUS
SELECT 
    employee_id,
    job_id
FROM job_history;

--JOIN하지 않은 두 table을 가져와 UNION 하기
SELECT
    location_id,
    department_name as "Department",
    TO_CHAR(NULL) "Warehouse location" --state_province 없기 때문에 null로 맞춰주기
FROM departments
UNION
SELECT
    location_id,
    TO_CHAR(NULL) as "Department", --department_name 없기 때문에 null로 맞춰주기
    state_province
FROM locations;

--다른 예시
SELECT
    employee_id,
    job_id,
    salary
FROM employees
MINUS
SELECT 
    employee_id,
    job_id,
    0 --salary 없기 때문에 0으로 맞추기
FROM job_history;
