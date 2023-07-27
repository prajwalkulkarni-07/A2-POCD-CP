%{
#include <stdio.h>
#include <stdlib.h>

%}

%token pan NL

%%
STMT : Pan NL  {printf("Valid PAN card number\n");exit(0);}
     ;

Pan : pan
    ;

%%

int yyerror(char *msg)
{
  printf("invalid PAN card number\n");
  exit(0);
}

int main() {
  printf("Enter PAN card number: ");
  yyparse();
  return 0;
}
