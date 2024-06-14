/*
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.*/
--Check full question: https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

/*Using self Join*/
SELECT W1.ID
    FROM WEATHER W1 JOIN WEATHER W2
                    ON W1.recordDate = DATEADD(DAY,1,W2.RECORDDATE)
                    WHERE W1.temperature > W2.temperature


/*Using window function*/

WITH CTE AS(
SELECT ID, RECORDDATE,temperature,
        LAG(temperature) OVER (ORDER BY RECORDDATE) AS PREVIOUSDAYTEMP
        FROM WEATHER)
        SELECT ID FROM CTE WHERE temperature> PREVIOUSDAYTEMP 
