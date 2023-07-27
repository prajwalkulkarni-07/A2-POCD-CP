%{
#include"y.tab.h"
%}

%%
[0-9]{2} { return code; }
[1-9]{1}[0-9]{9} { return NUMBER; }
\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
