%{
#include "y.tab.h"
%}

%%
"("           { return LPAREN; }
")"           { return RPAREN; }
","           { return COMMA; }
":"           { return COLON; }
"{"           { return LBRACE; }
"}"           { return RBRACE; }
"int"         { return INT; }
"float"       { return FLOAT;}
"return"      { return RETURN; }
[(){};=,]     { return yytext[0]; }
[ \t\n]       ; /* Skip whitespace and newlines */
[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }
.             { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}
