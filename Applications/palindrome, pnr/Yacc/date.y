%{
#include <stdio.h>
#include <stdlib.h>
%}

%token digit NL

%%
st : st Date NL {printf("Valid Date\n");}
   | Date NL    {printf("Valid Date\n");}
   ;
Date : D '/' M '/' Y
     ;
D    : digit
     | digit digit
     ;
M    : digit
     | digit digit
     ;
Y    : digit digit digit digit  
     ;
%%


int yyerror(char *msg)
{
  printf("Invalid Date\n");
  exit(0);
}

int main()
{
  printf("Enter Date:\nDate Format(DD/MM/YYYY)\n");
  yyparse();
return 0;
}
