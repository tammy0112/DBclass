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










