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
%}

%token atoken btoken NL 
%%
stmt: stmt S NL   {printf("Valid\n");}
    | S NL   {printf("Valid\n");}
    ;
S   : atoken atoken atoken atoken atoken A
    ;
A   :btoken
    |atoken A
    ;
%%
int yyerror(char *msg)
{
  printf("invalid\n");
  exit(0);

}
int main()
{
printf("Enter the string\n");
yyparse();
return 0;
}
