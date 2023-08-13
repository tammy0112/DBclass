/*
DDL(Data Definition Language)
    ������ ���̽� ���� ���̺�, ������...�� ����, ����, ���� ��ɹ�
*/
--CREATE TABLE: table ����
CREATE TABLE dept(
    d_no NUMBER(6),
    d_name VARCHAR2(200),
    loc VARCHAR(200),
    create_date DATE DEFAULT sysdate
    );
DESC dept;
/*
������ ����
    VARCHAR2(size)
    : size bite������ ���� ������ ���� ������ ����, �ִ� 4000bt
    NUMBER(p, s)
    : ���� p������ ���� ���� ���� ������ ����, s�� �Ҽ��� �� �ڸ���
    CHAR(size): ���� ���� ���ڿ� ����, �ִ� 2000bite
    DATE: ��¥, �ð� ����
    CLOB: ���� ������, �ִ� 4DB
    BLOB: ���̳ʸ� ������, �ִ� 4GB
    BFILE: ���� ��ġ�� ��Ÿ������ ����, �ִ� 4GB
*/
--departments table�� dept�� �����ϱ�
INSERT INTO dept
SELECT
    department_id,
    department_name,
    location_id,
    sysdate
FROM departments;
/*
CTAS: Create Table As Select�� ����, ���ο� table ���� ���
         ���� table���� SELECT�� ������ ��ȸ �� �̸� �������� ����
*/
--table ����, ���������� ���� �ȵ�
CREATE TABLE dept2 AS SELECT * FROM dept;
SELECT * FROM dept2;
--table ������ ����
CREATE TABLE dept3 AS SELECT * FROM dept
WHERE 1=2;
SELECT * FROM dept3;
/*
ALTER: �����ͺ��̽��� ��ü ����, �Ӽ� ���� �� ���
DROP: ��ü ���� �� ���
*/
CREATE TABLE simpli(num NUMBER);
--Į�� �߰�
ALTER TABLE simpli ADD(name VARCHAR2(3));
--Į�� ����: �ִ� 3��Ʈ > 30��Ʈ
ALTER TABLE simpli MODIFY(name VARCHAR2(30));
--Į�� ����
--���1
ALTER TABLE simpli DROP COLUMN name;
--���2
ALTER TABLE simpli ADD(addr VARCHAR(50));
ALTER TABLE simpli DROP(addr);
--table ����
DROP TABLE simpli;
/*
�������� CONSTRAINT
    Į���� ��ġ �ʴ� ������ �Է�/����/������ �����ϱ� ����
    table ���� �Ǵ� ���� �� ����
    ����� �������� �ŷڼ� ���� ����
    ���������� ���� �Ұ�, ������ ����
    
    NOT NULL
        : NULL�� �Է��� �Ǿ�� �ȵǴ� ���� ����
        Į�� ���������� �ο� ����
    UNIQUE KEY
        : ���尪�� �ߺ����� �ʰ� �����Ǿ�� �ϴ� ���� ����
         NULL ���
    PRIMARY KEY: NOT NULL+UNIQUE KEY ���� ����
    CHECK: ���ǿ� �´� �����͸� �ԷµǴ� Į�� ���� ����
    FOREIGN KEY: �θ� ���̺��� PRIMARY KEY â�� ���� ����
*/
CREATE TABLE dept4(
    dno NUMBER(2) CONSTRAINT dno_pk PRIMARY KEY,
    --CONSTRAINT (�������� �̸�) (�������� ����)
    dname VARCHAR2(15) DEFAULT '������',
    --DEFAULT: �ƹ����� �Էµ��� �ʾ��� ��� ����Ǵ� ������
    loc CHAR(1) CONSTRAINT loc_ck CHECK(loc IN('1', '2'))
    --1 �Ǵ� 2�� �Է¹��� �� ����
    );
INSERT INTO dept4 (dno, loc)
VALUES (2, '1');
--dname�� �Է����� �ʾ� '������'�� �����
SELECT * FROM dept4;
INSERT INTO dept4 (dno, loc)
VALUES (2, '3');
--loc�� ���� ������ ������ ���� �߻�
CREATE TABLE dept5(
    dno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(15) NOT NULL
    );
--�θ����̺� dept5�� �����ϴ� �ڽ� ���̺�
CREATE TABLE emp(
    empno NUMBER(4) PRIMARY KEY,
    enmae VARCHAR2(15) NOT NULL,
    dno NUMBER(2),
CONSTRAINT emp_dept5_fk FOREIGN KEY(dno)
    REFERENCES dept5(dno)
    );
SELECT * FROM dept5;
INSERT INTO dept5 (dno, dname) VALUES(1, '���ߺ�');
INSERT INTO dept5 (dno, dname) VALUES(2, '��ȹ��');
INSERT INTO dept5 (dno, dname) VALUES(3, '�����κ�');
COMMIT;
SELECT * FROM emp;
INSERT INTO emp (empno, enmae, dno) VALUES(1, '������', 1);
INSERT INTO emp (empno, enmae, dno) VALUES(2, '���̶�', 3);
COMMIT;
DELETE FROM emp
WHERE empno=1;
--�ڽ� table ������ ���� ����
ROLLBACK;

DELETE FROM dept5
WHERE dno=1;
--�θ� table ������ ���� ����
ROLLBACK;

DELETE FROM emp
WHERE empno=1;
DELETE FROM dept5
WHERE dno=1;
--�ڽ� table ���� �� �θ� table ������ ���� ����
ROLLBACK;

--�������� �˻�
SELECT * FROM user_constraints
WHERE constraint_name='EMP_DEPT5_FK';

--�������� ����
ALTER TABLE emp DROP CONSTRAINTS EMP_DEPT5_FK;

--�������� �߰�
ALTER TABLE emp ADD(
    CONSTRAINTS emp_dept5_fk FOREIGN KEY(dno) REFERENCES dept5(dno)
    );
COMMIT;



