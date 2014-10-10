--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 1-2: Print the unique amount of S#s of suppliers that supply a part with 
weight greater than 15 to a London project */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*Load database*/
use canzalon_spjdatabase;

/* Description: This statement will return the S#s of the suppliers that, according
to the foreign key relationships in the spj table, supply a product(s) to a London
project. In other words, the specific spj row must contain at least one product (p)
that both weighs more than 15 and is shipped to a London (j) project. The p (product)
table is first check for the specific p#s with satisfactory weight, then the job (j)
table is checked for the j#s that are located in the city of London. These values are
then compared in a join-clause against the spj table to find whether both criteria are 
met for each s# checked. */

SELECT DISTINCT SPJ.s# 
FROM j, p, spj 
WHERE p.weight > 15 AND
	  j.city = 'London' AND
	  spj.p# = p.p# AND
	  spj.j# = j.j#;

