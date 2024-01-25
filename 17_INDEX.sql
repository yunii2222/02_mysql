-- 17. INDEX

-- 사용데이터 만들기 S --
CREATE TABLE phone (
	phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10,2)
);

INSERT INTO
	phone
VALUES
	(1, 'galaxyS23', 12000000),
	(2, 'iphone14pro', 18000000),
	(3, 'iphone13mini', 9000000);

SELECT * FROM phone;
-- 사용데이터 만들기 E --

-- INDEX가 없는 컬럼을 WHERE절의 조건으로 활용한 조회
EXPLAIN SELECT * FROM 
	phone 
WHERE 
	phone_name = 'galaxyS23';
    
-- phone_name 컬럼에 INDEX 생성
CREATE INDEX 
	idx_name 
ON 
	phone (phone_name);

-- INDEX테이블 조회하는 구문
SHOW INDEX FROM phone;

-- 2개 이상의 컬럼을 한 번에 하나의 인덱스로 설정해서 생성할 수 있다.
CREATE INDEX 
	idx_name_price
ON 
	phone(phone_name, phone_price);

-- INDEX테이블 조회하는 구문
SHOW INDEX FROM phone;

-- INDEX가 생성된 컬럼을 WHERE절의 조건으로 활용한 조회
EXPLAIN SELECT * FROM 
	phone 
WHERE 
	phone_name = 'galaxyS23';
    
    
