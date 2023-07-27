%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char* s);
int valid_input_flag = 1;

%}

%union {
    char* str;
}

%token <str> IDENTIFIER
%token INT FLOAT CHAR VOID
%token LPAREN RPAREN COMMA SEMICOLON

%type <str> type_specifier
%type <str> declarator_list
%type <str> declarator
%type <str> parameter_list
%type <str> parameter_declaration

%%

declaration_list : declaration_list declaration
                  | declaration
                  ;

declaration : type_specifier declarator_list SEMICOLON
            { printf("Valid function declaration\n"); }
            | type_specifier declarator_list
            { printf("Invalid input: Missing semicolon\n"); valid_input_flag = 0; }
            ;

type_specifier : INT
               | FLOAT
               | CHAR
               | VOID
               ;

declarator_list : declarator
                | declarator COMMA declarator_list
                ;

declarator : IDENTIFIER LPAREN parameter_list RPAREN
           | IDENTIFIER LPAREN RPAREN
           ;

parameter_list : parameter_declaration
               | parameter_declaration COMMA parameter_list
               ;

parameter_declaration : type_specifier IDENTIFIER
                      ;

%%

void yyerror(const char* s) {
    printf("Error in function declaration\n");
    exit(EXIT_FAILURE);
}

int main() {
    yyparse();
    if (valid_input_flag) {
        printf("Invalid input: Missing semicolon\n");
    }
    return 0;
}
