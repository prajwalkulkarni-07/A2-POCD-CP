%{
#include <stdio.h>
#include <stdlib.h>

%}

%token EMAIL NL

%%
STMT : em NL  {printf("Valid e-mail id\n"); exit(0) ;}
     ;

em: EMAIL
          ;
          
%%

int yyerror(char *msg)
{
  printf("invalid e-mail id\n");
  exit(0);
}

int main() {
  printf("Enter e-mail id: ");
  yyparse();
  return 0;
}
