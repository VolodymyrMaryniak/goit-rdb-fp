USE pandemic;

SELECT 
	MAKEDATE(ic.Year, 1),
    NOW(),
    TIMESTAMPDIFF(YEAR, MAKEDATE(ic.Year, 1), NOW())
FROM infectious_cases as ic;
