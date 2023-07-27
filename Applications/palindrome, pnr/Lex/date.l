%{
  #include "y.tab.h"
%}

%%
[0-9] {return digit;}
\n {return NL;}
. {return yytext[0];}
%%
