/*
DDL(Data Definition Language)
    데이터 베이스 내의 테이블, 시퀀스...등 생성, 변경, 삭제 명령문
*/
--CREATE TABLE: table 생성
CREATE TABLE dept(
    d_no NUMBER(6),
    d_name VARCHAR2(200),
    loc VARCHAR(200),
    create_date DATE DEFAULT sysdate
    );
DESC dept;
/*
데이터 유형
    VARCHAR2(size)
    : size bite까지의 가변 길이의 문자 데이터 저장, 최대 4000bt
    NUMBER(p, s)
    : 길이 p까지의 가변 길이 숫자 데이터 저장, s는 소수점 밑 자릿수
    CHAR(size): 고정 길이 문자열 저장, 최대 2000bite
    DATE: 날짜, 시간 저장
    CLOB: 문자 데이터, 최대 4DB
    BLOB: 바이너리 데이터, 최대 4GB
    BFILE: 파일 위치와 메타데이터 저장, 최대 4GB
*/
--departments table을 dept에 복사하기
INSERT INTO dept
SELECT
    department_id,
    department_name,
    location_id,
    sysdate
FROM departments;
/*
CTAS: Create Table As Select의 약자, 새로운 table 생성 방법
         기존 table에서 SELECT로 데이터 조회 후 이를 바탕으로 생성
*/
--table 복사, 제약조건은 복사 안됨
CREATE TABLE dept2 AS SELECT * FROM dept;
SELECT * FROM dept2;
--table 구조만 복사
CREATE TABLE dept3 AS SELECT * FROM dept
WHERE 1=2;
SELECT * FROM dept3;
/*
ALTER: 데이터베이스의 객체 구조, 속성 변경 시 사용
DROP: 객체 삭제 시 사용
*/
CREATE TABLE simpli(num NUMBER);
--칼러 추가
ALTER TABLE simpli ADD(name VARCHAR2(3));
--칼럼 수정: 최대 3비트 > 30비트
ALTER TABLE simpli MODIFY(name VARCHAR2(30));
--칼럼 삭제
--방법1
ALTER TABLE simpli DROP COLUMN name;
--방법2
ALTER TABLE simpli ADD(addr VARCHAR(50));
ALTER TABLE simpli DROP(addr);
--table 삭제
DROP TABLE simpli;
/*
제약조건 CONSTRAINT
    칼럼의 원치 않는 데이터 입력/수정/삭제를 방지하기 위해
    table 생성 또는 변경 시 설정
    저장된 데이터의 신뢰성 제고 가능
    제약조건은 수정 불가, 삭제만 가능
    
    NOT NULL
        : NULL로 입력이 되어서는 안되는 제약 조건
        칼럼 레벨에서만 부여 가능
    UNIQUE KEY
        : 저장값이 중복되지 않게 유지되어야 하는 제약 조건
         NULL 허용
    PRIMARY KEY: NOT NULL+UNIQUE KEY 제약 조건
    CHECK: 조건에 맞는 데이터만 입력되는 칼럼 제약 조건
    FOREIGN KEY: 부모 테이블의 PRIMARY KEY 창조 제약 조건
*/
CREATE TABLE dept4(
    dno NUMBER(2) CONSTRAINT dno_pk PRIMARY KEY,
    --CONSTRAINT (제약조건 이름) (제약조건 설정)
    dname VARCHAR2(15) DEFAULT '영업부',
    --DEFAULT: 아무값도 입력되지 않았을 경우 저장되는 데이터
    loc CHAR(1) CONSTRAINT loc_ck CHECK(loc IN('1', '2'))
    --1 또는 2만 입력받을 수 있음
    );
INSERT INTO dept4 (dno, loc)
VALUES (2, '1');
--dname을 입력하지 않아 '영업부'로 저장됨
SELECT * FROM dept4;
INSERT INTO dept4 (dno, loc)
VALUES (2, '3');
--loc의 제약 조건을 위배해 오류 발생
CREATE TABLE dept5(
    dno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(15) NOT NULL
    );
--부모테이블 dept5을 참조하는 자식 테이블
CREATE TABLE emp(
    empno NUMBER(4) PRIMARY KEY,
    enmae VARCHAR2(15) NOT NULL,
    dno NUMBER(2),
CONSTRAINT emp_dept5_fk FOREIGN KEY(dno)
    REFERENCES dept5(dno)
    );
SELECT * FROM dept5;
INSERT INTO dept5 (dno, dname) VALUES(1, '개발부');
INSERT INTO dept5 (dno, dname) VALUES(2, '기획부');
INSERT INTO dept5 (dno, dname) VALUES(3, '디자인부');
COMMIT;
SELECT * FROM emp;
INSERT INTO emp (empno, enmae, dno) VALUES(1, '마요이', 1);
INSERT INTO emp (empno, enmae, dno) VALUES(2, '아이라', 3);
COMMIT;
DELETE FROM emp
WHERE empno=1;
--자식 table 삭제는 문제 없음
ROLLBACK;

DELETE FROM dept5
WHERE dno=1;
--부모 table 삭제는 문제 있음
ROLLBACK;

DELETE FROM emp
WHERE empno=1;
DELETE FROM dept5
WHERE dno=1;
--자식 table 삭제 후 부모 table 삭제는 문제 없음
ROLLBACK;

--제약조건 검색
SELECT * FROM user_constraints
WHERE constraint_name='EMP_DEPT5_FK';

--제약조건 삭제
ALTER TABLE emp DROP CONSTRAINTS EMP_DEPT5_FK;

--제약조건 추가
ALTER TABLE emp ADD(
    CONSTRAINTS emp_dept5_fk FOREIGN KEY(dno) REFERENCES dept5(dno)
    );
COMMIT;



