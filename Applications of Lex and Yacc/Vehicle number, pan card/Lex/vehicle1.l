%{
#include"y.tab.h"
%}

%%
[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4} { return vehicle; }
\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
