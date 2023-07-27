%{
#include <stdio.h>
#include <stdlib.h>

%}

%token usn USN NL

%%
STMT : n NL {printf("Valid USN\n"); exit(0) ;}
     ;
n : usn 
  | USN
  ;
          
%%

int yyerror(char *msg)
{
  printf("invalid USN\n");
  exit(0);
}

int main() {
  printf("Enter USN: ");
  yyparse();
  return 0;
}
