%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"

extern FILE* yyin; 
%}

%%

[0-9]+          { yylval = atof(yytext); return NUMBER; }
[a-zA-Z_]+      { yylval = strdup(yytext); return ID; }
[0-9]+\.[0-9]+  { yylval = atof(yytext); return FLOAT_NUMBER; }
"\n"            { return NL; }
"<<"            { return SHIFT_LEFT; }
"&&"            { return LOGICAL_AND; }
"^"            { return '^'; } 
.               { return yytext[0]; }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* inputFile = fopen(argv[1], "r");
    if (inputFile == NULL) {
        printf("Error opening the input file\n");
        return 1;
    }

    
    yyin = inputFile;

    //printf("Enter the expression:\n");
    yyparse();

    fclose(inputFile);
    return 0;
}
