/*
�����ͺ��̽� ��ü
    table: ��� ���� ������ ���� ����
    view: �ϳ� �̻��� table�� �ִ� �������� �κ������� �������� ��Ÿ��(���� table)
    sequence: �Ϸ��� ���ڸ� �ڵ����� ����
    index: table�� �����Ϳ� ���� ���� �˻��� �����ϴ� ���� ��ü
    ���Ǿ�: ��ü�� �ٸ� �̸� �ο�
*/
--view ����
CREATE VIEW empvu80
AS SELECT
        employee_id,
        last_name,
        salary
    FROM employees
    WHERE department_id=80;
SELECT * FROM empvu80;
--empvu80�� �ϳ��� tableó�� ��� ����
--���� table �������� �޸� query ��ü�� ����ϰ� �ִ� ��

--alias�� ����� view ����
CREATE VIEW salvu50
AS SELECT
        employee_id as ID_NUMBER,
        last_name as name,
        salary*12 as ann_salary
    FROM employees
    WHERE department_id=50;
SELECT * FROM salvu50
WHERE ann_salary>=50000;

--view ����
CREATE OR REPLACE VIEW empvu80 --������ ����, ������ ����
    (id_number, name, sal, department_id) --Į�� ����, ����
    AS SELECT employee_id, first_name || ' ' || last_name, 
                    salary, department_id
    FROM employees
    WHERE department_id=80;
SELECT * FROM empvu80;

UPDATE empvu80 SET
department_id=90
WHERE id_number=145;
SELECT * FROM empvu80;
--view���� ������ ���� ���� table(employees)�� ���� ������
--���� empvu80�� WHERE department_id=80; ���ǿ� ���� empvu80 1�� �� �����
ROLLBACK;

--���� view ����: 2�� �̻��� table�� ���� ���ǵ� view
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
view DML�۾� ��Ģ
    1. �� ���� �Ұ��� ���
        - �׷� �Լ� ���� ��
        - GROUP BY ��
        - DISTINCT Ű����
        - PSEUDOCOLUMN ROWNUM Ű����
        
    2. ������ ���� �Ұ��� ���
        - �׷� �Լ�
        - GROUP BY ��
        - DISTINCT Ű����
        - PSEUDOCOLUMN ROWNUM Ű����
        - ǥ�������� ���ǵǴ� ��
        
    3. ������ �߰� �Ұ��� ���
        - �׷� �Լ�
        - GROUP BY ��
        - DISTINCT Ű����
        - PSEUDOCOLUMN ROWNUM Ű����
        - ǥ�������� ���ǵǴ� ��
        - view���� ���õ��� ���� �⺻ table�� NOT NULL��
*/
--ROWNUM: ���� ����� �� �࿡ ������ ��ȣ �Ҵ�
SELECT
    ROWNUM,
    employee_id,
    last_name
FROM employees
WHERE department_id=80;

--DML �۾� �ź�
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
--WITH READ ONLY�� ���� �б� ���� view�� ����

--WITH CHECK OPTION: view�� ���� ������ ���� ����
CREATE OR REPLACE VIEW high_salary_employee_vu
AS SELECT * FROM employees
    WHERE salary>10000
    WITH CHECK OPTION CONSTRAINT high_salary_employee_ck;
SELECT * FROM high_salary_employee_vu;

UPDATE high_salary_employee_vu SET
salary=2400
WHERE employee_id=100;
--WITH CHECK OPTION�� ���� UPDATE ���� �Ұ�

UPDATE high_salary_employee_vu SET
salary=26000
WHERE employee_id=100;
--WITH CHECK OPTION ���ǿ� ������� �ʾ� ���� ����

--view ����
DROP VIEW high_salary_employee_vu CASCADE CONSTRAINTS;
--CASCADE CONSTRAINTS���� ���� ���ǵ� �Բ� ����

/*
sequence
    ������ ���� ���� �ڵ����� �������� ��ȯ
    ä�� �� �ַ� ���
*/
CREATE SEQUENCE my_seq
    INCREMENT BY 1 --���� ��
    START WITH 1 --���� ��
    MINVALUE 1 --�ּ� ��
    MAXVALUE 999 --�ִ� ��
    NOCYCLE --�ݺ�x, CYCLE�̶�� �ִ밪 ���� �� �ּҰ����� �ٽ� ����
    CACHE 20 --�̸� ��ȣ�� �޸𸮿� ����
    ORDER; --��û ������� �� ����
SELECT my_seq.NEXTVAL FROM dual;
--������ ������ 1�� ����

--���� sequence�� Ȯ��
SELECT my_seq.CURRVAL FROM dual;

--sequence ����
DROP SEQUENCE my_seq;

--sequence Ȱ�� ���
CREATE TABLE dept3 AS
SELECT * FROM dept5
WHERE 1=2;

INSERT INTO dept3 VALUES(my_seq.nextval, 'A');
INSERT INTO dept3 VALUES(my_seq.nextval, 'B');
INSERT INTO dept3 VALUES(my_seq.nextval, 'C');

SELECT * FROM dept3;
--DENO Į���� �� 1�� ����

/*
INDEX
    �����͸� ������ �˻��ϱ� ���� Ư�� ���� ������ ����
    ������ ��ȸ ���� ��� ���
    
    PK: table ���� �� �ڵ����� index ������
*/
SELECT 
    last_name,
    ROWID --��ǻ�� ���� ����� id ��ġ ��
FROM employees
ORDER BY last_name;

--employees table�� last_name ���� ���� index ����
CREATE INDEX emp_last_name_idx
    ON employees(last_name);
    
--index ����
DROP INDEX emp_last_name_idx;

/*
���Ǿ�(SYNONYM)
    ���Ǿ ������ ��ü�� �ٸ� �̸� �ο� ����
*/
CREATE SYNONYM d_sum
FOR dept_sum_vu;
SELECT * FROM dept_sum_vu;
SELECT * FROM d_sum;
--������ ���

--���Ǿ� ����
DROP SYNONYM d_sum;

/*
ROWID: ROW ���� Id
            �����ͺ��̽� ���� ���� ������ ��ġ ����
ROWNUM: ���� ����� ������ ��ȣ ���
*/
SELECT
    ROWNUM,
    ROWID,
    employee_id,
    last_name,
    salary
FROM employees;





