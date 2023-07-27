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

%token zero one NL
%%
stmt: stmt S NL   {printf("Valid\n");}
    | S NL   {printf("Valid\n");}
    ;
S   : zero S one
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
  fp=fopen("pocdf2.txt","r");
  yyin=fp;
yyparse();
return 0;
}
