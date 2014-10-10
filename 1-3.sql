--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 1-3: Print the S#s of suppliers that supply a part with weight greater 
than 15 and that also supply a London project. */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*Load database*/
use canzalon_spjdatabase;

/*
Description: 
-The first (SELECT..) statement finds the P#s that have weights greater than 15 AND 
that are also located in the spj table, the second condition being necessary to ensure 
that only parts located in the combined foreign key, spj, table are considered.
-The second (SELECT..) statement finds the projects (jobs) that supply to London AND
if those specific j#s reside in the spj table and where.
-Essentially, the INTERSECT keyword returns the distinct values that satisfy both 
SELECT.. statements. This basically includes part numbers with weights > 15 AND that 
ALSO supply to London projects/jobs. The suppliers meeting this criteria are found via
cross-referencing in the spj table and are printed accordingly. The difference in this
statement from 1-2 is that supplier #s who have products that weigh more than
15 AND that are also able to distribute to london projects are included, and not 
necessarily specific products that fulfill the weight req. and ship to London locations.
*/

(SELECT spj.s# 
 FROM p, spj 
 WHERE p.weight > 15 AND spj.p# = p.p#)
INTERSECT
(SELECT spj.s# 
 FROM j, spj 
 WHERE j.city='London' AND spj.j# = j.j#);