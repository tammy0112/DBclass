/*
함수(Function)
    매개변수를 받아 특정 작업을 수행하고 결과 반환 
    
함수 유형
    단일행 함수: 단일행 매개변수를 입력받아 결과 출력
    여러형(그룹) 함수:여러행 매개변수를 입력받아 결과 출력
*/
--단일행 함수들
/*
--대소문자 함수
-- LOWER(): 문자열을 소문자로 변환
SELECT
    employee_id,
    last_name,
    department_id
FROM employees
WHERE LOWER(last_name)='higgins' --last_name의 이름들을 소문자로 읽어옴
*/
/*
--UPPER(): 문자열을 대문자로 반환
SELECT UPPER('higgins') FROM dual;
*/
/*
--INITCAP(): 문자열의 첫 글자를 대문자로 반환
SELECT
    employee_id,
    last_name,
    department_id
FROM employees
WHERE last_name=INITCAP('higgins');
*/
/*
--문자 조작 함수
--CONCAT(): 두 개의 파라미터 값 연결
SELECT 'HELLO' || 'WORLD' FROM dual;
SELECT CONCAT('Hello', 'World') FROM dual;
*/
/*
--SUBSTR(): 지정된 길이의 문자열 추출
SELECT SUBSTR('HelloWorld', 1, 5) FROM dual;
*/
/*
--LENGTH(): 문자열의 길이 반환
SELECT LENGTH('HelloWorld') FROM dual;
*/
/*
--INSTR(): 문자열에서 지정된 문자의 위치 반환
SELECT INSTR('HelloWorld', 'W') FROM dual;
*/
/*
--LPAD(): 왼쪽부터 문자식으로 채운 표현식 반환
SELECT LPAD('salary', 10, '*') FROM dual;
--10칸 생성, 빈칸은 *로 채우며 salary 출력 
*/
/*
--RPAD(): 오른쪽부터 문자식으로 채운 표현식 반환
SELECT RPAD('salary', 10, '*') FROM dual;
*/
/*
--REPLACE(): 문자열에서 지정된 문자 치환
SELECT REPLACE('Jack and Jue', 'J', 'Bl') FROM dual;
*/
/*
--TRIM(): 문자열에서 선행 또는 후행 문자를 자름
SELECT TRIM('H' FROM 'HelloWorldH') FROM dual;
SELECT TRIM(' ' FROM ' Hello World ') FROM dual;
*/
/*
--숫자함수
--ROUND(): 지정된 소숫점 자릿수 반올림
SELECT ROUND(45.936, 2) FROM dual;

--TRUNC(): 지정된 소수점 자릿수 값 전달
SELECT TRUNC(45.936, 2) FROM dual;

--MOD(): 나눈 나머지 반환
SELECT MOD(1600, 300) FROM dual;
*/
/*
--CEIL(): 주어진 수를 올림하여 정수로 반환
SELECT CEIL(45.422) FROM dual;
*/
/*
--날짜함수
--SYSDATE: 현재 날짜와 시간을 얻을 수 있는 pseudo-column
SELECT SYSDATE FROM dual;
*/
/*
날짜 연산
    날짜에 수를 더하거나 빼서 결과 날짜값을 계산
    두 날짜 사이의 일수를 알아내기 위해 뺏셈
*/
/*
SELECT last_name, (sysdate-hire_date)/7 as weeks
FROM employees
WHERE department_id=90;
*/
/*
날짜 조작 함수
    MONTHS_BETWEEN(date1, date2): 두 날짜 간 월 수 계산
    ADD_MONTHS(date, n): 날짜에 n개월 추가
    NEXT_DAY(date, day_of_week): 지정된 날짜의 다음으로 주어진 요일이 나오는 날짜 계산
        (1: 일 ~ 7: 토요일)
    LAST_DAY(date): 주어진 월의 마지막 날짜를 반환
    ROUND(date, format): 날짜를 지정된 형식으로 반올림
    TRUNC(date, format): 날짜를 지정된 형식으로 절삭
*/
/*
---MONTHS_BETWEEN
SELECT MONTHS_BETWEEN(TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-01-12', 'YYYY-MM-DD'))
FROM dual;
---ADD_MONTHS
SELECT ADD_MONTHS(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 5)
FROM dual;
--NEXT_DAY
SELECT NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 3) --화요일
FROM dual;
--LAST_DAY
SELECT LAST_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'))
FROM dual;
--ROUND
SELECT ROUND(TO_DATE('2023-08-18', 'YYYY-MM-DD'), 'month')
FROM dual;
--TRUNC
SELECT TRUNC(TO_DATE('2023-08-18', 'YYYY-MM-DD'), 'day')
FROM dual;
*/
/*
변환 함수
    TO_CHAR(): 날짜 또는 숫자를 문자열로 변환
        YYYY: 전체 연도를 숫자로 나타냄
        YEAR: 영어 활자로 표기된 연도 반환
        MM: 월의 두 자리 숫자 값을 반환
        MONTH: 전체 월 이름 반환
        MON: 월 이름의 3자리 약어 반환
        DAY: 요일의 전체 이름 반환
        DY: 요일 이름의 3자링 약어 반환
        DD: 월간 일(1~31)을 숫자 형식으로 반환
        HH, HH12, HH24: 1일 동안 시간/12시간/24시간을 반환
        MI: 분(0~59) 반환
        SS: 초(0~59) 반환
        FF: 밀리세컨드(0~999) 반환
        AM / PM: 오전 / 오후 나타내는 자오선 표시 반환
        A.M. / P.M.: 오전 / 오후를 나타내는 마침표가 있는 자오선 반환
        
        9: 숫자로 나타냄
        0: 0이 표시되도록 강제
        $: 부동 달러 기호 배치
        L: 부동 로컬 통화기호 사용
        .: 소숫점 출력
        ,: 1000단위 표시자로 쉼표 사용
*/
/*
SELECT last_name, TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') as "Hiredate"
FROM employees;
*/
/*
--TIMESTAMP: 날짜 정보+밀리 세컨드까지 반환
SELECT TO_CHAR(systimestamp, 'YYYY-MM-DD HH24:MI:SS.FF2')
FROM dual;
*/
/*
SELECT TO_CHAR(salary, 'L99,999.00') as salary
FROM employees
WHERE last_name='Ernst'
*/
/*
---TO_DATE():  문자열을 date 타입으로 전환
SELECT last_name, TO_CHAR(hire_date, 'YYYY-MM-DD')
FROM employees
WHERE hire_date<TO_DATE('2005-01-01', 'YYYY-MM-DD')
*/
/*
함수 중첩
    단일 행 함수는 어떠한 레벨로 중첩 가능
    중첩된 함수는 가장 깊은 레벨에서 낮은 레벨로 평가
*/
/*
SELECT last_name, UPPER(CONCAT(SUBSTR(last_name, 1, 8), '_US'))
---last_name들을 1~8글자 자르기 > 해당 글자들에 _US 붙이기 > 글자 전부를 대문자로 변환
FROM employees
WHERE department_id=60;
*/
/*
--NVL(): null값을 지정한 값으로 반환(null이 연산이 안될 경우 사용)
SELECT 
    last_name,
    salary,
    NVL(commission_pct, 0), --null값을 0으로 바꿔 출력
    (salary*12)+(salary*12*NVL(commission_pct, 0)) as AN_SAL
FROM employees
*/
/*
--NVL2(): 첫번째 표현식을 검사 후 null이 아니면 두번째 표현식 반환
--첫번째 표현식이 null이면 세번째 표현식 반환
SELECT
    last_name,
    salary,
    commission_pct,
    NVL2(commission_pct, 'SAL+COMM', 'SAL') as income
    --commission_pct가 null이라면 SAL, null이 아니라면 SAL+COMM 반환
FROM employees
WHERE department_id IN (50, 80);
*/
/*
--NULLIF(): 두 표현식을 비교하여 같으면 null, 다르면 expr1 반환
--그러나 expr1에 대해 리터럴 null 지정 불가
--expr1은 첫번째 값을 의미
SELECT
    first_name,
    LENGTH(first_name) as expr1,
    last_name,
    LENGTH(last_name) as expr2,
    NULLIF(LENGTH(first_name), LENGTH(last_name)) as result
FROM employees;
*/
/*
--COALESCE(): 리스트에서 null이 아닌 첫번쨰 표현식 반환
SELECT
    last_name,
    employee_id,
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'No commission_pct')
    --null이 아닐 때까지 표현식 검토, 아닌 표현식 반환
FROM employees;
*/
/*
CASE식
    IF, THEN, ELSE문 작업 수행을 통해 조건부 조회를 편리하게
*/
/*
SELECT
    last_name,
    job_id,
    salary,
    CASE job_id
        WHEN 'IT_PROG' THEN 1.10*salary
        WHEN 'ST_CLERK' THEN 1.15*salary
        WHEN 'SA_REP' THEN 1.20*salary
        ELSE salary
    END AS REVISED_SALARY
FROM employees;
*/
/*
--DECODE(): case와 유사
SELECT
    last_name,
    job_id,
    salary,
    DECODE(job_id, 'IT_PROG', 1.10*salary,
                            'ST_CLERK', 1.15*salary,
                            'SA_REP', 1.20*salary,
                             salary ) as REVISED_SALARY
FROM employees;
*/
