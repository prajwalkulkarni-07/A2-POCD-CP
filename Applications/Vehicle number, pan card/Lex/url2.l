%{
#include"y.tab.h"
%}

%%
[a-z]{3,8} { return scheme; }
[w][w][w][.][a-z]{0,30}[.][a-z]{2,10}[.]{0,1}[a-z]{0,10} { return host; }
\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
