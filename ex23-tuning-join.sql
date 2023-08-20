/*
NESTED LOOPS
    ��ø ���� ����
    
��ø ���� ������ Ư¡
    ���� ����Ǵ� ����(���� ���̺�)�� ó�� ������ ��ü �Ϸ��� �¿���
    ���� ����Ǵ� ������ ����� �ٲ�� ���� ���̺� ������ �������� ���޵�
    ���� ���̺��� ��� ������ ���鼭 ���� ���̺��� ��� ������ ����� ������ ������ �õ���
    ���� �Ǵ� ���� ���̺��� ���� �÷��� �ε����� �����ؾ� ��.
    �ε����� ������ ���� ���̺��� �ݺ������� FULL TABLE SCAN�ϹǷ� ��ȿ����

*/

CREATE INDEX emp_deptno_idx ON emp(deptno);

SELECT /*+ USE_NL(e d) */
    e.ename, d.dname
FROM emp e INNER JOIN dept d
ON (e.deptno = d.deptno);

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));

SELECT /*+ ORDERED USE_NL(e d) */ 
    E.ename, D.dname
FROM  emp E, dept D
WHERE E.deptno = D.deptno;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


/*
SORT MERGE
    �� ���̺�κ��� ���ÿ� ����������
    �����͸� �о� ���� ��, ����� Į���� ������� ���� �۾� �����մϴ�.
    ���� ������ ������ �մϴ�.
    
��Ʈ ���� ������ Ư¡
: �� ���̺��� ���� �÷����� ���� ������ ����, ���� ���� ���� ���ϸ鼭 �����ϴ� ���
  ��ø ���� ���ο��� ���� Ƚ���� ���� ���� �׼����� �δ�Ǵ� ��쿡 ���
: ���� �۾��� PGA �޸𸮸� ����ϹǷ� ���� ��� �Ǽ��� �������� ������ ���� �δ��� ����
  �޸� SORT_AREA_SIZE�� ����ȭ
*/

SELECT /*+ USE_MERGE(e d) */
    e.ename, d.dname
FROM emp e INNER JOIN dept d
ON (e.deptno = d.deptno);

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));



/*
HASH JOIN
    Driving ���̺�� �ϳ��� ����
    Hashing�� ���� �ؽð��� ����� �޸� �����մϴ�.
    �������� �����ؾ� �� ���̺�κ��� �����͸� �о
    Hashing�� ���� �ؽð��� ����ϴ�.
    
    �޸� HASH_AREA_SIZE�� ����ȭ(SORT_AREA_SIZE 2�谡 �⺻��)
    
Hash JOIN ������
    ���� �󵵰� ����
    ���� ���� �ð��� ���� �ɸ���
    �뷮 ������ ������ ��
*/

SELECT /*+ USE_HASH(e d) */
    e.ename, d.dname
FROM emp e INNER JOIN dept d
ON (e.deptno = d.deptno);
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));