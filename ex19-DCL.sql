/*
DCL(Data Control Language)
    table에 데이터를 조작할 때 필요한 권한을 조작하는 명령
    
CONNECT: 데이터 베이스에 접속하는 권한 제공
RESOUCE: table, 시퀀스, 프로시저 생성 권한 부여
ALTER, DROP: 객체 변경 또는 삭제 권한 제공
DBA: 데이터 베이스 관리자오서 시스템 완전 제어의 권한 부여
*/
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

--사용자 생성
CREATE USER alice IDENTIFIED BY butterfly;

--GRANT 사용해 권한 부여
--방법1
GRANT CREATE SESSION TO alice;
--방법2
GRANT CONNECT TO alice;

--권한 삭제
--방법1
REVOKE CREATE SESSION FROM alice;
--방법2
REVOKE CONNECT FROM alice;

--OBJECT 권한 부여
GRANT CREATE SEQUENCE TO alice;
GRANT CREATE SYNONYM TO alice;
GRANT CREATE TABLE TO alice;
GRANT CREATE PROCEDURE TO alice;
GRANT CREATE VIEW TO alice;

--모든 권한 부여
GRANT CONNECT, DBA, RESOURCE TO alice; 

--모든 권한 부여 삭제
REVOKE CONNECT, DBA, RESOURCE FROM alice;

--사용자 비밀번호 변경
ALTER USER alice IDENTIFIED BY wonderland;

/*
ROLE: 그룹으로 권한 주기
*/
--ROLE 생성
CREATE ROLE role01;

--ROLE 권한 부여
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

--사용자에게 role 부여
GRANT role01 TO alice;
REVOKE role01 FROM alice;

--사용자 삭제
DROP USER alice;
DROP USER alice CASCADE;
--CASCADE를 사용하면 해당 사용자와 관련된 모든 객체들까지 삭제







