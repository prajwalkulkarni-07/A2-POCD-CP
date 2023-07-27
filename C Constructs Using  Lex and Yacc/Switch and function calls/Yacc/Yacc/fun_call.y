%{
#include <stdio.h>
#include<stdbool.h>
bool valid_input =true;
extern FILE *yyin;
#include <stdlib.h>
%}

%union {
    int num;
    char* str;
}

%token <num> NUMBER
%token <str> IDENTIFIER

%%

program: function_definitions function_calls
       ;

function_definitions: function_definition
                     | function_definitions function_definition
                     ;

function_definition: IDENTIFIER '(' parameter_list ')' ';'
                   ;

parameter_list: /* Empty parameter list */
              | parameter
              | parameter ',' parameter_list
              ;

parameter: IDENTIFIER
         ;

function_calls: function_call
              | function_calls function_call
              ;

function_call: IDENTIFIER '(' argument_list ')'
             | error '(' argument_list ')'
             ;

argument_list: /* Empty argument list */
             | argument
             | argument ',' argument_list
             ;

argument: NUMBER
        | IDENTIFIER
        ;

%%

int yyerror(const char* msg) {
    valid_input=false;   
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
        printf("Valid fun call according to the given function defintions in input.c\n");
    } else {
        printf("invalid fun call\n");
    }

    fclose(yyin);

    return 0;
}
