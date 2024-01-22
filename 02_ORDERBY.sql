-- 2. ORDER BY
-- SELECT문과 함께 사용하며 결과 집합을 특정 열이나 열들의 값에 따라 정렬하는데 사용

-- 결과 집합을 하나의 열로 정렬
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
-- menu_price ASC;  --ASC는 오름차순이며 기본 설정 값
	menu_price ASC;
    
-- -----------------------------------------------------
    
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
-- menu_price DESC;  --DESC는 내림차순이며 생략 불가능
	menu_price DESC;
    
-- 결과 집합을 여러 열로 정렬
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	-- 가격은 내림차순으로 정렬하고,
	menu_price DESC,
    -- 메뉴 이름은 오름(가나다..)차순으로 하겠다.
    menu_name ASC;
    
-- -----------------------------------------------------
    
-- 연산 결과로 결과 집합 정렬
SELECT
	menu_code,
    menu_price,
    menu_code * menu_price
FROM
	tbl_menu
ORDER BY
	menu_code * menu_price;
    
-- -----------------------------------------------------
    
-- 사용자 지정 목록을 사용하여 데이터 정렬
-- 첫 번째 인자의 값이 두 번째 인자 이후의 값과 일치하면 해당 위치 값을 변환
SELECT FIELD('A', 'A', 'B', 'C');
SELECT FIELD('B', 'A', 'B', 'C');
SELECT FIELD('C', 'A', 'B', 'C');
SELECT 
	FIELD(orderable_status,'N','Y')
FROM
	tbl_menu;
    
SELECT
	menu_name,
    orderable_status
FROM
	tbl_menu
ORDER BY
	FIELD(orderable_status,'N','Y');
    
-- -----------------------------------------------------

-- null 값이 있는 컬럼에 대한 정렬
-- 오름차순 설정 시 null 값이 처음으로(기본설정)
SELECT 
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code ASC;
    
-- 오름차순 설정 시 null값이 마지막으로
SELECT 
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code IS NULL ASC;
    
-- 내림차순 설정 시 null값이 마지막으로    
SELECT 
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code DESC;
    
-- 내림차순 설정 시 null값이 처음으로
SELECT 
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
ORDER BY
	ref_category_code IS NULL DESC, ref_category_code DESC;