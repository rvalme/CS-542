SELECT *
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian');

SELECT *
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegan');

SELECT *
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Paleolithic');
                
SELECT R.Carbs,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Paleolithic')
ORDER BY R.Carbs desc;

SELECT R.Carbs,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian')
ORDER BY R.Carbs desc;

SELECT R.Carbs,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegan')
ORDER BY R.Carbs desc;

SELECT R.sugar,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Paleolithic')
ORDER BY R.sugar desc;

SELECT R.sugar,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian')
ORDER BY R.sugar desc;

SELECT R.sugar,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegan')
ORDER BY R.sugar desc;

SELECT R.FAT,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Paleolithic')
ORDER BY R.FAT desc;

SELECT R.FAT,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian')
ORDER BY R.FAT desc;

SELECT R.FAT,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegan')
ORDER BY R.FAT desc;

SELECT R.PROTEIN,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Paleolithic')
ORDER BY R.PROTEIN desc;

SELECT R.PROTEIN,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian')
ORDER BY R.PROTEIN desc;

SELECT R.PROTEIN,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegan')
ORDER BY R.PROTEIN desc;

SELECT R.Calories,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Paleolithic')
ORDER BY R.Calories desc;

SELECT R.Calories,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian')
ORDER BY R.Calories desc;

SELECT R.Calories,R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegan')
ORDER BY R.Calories desc;

SELECT *
FROM Recipe R
WHERE R.CARBS = (SELECT MAX(R.CARBS)
FROM Recipe R
where R.RID IN (SELECT R.RID
FROM SubscribesTo S
WHERE S.Type_of_diet = 'Paleolithic'));

SELECT sum(C.Quantity*R.Money_Cost) AS price
FROM Recipe R, Canrequest C
WHERE R.RID = C.RID;

SELECT R.RNAME
FROM Recipe R
MINUS
SELECT R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT M.RID
FROM MAKESUP M
WHERE M.INAME = 'Carrot');

SELECT R.RNAME
FROM Recipe R
MINUS
SELECT R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT M.RID
FROM MAKESUP M
WHERE M.INAME = 'Kale');

SELECT R.RNAME
FROM Recipe R
MINUS
SELECT R.RNAME
FROM Recipe R
WHERE R.RID IN (SELECT M.RID
FROM MAKESUP M
WHERE M.INAME = 'Pecan');

SELECT DISTINCT *
FROM Recipe R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian')
MINUS
SELECT *
FROM Recipe R
WHERE
R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian')
AND
R.RID IN (SELECT M.RID
FROM MAKESUP M
WHERE M.INAME = 'Pecans');


SELECT *
FROM RECIPE R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegetarian') AND R.CARBS<50;

SELECT *
FROM RECIPE R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Vegan') AND R.CALORIES<100;

SELECT *
FROM RECIPE R
WHERE R.RID IN (SELECT S.RID
                FROM SubscribesTo S
                WHERE S.Type_of_diet = 'Paleolithic') AND R.Fat<20;

UPDATE CanRequest C
SET C.QUANTITY = C.QUANTITY+1
WHERE C.CID = 'C01';


