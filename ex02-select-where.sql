/*
������ ����Ͽ� �� ����
    WHERE���� �̿��Ͽ� ��ȯ�Ǵ� ���� ����

WHERE
    ������ �����ϴ� ������ query�� ����(����)
    
    3���� ���
    1. �� �̸�
    2. �� ����
    3. �� �̸�, ��� �Ǵ� �� ����Ʈ
    

SELECT
    employee_id,
    last_name,
    job_id,
    department_id
FROM employees
WHERE department_id=90; --�μ���ȣ�� 90�� ����鸸 ��ȸ
--�� �̸�: department_id / �� ����: = / �� �̸�, ��� �Ǵ� �� ����Ʈ: 90
*/
/*
���ڿ� �� ��¥
    ���ڿ� �� ��¥ ���� ' ' �� ���´�
    ���ڴ� ��ҹ��� ����, ��¥�� ������ ����(����-ȯ�漳��-�����ͺ��̽�-NLS���� Ȯ�� ����)

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
--����-ȯ�漳��-�����ͺ��̽�-��ũ��Ʈ-üĿ�� ���� üũ
/*
�� ������
    Ư�� ǥ������ �ٸ� ��, ǥ���İ� ���� �� ���
    =, >, >=, <, <=
    <> ���� ����
    BETWEEN...AND... ...�̻� ...����
    IN(set) �� ����Ʈ �� ��ġ�ϴ� �� �˻�
    LIKE ��ġ�ϴ� ���� ���� �˻�
    IS NULL null�� ���� �Ǵ�
    
--��
SELECT
    last_name,
    salary
FROM employees
WHERE salary<=3000;

--BETWEEN ����
SELECT
    last_name,
    salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500; --2500, 3500�� ����
--WHERE salary>=2500 AND salary<=3500; ���ε� ����

--IN ����
SELECT
    employee_id,
    last_name,
    salary,
    manager_id
FROM employees
WHERE manager_id IN (100, 101, 201); --�Ŵ��� ��ȣ�� �� 100, 101, 201�� ��� ��� ���
--WHERE manager_id=100 OR manager_id=102 OR manager_id=201; �ε� ����
*/
/*LIKE ����
    LIKE �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� ��ü ���� �˻� ����
    �˻� ���ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� �ִ�
        %: 0�� �̻��� ���� ��Ÿ��
        _: �� ���� ��Ÿ��

SELECT first_name
FROM employees
WHERE first_name LIKE 'A%'; --first_name�� A~�� ��� ���

SELECT first_name
FROM employees
WHERE first_name LIKE '%a%'; --first_name�� ~a~�� ��� ���

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%'; --first_name�� �ι�° ���ڰ� o�� ��� ���

--ESCAPE �ĺ���
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA\_%' ESCAPE '\'; 
--_�� ���ڷν� ��ȸ�ϰ� �ʹٸ� ESCAPE�� ���� ������ Ư�� ������ ���ش�
--�� %SA\_%�� ~SA(�� ����)~�� �ƴ� ~SA_~�� �νĵȴ�
*/
/*
NULL ����
    IS NULL�� null�� �׽�Ʈ

SELECT
    last_name,
    manager_id
FROM employees
WHERE manager_id is NULL --�Ŵ��� ���̵� ĭ�� �� ĭ�� ��� ���
*/
/*
�� �����ڸ� ����� ���� ����
    AND: ������� ��� ���� �� TRUE ��ȯ
    OR: ������� �� �ϳ��� ���� �� TRUE ��ȯ
    NOT: ������ ������ ��� TRUE ��ȯ

--AND ������
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary>=10000
AND job_id LIKE '%MAN%'

--OR ������
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM employees
WHERE salary>=10000
OR job_id LIKE '%MAN%'
*/
--NOT ������
SELECT
    last_name,
    job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');











