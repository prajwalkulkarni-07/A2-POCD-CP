%{
#include "y.tab.h"
%}

%%
"switch"    { return SWITCH; }
"case"      { return CASE; }
"default"   { return DEFAULT; }
"break"     { return BREAK; }
"{"         { return LEFT_BRACE; }
"}"         { return RIGHT_BRACE; }
"("         { return LEFT_PAREN; }
")"         { return RIGHT_PAREN; }
";"         { return SEMICOLON; }
[A-Za-z]+   { return IDENTIFIER; }
[0-9]+      { return NUMBER; }
.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
