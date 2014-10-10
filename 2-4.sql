--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 2-4: Print the p#s and average QTYs of parts that are supplied in an average QTY 
that is greater than the average QTY supplied of Red parts. Use a group by clause and a 
having clause in this solution. */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*In this statement, we are asking to print the p#(s) with their average quantity/ies 
from the spj table. Being that avg() is an aggregate function, a GROUP BY clause is 
required to group the results by whatever column is specified in the clause. 
Additionally, the HAVING clause is utilized in order to use the aggregate function avg() 
since the WHERE clause does not have this capability. The HAVING clause basically
serves the same purpose, aside from the aforementioned inability.*/

SET ECHO ON

/* 2-4 */
SELECT p#, avg(QTY) FROM spj
GROUP BY p# 
HAVING avg(QTY) > 
       (SELECT avg(QTY) FROM spj, p
        WHERE p.color = 'Red' 
          AND spj.p# = p.p#);