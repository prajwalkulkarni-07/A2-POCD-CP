%{
#include <stdio.h>
#include <stdlib.h>

%}

%token scheme host NL

%%
STMT : url NL  {printf("Valid URL\n"); exit(0);}
     ;

url : scheme ':' '/' '/' host
          ;

%%

int yyerror(char *msg)
{
  printf("invalid URL\n"); 
  exit(0);
}

int main() {
  printf("Enter URL: ");
  yyparse();
  return 0;
}
