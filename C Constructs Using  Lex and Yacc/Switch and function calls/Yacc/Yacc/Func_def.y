%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yylineno;
extern char* yytext;

void yyerror(const char* message) {
printf("Invalid function definition.\n"); 
    exit(1);
}

void yywarn(const char* message) {
printf("Invalid function definition.\n"); 
}
%}

%token INT RETURN IDENTIFIER LPAREN RPAREN COMMA COLON LBRACE RBRACE FLOAT

%%

input: function_definition { printf("Valid function definition.\n"); }
     | /* empty */ { printf("Invalid function definition.\n"); }
     ;

function_definition: INT IDENTIFIER LPAREN parameter_list RPAREN LBRACE statement RBRACE
                   ;

parameter_list: /* empty */
              | parameter
              | parameter_list COMMA parameter
              ;

parameter: INT IDENTIFIER
         ;

statement: RETURN expression ';'
         ;

expression: IDENTIFIER '+' IDENTIFIER
          | IDENTIFIER '-' IDENTIFIER
          | IDENTIFIER '*' IDENTIFIER
          | IDENTIFIER '/' IDENTIFIER
          ;

%%

int main() {
    printf("Enter the function definition: ");
    yyparse();
    return 0;
}

