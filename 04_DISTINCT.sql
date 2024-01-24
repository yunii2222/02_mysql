-- 4. DISTINCT
-- 중복 값을 제거 하는데 사용한다. 컬럼에 있는 컬럼 값의 종류를 쉽게 파악할 수 있다.

SELECT
	category_code
FROM
	tbl_menu
ORDER BY
	category_code;
    
    
-- 단일열 DISTINCT 사용
SELECT
	DISTINCT category_code
FROM
	tbl_menu
ORDER BY
	category_code;
    
-- NILL 값을 포함한 열의 DISTINCT 사용
SELECT
	DISTINCT ref_category_code
FROM
	tbl_category;
    
-- 다중열 DISTINCT사용
SELECT
	DISTINCT category_code,
    orderable_status
FROM
	tbl_menu;
