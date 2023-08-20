/*
DCL(Data Control Language)
    table�� �����͸� ������ �� �ʿ��� ������ �����ϴ� ���
    
CONNECT: ������ ���̽��� �����ϴ� ���� ����
RESOUCE: table, ������, ���ν��� ���� ���� �ο�
ALTER, DROP: ��ü ���� �Ǵ� ���� ���� ����
DBA: ������ ���̽� �����ڿ��� �ý��� ���� ������ ���� �ο�
*/
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

--����� ����
CREATE USER alice IDENTIFIED BY butterfly;

--GRANT ����� ���� �ο�
--���1
GRANT CREATE SESSION TO alice;
--���2
GRANT CONNECT TO alice;

--���� ����
--���1
REVOKE CREATE SESSION FROM alice;
--���2
REVOKE CONNECT FROM alice;

--OBJECT ���� �ο�
GRANT CREATE SEQUENCE TO alice;
GRANT CREATE SYNONYM TO alice;
GRANT CREATE TABLE TO alice;
GRANT CREATE PROCEDURE TO alice;
GRANT CREATE VIEW TO alice;

--��� ���� �ο�
GRANT CONNECT, DBA, RESOURCE TO alice; 

--��� ���� �ο� ����
REVOKE CONNECT, DBA, RESOURCE FROM alice;

--����� ��й�ȣ ����
ALTER USER alice IDENTIFIED BY wonderland;

/*
ROLE: �׷����� ���� �ֱ�
*/
--ROLE ����
CREATE ROLE role01;

--ROLE ���� �ο�
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

--����ڿ��� role �ο�
GRANT role01 TO alice;
REVOKE role01 FROM alice;

--����� ����
DROP USER alice;
DROP USER alice CASCADE;
--CASCADE�� ����ϸ� �ش� ����ڿ� ���õ� ��� ��ü����� ����







