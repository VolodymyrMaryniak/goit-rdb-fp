USE pandemic;

SELECT 
	e.entity_name, 
	e.entity_code, 
    AVG(ic.Number_rabies), 
    MIN(ic.Number_rabies), 
    MAX(ic.Number_rabies), 
    SUM(ic.Number_rabies)
FROM infectious_cases as ic
	INNER JOIN entities as e ON e.id = ic.entity_id
WHERE ic.Number_rabies IS NOT NULL
GROUP BY entity_id
ORDER BY AVG(ic.Number_rabies) DESC
LIMIT 10;



