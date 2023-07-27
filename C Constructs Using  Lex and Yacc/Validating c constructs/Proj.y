%{


/* Authors:
Abhishek Teli   - 01fe21bcs120
Tanishq Birajdar – 01fe21bcs141
Manish – 01fe21bcs149
Yoginath G L – 01fe21bcs150

Under the Guidance of :
Prof. Jayalakshmi G N
Asst.Prof. Kavya Kori

Limitations:
•	This code doesn’t consider the declaration of C structs like – Structures and pointers.
•	It considers only the datatypes such as : int, float, char, double. 
•	The uppercase represents Tokens and lower case represents the non-terminals.
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern int yyerror(const char *s);
extern FILE* yyin;
%}

%union
{
	int number;
	char *string;
}

%token INT COMMA SEMICOLON LBRACKET RBRACKET EQUAL
%token <string> IDENTIFIER
%token <number> NUMBER
%token <string> DATATYPE

%%
program: DATATYPE declaration_list SEMICOLON {printf("Parsing complete for datatype %s.\n",$1); return;}
       ;
declaration_list: declaration_list COMMA declaration
                 | declaration
                 ;

declaration: IDENTIFIER { printf("Declaration: %s;\n",$1);} 
           | IDENTIFIER LBRACKET NUMBER RBRACKET { printf("Declaration: %s[%d];\n",$1, $3);}
           | IDENTIFIER EQUAL NUMBER { printf("Declaration: %s=%d;\n",$1, $3);}
           ;

%%

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}

int main(int argc, char *argv[]) {
    
    if (argc!=2)
    {
    	printf("Error\n");
    	return 1;
    }

    FILE *input=fopen(argv[1],"r");
    
    if(input == NULL)
    {
    	printf("Error opening input file\n");
    	return 1;
    }
    
    yyin = input;
    
    printf("Enter the declaration statement:\n");
    yyparse();
    
    fclose(input);
    
    return 0;
}
