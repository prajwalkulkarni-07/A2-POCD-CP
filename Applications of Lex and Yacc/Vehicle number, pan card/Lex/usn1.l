%{
#include"y.tab.h"
%}

%%
[0][1][F][E][0-9]{1}[1-9]{1}[A-Z]{3}[0-9]{2}[1-9]{1} { return USN; }
[0][1][f][e][0-9]{1}[1-9]{1}[a-z]{3}[0-9]{2}[1-9]{1} { return usn; }
\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
