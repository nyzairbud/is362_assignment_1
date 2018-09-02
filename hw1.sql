
#How many airplanes have listed speeds?
#answer is 23
SELECT COUNT(*) FROM planes
WHERE coalesce(speed);

#What is the minimum listed speed
#answer is 90
SELECT MIN(speed) AS 'Min Speed'
FROM planes;

#What is the maximum listed speed
#answer is 432
SELECT MAX(speed) AS 'Max Speed'
FROM planes;

#What is the total distance flown by all of the planes in January 2013?
#answer is 27,188,805
SELECT SUM(distance) AS 'Total Distance' FROM flights
WHERE month = 1 and year = 2013;

#What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
# answer is none
SELECT SUM(distance) AS 'Total Distance', tailnum FROM flights
WHERE month = 1 AND year = 2013
AND 
tailnum IS NULL;

#what is the total  distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
#Write this statement first using an INNER JOIN, then using a LEFTOUTER JOIN. How do your results compare?
#answer the order changes between the two

SELECT planes. manufacturer, SUM(flights.distance) 
FROM flights 
INNER JOIN planes
ON planes.tailnum = flights.tailnum
WHERE flights.year = '2013' AND flights.month ='7' AND flights.day ='5' 
GROUP BY planes.manufacturer;


SELECT planes.manufacturer, SUM(flights.distance)
FROM flights
LEFT JOIN planes
ON planes.tailnum = flights.tailnum
WHERE flights.year = '2013' AND flights.month = '7' AND flights.day ='5'
GROUP BY planes.manufacturer;

#Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database
#What carrier had the longest flight?
#answer is YV with 14 hours and 28 minutes 
SELECT * FROM flights;

SELECT carrier, hour, minute FROM flights
GROUP BY CARRIER
ORDER BY hour DESC;


