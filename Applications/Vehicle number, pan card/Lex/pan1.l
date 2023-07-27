%{
#include"y.tab.h"
%}

%% 
[A-Z]{5}[0-9]{4}[A-Z]{1} { return pan; }

\n { return NL; }
. { return yytext[0]; }

%%

int yywrap() {
  return 1;
}
