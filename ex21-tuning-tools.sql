/*
SQL tuning tools

�����ȹ �б�
    - ���̺� �׼��� ���μ����� �� ���̺��� �͵����� �׼����ϴ� ���μ����� �ϳ��� ����
    - ���� ���� �߿��� �鿩���Ⱑ ���� �Ǿ� �ִ� ������ ���� ����
    - �鿩���Ⱑ ����(�� ���� ����) ���� ���μ����� ����
    - �鿩���Ⱑ ���� ���� �����̶�� ���� �ִ�(���� ������) ������ ���� ����
    - ���� ��带 ���� ����� ��쿡�� ���� ��尡 ���� ����
*/
/*
1. EXPLAIN PLAN
    SQL ���� �������� �ʰ� ��Ƽ�������� �ش� SQL ���� ���� ��ȹ�� Ȯ���ϴ� �� ���˴ϴ�.

*/
EXPLAIN PLAN FOR
SELECT d.dname, e.ename
FROM dept d, emp e
WHERE d.deptno = e.deptno
AND e.sal >= 3000
ORDER BY e.ename;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

/*
2. AUTOTRACE
SQL*Plus���� ���Ǹ�, ������ ���� ��ȹ�� ���ɿ� ���� ��踦 �����մϴ�.
��ũ �б�, �޸� �б� ���� ���� ��� ������ �����մϴ�.


*/
SET AUTOTRACE ON;

SELECT d.dname, e.ename
FROM dept d, emp e
WHERE d.deptno = e.deptno
AND e.sal >= 3000
ORDER BY e.ename;

SET AUTOTRACE OFF;

/*

3. V$SQL_PLAN
����� SQL ���� ���� Ǯ�� ������ �ִ� SQL ���� ���� ��ȹ�� ���� ������ �����ϴ� ���Դϴ�.
DBMS_XPLAN ��Ű�� �޼ҵ带 ����Ͽ� ���� ��ȹ�� ǥ���� �� �ֽ��ϴ�.

DBMS_XPLAN.DISPLAY_CURSOR

�ʿ���� �ο�
GRANT SELECT ON V_$SESSION TO tuning;
GRANT SELECT ON V_$SQL_PLAN_STATISTICS_ALL TO tuning;
GRANT SELECT ON V_$SQL TO tuning;
GRANT SELECT ANY DICTIONARY TO tuning;




*/
-- ��� ĸó����
ALTER SYSTEM SET STATISTICS_LEVEL = ALL;

SELECT  d.dname, e.ename
FROM emp e, dept d
WHERE 1=1 
AND e.sal >= 3000
AND e.deptno = d.deptno
ORDER BY e.ename;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST -ROWS'));