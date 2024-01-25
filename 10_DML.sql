 -- 10. DML (데이터 조작 언어)
-- 테이블에 값을 삽입(INSERT), 수정(UPDATE), 삭제(DELETE) 

-- 1. INSERT : 새로운 행을 추가하는 구문으로 테이블의 행의 수가 증가한다.
INSERT INTO tbl_menu 
VALUES 
	(NULL, '바나나해장국', 8500, 4, 'Y');
SELECT * FROM tbl_menu;

-- NULL 허용 가능 컬럼 또는 auto_increment 설정 된 컬럼을 제외하고 INSERT 할 컬럼을 지정해서 INSERT 가능
-- NULL값은 나눠져있음, 메뉴코드는 자동증가함

-- 제한이 없음
INSERT INTO
-- 여기에 해당하는 값만 넣겠다.
	tbl_menu (menu_name, menu_price, category_code, orderable_status)
VALUES 
	('초콜릿죽', 6500, 7, 'Y');
    
-- 컬럼을 명시할 경우 데이터의 순서를 바꾸는 것도 가능
INSERT INTO
	tbl_menu (orderable_status, menu_price, menu_name, category_code)
VALUES 
	('Y', 5500, '파인애플탕', 9);

-- multi insert (여러 행을 한 번에 삽입)
INSERT INTO
	tbl_menu
VALUES 
	(null, '참치맛아이스크림', 1700, 12, 'Y'),
	(null, '멸치맛아이스크림', 1500, 12, 'Y'),
	(null, '소세지맛커피', 2000, 8, 'Y');
    
SELECT * FROM tbl_menu;

-- ------------------------------------------------------------------

-- 2. UPDATE : 테이블에 기록 된 컬럼의 값을 수정하는 구문으로 행 개수의 변화는 없다.
SELECT 
	menu_code,
    category_code
FROM
	tbl_menu
WHERE
	menu_name = '파인애플탕';
-- 파인애플탕의 카테고리를 4에서 7로 수정
UPDATE
	tbl_menu
SET
-- 카테고리 코드를 7로 하겠다.
	category_code = 10
WHERE
	menu_code = 24;
-- 출력 확인코드
SELECT * FROM tbl_menu;

-- SUBQUERY를 활용한 UPDATE
-- MYSQL에서는 UPDATE, DELETE 시 자기 자신 테이블의 데이터를 사용하면 1093에러 발생
UPDATE
	tbl_menu
SET
	category_code = 6
WHERE
	menu_code = (SELECT
					tmp.menu_code
				FROM 
                -- 서브쿼리 한 번 더 사용
				(SELECT
					menu_code
				WHERE
					menu_name = '파인애플탕'
				)
			tmp);
            
-- ------------------------------------------------------------------
            
-- 3. DELETE : 테이블의 행을 삭제하는 구문으로 테이블의 행의 갯수가 줄어든다.
SELECT * FROM tbl_menu ORDER BY menu_price;
-- LIMIT을 활용한 행 삭제(offset 지정불가)
DELETE 
FROM 
	tbl_menu
ORDER BY 
	menu_price
LIMIT 2;

-- WHERE 절을 활용한 행 삭제
DELETE 
FROM 
	tbl_menu
WHERE
-- 24번이라는 메뉴코드를 지우겠다.
	menu_code = 24;
    
-- 해당 테이블 전체 행 삭제
DELETE FROM tbl_menu;

-- 4. REPLACE : 중복 된 데이터를 덮어 쓸 수 있는 기능
-- INSERT시 PRIMARY KEY 또는 UNIQUE KEY가 충돌이 발생할 때 사용 가능
INSERT INTO 
	tbl_menu
VALUES
-- menu_code(17) 중복으로 삽입불가
	(17, '참기름소주', 5000, 10, 'Y'); 
REPLACE INTO
	tbl_menu
VALUES
	(17, '참기름소주', 5000, 10, 'Y'); 
REPLACE -- INTO 생략가능
	tbl_menu
	VALUES
		(17, '참기름소주', 5000, 10, 'Y'); 

-- UPDATE 시 WHERE 구문 없이 UPDATE 가능
REPLACE	
	tbl_menu
SET
	menu_code = 2,
    menu_name = '우럭쥬스',
    menu_price = 2000,
    category_code = 9,
    orderable_status = 'Y';
    
        
	

