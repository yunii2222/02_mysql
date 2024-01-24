-- 12. DDL(데이터 정의 언어)

-- 1. CREATE
-- IF NOT EXISTS : 기존에 존재하는 테이블이 있어도 오류가 발생하지 않음.
CREATE TABLE IF NOT EXISTS tb1(
	pk INT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
    
    ) ENGINE = INNODB;
    
-- 테이블 구조 확인
DESCRIBE tb1;

-- INSERT 테스트
INSERT INTO tb1 VALUES(1, 10, 'Y');
-- 들어간 데이터 조회
SELECT * FROM tb1;

-- 2. AUTO_INCREMENT : INSERT 시 PRIMARY KEY에 해당하는 컬럼에 자동으로 번호를 발생 시켜 중복 되지 않는 값을 만들 수 있다.
CREATE TABLE IF NOT EXISTS tb2(
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
    
    ) ENGINE = INNODB;

-- 테이블 구조 확인 (두번째 테이블이 잘 들어갔는지)
DESCRIBE tb2;

-- -------------------------------------------------------------

-- INSERT 테스트
INSERT INTO tb2 VALUES (NULL, 10, 'Y');
INSERT INTO tb2 VALUES (NULL, 20, 'Y');
SELECT * FROM tb2;

-- 3.ALTER : 테이블에 추가, 변경, 수정, 삭제하는 모든 명령어는 ALTER를 사용해 적용
-- (1) 열 추가 : ALTER TABLE 테이블명 ADD 컬럼명 컬럼정의
ALTER TABLE tb2
ADD col2 INT NOT NULL;

-- 테이블 구조 확인
DESCRIBE tb2;

-- -------------------------------------------------------------

-- (2) 열 삭제 : ALTER TABLE 테이블명 DROP COLUMN 컬럼명
ALTER TABLE tb2
DROP COLUMN col2;

-- 테이블 구조 확인
DESCRIBE tb2;

-- -------------------------------------------------------------

-- (3) 열 이름 및 데이터 형식 변경
-- : ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 바꿀컬럼명 컬럼정의

ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

-- 테이블 구조 확인
DESCRIBE tb2;

-- -------------------------------------------------------------

-- (4) 열 제약 조건 추가 및 삭제
-- : ALTER TABLE 테이블명 DROP 제약 조건
ALTER TABLE tb2
DROP PRIMARY KEY;
-- 에러 발생 : auto_increment 걸려 있는 컬럼에서 pk제약조건 불가
-- auto_increment 조건을 MODIFY 명령어로 먼저 제거 한다.alter
ALTER TABLE tb2
-- MODIFY : 컬럼의 정의 변경
MODIFY pk INT;

-- 테이블 구조 확인
DESCRIBE tb2;

-- auto_increment제약 제거 후에 다시 PRIMARY KEY지울게요~
ALTER TABLE tb2
DROP PRIMARY KEY;

-- 테이블 구조 확인
DESCRIBE tb2;

-- 제약조건 추가 : ALTER TABLE 테이블명 ADD 제약조건
ALTER TABLE tb2
ADD PRIMARY KEY(pk);

-- 테이블 구조 확인
DESCRIBE tb2;

-- -------------------------------------------------------------

-- (5) 컬럼 여러개 추가하기
-- : ALTER TABLE 테이블명
ALTER TABLE tb2
ADD col3 DATE NOT NULL,
ADD col4 INT NOT NULL;

-- DATE 타입이 0으로 추가 되지 않는 설정을 수정한다.
SELECT @@GLOBAL.sql_mode;
SET GLOBAL sql_model = ''; -- root 계정으로 접속해서 실행

-- 테이블 구조 확인
DESCRIBE tb2;

-- 4. DROP : 테이블을 삭제하는 구문
CREATE TABLE IF NOT EXISTS tb4(
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
    
    ) ENGINE = INNODB;
    
    CREATE TABLE IF NOT EXISTS tb5(
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
    
    ) ENGINE = INNODB;
    
DROP TABLE IF EXISTS tb4, tb5;
     
-- 테이블 구조 확인
DESCRIBE tb2;

-- 5. TRUNCATE (초기화시키고싶다.)
-- : 테이블에 존재하는 모든 데이터 제거
-- DELETE는 행을 하나씩 지우지만 TRUNCATE는 DROP 이후 테이블을 재생성 해주므로 효율적이다ㅏ.


