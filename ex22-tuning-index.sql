/*
INDEX UNIQUE SCAN
: ���� �ε����� ���ǵ� �÷��� ���������� '='�� �񱳵Ǵ� ���
: �� ���� ���� ���� INDEX RANGE SCAN�� �߻�
*/

SELECT *
FROM products
WHERE prodno = 11000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


SELECT /*+ FULL(p) */ *
FROM products p
WHERE prodno = 11000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


/*
FULL TABLE SCAN

: ���̺� �Ҵ�� ù ��° ��Ϻ��� HWM �Ʒ��� ��� ����� ����
: 1ȸ�� I/O�� ���ؼ� ���� ���� ����� ����
: DB_FILE_MULTIBLOCK_READ_COUNT �Ķ���ͷ� �� ���� �о�� �� ����� ������ ����

*/
SHOW PARAMETER DB_FILE_MULTIBLOCK_READ_COUNT;

SELECT * FROM orderdetails;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


/*
INDEX RANGE SCAN
: INDEX UNIQUE SCAN�� ������ ��� INDEX SCAN�� INDEX RANGE SCAN �̴�.
: ���� �ε����� ���ǵ� �÷��� ���������� '=' �� �����ڸ� ������ ��� �����ڷ� �񱳵Ǵ� ���
: ����� �ε����� ���ǵ� �÷��� �������� ����Ǵ� ���
*/

CREATE INDEX products_price_idx ON products(price);
DROP INDEX products_price_idx;

SELECT *
FROM products
WHERE price BETWEEN 3350 AND 4500;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


/*
INDEX RANGE SCAN DESCENDING
: INDEX RANGE SCAN������ �������� ������ �˻� �� ��, �⺻������ �ּ� ��谪���� �˻��� �����Ͽ� �ִ� ��谪���� �˻��� ����
: ����, �ִ� ��谪���� �˻��� �����Ͽ� �ּ� ��谪���� �˻��� �����ؾ��ϴ� ��쿡 ���
*/
CREATE INDEX products_price_idx ON products(price);

SELECT /*+ INDEX_DESC(products products_price_idx) */ *
FROM products
WHERE price BETWEEN 3350 AND 4500;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));



/*
INDEX RANGE SCAN(MIN/MAX)
    �ռ� ����� �ִ밪 ã�⿡�� ������ ���� ����(����) �ε����� ����
*/

DROP INDEX products_idx;
CREATE INDEX products_idx ON products(psize, price);


SELECT /*+ INDEX(products products_idx) */ MAX(price) FROM products
WHERE psize = 'XL';
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST -ROWS'));

/*
INDEX �÷� ����
    �ε����� ���ǵ� �÷��� �����ϸ� �ε����� Ȱ�� �� �� ����
*/

CREATE INDEX products_price_idx ON products(price);

SELECT /*+ INDEX(products products_price_idx) */ * 
FROM products
WHERE TRUNC(price) BETWEEN 3350 AND 4500;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));

-- ��
SELECT /*+ INDEX(products products_price_idx) */ * 
FROM products
WHERE price BETWEEN 3350 AND 4500;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


/*
INDEX RANGE SCAN �� FULL TABLE SCAN
    ���̺� ��κ��� �����͸� ã������ FULL TABLE SCAN ����� �����ϴ�
*/

SELECT COUNT(*) FROM orders;

CREATE INDEX orders_custno_idx ON orders(custno);

SELECT /*+ FULL(orders) */ MAX(orderdate)
FROM orders
WHERE custno BETWEEN 1 AND 100;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


SELECT /*+ INDEX(orders orders_custno_idx) */ MAX(orderdate)
FROM orders
WHERE custno BETWEEN 1 AND 100;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


SELECT /*+ FULL(orders) */ MAX(orderdate)
FROM orders
WHERE custno BETWEEN 1 AND 5000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));

SELECT /*+ INDEX(orders orders_custno_idx) */ MAX(orderdate)
FROM orders
WHERE custno BETWEEN 1 AND 5000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));


/*
INDEX FAST FULL SCAN
: INDEX FULL SCAN�� �ε����� ���Ե��� ���� �÷��� SQL�� ���ԵǾ� ���� ���� �߻�������
  INDEX FAST FULL SCAN�� �ε����� ���Ե� �÷��鸸 SQL�� ���Ǿ��� �� �߻�
: Multi Block I/O�� ���� ���� ��Ͽ� �����ϹǷ�, �������� ��� ������ �������� ����
*/
CREATE INDEX emp_idx on emp(job, hiredate, deptno);

SELECT /*+ INDEX_FFS(e emp_idx) */ TO_CHAR(hiredate, 'YYYYMM') yyyymm, COUNT(deptno) total
FROM emp e
WHERE job = 'CLERK'
GROUP BY TO_CHAR(hiredate, 'YYYYMM')
order by yyyymm 
;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));

/*
INDEX SKIP SCAN										
    ���� �ε����� ���� �÷��� WHERE ���� ���ǿ� ���Ե��� �ʾƼ�, 
    �ش� ���� �÷��� ��� ���� ���� �ε����� �˻�										
*/
CREATE INDEX customers_idx ON customers(gender, city, grade, birthdate);

SELECT /*+ NO_INDEX_SS(c customers_idx) */ custno, city, grade, birthdate, phone
FROM customers c
WHERE city = '����'
AND grade = 'VIP'
AND birthdate BETWEEN TO_DATE('19850101', 'YYYYMMDD') AND TO_DATE('19851231', 'YYYYMMDD');

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));

+-----------------
SELECT /*+ INDEX_SS(c customers_idx) */ custno, city, grade, birthdate, phone
FROM customers c
WHERE city = '����'
AND grade = 'VIP'
AND birthdate BETWEEN TO_DATE('19850101', 'YYYYMMDD') AND TO_DATE('19851231', 'YYYYMMDD');
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL, NULL, 'ALLSTATS LAST'));