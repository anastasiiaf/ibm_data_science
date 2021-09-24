--1. List the case number, type of crime and community area for all crimes in community area number 18.
SELECT CCD.case_number, CCD.primary_type, CD.community_area_name
FROM CHICAGO_CRIME_DATA CCD
INNER JOIN CENSUS_DATA CD
ON CCD.community_area_number=CD.community_area_number
WHERE CCD.community_area_number=18;

--2.List all crimes that took place at a school. Include case number, crime type and community name.
SELECT CCD.case_number, CCD.primary_type, CD.community_area_name
FROM CHICAGO_CRIME_DATA CCD
LEFT JOIN CENSUS_DATA CD
ON CCD.community_area_number=CD.community_area_number
WHERE UCASE(CCD.location_description) LIKE '%SCHOOL%';

--3.For the communities of Oakland, Armour Square, Edgewater and CHICAGO list the associated community_area_numbers and the case_numbers.
SELECT CCD.case_number, CCD.community_area_number, CD.community_area_name
FROM CHICAGO_CRIME_DATA CCD
FULL OUTER JOIN CENSUS_DATA CD
ON CCD.community_area_number=CD.community_area_number
WHERE CD.community_area_name IN ('Oakland', 'Armour Square', 'Edgewater', 'CHICAGO');