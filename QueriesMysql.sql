SELECT * FROM USAirlineFlights2.flights;

/* 1. Quantitat de registres de la taula de vols:*/

SELECT COUNT(*) FROM USAirlineFlights2.flights;

/* 2. Retard promig de sortida i arribada segons l’aeroport origen.*/

SELECT origin, AVG(DepDelay) AS Avg_DevDelay, 
AVG(ArrDelay) AS Avg_ArrDelay 
FROM USAirlineFlights2.flights GROUP BY origin; 

/* 3. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen. A més, volen que 
els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files): LAX, 2000, 01, 10.*/

SELECT origin, MONTH, YEAR, avg(DepDelay) AS Avg_DepDelay, avg(ArrDelay) as Avg_ArrDelay
FROM USAirlineFlights2.flights
GROUP BY origin, MONTH, YEAR;

/* 4. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa consulta 
que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es 
mostri el nom de la ciutat. Los Angeles, 2000, 01, retard; Los Angeles, 2000, 02, retard.*/

SELECT  b.airport, MONTH, YEAR, avg(DepDelay) as Avg_DepDelay, avg(ArrDelay)
FROM USAirlineFlights2.flights a
LEFT JOIN USAirlineFlights2.airports b ON a.origin = b.iata
GROUP BY b.airport, month, year;

/* 5. Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma 
que les companyies amb més cancel·lacions apareguin les primeres.*/

SELECT COUNT(cancelled), uniquecarrier
FROM flights 
WHERE cancelled > 0
GROUP BY uniquecarrier
ORDER BY count(cancelled) desc;

/* 6. L’identificador dels 10 avions que més distància han recorregut fent vols.*/

SELECT SUM(distance), tailnum
FROM flights 
GROUP BY tailnum
ORDER BY sum(distance) desc
LIMIT 10;

/* 7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben 
al seu destí amb un retras promig major de 10 minuts.*/

SELECT UniqueCarrier, avg(ArrDelay)
FROM flights
GROUP BY UniqueCarrier
HAVING avg(ArrDelay)>10;









