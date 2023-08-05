/*
�Լ�(Function)
    �Ű������� �޾� Ư�� �۾��� �����ϰ� ��� ��ȯ 
    
�Լ� ����
    ������ �Լ�: ������ �Ű������� �Է¹޾� ��� ���
    ������(�׷�) �Լ�:������ �Ű������� �Է¹޾� ��� ���
*/
--������ �Լ���
/*
--��ҹ��� �Լ�
-- LOWER(): ���ڿ��� �ҹ��ڷ� ��ȯ
SELECT
    employee_id,
    last_name,
    department_id
FROM employees
WHERE LOWER(last_name)='higgins' --last_name�� �̸����� �ҹ��ڷ� �о��
*/
/*
--UPPER(): ���ڿ��� �빮�ڷ� ��ȯ
SELECT UPPER('higgins') FROM dual;
*/
/*
--INITCAP(): ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT
    employee_id,
    last_name,
    department_id
FROM employees
WHERE last_name=INITCAP('higgins');
*/
/*
--���� ���� �Լ�
--CONCAT(): �� ���� �Ķ���� �� ����
SELECT 'HELLO' || 'WORLD' FROM dual;
SELECT CONCAT('Hello', 'World') FROM dual;
*/
/*
--SUBSTR(): ������ ������ ���ڿ� ����
SELECT SUBSTR('HelloWorld', 1, 5) FROM dual;
*/
/*
--LENGTH(): ���ڿ��� ���� ��ȯ
SELECT LENGTH('HelloWorld') FROM dual;
*/
/*
--INSTR(): ���ڿ����� ������ ������ ��ġ ��ȯ
SELECT INSTR('HelloWorld', 'W') FROM dual;
*/
/*
--LPAD(): ���ʺ��� ���ڽ����� ä�� ǥ���� ��ȯ
SELECT LPAD('salary', 10, '*') FROM dual;
--10ĭ ����, ��ĭ�� *�� ä��� salary ��� 
*/
/*
--RPAD(): �����ʺ��� ���ڽ����� ä�� ǥ���� ��ȯ
SELECT RPAD('salary', 10, '*') FROM dual;
*/
/*
--REPLACE(): ���ڿ����� ������ ���� ġȯ
SELECT REPLACE('Jack and Jue', 'J', 'Bl') FROM dual;
*/
/*
--TRIM(): ���ڿ����� ���� �Ǵ� ���� ���ڸ� �ڸ�
SELECT TRIM('H' FROM 'HelloWorldH') FROM dual;
SELECT TRIM(' ' FROM ' Hello World ') FROM dual;
*/
/*
--�����Լ�
--ROUND(): ������ �Ҽ��� �ڸ��� �ݿø�
SELECT ROUND(45.936, 2) FROM dual;

--TRUNC(): ������ �Ҽ��� �ڸ��� �� ����
SELECT TRUNC(45.936, 2) FROM dual;

--MOD(): ���� ������ ��ȯ
SELECT MOD(1600, 300) FROM dual;
*/
/*
--CEIL(): �־��� ���� �ø��Ͽ� ������ ��ȯ
SELECT CEIL(45.422) FROM dual;
*/
/*
--��¥�Լ�
--SYSDATE: ���� ��¥�� �ð��� ���� �� �ִ� pseudo-column
SELECT SYSDATE FROM dual;
*/
/*
��¥ ����
    ��¥�� ���� ���ϰų� ���� ��� ��¥���� ���
    �� ��¥ ������ �ϼ��� �˾Ƴ��� ���� ����
*/
/*
SELECT last_name, (sysdate-hire_date)/7 as weeks
FROM employees
WHERE department_id=90;
*/
/*
��¥ ���� �Լ�
    MONTHS_BETWEEN(date1, date2): �� ��¥ �� �� �� ���
    ADD_MONTHS(date, n): ��¥�� n���� �߰�
    NEXT_DAY(date, day_of_week): ������ ��¥�� �������� �־��� ������ ������ ��¥ ���
        (1: �� ~ 7: �����)
    LAST_DAY(date): �־��� ���� ������ ��¥�� ��ȯ
    ROUND(date, format): ��¥�� ������ �������� �ݿø�
    TRUNC(date, format): ��¥�� ������ �������� ����
*/
/*
---MONTHS_BETWEEN
SELECT MONTHS_BETWEEN(TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-01-12', 'YYYY-MM-DD'))
FROM dual;
---ADD_MONTHS
SELECT ADD_MONTHS(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 5)
FROM dual;
--NEXT_DAY
SELECT NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 3) --ȭ����
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
��ȯ �Լ�
    TO_CHAR(): ��¥ �Ǵ� ���ڸ� ���ڿ��� ��ȯ
        YYYY: ��ü ������ ���ڷ� ��Ÿ��
        YEAR: ���� Ȱ�ڷ� ǥ��� ���� ��ȯ
        MM: ���� �� �ڸ� ���� ���� ��ȯ
        MONTH: ��ü �� �̸� ��ȯ
        MON: �� �̸��� 3�ڸ� ��� ��ȯ
        DAY: ������ ��ü �̸� ��ȯ
        DY: ���� �̸��� 3�ڸ� ��� ��ȯ
        DD: ���� ��(1~31)�� ���� �������� ��ȯ
        HH, HH12, HH24: 1�� ���� �ð�/12�ð�/24�ð��� ��ȯ
        MI: ��(0~59) ��ȯ
        SS: ��(0~59) ��ȯ
        FF: �и�������(0~999) ��ȯ
        AM / PM: ���� / ���� ��Ÿ���� �ڿ��� ǥ�� ��ȯ
        A.M. / P.M.: ���� / ���ĸ� ��Ÿ���� ��ħǥ�� �ִ� �ڿ��� ��ȯ
        
        9: ���ڷ� ��Ÿ��
        0: 0�� ǥ�õǵ��� ����
        $: �ε� �޷� ��ȣ ��ġ
        L: �ε� ���� ��ȭ��ȣ ���
        .: �Ҽ��� ���
        ,: 1000���� ǥ���ڷ� ��ǥ ���
*/
/*
SELECT last_name, TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') as "Hiredate"
FROM employees;
*/
/*
--TIMESTAMP: ��¥ ����+�и� ��������� ��ȯ
SELECT TO_CHAR(systimestamp, 'YYYY-MM-DD HH24:MI:SS.FF2')
FROM dual;
*/
/*
SELECT TO_CHAR(salary, 'L99,999.00') as salary
FROM employees
WHERE last_name='Ernst'
*/
/*
---TO_DATE():  ���ڿ��� date Ÿ������ ��ȯ
SELECT last_name, TO_CHAR(hire_date, 'YYYY-MM-DD')
FROM employees
WHERE hire_date<TO_DATE('2005-01-01', 'YYYY-MM-DD')
*/
/*
�Լ� ��ø
    ���� �� �Լ��� ��� ������ ��ø ����
    ��ø�� �Լ��� ���� ���� �������� ���� ������ ��
*/
/*
SELECT last_name, UPPER(CONCAT(SUBSTR(last_name, 1, 8), '_US'))
---last_name���� 1~8���� �ڸ��� > �ش� ���ڵ鿡 _US ���̱� > ���� ���θ� �빮�ڷ� ��ȯ
FROM employees
WHERE department_id=60;
*/
/*
--NVL(): null���� ������ ������ ��ȯ(null�� ������ �ȵ� ��� ���)
SELECT 
    last_name,
    salary,
    NVL(commission_pct, 0), --null���� 0���� �ٲ� ���
    (salary*12)+(salary*12*NVL(commission_pct, 0)) as AN_SAL
FROM employees
*/
/*
--NVL2(): ù��° ǥ������ �˻� �� null�� �ƴϸ� �ι�° ǥ���� ��ȯ
--ù��° ǥ������ null�̸� ����° ǥ���� ��ȯ
SELECT
    last_name,
    salary,
    commission_pct,
    NVL2(commission_pct, 'SAL+COMM', 'SAL') as income
    --commission_pct�� null�̶�� SAL, null�� �ƴ϶�� SAL+COMM ��ȯ
FROM employees
WHERE department_id IN (50, 80);
*/
/*
--NULLIF(): �� ǥ������ ���Ͽ� ������ null, �ٸ��� expr1 ��ȯ
--�׷��� expr1�� ���� ���ͷ� null ���� �Ұ�
--expr1�� ù��° ���� �ǹ�
SELECT
    first_name,
    LENGTH(first_name) as expr1,
    last_name,
    LENGTH(last_name) as expr2,
    NULLIF(LENGTH(first_name), LENGTH(last_name)) as result
FROM employees;
*/
/*
--COALESCE(): ����Ʈ���� null�� �ƴ� ù���� ǥ���� ��ȯ
SELECT
    last_name,
    employee_id,
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'No commission_pct')
    --null�� �ƴ� ������ ǥ���� ����, �ƴ� ǥ���� ��ȯ
FROM employees;
*/
/*
CASE��
    IF, THEN, ELSE�� �۾� ������ ���� ���Ǻ� ��ȸ�� ���ϰ�
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
--DECODE(): case�� ����
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
