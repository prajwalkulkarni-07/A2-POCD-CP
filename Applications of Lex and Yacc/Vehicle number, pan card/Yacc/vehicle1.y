%{
#include <stdio.h>
#include <stdlib.h>
%}

%token vehicle NL

%%
STMT : vehicle_no NL  {printf("Valid vehicle number\n");exit(0);}
     ;

vehicle_no: vehicle
          ;

%%

int yyerror(char *msg)
{
  printf("invalid vehicle number\n");
  exit(0);
}

int main() {
  printf("Enter vehicle number: ");
  yyparse();
  return 0;
}
