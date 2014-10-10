--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 1-5: Print the pairs of J#s such that there is a shipment for the first project 
having the same supplier and the same qty as a shipment for the second project.*/
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*Load Database*/ 
use canzalon_spjdatabase;

/* Description: This sql statement is a bit more complex in comparison to its
predecessors in this project. Here, we are trying to compare different columns
to one another in the same table, in the same statement. To do this, we must create
aliases of the appropriate columns to create binary conditions in the where-clause.
Dissecting the problem, we see that we will be printing pairs of Job #s that 
share the same supplier and quantity in a shipment. To do this, we must test for
equality in S#s and qty values, both of which are two different columns in the same
table. By declaring SPJ instances in our FROM clause, we can compare two instances of
the spj table together in our WHERE clause, and also keep seperate the j# pairs so as
to avoid duplicates and symmetric pairs being printed. There WHERE clause contains
the following statements which must ALL be true for results to be printed: matching
S#s, matching qty values, J#s that do not equal one another so as to avoid duplicate
entries, and only the J#s of the initial position of the pair being greater than their
successor J#s so as to avoid symmetric pairs being printed. */

SELECT DISTINCT SPJX.j#, SPJY.j# 
FROM SPJ SPJX, SPJ SPJY 
WHERE SPJX.s# = SPJY.s# AND SPJX.j# > SPJY.j# AND SPJX.qty = SPJY.qty AND SPJX.j# <> SPJY.j#;

