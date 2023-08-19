/*
데이터베이스 객체
    table: 행과 열로 구성된 저장 공간
    view: 하나 이상의 table에 있는 데이터의 부분집합을 논리적으로 나타냄(가상 table)
    sequence: 일련의 숫자를 자동으로 생성
    index: table의 데이터에 대한 빠른 검색을 지원하는 색인 객체
    동의어: 객체에 다른 이름 부여
*/
--view 생성
CREATE VIEW empvu80
AS SELECT
        employee_id,
        last_name,
        salary
    FROM employees
    WHERE department_id=80;
SELECT * FROM empvu80;
--empvu80을 하나의 table처럼 사용 가능
--실제 table 생성과는 달리 query 자체를 기억하고 있는 것

--alias를 사용한 view 생성
CREATE VIEW salvu50
AS SELECT
        employee_id as ID_NUMBER,
        last_name as name,
        salary*12 as ann_salary
    FROM employees
    WHERE department_id=50;
SELECT * FROM salvu50
WHERE ann_salary>=50000;

--view 수정
CREATE OR REPLACE VIEW empvu80 --없으면 생성, 있으면 수정
    (id_number, name, sal, department_id) --칼럼 수정, 생성
    AS SELECT employee_id, first_name || ' ' || last_name, 
                    salary, department_id
    FROM employees
    WHERE department_id=80;
SELECT * FROM empvu80;

UPDATE empvu80 SET
department_id=90
WHERE id_number=145;
SELECT * FROM empvu80;
--view에서 수정한 값은 실제 table(employees)의 값이 수정됨
--따라서 empvu80의 WHERE department_id=80; 조건에 따라 empvu80 1개 항 사라짐
ROLLBACK;

--복합 view 생성: 2개 이상의 table에 의해 정의된 view
CREATE OR REPLACE VIEW dept_sum_vu
    (name, minsla, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary),
                MAX(e.salary), AVG(e.salary)
    FROM employees e
    JOIN departments d
    ON e.department_id=d.department_id
    GROUP BY d.department_name;
SELECT * FROM dept_sum_vu;

/*
view DML작업 규칙
    1. 행 제거 불가한 경우
        - 그룹 함수 존재 시
        - GROUP BY 절
        - DISTINCT 키워드
        - PSEUDOCOLUMN ROWNUM 키워드
        
    2. 데이터 수정 불가한 경우
        - 그룹 함수
        - GROUP BY 절
        - DISTINCT 키워드
        - PSEUDOCOLUMN ROWNUM 키워드
        - 표현식으로 정의되는 열
        
    3. 데이터 추가 불가한 경우
        - 그룹 함수
        - GROUP BY 절
        - DISTINCT 키워드
        - PSEUDOCOLUMN ROWNUM 키워드
        - 표현식으로 정의되는 열
        - view에서 선택되지 않은 기본 table의 NOT NULL열
*/
--ROWNUM: 쿼리 결과의 각 행에 순차적 번호 할당
SELECT
    ROWNUM,
    employee_id,
    last_name
FROM employees
WHERE department_id=80;

--DML 작업 거부
CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT
        employee_id,
        last_name,
        job_id
    FROM employees
    WHERE employees.department_id=10
    WITH READ ONLY;
SELECT * FROM empvu10;

UPDATE empvu10 SET
    employee_name='Whalenl'
WHERE empvu10.employee_number=200;
--WITH READ ONLY를 통해 읽기 전용 view로 고정

--WITH CHECK OPTION: view에 대한 데이터 변경 제한
CREATE OR REPLACE VIEW high_salary_employee_vu
AS SELECT * FROM employees
    WHERE salary>10000
    WITH CHECK OPTION CONSTRAINT high_salary_employee_ck;
SELECT * FROM high_salary_employee_vu;

UPDATE high_salary_employee_vu SET
salary=2400
WHERE employee_id=100;
--WITH CHECK OPTION로 인해 UPDATE 수정 불가

UPDATE high_salary_employee_vu SET
salary=26000
WHERE employee_id=100;
--WITH CHECK OPTION 조건에 위배되지 않아 수정 가능

--view 제거
DROP VIEW high_salary_employee_vu CASCADE CONSTRAINTS;
--CASCADE CONSTRAINTS통해 제약 조건도 함께 삭제

/*
sequence
    연속적 숫자 값을 자동으로 증감시켜 반환
    채번 시 주로 사용
*/
CREATE SEQUENCE my_seq
    INCREMENT BY 1 --증가 값
    START WITH 1 --시작 값
    MINVALUE 1 --최소 값
    MAXVALUE 999 --최대 값
    NOCYCLE --반복x, CYCLE이라면 최대값 도달 시 최소값부터 다시 시작
    CACHE 20 --미리 번호를 메모리에 생성
    ORDER; --요청 순서대로 값 생성
SELECT my_seq.NEXTVAL FROM dual;
--실행할 때마다 1씩 증가

--현재 sequence값 확인
SELECT my_seq.CURRVAL FROM dual;

--sequence 삭제
DROP SEQUENCE my_seq;

--sequence 활용 방법
CREATE TABLE dept3 AS
SELECT * FROM dept5
WHERE 1=2;

INSERT INTO dept3 VALUES(my_seq.nextval, 'A');
INSERT INTO dept3 VALUES(my_seq.nextval, 'B');
INSERT INTO dept3 VALUES(my_seq.nextval, 'C');

SELECT * FROM dept3;
--DENO 칼럼의 값 1씩 증가

/*
INDEX
    데이터를 빠르게 검색하기 위해 특정 열을 정렬해 저장
    데이터 조회 성능 향상에 사용
    
    PK: table 생성 시 자동으로 index 생성됨
*/
SELECT 
    last_name,
    ROWID --컴퓨터 내에 저장된 id 위치 값
FROM employees
ORDER BY last_name;

--employees table의 last_name 열에 대한 index 생성
CREATE INDEX emp_last_name_idx
    ON employees(last_name);
    
--index 제거
DROP INDEX emp_last_name_idx;

/*
동의어(SYNONYM)
    동의어를 생성해 객체에 다를 이름 부여 가능
*/
CREATE SYNONYM d_sum
FOR dept_sum_vu;
SELECT * FROM dept_sum_vu;
SELECT * FROM d_sum;
--동일한 결과

--동의어 제거
DROP SYNONYM d_sum;

/*
ROWID: ROW 고유 Id
            데이터베이스 내부 행의 물리적 위치 전달
ROWNUM: 쿼리 결과에 순차적 번호 배부
*/
SELECT
    ROWNUM,
    ROWID,
    employee_id,
    last_name,
    salary
FROM employees;





