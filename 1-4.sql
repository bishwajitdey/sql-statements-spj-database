--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/*Problem 4: Print the S#s of suppliers that supply a part with 
weight greater than 15 but that do not supply a London project.*/
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*Load Database*/ 
use canzalon_spjdatabase;

/*
Description: 
-The first (SELECT..) statement finds the P#s that have weights greater than 15 AND 
that are also located in the spj table, the second condition being necessary to ensure 
that only parts located in the combined foreign key, spj, table are considered.
-The second (SELECT..) statement finds the projects (jobs) that supply to London AND
if those specific j#s reside in the spj table and where.
-This is where this statement differs from problem 3. Here, the EXCEPT sql keyword
is used to deduct from the results of the sql statement that came before it. In other
words, the first select statement finds the p#s of the products with weight greater 
than 15 located in the spj table, and the EXCEPT keyword minuses from these results
all of the same entries that include (in the same row) j#s that have products shipping
to London in the spj table.
*/

(SELECT spj.s# 
 FROM p, spj 
 WHERE p.weight > 15 AND spj.p# = p.p#)
EXCEPT
(SELECT spj.s# 
 FROM j, spj 
 WHERE j.city = 'London' AND spj.j# = j.j#);