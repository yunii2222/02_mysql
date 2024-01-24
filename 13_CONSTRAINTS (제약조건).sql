-- 13. CONSTRAINTS (제약조건)
-- 테이블에 데이터가 입력 되거나 수정 될 때의 규칙을 정의 하며 데이터 무결성 보장에 도움이 된다.alter

-- 1. NOT NULL : 컬럼 값에 NULL을 허용하지 않는 제약조건
-- 컬럼 레벨에 작성

CREATE TABLE IF NOT EXISTS user_notnull (
    -- 무조건 값이 있어야 합니다.의 뜻
	user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
	phone VARCHAR(255) NOT NULL,
	email VARCHAR(255)
    -- 테이블 레벨
) ENGINE = INNODB;

INSERT INTO user_notnull (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(1, 'user01', 'pass01', '오나윤', '여', '010-9269-7551', 'ny990120@naver.com');
    
INSERT INTO user_notnull (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(2, 'user02', 'pass02', '박호범', '남', '010-9269-7551', 'ny990120@naver.com');
    
-- 들어간 데이터 조회
SELECT * FROM user_notnull;

-- NULL 삽입

INSERT INTO user_notnull (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
-- NOT NULL 제약조건 위반으로 넣으면 안된다.
	(3, 'user03', NULL, NULL, '남', '010-9269-7551', 'ny990120@naver.com');
    
-- 2. UNIQUE : 중복 값이 허용하지 않는 제약조건, 고유한 값만 담을 수 있다.
-- 컬럼레벨, 테이블레벨 작성
CREATE TABLE IF NOT EXISTS user_unique (
	user_no INT NOT NULL UNIQUE, -- 컬럼 레벨에 작성
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
	phone VARCHAR(255) NOT NULL,
	email VARCHAR(255),
    UNIQUE (phone), -- 테이블 레벨에 작성
    UNIQUE (email)
    -- 테이블 레벨
) ENGINE = INNODB;

INSERT INTO user_unique (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(1, 'user01', 'pass01', '오나윤', '여', '010-9269-7551', 'ny990120@naver.com');
    
INSERT INTO user_unique (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(2, 'user02', 'pass02', '박호범', '남', '010-9269-5555', 'ny990120@naver.com');
    
-- 들어간 데이터 조회
SELECT * FROM user_unique;

-- unique 제약조건 위반

INSERT INTO user_unique (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(3, 'user03', 'pass03', '박호범', '남', '010-9269-5555', 'ny990120@naver.com');
    


-- 3. PRIMARY KEY : 테이블에서 한 행의 정보를 찾기 위해 사용하는 컬럼
-- 테이블의 식별자 역할. NOT NULL + UNIQUE의 의미. 한 테이블 당 1개씩 설정.
-- 컬럼레벨, 테이블레벨 작성가능.(* 두 개 이상의 컬럼을 한 컬럼에 묶어서 사용 가능)
-- 한 개 컬럼을 대상으로 설정할 수도 있고, 여러 개의 컬럼을 묶어서 설정할 수도 있음.(pk(복합키줄임말) = 메뉴코드)
CREATE TABLE IF NOT EXISTS user_primartKey (
	user_no INT, -- PRIMARY KEY-- , -- 컬럼 레벨에 작성
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
	phone VARCHAR(255) NOT NULL,
	email VARCHAR(255),
	PRIMARY KEY (user_no) -- 테이블 레벨에 작성
    -- 테이블 레벨
) ENGINE = INNODB;

INSERT INTO user_primartKey (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(1, 'user01', 'pass01', '오나윤', '여', '010-9269-7551', 'ny990120@naver.com');
    
INSERT INTO user_primartKey (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(2, 'user02', 'pass02', '박호범', '남', '010-9269-5555', 'ny990120@naver.com');
    
-- 들어간 데이터 조회
SELECT * FROM user_primartKey;
    
-- primartKey 계약 조건위반 -----------------------------------------------------------------
INSERT INTO user_primartKey (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(2, 'user03', 'pass03', '박호범', '남', '010-9269-5555', 'ny990120@naver.com'); 
    
INSERT INTO user_primartKey (
	user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
	(NULL, 'user03', 'pass03', '박호범', '남', '010-9269-5555', 'ny990120@naver.com'); 
    
-- ----------------------------------------------------------------------------------------

-- 4. FOREIGN KEY : 참조 된 다른 테이블에서 제공하는 값만 사용할 수 있는 제약조건
-- 참조 무결성을 위배하지 않기 위해 사용. FK 제약조건에 의해 테이블 간의 관계가 형성.
-- 제공 값 이외에는 NULL값을 사용할 수 없음.     

DROP TABLE IF EXISTS user_grade;
CREATE TABLE IF NOT EXISTS user_grade (
	 grade_code INT NOT NULL UNIQUE,
	 grade_name VARCHAR(255) NOT NULL
	) ENGINE = INNODB;

INSERT INTO user_grade
VALUES
	(10, '일반회원'),
	(20, '우수회원'),
	(30, '특별회원');
SELECT * FROM user_grade;

-- user_geade 부모 테이블을 참조하는 자식테이블
-- user_grade 테이블을 먼저 생성
CREATE TABLE IF NOT EXISTS user_grade (
    grade_code INT PRIMARY KEY,
    grade_name VARCHAR(255) NOT NULL
) ENGINE = INNODB;

-- user_foreignkey1 테이블 생성
DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1 (
	 user_no INT PRIMARY KEY,
	 user_id VARCHAR(255) NOT NULL,
	 user_pwd VARCHAR(255) NOT NULL,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3),
	 phone VARCHAR(255) NOT NULL,
	 email VARCHAR(255),
	 grade_code INT ,
	FOREIGN KEY (grade_code)
	REFERENCES user_grade (grade_code)
	) ENGINE = INNODB;
INSERT INTO user_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
	(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);
SELECT * FROM user_foreignkey1;

-- foreign key 제약조건 에러 발생(참조 컬럼에 없는 값 적용)
INSERT INTO user_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES 
	(3, 'user03', 'pass03', '이순신', '남', '010-777-7777', 'lee222@gmail.com', 50);

-- 제약조건 확인용 테이블 생성 및 테스트 데이터 INSERT 후 조회하기3
-- (자식 테이블 - DELETE 삭제룰 있을 시 )
DROP TABLE IF EXISTS user_foreignkey2;
CREATE TABLE IF NOT EXISTS user_foreignkey2 (
	 user_no INT PRIMARY KEY,
	 user_id VARCHAR(255) NOT NULL,
	 user_pwd VARCHAR(255) NOT NULL,
	 user_name VARCHAR(255) NOT NULL,
	 gender VARCHAR(3),
	 phone VARCHAR(255) NOT NULL,
	 email VARCHAR(255),
	 grade_code INT ,
	 FOREIGN KEY (grade_code)
	REFERENCES user_grade (grade_code)
	 ON UPDATE SET NULL
	 ON DELETE SET NULL
	) ENGINE=INNODB;
INSERT INTO user_foreignkey2
	(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
	(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);
SELECT * FROM user_foreignkey2;


-- 1) 부모 테이블의 grade_code 수정
-- (user_foreignkey1 테이블 DROP하고 진행할 것(user_foreignkey에는 foreign key 제약조건에 수정 및 삭제룰 적용이 되지 않았기 때문)
DROP TABLE IF EXISTS user_foreignkey1;
UPDATE
	user_grade
SET 
	grade_code = null
WHERE 
	grade_code = 10;
-- 자식 테이블의 grade_code가 10이 었던 회원의 grade_code값이 NULL이 된 것을 확인
SELECT * FROM user_foreignkey2;

-- 2) 부모 테이블의 행 삭제
-- (user_foreignkey1 테이블 DROP하고 진행할 것(user_foreignkey에는 foreign key 제약조건에 수정 및 삭제룰 적용이 되지 않았기 때문)
DELETE FROM user_grade
WHERE 
	grade_code = 20;
-- 자식 테이블의 grade_code가 20이 었던 회원의 grade_code값이 NULL이 된 것을 확인
SELECT * FROM user_foreignkey2;

-- -----------------------------------------------------------------------------------------------

-- 5. CHECK : check 제약 조건 위반 시 허용하지 않는 제약 조건
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check (
	 user_no INT AUTO_INCREMENT PRIMARY KEY,
	 user_name VARCHAR(255) NOT NULL,
     -- 이 범위 안에 값만 저장할 것 이다.
	 gender VARCHAR(3) CHECK (gender IN ('남','여')),
	 age INT CHECK (age >= 19)
) ENGINE=INNODB;

INSERT INTO user_check
VALUES
	 (null, '신사임당', '여', 25),
	 (null, '이순신', '남', 33);
SELECT * FROM user_check;

INSERT INTO user_check 
VALUES 
	(null, '이순신', '남자', 44); -- gender check제약조건 위반

INSERT INTO user_check 
VALUES 
	(null, '이순신', '여', 16); -- gender check제약조건 위반

-- 6. DEFAULT : 컬럼에 NULL대신 기본 값을 적용할 수 있다.
DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country (
	country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국', -- 이 컬럼의 값이 없을때 '한국'으로 넣어라
    population VARCHAR(255) DEFAULT '0명',
	add_day DATE DEFAULT (current_date),
	add_time DATETIME DEFAULT (current_time) -- 현재 날짜로 처리
) ENGINE = INNODB;

INSERT INTO tbl_country
VALUES 
	(NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
SELECT * FROM tbl_country;

INSERT INTO tbl_country (country_name)
VALUES 
	('미국');
    
SELECT * FROM tbl_country;




    
    
