/*
PL/SQL(Procedual Language Extension to SQL)
    SQL�� Ȯ���� ������ ���
    ���� SQL�� �ϳ��� block���� ������ SQL ����

���ν���(Procedure)
    �����ͺ��̽����� ���� ������ �ϳ� �̻��� sql�� ����
    �ϳ��� �� ������ ���� ��ü
*/
/*
�͸� ���ν���: ��ȸ��, DB�� ������� ����
    [�⺻ ����]
        DECLARE ���� ����
        BEGIN ó�� ���� ����
        EXCEPTION ���� ó��
        END ó�� ���� ����
*/
/*
--���� ����� ����ϵ��� ���� ����
SET SERVEROUTPUT ON;

--��ũ��Ʈ ��� �ð� ����ϵ��� ���� ����
SET TIMING ON;

DECLARE --���� ����
    V_STRD_DT VARCHAR2(8);
    V_STRD_DEPTNO NUMBER;
    V_DEPTNO NUMBER;
    V_DNAME VARCHAR2(50);
    V_RESULT_MSG VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN --���� ����, �ڵ� ����
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
    --��ȸ ��� ���� ����
    V_RESULT_MSG := 'RESULT>DEPTNO'||V_DEPTNO||,
                                DNAME='||V_DNAME||',
                                LOC='||V_LOC;
    --��ȸ ��� ���� ���
    DBMS_OUTPUT.PUT_LINE( VRESULT_MSG);
EXCEPTION
    WHEN VALUE_ERROR THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE=>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE(VRESULT_MSAG);
END;
*/
/*
���ν���
    [�⺻ ����] ()�� ���� ����
        CREATE OR REPLACE ���ν��� �̸�(�Ķ����1, �Ķ����2...)
        IS (AS)
            (�����)
        BEGIN 
            (�����)
        (EXCEPTION)
            (���� ó��)
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
IN �Ű�����
    ���� ���ν��� ������ ��
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
OUT �Ű�����
    ���ν����� ���� ���� �����Ƿ� OUT �Ű������� ���� ���� �� ����
    ������ �Ű������� ����
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
--NVARCHAR2�� VARCHAR2�� �޸� ���� ���� ���� 25
VARIABLE v_lname NVARCHAR2(25); 
VARIABLE v_sal NUMBER;

EXECUTE find_emp_proc(115, :v_fname, :v_lname, :v_sal);
PRINT v_fname;
PRINT v_lname;
PRINT v_sal;

/*
IN OUT �Ű�����
    IN, OUT ���� ��� ����
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
�Լ�(FUNCTION)
    Ư�� ��ɵ��� ���ȭ, ���� �� �� �ֵ��� ������ �������� ������ ��
    [�⺻ ����]
        CREATE OR REPLACE FUNCTION function_name(�Ķ����1, �Ķ����2...)
        RETURN datatype --��ȯ �� ����
        IS --�����
        BEGIN
            (�����: PL/SQL ��)
        EXCEPTION
            (EXCEPTION ó��)
        RETURN ����;
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


