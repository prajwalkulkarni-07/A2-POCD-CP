%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "y.tab.h"
%}

%token NUMBER  ID NL SHIFT_LEFT LOGICAL_AND
%token  FLOAT_NUMBER

%left '+' '-'
%left '*' '/'
%left SHIFT_LEFT
%left LOGICAL_AND
%right '^' // Set '^' to have higher precedence (right-associative)


%%

stmt : exp NL { printf("Vaild Expression\n");printf("Value = %d\n", $1); return 0; } 
     ;

exp : exp '+' exp { $$ = $1 + $3; } 
    | exp '-' exp { $$ = $1 - $3; } 
    | exp '*' exp { $$ = $1 * $3; } 
    | exp '/' exp { if ($3 == 0) {
                       printf("Cannot divide by 0\n");
                       return 0;
                   } else {
                       $$ = $1 / $3;
                   }
                 }
    | exp SHIFT_LEFT exp { $$ = $1 << $3; }
    | exp LOGICAL_AND exp { $$ = $1 && $3; }
    | exp '^' exp { // Handle the exponentiation operator
        int base = $1;
        int exponent = $3;
        int result = 1;
        for (int i = 0; i < exponent; i++) {
            result *= base;
        }
        $$ = result;
    }
    | '-' exp %prec NEGATIVE { $$ = -$2; } 
    | '-' exp { $$ = -$2; }
    | '(' exp ')' { $$ = $2; } 
    | exp'('exp_list')'{$$=$1*$3;}
    | ID { $$ = $1; } 
    | NUMBER { $$=$1; } 
    | FLOAT_NUMBER { $$ = $1;} 
    ;
    
exp_list:exp
        |exp_list exp
        ;

%%

void yyerror(const char* msg) {
    fprintf(stderr, "Syntax error: %s\n", msg);
    exit(1);
}