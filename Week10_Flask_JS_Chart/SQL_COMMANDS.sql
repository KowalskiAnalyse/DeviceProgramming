SELECT * FROM data WHERE jaar = 2011 AND maand = 1;
SHOW COLUMNS FROM data;  
SELECT SUM(Aantal_werknemers) AS BOI FROM data GROUP BY jaar, maand;
