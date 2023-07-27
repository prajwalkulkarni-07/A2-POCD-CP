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
#include"y.tab.h"
%}

%%
[a]       {return atoken;}
[b]       {return btoken;}
[c]       {return ctoken;}     
[d]       {return dtoken;}
\n        {return NL;}
.         {return yytext[0];}
%%
