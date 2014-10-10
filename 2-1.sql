--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 2-1: 1-2 re-done completely nested (i.e. using the in operator so as to avoid all 
JOIN clauses. */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*In order to avoid the use of JOIN clauses and equi-joins, the IN operator is used to
allow the specification of multiple conditions within the WHERE clause for the SQL 
statement. This allows us the ability to avoid JOIN clauses being that the respective 
p and j numbers are being inspected seperately via nested SQL statements, and being 
returned altogether.*/

SET ECHO ON

/* 2-1 */
SELECT DISTINCT s# FROM spj
WHERE (
        p# IN (SELECT p# FROM p
               WHERE weight > 15)
        AND  
        j# IN (SELECT j# FROM j
               WHERE city = 'London')
      );
      
