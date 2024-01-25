-- 14. DATA TYPES (데이터 타입)
-- 숫자, 문자, 날짜(시간) 타입이 있다.

-- 형변환
-- 1. 명시적 형변환
-- CAST, CONVERT
SELECT AVG(menu_price) FROM tbl_menu;
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) AS '평균 메뉴 가격'
FROM tbl_menu;
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) AS '평균 메뉴 가격'
FROM tbl_menu;

SELECT CAST('2023$5$30' AS DATE);
SELECT CAST('2023/5/30' AS DATE);
SELECT CAST('2023%5%30' AS DATE);
SELECT CAST('2023@5@30' AS DATE);

SELECT CONCAT(CAST(menu_price AS CHAR(5)), '원') FROM tbl_menu;

SELECT category_code, CONCAT(CAST(SUM(menu_price) AS CHAR(10)), '원')
FROM tbl_menu GROUP BY category_code;


SELECT '1' + '2'; -- 각 문자가 정수로 변환됨
SELECT CONCAT(menu_price, '원') FROM tbl_menu;
-- menu_price가 문자로 변환됨
SELECT 3 > 'MAY'; -- 문자는 0으로 변환된다.
