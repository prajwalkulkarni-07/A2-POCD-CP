%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int w=0,dw=0;
%}

%token ID NUM DO WHILE LE GE EQ NE OR AND 
%left AND OR
%left '<''>' LE GE EQ NE
%left '+''-'
%left '*''/'
%left '!'

%%

S      : ST1 {printf("Input accepted.\n");}
       | ST
       | ST1 ST1
       ;
ST1    :    DO '{' S '}' WHILE'(' E2 ')'';' {dw++;}
       |    WHILE'(' E2 ')' '{' S '}'       {w++;}
       ;
       
ST     :  ID
       |
       ;
       
E      : E'+'E
       | E'-'E
       | E'*'E
       | E'/'E
       | E'<'E
       | E'>'E
       | E LE E
       | E GE E
       | E EQ E
       | E NE E
       | E OR E
       | E AND E
       | ID
       | NUM
       ;
       
E2     : E'<'E
       | E'>'E
       | E LE E
       | E GE E
       | E EQ E
       | E NE E
       | E OR E
       | E AND E
       | ID
       | NUM
       ;

%%

int yyerror(char *msg)
{
  printf("Invalid\n");
  exit(0);
}

int main() {
    FILE* input_file = fopen("input.txt", "r");  // Open the input file
    if (input_file == NULL) {
        perror("Failed to open the input file");
        return 1;
    }

   FILE* yyin = input_file;  // Assign the input file pointer to yyin

    yyparse();  // Start the parsing process

    fclose(input_file);  // Close the input file

    return 0;
}
