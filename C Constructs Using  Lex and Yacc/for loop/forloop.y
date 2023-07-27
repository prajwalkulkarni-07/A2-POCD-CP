%{  
int count=0;
#include <stdio.h> 
#include <stdlib.h> 
%}

%token NUM id FOR le ge eq ne or and 
%right '='
%left or and
%left '>' '<' le ge eq ne
%left '+' '-'
%left '*' '/'
%left '!'

%%
s:st {printf("Valid Input::Number of for statements:%d\n",count);if(count==1){printf("Simple for statement\n");} else {printf("Nested for statement\n");}return 0;}
st: FOR'('E';'E2';'E')'DEF  {count++;}
;
DEF: '{'BODY'}'
|E';'
|st
|
;
BODY: BODY BODY
|E';'
|st
|
;
E: id'='E
|E'+'E
|E'-'E
|E'*'E
|E'/'E
|E'<'E
|E'>'E
|E le E
|E ge E
|E eq E
|E ne E
|E or E
|E and E
|E'+''+'
|E'-''-'
|id
|NUM
;

E2:E'<'E
|E'>'E
|E le E
|E ge E
|E eq E
|E ne E
|E or E
|E and E
;
%%

int main() {

printf("Enter the expression\n");

yyparse();
return 0;
}

int yyerror(char* s) {

printf("Expression is invalid\n");

}
