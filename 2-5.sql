--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 2-5: Redo 2-4 so as to not have a group by clause or a having clause */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*In order to use an aggregate function without the use of the GROUP BY or HAVING 
clauses, one needs to take advantage of nesting the sql statements in a way
that avoids having the functions be called directly from a WHERE clause. Additionally, 
without the use of the GROUP BY clause, we are not able to dictate how the results will 
be printed and so we are not able to have an aggregator function and a column 
expression listed together under the SELECT clause. To remedy this, an entire SQL 
statement is nested within the SELECT clause to have the value returned to the SELECT
list, making it so it never directly encounters the function itself.*/

SET ECHO ON

/* 2-5 */
SELECT p.p# , (SELECT avg(QTY) FROM spj WHERE spj.p# = p.p#) FROM p
WHERE (SELECT avg(QTY) FROM spj 
       WHERE spj.p# = p.p#)
       >
      (SELECT avg(QTY) FROM spj, p 
       WHERE p.color = 'Red' AND spj.p# = p.p#);