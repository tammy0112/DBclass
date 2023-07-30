/* day1
���ϸ�: ex01-select.sql

SQL (Dtructured Query Language) - ������ ���� ���
    ������ ������ ���̽� �ý��ۿ��� �ڷḦ �����ϰ� ó���ϱ� ���� ����� ���
    
select ��
    ������ ���̽����� ���� �˻� ��ɾ�
   
--��� �� ���� *
SELECT *
FROM departments;

--Ư�� �� ����(��������)
SELECT department_id, location_id
FROM departments;
*/

/* day2
�����(+, -, *, /....)
    ��� �����ڸ� ���� ���� / ��¥ ���� ������ ǥ���� �ۼ�

SELECT 
    LAST_NAME, 
    SALARY, 
    SALARY + 300 --���� table�� ���� �ٲ�� ���� �ƴϴ�
FROM EMPLOYEEs;
*/
/*
������ �켱����
    ���ϱ�� ������� ���ϱ�, ���⺸�� ���� ����

SELECT 
    LAST_NAME, 
    SALARY, 
    12*SALARY + 100
FROM EMPLOYEEs;
*/
/*
������� null��
    null���� �����ϴ� ������� null�� ���

SELECT 
    LAST_NAME, 
    12*SALARY*COMMISSION_PCT, 
    SALARY, 
    COMMISSION_PCT --null���� ������ �����ص� null�� �ȴ�
FROM employees;
*/
/*
�� alias ����
    �� �Ӹ����� �̸��� �ٲ۴�
    �� �̸� �ٷ� �ڿ� ����
    (�� �̸��� alias ���̿� ���û����� as Ű���尡 �� �� �ִ�)
    ����, Ư�����ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� ��� " "�ʿ�

SELECT 
    last_name as name, --as�� �̿��ϰų�
    commission_pct comm, --�׳� ��Ī�� ���� ���
    salary * 10 as "�޿� 10��" --����(����) �����̹Ƿ� ""�̿�
    --���� table ���� �̸��� �ٲ��� �ʴ´�
FROM employees;

SELECT
    last_name "Name"
    salary*12 "Annual Salary"
FROM employees;
*/
/*
���� ������
    ���̳� ���ڿ��� �ٸ� ���� ����
    �� ���� ���μ�(||)���� ǥ��
    ���� ǥ������ ��� ���� �ۼ�

SELECT
    last_name||job_id as "Employees",
    last_name,
    job_id
FROM employees;
*/
/*
���ͷ� ���ڿ�
    ���ͷ��� SELECT ���� ���Ե� ����, ���� �Ǵ� ��¥
    ��¥ �� ���� ���ͷ� ���� ' '�� ����
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �Ѳ����� ���

SELECT
    last_name || ' is a '|| job_id as "Employyes Details"
FROM employees;
*/
/*
��ü �ο�(q) ������
    �ڽ��� ����ǥ �����ڸ� ����(' '�ȿ� '�� �� ���� ������ �ȵǴ� ���)
    �����ڸ� ���Ƿ� ����
    ������ �� ��뼺 ����

SELECT
    department_name || q'[Department's Member ID: ]' || manager_id
    as "Depaertment and Manager"
    --�׳� �� �� 'Department's Member ID: '���� ���� �߻�
FROM departments;
*/
/*
�ߺ���
    �⺻������ Query ������� �ߺ��� ���� ��� �� ǥ�õ�
DISTINCT
    �ߺ��� ����

SELECT DISTINCT
    department_id
FROM employees;
*/
/*
���̺� ����ǥ��
    DESCRIBE(DESC) ����� ����� ���̺� ������ ǥ��

DESCRIBE employees; 
--�̸�: �� �̸� / not null: �ش� ����null�̸� ������ ���� / ����: ����, ����...
*/

















