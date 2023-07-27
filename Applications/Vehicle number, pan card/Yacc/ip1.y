%{
#include <stdio.h>
#include <stdlib.h>

%}

%token ip NL

%%
STMT : IP NL  {printf("Valid ip address\n"); exit(0) ;}
     ;

IP: ip'.'ip'.'ip'.'ip 
          ;
          
%%

int yyerror(char *msg)
{
  printf("invalid ip address\n");
  exit(0);
}

int main() {
  printf("Enter ip address : ");
  yyparse();
  return 0;
}
