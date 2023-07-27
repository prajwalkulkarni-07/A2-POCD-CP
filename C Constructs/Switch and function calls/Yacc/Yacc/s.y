%{
#include <stdio.h>
#include <stdbool.h>
extern FILE* yyin;
extern int yylex();
extern int yyparse();
extern int yylineno;
extern char* yytext;

bool valid_input = true;

int yyerror(const char* s);

%}

%token SWITCH CASE DEFAULT BREAK LEFT_BRACE RIGHT_BRACE LEFT_PAREN RIGHT_PAREN SEMICOLON NUMBER IDENTIFIER COLON

%%

program : switch_stmt ;

switch_stmt : SWITCH LEFT_PAREN IDENTIFIER RIGHT_PAREN LEFT_BRACE case_list default_case RIGHT_BRACE ;

case_list : case_stmt
          | case_list case_stmt ;

case_stmt : CASE NUMBER COLON statement_list
          | CASE IDENTIFIER COLON statement_list ;

default_case : DEFAULT COLON statement_list
             | ;

statement_list : statement_list statement
               | statement ;

statement : BREAK SEMICOLON
          | /* other statements */ ;

%%

int yyerror(const char* s) {
    
    return -1;
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Usage: %s input_file\n", argv[0]);
        return -1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Failed to open input file '%s'\n", argv[1]);
        return -1;
    }

    yyparse();

    if (valid_input) {
        printf("valid\n");
    }

    fclose(yyin);

    return 0;
}
