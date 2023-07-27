%{
#include"y.tab.h"
%}

%%
[a-z0-9]{1}[a-z0-9_.+-]{4,40}[a-z0-9]{1}[@][a-z]{2,15}[.][a-z]{2,10}[.]{0,1}[a-z]{0,10} { return EMAIL; }
\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
