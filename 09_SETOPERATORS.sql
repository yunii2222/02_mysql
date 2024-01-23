-- 9. SET OPERATORS
-- SET 연산자는 2개 이상의 SELECT문의 결과 집합을 결합하는데 사용한다.
-- 단, 결합하는 결과 집합의 컬럼이 동일해야 한다.

-- (1) UNION
-- 두 개 이상의 SELECT 문의 결과를 결합하여 중복 된 레코드(행)를 제거한 후 반환하는 SQL 연산자
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 10
UNION
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code < 9000;
    
-- (2)UNION ALL
-- 두 개 이상의 SELECT 문의 결과를 결합하여 중복 된 레코드(행)를 제거하지 않고 모두 반환하는 SQL 연산자
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 10
UNION ALL
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code < 9000;
    
-- (3) INTERSECT
-- 두 개 이상의 SELECT 문의 결과 중 공통 되는 레코드 만을 반환하는 연산자
-- mysql은 INTERSECT 연산자를 제공하지 않는다. 단, INNER JOIN 또는 IN 연산자를 활용해서 구현 가능하다.
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 10
UNION ALL
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code < 9000;
	
