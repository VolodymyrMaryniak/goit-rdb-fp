USE pandemic;

DELIMITER //

CREATE FUNCTION GetYearsFrom(year INT)
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE year_date DATE;
    DECLARE years_past INT;

    SET year_date = MAKEDATE(year, 1);
    SET years_past = TIMESTAMPDIFF(YEAR, year_date, NOW());

    RETURN years_past;
END //

DELIMITER ;

SELECT ic.Year, GetYearsFrom(ic.Year)
FROM infectious_cases as ic;
