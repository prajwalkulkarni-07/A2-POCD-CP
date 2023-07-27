%{
#include <stdio.h>
#include <stdlib.h>

%}

%token NUMBER NL code

%%
STMT : mobile_no NL  {printf("Valid moblie number\n"); exit(0);}
     ;

mobile_no : '+'code' ' NUMBER 
          ;
          
%%

int yyerror(char *msg)
{
  printf("invalid mobile number\n");
  exit(0);
}

int main() {
  printf("Enter mobile number: ");
  yyparse();
  return 0;
}
