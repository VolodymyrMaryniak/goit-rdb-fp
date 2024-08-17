USE pandemic;

CREATE TABLE entities (
	id INT NOT NULL AUTO_INCREMENT,
    entity_name VARCHAR(50) NOT NULL,
    entity_code VARCHAR(10) NULL,
    PRIMARY KEY (id)
);

INSERT INTO entities (entity_name, entity_code)
SELECT DISTINCT Entity, Code FROM infectious_cases;

ALTER TABLE infectious_cases
ADD entity_id INT NULL;

UPDATE infectious_cases as ic
JOIN entities e
ON ic.Entity = e.entity_name
AND COALESCE(ic.Code, '') = COALESCE(e.entity_code, '')
SET ic.entity_id = e.id;

ALTER TABLE infectious_cases
MODIFY entity_id INT NOT NULL;

ALTER TABLE infectious_cases
DROP COLUMN Entity;

ALTER TABLE infectious_cases
DROP COLUMN Code;
