--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 2-3: Print the p#s of parts that are not supplied by a supplier with status = 20. */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*In order to print all p#s of parts except for the ones not by a supplier with 
status = 20, one could use the MINUS query. This query returns all of the rows asked 
for in the first sql SELECT statement that are not returned by the sql SELECT statement
that comes after it. Here, the first statement returns every one of the p#s from the p 
table. The second statement returns all of the p#s that share orders on the spj table 
with suppliers that have a status of 20. The MINUS query between them gives us every p# 
except for (minus) the ones supplied by a supplier with status being 20. */

SET ECHO ON

/* 2-3 */
(SELECT p# FROM p)
MINUS
(SELECT spj.p# FROM spj, s
 WHERE s.status = 20 AND spj.s# = s.s#);