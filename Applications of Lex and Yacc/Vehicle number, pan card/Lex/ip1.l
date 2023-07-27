%{
#include"y.tab.h"
%}

%%
[0-9]|[1-9][0-9]|[1][0-9]{2}|[2][0-4][0-9]|[2][5][0-5] { return ip; }
\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
