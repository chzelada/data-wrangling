Select * from heroes_information limit 10;
Select * from super_hero_powers limit 10;


#ejercicio 1
SELECT name, Publisher
FROM heroes_information;

# ejercicio 2
SELECT DISTINCT 
Publisher
from heroes_information;

## ejercicio 3
SELECT COUNT( DISTINCT Publisher)
from heroes_information;

## ejercicio 4
SELECT *
FROM heroes_information
WHERE Race = 'Human';

## ejercicio 5 
SELECT *
FROM heroes_information
WHERE Height >= 200;

## ejercicio 6
SELECT *
FROM heroes_information
WHERE Race='Human'
AND Height >= 200;

## ejercicio 7
SELECT COUNT(*)
FROM heroes_information
WHERE  Weight > 100
AND Weight < 200;

##ejercicio 8
SELECT COUNT(*)
FROM heroes_information
WHERE `Eye color` = 'blue'
OR `Eye color` = 'red';

##ejercicio 9
SELECT COUNT(*)
FROM heroes_information
WHERE  Weight > 100
AND Weight < 200;

###ejercicio 10
SELECT name, height, weight
FROM heroes_information
WHERE Height > 100
AND Weight > 200
ORDER BY height desc;

##ejercicio 11
SELECT publisher, gender, COUNT(*)
FROM heroes_information
WHERE gender = 'Female'
GROUP BY publisher
ORDER BY count(*) desc;

SELECT * 
FROM heroes_information
WHERE Alignment ='good'
GROUP BY Race
Having