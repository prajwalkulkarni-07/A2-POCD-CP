LEX  PROGRAM
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h" // Include the Yacc-generated header file

extern FILE* yyin; // Declare yyin as an external variable
%}

%%
int           { return INT; }
float         { return FLOAT; }
while         { return WHILE; }
if            { return IF; }
else          { return ELSE; }
[0-9]+        { yylval.str_val = strdup(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*   { yylval.str_val = strdup(yytext); return IDENTIFIER; }
"<="          { return LESS_EQUAL; }
";"           { return SEMICOLON; }
"="           { return ASSIGN; }
"{"           { return OPEN_BRACE; }
"}"           { return CLOSE_BRACE; }
[ \t\n]       ; // Ignore whitespace and newlines
.             { return yytext[0]; } // Any other character

%%

int yywrap() {
    return 1;
}
