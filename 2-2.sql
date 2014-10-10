--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 2-2: Redo 1-2 so as to not use a where clause (or a having clause) */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*Rather than use join clauses, we can let the SQL equi-joins do this for us by using 
JOIN and NATURAL JOIN, for example. The NATURAL JOIN will join all of the similarly
named columns of the tables being compared. The JOIN keyword allows us to get data 
from different tables based on relationships between certain columns in each of the 
tables. In this case, we are joining all of the p table rows that have weight 
values > 15, and we are joining the j table rows that have a city value of 'London'. 
Each of these is joined with the spj table, and is printed such that the similarly 
named columns of each of the tables are displayed via the NATURAL JOIN. */

SET ECHO ON

/* 2-2 */
SELECT DISTINCT s# FROM s 
NATURAL JOIN spj
JOIN p ON p.weight > 15 AND p.p# = spj.p#
JOIN j ON j.city = 'London' AND j.j# = spj.j#;