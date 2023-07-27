 /*                  
NAME	             USN                   ROLL NO
ANKIT KUMAR 	     01FE21BCS241          145
VATS SHIVAM 	     01FE21BCS207          137
SAMARTH  PAI	     01FE21BCS263          158
RUTUJ  PATIL	     01FE21BCS325          154

*/

/*
Under the Guidance:
Prof. Jayalaxmi G N
Asst. Prof. Kavya Kori
*/


%{
#include<stdio.h>
#include<stdlib.h>
extern FILE *yyin;
%}

%token atoken btoken ctoken dtoken NL 
%%
stmt: stmt S NL   {printf("Valid\n");}
    | S NL   {printf("Valid\n");}
    ;
S   : atoken A btoken B
    ;
A   : atoken A btoken 
    |
    ;
B   : ctoken B dtoken
    |
    ;
%%
int yyerror(char *msg)
{
  printf("invalid\n");
  exit(0);
}
int main()
{
  FILE *fp;
  fp=fopen("pocdf4.txt","r");
  yyin=fp;
yyparse();
return 0;
}

