%{
#include <stdio.h>
#include <stdlib.h>
%}

%token digit NL

%%
st : st S NL {printf("Valid\n");}
   | S NL    {printf("Valid\n");}
   ;
S  : digit digit digit digit digit digit digit digit digit digit
   ;
%%


int yyerror(char *msg)
{
  printf("Invalid\n");
  exit(0);
}

int main()
{
  printf("Enter PNR number\nNOTE: A valid PNR ID is a 10 digit number\n");
  yyparse();
return 0;
}
