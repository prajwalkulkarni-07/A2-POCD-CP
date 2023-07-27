%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}

%token INT
%token IDENTIFIER
%token IF ELSE RETURN
%left '>'
%nonassoc IFX


%%
program: function
        ;
function: type IDENTIFIER '(' params ')' compound_statement
         ;
params: type IDENTIFIER ',' params
      | type IDENTIFIER
      ;
type: INT
     ;
compound_statement: '{' statement_list '}' 
                  ;
statement_list: statement
              | statement statement_list
              ;
statement: if_statement
         | return_statement
         ;
if_statement: IF '(' expression ')' compound_statement ELSE compound_statement
            ;
return_statement: RETURN expression ';'
                 ;

expression: expression '>' expression %prec '>'
          | '(' expression ')'
          | IDENTIFIER
          | INT
          ;
%%

int main() {
 
  FILE *fp;
  fp=fopen("inp4.c","r");
  yyin=fp;
yyparse();
return 0;
}

int yyerror(char *msg)
{
  printf("error in c construct\n");
  exit(0);
}
