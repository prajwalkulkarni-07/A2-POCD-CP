 /*                  
NAME	             USN                   ROLL NO
ANKIT KUMAR 	     01FE21BCS241          145
VATS SHIVAM 	     01FE21BCS207          137
SAMARTH  PAI	     01FE21BCS263          158
RUTUJ  PATIL	     01FE21BCS325          154

*/

/*
Under the Guidance:
Prof. Jayalaxmi G N
Asst. Prof. Kavya Kori
*/


%{
#include "y.tab.h"
%}

%%
"0"    { return ZERO; }
"1"    { return ONE; }
.      { /* ignore all other characters */ }
\n     { return NL ; }
%%

int yywrap() {
    return 1;
}

