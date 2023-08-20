/*
���ν��� ���
*/

-- 1. �ݺ���

SET serveroutput ON;
-- FOR LOOP
/*
FOR index in [REVERSE] ���۰� .. END�� LOOP
    STATEMENT 1
    STATEMENT 2
    ...
END LOOP;

*/
BEGIN
	FOR I IN 1..4 LOOP --1���� 4����
	  	IF MOD(I, 2) = 0 THEN --I�� 2�� ���� �������� 0�̶��
			dbms_output.put_line( I || '�� ¦��!!');
		ELSE
			dbms_output.put_line( I || '�� Ȧ��!!');
		END IF;
	END LOOP;
END;
/


-- ������ FOR ���ȿ� SELECT ���� ���� ����
SET serveroutput ON;
BEGIN
	FOR NUM_LIST IN 
    (
        SELECT 1 AS NUM FROM DUAL
        UNION ALL
        SELECT 2 AS NUM FROM DUAL
        UNION ALL
        SELECT 3 AS NUM FROM DUAL
        UNION ALL
        SELECT 4 AS NUM FROM DUAL
    )
    LOOP
	  	if MOD(NUM_LIST.NUM, 2) = 0 then 
			dbms_output.put_line( NUM_LIST.NUM || '�� ¦��!!');
		else
			dbms_output.put_line( NUM_LIST.NUM || '�� Ȧ��!!');
		end if;
	END LOOP;
END;
/

-- LOOP��
/*

LOOP 
    PL/SQL STATEMENT 1
       �ٸ� LOOP�� �����Ͽ� ��ø���� ��� ����
    EXIT [WHEN CONDITION]
END LOOP;

*/


SET serveroutput ON;

DECLARE --���� ����
    v_num NUMBER := 6; -- ���ۼ���
    v_tot_num NUMBER := 0; -- �� loop�� ��ȯ ����
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� ���� : ' || v_num);
        v_num := v_num + 1;
        v_tot_num := v_tot_num + 1;
        EXIT WHEN v_num > 6;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(v_tot_num || '���� LOOP');

END;
/


-- WHILE LOOP��
SET serveroutput ON;

DECLARE
    v_num NUMBER := 6; -- ���ۼ���
    v_tot_num NUMBER := 0; -- �� loop�� ��ȯ ����
BEGIN
    WHILE v_num < 11 LOOP
        DBMS_OUTPUT.PUT_LINE('���� ���� : ' || v_num);
        v_num := v_num + 1;
        v_tot_num := v_tot_num + 1;
        
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_tot_num || '���� LOOP');

END;
/


-- 2. ���

-- IF��
/*
IF ����1 THEN
    ó����1
ELSE IF ����2 THEN
    ó����2
    ...
ELSE
    ó����
END IF;

*/

DECLARE
    v_score NUMBER := 79;
BEGIN
  IF v_score >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : A');
  ELSIF v_score >= 80 THEN
    DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : B');
  ELSIF v_score >= 70 THEN
    DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : C');
  ELSIF v_score >= 60 THEN
    DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : D');
  ELSE
    DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : F');
  END IF;
END;
/


-- CASE��
/*

CASE WHEN ����1 THEN
    ó����1
WHEN ����2 THEN
    ó����2
    ...
ELSE
    ó����
END CASE;

*/

DECLARE
    v_grade     CHAR(1) := 'C';
    v_appraisal VARCHAR2(20) ;
BEGIN
  v_appraisal := CASE v_grade
  					WHEN 'A' THEN 'Excellent'
  					WHEN 'B' THEN 'Very Good'
					WHEN 'C' THEN 'Good'
					ELSE 'No such grade'
  				 END;
  DBMS_OUTPUT.PUT_LINE ('Grade : '|| v_grade) ;
  DBMS_OUTPUT.PUT_LINE ('Appraisal: '|| v_appraisal);
END;
/


CREATE OR REPLACE PROCEDURE update_salaries(p_percentage IN NUMBER) IS
BEGIN
    FOR emp_rec IN (SELECT employee_id, salary FROM employees) LOOP
        IF emp_rec.salary > 5000 THEN
            UPDATE employees
            SET salary = salary + (salary * (p_percentage / 100))
            WHERE employee_id = emp_rec.employee_id;
        END IF;
    END LOOP;
    COMMIT;
END;
/
--100	26400
SELECT employee_id, salary FROM employees
WHERE salary > 5000;

EXECUTE update_salaries(10);

ROLLBACK;


