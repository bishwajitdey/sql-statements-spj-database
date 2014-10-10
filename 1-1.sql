--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
/* 1-1: Print P#s and PNAMEs of London parts having part weights of greater 
than 15 */
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

/*Load database*/
use canzalon_spjdatabase;

/* Description: This statement is to return the product# and product name values of the 
product table where the location of the product is located in London AND its weight is
greater than 15. */

SELECT p.p#, p.pname 
FROM p 
WHERE p.city='London' and p.weight > 15;