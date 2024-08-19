SELECT count(*) FROM club	soccer_3
SELECT count(*) FROM club	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Wins_count  >  2	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Wins_count  >  2	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
