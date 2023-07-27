%{
#include"y.tab.h"
%}
%%
[0-9a-f]{2} { return mac; }

\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
