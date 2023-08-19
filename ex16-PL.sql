/*
PL/SQL(Procedual Language Extension to SQL)
    SQL을 확장한 절차적 언어
    여러 SQL을 하나의 block으로 구성해 SQL 제어

프로시저(Procedure)
    데이터베이스에서 실행 가능한 하나 이상의 sql을 묶어
    하나의 논리 단위로 만든 객체
*/
/*
익명 프로시저: 일회용, DB에 저장되지 않음
    [기본 구조]
        DECLARE 변수 정의
        BEGIN 처리 로직 시작
        EXCEPTION 예외 처리
        END 처리 로직 종료
*/
/*
--길행 결과를 출력하도록 설정 변경
SET SERVEROUTPUT ON;

--스크립트 경과 시간 출력하도록 설정 변경
SET TIMING ON;

DECLARE --변수 정의
    V_STRD_DT VARCHAR2(8);
    V_STRD_DEPTNO NUMBER;
    V_DEPTNO NUMBER;
    V_DNAME VARCHAR2(50);
    V_RESULT_MSG VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN --로직 시작, 코드 구현
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD');
    V_STRD_DEPTNO := 10;
    
    SELECT 
        t1.department_id,
        t1.department_name,
        t1.location_id
    INTO V_DEPTNO,
            V_DNAME,
            V_LOC
    FROM departments t1
    WHERE t1.department_id=V_STRD_DEPTNO;
    --조회 결과 변수 설정
    V_RESULT_MSG := 'RESULT>DEPTNO'||V_DEPTNO||,
                                DNAME='||V_DNAME||',
                                LOC='||V_LOC;
    --조회 결과 변수 출력
    DBMS_OUTPUT.PUT_LINE( VRESULT_MSG);
EXCEPTION
    WHEN VALUE_ERROR THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE=>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE(VRESULT_MSAG);
END;
*/
/*
프로시저
    [기본 구조] ()는 생략 가능
        CREATE OR REPLACE 프로시저 이름(파라미터1, 파라미터2...)
        IS (AS)
            (선언부)
        BEGIN 
            (실행부)
        (EXCEPTION)
            (예외 처리)
        END;
*/
/*
CREATE OR REPLACE PROCEDURE print_hello_proc
    IS
        msg VARCHAR2(20) := 'hello world';
    BEGIN
        DBMS_OUTPUT.PUT_LINE(msg);
    END;
EXEC print_hello_proc;
*/
/*
IN 매개변수
    값이 프로시저 안으로 들어감
*/
/*
CREATE TABLE emp2 AS
SELECT
    employee_id empno,
    last_name name,
    salary,
    department_id depno
FROM employees;

SELECT * FROM emp2;

CREATE OR REPLACE PROCEDURE update_emp_salary_proc(eno IN NUMBER)
    IS
    BEGIN
        UPDATE emp2 SET
        salary=salary*1.1
        WHERE empno=eno;
        COMMIT;
    END;
*/
--salary=3100
SELECT * FROM emp2
WHERE empno=115;

EXEC update_emp_salary_proc(115);
SELECT * FROM emp2;

/*
OUT 매개변수
    프로시저에 관한 값이 없으므로 OUT 매개변수로 값을 받을 수 있음
    참조형 매개변수와 유사
*/
CREATE OR REPLACE PROCEDURE find_emp_proc(v_eno IN NUMBER,
    v_fname OUT NVARCHAR2, v_lname OUT NVARCHAR2, v_sal OUT NUMBER)
IS
    BEGIN
        SELECT
            first_name,
            last_name,
            salary
        INTO
            v_fname,
            v_lname,
            v_sal
        FROM employees
        WHERE employee_id=v_eno;
    END;
VARIABLE v_fname NVARCHAR2(25); 
--NVARCHAR2는 VARCHAR2와 달리 문자 길이 값이 25
VARIABLE v_lname NVARCHAR2(25); 
VARIABLE v_sal NUMBER;

EXECUTE find_emp_proc(115, :v_fname, :v_lname, :v_sal);
PRINT v_fname;
PRINT v_lname;
PRINT v_sal;

/*
IN OUT 매개변수
    IN, OUT 동시 사용 가능
*/
CREATE OR REPLACE PROCEDURE find_sal(v_io IN OUT NUMBER)
IS
    BEGIN
    SELECT salary
    INTO v_io
    FROM employees
    WHERE employee_id=v_io;
    END;

DECLARE
    v_io NUMBER := 115;
    BEGIN
    DBMS_OUTPUT.PUT_LINE('eno='||v_io);
    find_sal(v_io);
    DBMS_OUTPUT.PUT_LINE('salary='||v_io);
    END;

VARIABLE v_io NUMBER;
EXECUTE :v_io := 115;
PRINT v_io;
EXECUTE find_sal(:v_io);
PRINT v_io;

/*
함수(FUNCTION)
    특정 기능들을 모듈화, 재사용 할 수 있도록 복잡한 쿼리문을 간결히 함
    [기본 구조]
        CREATE OR REPLACE FUNCTION function_name(파라미터1, 파라미터2...)
        RETURN datatype --반환 값 유형
        IS --선언부
        BEGIN
            (실행부: PL/SQL 블럭)
        EXCEPTION
            (EXCEPTION 처리)
        RETURN 변수;
        END;
*/
CREATE OR REPLACE FUNCTION get_dept_name(p_dept_no NUMBER)
RETURN VARCHAR2
    IS
        V_TEST_NAME VARCHAR2(30);
    BEGIN
        SELECT department_name
        INTO V_TEST_NAME
        FROM departments
        WHERE department_id=p_dept_no;
    RETURN V_TEST_NAME;
    END;

SELECT get_dept_name(10)
FROM dual;


