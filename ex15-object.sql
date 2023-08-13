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










