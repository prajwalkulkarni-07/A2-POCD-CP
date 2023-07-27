%{
#include "y.tab.h"
%}

%%

"int"   { return INT; }
"float" { return FLOAT; }
"char"  { return CHAR; }
"void"  { return VOID; }
"("     { return LPAREN; }
")"     { return RPAREN; }
","     { return COMMA; }
";"     { return SEMICOLON; }
[A-Za-z][A-Za-z0-9_]*   {  yylval.str = strdup(yytext); return IDENTIFIER; }
[ \t\n]                 ; /* skip whitespace */

.   { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
