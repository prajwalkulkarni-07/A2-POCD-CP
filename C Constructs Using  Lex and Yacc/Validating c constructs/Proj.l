%{
#include "y.tab.h"
extern YYSTYPE yylval;
extern FILE* yyin;
%}

%%
[ \t\n]      ;
"int"|"float"|"char"|"double"        { yylval.string = strdup(yytext); return DATATYPE; }
[a-zA-Z][a-zA-Z0-9]*    {yylval.string = strdup(yytext); return IDENTIFIER; }
[0-9]+       { yylval.number = atoi(yytext); return NUMBER; }
","          { return COMMA; }
";"          { return SEMICOLON; }
"="          { return EQUAL; }
"["          { return LBRACKET; }
"]"          { return RBRACKET; }
.            { return yytext[0]; }
%%

int yywrap() {
    return 1;
}

