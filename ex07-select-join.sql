/*
JOIN
    SQL에서 두 개 이상의 table에서 관련된 행들을 결합
NATURAL JOIN
    두 table에서 데이터 유형/이름이 일치하는 열을 기반으로
    자동으로 table join 가능
*/
/*
SELECT
    department_id,
    department_name,
    location_id,
    city --location table에서 가져왔다
FROM departments
NATURAL JOIN locations;
*/
/*
--USING(): 결합을 하고자 하는 열 정확히 명시
SELECT
    employee_id,
    last_name,
    location_id,
    department_id
FROM employees 
JOIN departments USING (department_id)
--departments table에서 department_id만 가져와 join
*/
/*
--ON: join 결합 지정
SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.location_id
FROM employees e JOIN departments d
--table employees의 별칭 e, table departments의 별칭 d
ON e.department_id = d.department_id;
--table employees의 department_id와
--table departments의 deparment_id가 같은 대상들만 가져오기
*/
/*
--ON 절 사용해 3-way 결합
SELECT
    e.employee_id,
    e.last_name,
    d.department_name,
    l.city
FROM employees e 
JOIN departments d
ON e.department_id=d.department_id
JOIN locations l
ON d.location_id=l.location_id
ORDER BY l.city
*/
/*
--oracle에서는 이렇게 해도 가능하다
SELECT e.employee_id, e.last_name, d.department_id
FROM employees e, departments d
WHERE e.department_id=d.department_id;
*/
/*
--JOIN에 추가 조건 적용
SELECT 
    e.employee_id,
    e.last_name,
    e.department_id,
    d.department_id,
    d.location_id
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
AND e.manager_id=149;
--e.employee_id=d.department_id이고 e.manager_id=149인
--e.employee_id, e.last_name.... 가져오기
--AND 대신 WHERE을 써도 같다
*/
/*
--ON을 사용하는 SELF JOIN
SELECT
    worker.last_name as emp,
    manager.last_name as mgr
FROM employees worker
JOIN employees manager
ON worker.manager_id=manager.employee_id
--ex. 직원 A, B, C / A 담당 매니저 B / B의 담장 매니저 C
--emp: A - mgr: B / emp:B - mgr: C
*/
/*
Nonequijoin
    등호 연산자 외의 다른 연상자를 포함하는 join 조건
*/
/*
CREATE TABLE job_grades (
grade_level CHAR(1),
lowest_sal NUMBER(8, 2) NOT NULL,
highest_sal NUMBER(8, 2) NOT NULL
);

ALTER TABLE job_grades
ADD CONSTANT jobgrades_grade_pk PRIMARY KEY (grade_level);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

SELECT * FROM job_grades
*/
/*
SELECT 
    e.last_name, 
    e.salary, 
    j.grade_level
FROM employees e
JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;
*/
--INNER JOIN과 OUTER JOIN
--INNER JOIN: 일치하지 않는 행은 출력하지 않음(교집합)
--OUTER JOIN: 한 테이블의 행을 기반으로 다른 테이블의 연결이 없는 행까지 포함하여 반환
/*
--LEFT OUTER JOIN
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
LEFT OUTER JOIN departments d
--JOIN을 기준으로 왼쪽 table(employees)의 행을 일단 다 출력
ON e.department_id=d.department_id;
--그리고 ON 조건을 만족하는 d.department_name 출력
--departments table에 대응되는 행이 없어도 employees 행 다 출력

SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;
--이렇게 할 시 department_id가 null인 사원은 출력되지 않음

SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id(+);
--이렇게도 가능은 하다

--RIGHT OUTER JOIN
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
--JOIN을 기준으로 오른쪽 table(departments)의 행을 일단 다 출력
ON e.department_id=d.department_id;
--그리고 ON 조건을 만족하는 e.last_name, e.department_id 출력
--employees table에 대응되는 행이 없어도 departments 행 다 출력

--FULL OUTER JOIN: 대응되는 행 없어도 모든 행 출력
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id=d.department_id;
*/
--Cartesian Product: JOIN 조건이 잘못되거나 생략된 경우 결과가 모든 행의 조합 표시
--CROSS JOIN: 두 table의 교차 곱 생성
SELECT
    last_name,
    department_name
FROM employees
CROSS JOIN departments; --경우의 수 모두 출력






