SELECT ORIGIN_AIRPORT AS potential_hub
FROM red_flights
WHERE AIRLINE IN ("AA", "DL", "UA", "WN")
AND ORIGIN_AIRPORT IN (
    SELECT DESTINATION_AIRPORT
    FROM red_flights
    GROUP BY DESTINATION_AIRPORT
    HAVING CHAR_LENGTH(DESTINATION_AIRPORT) <= 3 AND AVG(ARRIVAL_DELAY) <= 15
)
GROUP BY ORIGIN_AIRPORT
ORDER BY COUNT(ORIGIN_AIRPORT) DESC
LIMIT 15;
