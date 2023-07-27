%{
#include "y.tab.h"
%}

%%
[ \t\n]           /* Ignore whitespace and newlines */
[0-9]+            { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.str = strdup(yytext); return IDENTIFIER; }
.                 { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
