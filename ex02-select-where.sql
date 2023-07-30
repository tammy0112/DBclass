/*
선택을 사용하여 행 제한
    WHERE절을 이용하여 반환되는 행을 제한

WHERE
    조건을 충족하는 행으로 query를 제한(필터)
    
    3가지 요소
    1. 열 이름
    2. 비교 조건
    3. 열 이름, 상수 또는 값 리스트
    

SELECT
    employee_id,
    last_name,
    job_id,
    department_id
FROM employees
WHERE department_id=90; --부서번호가 90인 사원들만 조회
--열 이름: department_id / 비교 조건: = / 열 이름, 상수 또는 값 리스트: 90
*/
/*
문자열 밑 날짜
    문자열 밑 날짜 값은 ' ' 로 묶는다
    문자는 대소문자 구분, 날짜는 형식을 구분(도구-환경설정-데이터베이스-NLS에서 확인 가능)

SELECT
    last_name, 
    job_id,
    department_id
FROM employees
WHERE last_name = 'Whalen';

SELECT
    last_name, 
    hire_date
FROM employees
WHERE hire_date = '03/06/17';
*/
--도구-환경설정-데이터베이스-워크시트-체커판 격자 체크
/*
비교 연산자
    특정 표현식을 다른 값, 표현식과 비교할 때 사용
    =, >, >=, <, <=
    <> 같지 않음
    BETWEEN...AND... ...이상 ...이하
    IN(set) 값 리스트 중 일치하는 값 검색
    LIKE 일치하는 문자 패턴 검색
    IS NULL null값 여부 판단
    
--비교
SELECT
    last_name,
    salary
FROM employees
WHERE salary<=3000;

--BETWEEN 연산
SELECT
    last_name,
    salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500; --2500, 3500도 포함
--WHERE salary>=2500 AND salary<=3500; 으로도 가능

--IN 연산
SELECT
    employee_id,
    last_name,
    salary,
    manager_id
FROM employees
WHERE manager_id IN (100, 101, 201); --매니저 번호가 가 100, 101, 201인 사원 모두 출력
--WHERE manager_id=100 OR manager_id=102 OR manager_id=201; 로도 가능
*/
/*LIKE 연산
    LIKE 연산자를 사용하여 유효한 검색 문자열 값의 대체 문자 검색 수행
    검색 조건에는 이터럴 문자나 숫자가 포함될 수 있다
        %: 0개 이상의 문자 나타냄
        _: 한 문자 나타냄

SELECT first_name
FROM employees
WHERE first_name LIKE 'A%'; --first_name이 A~인 사원 출력

SELECT first_name
FROM employees
WHERE first_name LIKE '%a%'; --first_name이 ~a~인 사원 출력

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%'; --first_name의 두번째 글자가 o인 사원 출력

--ESCAPE 식별자
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA\_%' ESCAPE '\'; 
--_를 문자로써 조회하고 싶다면 ESCAPE를 통해 정해진 특수 역할을 없앤다
--즉 %SA\_%는 ~SA(한 글자)~가 아닌 ~SA_~로 인식된다
*/
/*
NULL 조건
    IS NULL로 null을 테스트

SELECT
    last_name,
    manager_id
FROM employees
WHERE manager_id is NULL --매니저 아이디 칸이 빈 칸인 대상 출력
*/
/*
논리 연산자를 사용한 조건 정의
    AND: 구성요소 모두 참일 시 TRUE 반환
    OR: 구성요소 중 하나가 참일 시 TRUE 반환
    NOT: 조건이 거짓일 경우 TRUE 반환

--AND 연산자
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary>=10000
AND job_id LIKE '%MAN%'

--OR 연산자
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary>=10000
OR job_id LIKE '%MAN%'
*/
--NOT 연산자
SELECT
    last_name,
    job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');











