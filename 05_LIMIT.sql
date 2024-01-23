-- LIMIT
-- SELECT문의 결과 집합에서 반환할 행의 수를 제한하는데 사용

--  전체 행 조회
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC;
    
-- 2번 행부터 5번행까지 조회
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC
    LIMIT 1,4;
-- LIMIT [offset,] row_count
-- offset : 시작할 행의 번호(인덱스 체계)
-- roe_count : 이후 행 부터 반환 받을 행의 개수