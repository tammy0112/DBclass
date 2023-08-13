/*
DML(Data Manipulation Language)
    DB���� �����͸� ó���ϰ� �����ϴ� SQL
    DQL(Data Query Language, SELECT�� ��)�� ���� �ٸ�
    
INSERT: table�� ���ο� ���ڵ� ����
UPDATE: table ���� ���ڵ� ����
DELETE: table Ư�� ���ڵ� ����
UPDATE: ���� �� ����
TRUNCATE: table�� �� ���·� ���ܵ� ä ��� ���ڵ� ����
                 DML�� �ƴ� DDL�̱� ������ ���� undo �Ұ���
*/
/*
TRANSACTION
    ������ ó�� ����
    �������� SQL ��ɹ��� �ϳ��� �۾����� ó���ϴ� ����

COMMIT: DQL ��� ���� ����
ROLLBACK: DML ��� ���, COMMIT�ϱ� ���� ������� ��� ����
SAVEPOINY: �ӽ� ������
*/
/*
INSERT
    ���1
    INSERT INTO (Į��1, Į��2, ...)
    VALUES(��1, ��2, ...);
    
    ���2
    INSERT INTO table��(Į��1, Į��2, ...) subquery;
*/
/*
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations', 100, 1700);
SELECT * FROM departments;
--��������� ���� sql�� table�� ����
--�ٸ� sql�� ���� ������ COMMIT���� Ȯ������� �Ѵ�

--NULL ���� ���� �� ����, �� ���� ����
INSERT INTO departments(department_id, department_name)
VALUES (290, 'Purchasing');
SELECT * FROM departments;
--������ ���� NULL�� ����
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
    WHERE 1=2 --���� ����, �ƹ��͵� ��ȸ���� �ʴ´�, Į�� �̸��鸸 ��ȸ
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
    SET Į��1=������, Į��2=������
    WHERE ������
*/
/*
CREATE TABLE copy_emp
AS SELECT * FROM employees
WHERE 1=2; --employees table�� Į���� ������ ����

INSERT INTO copy_emp
SELECT * FROM employees;
COMMIT;

SELECT * FROM copy_emp;
*/
/*
--�μ���ȣ 50������ ����
UPDATE copy_emp
SET department_id=50
WHERE employee_id=113;
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
UPDATE copy_emp
SET department_id=110;
--������ ������ �ʾ� ���� ����
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
UPDATE copy_emp
SET department_id=(SELECT department_id 
                            FROM employees 
                            WHERE employee_id=100)
--department_id�� empoyee_id�� 100�� ����� �����ϰ� ����
WHERE job_id=(SELECT job_id 
                    FROM employees 
                    WHERE employee_id=200);
--employee_id�� 200�� ����� ���� job_id�� ���� ����� ���
*/
/*
DELETE
    DELETE FROM table
    WHERE
*/
/*
--��� �ذ�
DELETE FROM copy_emp
WHERE employee_id=200;
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
DELETE FROM copy_emp;
--������ ������ �ʾ� ���� ����
SELECT * FROM copy_emp;
ROLLBACK;
*/
/*
TRUNCATE TABLE copy_emp;
SELECT * FROM copy_emp;
ROLLBACK;
--ROLLBACK�� �ص� ������ �ȵ�
*/
/*
CREATE TABLE member(
    num NUMBER PRIMARY KEY,
    name VARCHAR(30), --30�ܾ���� ���� ������ ���ڿ���
    addr VARCHAR2(50));
INSERT INTO member VALUES(1, '��ī��', '���ʸ���');
INSERT INTO member VALUES(2, '������', '���ʸ���');
INSERT INTO member VALUES(3, '���̸�', '���ʸ���');
INSERT INTO member VALUES(4, '���α�', '���ʸ���');
INSERT INTO member VALUES(5, '����Ǯ', '���ʸ���');
SELECT * FROM member;

INSERT INTO member VALUES(6, '�ߵ���', '���ʸ���');
INSERT INTO member VALUES(7, '������', '���ʸ���');
SELECT * FROM member;
SAVEPOINT seven;
INSERT INTO member VALUES(8, '����', '���ʸ���');
ROLLBACK TO seven;
--seven������ ���·� ����
SELECT * FROM member;
*/
/*
--SELECT�� FOR UPDATE: Ư�� ���ڵ带 ��� ó�� / commit, rollback���� �������
SELECT
    employee_id,
    salary,
    job_id
FROM employees
WHERE job_id='SA_REP'
FOR UPDATE; --�ٸ� ����ڵ��� �ش� ������ ������ �� ����
*/
