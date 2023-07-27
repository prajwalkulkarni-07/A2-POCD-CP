%{
#include <stdio.h>
#include <stdlib.h>

%}

%token mac NL

%%
STMT : address NL  {printf("Valid ethernet address\n"); exit(0) ;}
     ;

address : mac ':' mac ':' mac ':' mac ':' mac ':' mac
    ;
%%

int yyerror(char *msg)
{
  printf("invalid ethernet address\n");
  exit(0);
}

int main() {
  printf("Enter ethernet address : ");
  yyparse();
  return 0;
}
