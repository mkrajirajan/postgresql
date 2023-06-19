
--OLAP----
CREATE TABLE course1(
    course_name VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (course_name, segment)
);
INSERT INTO course1(course_name, segment, quantity)
VALUES
    ('Python','Basic ', 100),
	('Advanced python','Advanced',200),
    ('SQL', 'Basic', 200),
    ('Java', 'Basic', 100),
    ('Adavancced Java', 'Advanced', 300);
    
    	---Rollup---
SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    course1
GROUP BY
    ROLLUP (course_name, segment)
ORDER BY
    course_name,
    segment;
	
	---Partial Rollup
	SELECT
    segment,
    course_name,
    SUM (quantity)
FROM
    course1
GROUP BY
    segment,
    ROLLUP (course_name)
ORDER BY
    segment,
    course_name;
	
	
	------cube--
	
	SELECT
    course_name,
    segment,
    SUM (quantity)
FROM
    course1
GROUP BY
    CUBE (course_name, segment)
ORDER BY
    course_name,
    segment;
	
