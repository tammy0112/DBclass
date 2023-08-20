/*
CURSOR 
 �����ͺ��̽����� ��ȸ�� ��� ������ ����Ű��, 
 �̸� ���� ��� ������ �ݺ������� ó���ϰų� 
 �����͸� �����ϴ� ���� �۾��� ������ �� �ֽ��ϴ�.

�Ͻ��� Ŀ��
    SQL ������ �����ϸ� �ڵ����� �����Ǵ� Ŀ���Դϴ�. 
    �ַ� ���� �� ��ȸ�� ���� ����¿� ���Ǹ�, �����ڰ� Ŀ���� ��������� 
    �������� �ʾƵ� �ڵ����� �����ǹǷ� ������ ��ȸ �۾��� �����մϴ�.


 - SQL%FOUND     : �ش� SQL���� ���� ��ȯ�� �� ����� 1�� �̻��� ���TRUE (BOOLEAN)
 - SQL%NOTFOUND  : �ش� SQL���� ���� ��ȯ�� �� ����� ���� ��� TRUE (BOOLEAN)
 - SQL%ISOPEN    : �׻� FALSE, �Ͻ��� Ŀ���� ���� �ִ����� ���� �˻�
                    ( PL/SQL�� ���� �� �ٷ� ������ Ŀ���� �ݱ� ������ �׻� �� false)
 - SQL%ROWCOUNT  : �ش� SQL���� ���� ��ȯ�� �� ���, ���� �ֱ� ����� SQL���� ���� ������ ���� ���� ����(����)
 

*/

SET SERVEROUTPUT ON;
DECLARE
    BEGIN
    DELETE FROM emp WHERE dno = 1;
    DBMS_OUTPUT.PUT_LINE('ó�� �Ǽ� : ' || TO_CHAR(SQL%ROWCOUNT)|| '��');
    COMMIT;
    END;

/*

 
����� Ŀ��
    �����ڰ� ���� �����ϰ� ����, 
    �����ͺ��̽� ���� ����� ����� ������ ������ �Ҵ��ϸ�, ó���մϴ�. 
    ����� Ŀ���� ��������� ������ ������ ������ ó���� ������ ������ �� �ִ� ������ �ֽ��ϴ�.

   - %ROWCOUNT : ������� ��ȯ�� ��� ���� ���� ���
   - %FOUND : FETCH�� �����Ͱ� ���� ��ȯ�ϸ� TRUE
   - %NOTFOUND : FETCH�� �����Ͱ� ���� ��ȯ���� ������ TRUE (LOOP�� ������ ������ ã�´�)
   - %ISOPEN : Ŀ���� OPEN�Ǿ������� TRUE

https://goddaehee.tistory.com/117


*/


CREATE OR REPLACE PROCEDURE retrieve_high_salaries(p_min_salary IN NUMBER) IS
    CURSOR emp_cursor IS
        SELECT employee_id, first_name, last_name, salary
        FROM employees
        WHERE salary >= p_min_salary;
    
    emp_record emp_cursor%ROWTYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_record.employee_id ||
                             ', Name: ' || emp_record.first_name || ' ' || emp_record.last_name ||
                             ', Salary: ' || emp_record.salary);
    END LOOP;
    CLOSE emp_cursor;
END;
/
