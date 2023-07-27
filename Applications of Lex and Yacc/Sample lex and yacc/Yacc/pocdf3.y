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
#include <stdio.h>
extern FILE *yyin;

void yyerror(const char*);
int count_0 = 0;
int count_1 = 0;
%}

%token ZERO ONE NL

%%

stmt: stmt S NL    {if (count_0 == count_1) {
        printf("Valid string. Number of 0's and 1's are equal.\n");
    } else {
        printf("Invalid string. Number of 0's and 1's are not equal.\n"); exit(0) ;
    } } 
    | S NL {if (count_0 == count_1) {
        printf("Valid string. Number of 0's and 1's are equal.\n");
    } else {
        printf("Invalid string. Number of 0's and 1's are not equal.\n"); exit(0) ;
    } }   
    ;
S    : 
     | S ZERO { count_0++; }
     | S ONE { count_1++; }
     ;
%%

int main() {
     FILE *fp;
  fp=fopen("pocdf3.txt","r");
  yyin=fp;
    yyparse();
    return 0;
}

void yyerror(const char* msg) {
    printf("Error: %s\n", msg);
}

