/* day1
파일명: ex01-select.sql

SQL (Dtructured Query Language) - 구조적 질의 언너
    관계형 데이터 베이스 시스템에서 자료를 관리하고 처리하기 위해 설계된 언어
    
select 문
    데이터 베이스에서 정보 검색 명령어
   
--모든 열 선택 *
SELECT *
FROM departments;

--특정 열 선택(프로젝션)
SELECT department_id, location_id
FROM departments;
*/

/* day2
산술식(+, -, *, /....)
    산술 연산자를 통해 숫자 / 날짜 등의 데이터 표현식 작성

SELECT 
    LAST_NAME, 
    SALARY, 
    SALARY + 300 --실제 table의 값이 바뀌는 것은 아니다
FROM EMPLOYEEs;
*/
/*
연산자 우선순위
    곱하기와 나누기는 더하기, 빼기보다 먼저 수행

SELECT 
    LAST_NAME, 
    SALARY, 
    12*SALARY + 100
FROM EMPLOYEEs;
*/
/*
산술식의 null값
    null값을 포함하는 산술식은 null로 계산

SELECT 
    LAST_NAME, 
    12*SALARY*COMMISSION_PCT, 
    SALARY, 
    COMMISSION_PCT --null값은 무엇을 연산해도 null이 된다
FROM employees;
*/
/*
열 alias 정의
    열 머리글의 이름을 바꾼다
    열 이름 바로 뒤에 나옴
    (열 이름과 alias 사이에 선택사항인 as 키워드가 올 수 있다)
    공백, 특수문자를 포함하거나 대소문자를 구분하는 경우 " "필요

SELECT 
    last_name as name, --as를 이용하거나
    commission_pct comm, --그냥 별칭을 적는 방법
    salary * 10 as "급여 10배" --공백(띄어쓰기) 포함이므로 ""이용
    --실제 table 열의 이름이 바뀌진 않는다
FROM employees;

SELECT
    last_name "Name"
    salary*12 "Annual Salary"
FROM employees;
*/
/*
연결 연산자
    열이나 문자열을 다른 열에 연결
    두 개의 세로선(||)으로 표시
    문자 표현식을 결과 열로 작성

SELECT
    last_name||job_id as "Employees",
    last_name,
    job_id
FROM employees;
*/
/*
리터럴 문자열
    리터럴은 SELECT 문에 포함된 문자, 숫자 또는 날짜
    날짜 및 문자 리터럴 값은 ' '로 묶음
    각 문자열은 반환되는 각 행에 한꺼번에 출력

SELECT
    last_name || ' is a '|| job_id as "Employyes Details"
FROM employees;
*/
/*
대체 인용(q) 연산자
    자신의 따움표 구분자를 지정(' '안에 '가 또 들어가서 구분이 안되는 경우)
    구분자를 임의로 선택
    가독성 및 사용성 증가

SELECT
    department_name || q'[Department's Member ID: ]' || manager_id
    as "Depaertment and Manager"
    --그냥 쓸 시 'Department's Member ID: '에서 오류 발생
FROM departments;
*/
/*
중복형
    기본적으로 Query 결과에는 중복행 포함 모든 행 표시됨
DISTINCT
    중복행 제거

SELECT DISTINCT
    department_id
FROM employees;
*/
/*
테이블 구조표시
    DESCRIBE(DESC) 명령을 사용해 테이블 구조를 표시

DESCRIBE employees; 
--이름: 열 이름 / not null: 해당 값이null이면 오류가 난다 / 유형: 숫자, 문자...
*/

















