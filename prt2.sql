SELECT carrier, AVG(hour) as 'total' FROM flights
WHERE year = '2013'
GROUP BY carrier
ORDER BY total DESC limit 3;