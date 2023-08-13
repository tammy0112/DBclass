/*
DML(Data Manipulation Language)
    DB에서 데이터를 처리하고 조작하는 SQL
    DQL(Data Query Language, SELECT문 등)과 조금 다름
    
INSERT: table에 새로운 레코드 삽입
UPDATE: table 기존 레코드 갱신
DELETE: table 특정 레코드 삭제
UPDATE: 기존 값 수정
TRUNCATE: table을 빈 상태로 남겨둔 채 모든 레코드 제거
                 DML이 아닌 DDL이기 때문에 쉽게 undo 불가능
*/
/*
TRANSACTION
    데이터 처리 단위
    여러개의 SQL 명령문을 하나의 작업으로 처리하는 과정

COMMIT: DQL 결과 영구 적용
ROLLBACK: DML 결과 취소, COMMIT하기 전의 결과까지 취소 가능
SAVEPOINY: 임시 저장점
*/
/*
INSERT
    방법1
    INSERT INTO (칼럼1, 칼럼2, ...)
    VALUES(값1, 값2, ...);
    
    방법2
    INSERT INTO table명(칼럼1, 칼럼2, ...) subquery;
*/
/*
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations', 100, 1700);
SELECT * FROM departments;
--여기까지는 현재 sql의 table에 적용
--다른 sql을 만들어도 쓸려면 COMMIT으로 확정해줘야 한다

--NULL 값을 가진 행 삽입, 열 생략 가능
INSERT INTO departments(department_id, department_name)
VALUES (290, 'Purchasing');
SELECT * FROM departments;
--생략한 값이 NULL로 저장
*/
/*
ROLLBACK;
SELECT * FROM departments;
*/
/*
INSERT INTO departments
VALUES (280, 'Public Relations', 100, null);
SELECT * FROM departments;
*/
/*
CREATE TABLE sales_reps
AS (SELECT 
        employee_id as id,
        last_name as name,
        salary,
        commission_pct
    FROM employees
    WHERE 1=2 --전부 거짓, 아무것도 조회되지 않는다, 칼럼 이름들만 조회
    );
    SELECT * FROM sales_reps;
*/
/*
INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT
    employee_id,
    last_name,
    salary,
    commission_pct
FROM employees
WHERE job_id LIKE '%REP%';
SELECT * FROM sales_reps;
*/
/*
UPDATE
    UPDATE table
    SET 칼럼1=수정값, 칼럼2=수정값
    WHERE 조건절
*/
/*
CREATE TABLE copy_emp
AS SELECT * FROM employees
WHERE 1=2; --employees table의 칼럼만 가져와 생성

INSERT INTO copy_emp
SELECT * FROM employees;
COMMIT;

SELECT * FROM copy_emp;
*/
/*
--부서번호 50번으로 변경
UPDATE copy_emp
SET department_id=50
WHERE employee_id=113;
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
UPDATE copy_emp
SET department_id=110;
--조건을 붙이지 않아 전부 변경
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
UPDATE copy_emp
SET department_id=(SELECT department_id 
                            FROM employees 
                            WHERE employee_id=100)
--department_id를 empoyee_id가 100인 사원과 동일하게 변경
WHERE job_id=(SELECT job_id 
                    FROM employees 
                    WHERE employee_id=200);
--employee_id가 200인 사원과 같은 job_id를 가진 사원들 대상
*/
/*
DELETE
    DELETE FROM table
    WHERE
*/
/*
--사원 해고
DELETE FROM copy_emp
WHERE employee_id=200;
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
DELETE FROM copy_emp;
--조건을 붙이지 않아 전부 삭제
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
TRUNCATE TABLE copy_emp;
SELECT * FROM copy_emp;
ROLLBACK;
--ROLLBACK을 해도 복구가 안됨
*/
/*
CREATE TABLE member(
    num NUMBER PRIMARY KEY,
    name VARCHAR(30), --30단어까지 저장 가능한 문자열행
    addr VARCHAR2(50));
INSERT INTO member VALUES(1, '피카츄', '태초마을');
INSERT INTO member VALUES(2, '라이츄', '태초마을');
INSERT INTO member VALUES(3, '파이리', '태초마을');
INSERT INTO member VALUES(4, '꼬부기', '태초마을');
INSERT INTO member VALUES(5, '버터풀', '태초마을');
SELECT * FROM member;

INSERT INTO member VALUES(6, '야도란', '태초마을');
INSERT INTO member VALUES(7, '따라츄', '태초마을');
SELECT * FROM member;
SAVEPOINT seven;
INSERT INTO member VALUES(8, '지우', '태초마을');
ROLLBACK TO seven;
--seven까지의 상태로 복구
SELECT * FROM member;
*/
/*
--SELECT의 FOR UPDATE: 특정 레코드를 잠금 처리 / commit, rollback으로 잠금해제
SELECT
    employee_id,
    salary,
    job_id
FROM employees
WHERE job_id='SA_REP'
FOR UPDATE; --다른 사용자들이 해당 정보를 수정할 수 없음
*/
