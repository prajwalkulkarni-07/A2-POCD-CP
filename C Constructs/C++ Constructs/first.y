/*  
Course: Principles of compiler designing

Title:
LEX and YACC program to check the valid syntax for C++ constructs:
a. class definition and declaration
b. inheritance

          TEAM PB02
Name of authors:
 Sachin H    142   01FE21BCS225
 Shorya J    146   01FE21BCS248
 Aakash J    144   01FE21BCS228
 Guruprasad  143   01FE21BCS226
 
 Guided by: Prof. Jayalaxmi G N
            Asst. Prof. Kavya K

 KLE TECHNOLOGICAL UNIVERSITY
 VIDYANAGAR, HUBBALLI-580031
 */



%{
#include <stdio.h>
#include<stdlib.h>
extern FILE *yyin;

void yyerror(const char*);
%}

%token CLASS ACCESS_SPECIFIER TYPE LEFT_BRACE RIGHT_BRACE SEMICOLON ID COLON INLINE COMA

%%

program:
    class_declaration {printf("valid expression\n");}
    ;

class_declaration:
    CLASS ID class_body cl
    ;
    
cl:
    CLASS ID COLON ACCESS_SPECIFIER ID class_body cl
    |
    
    ;

class_body:
    LEFT_BRACE RIGHT_BRACE
    |
    LEFT_BRACE ACCESS_SPECIFIER COLON class_members RIGHT_BRACE
    ;

class_members:
    class_member
    |
    function
    |
    nested_class
    |
    class_members class_member 
    |
    class_members function
    |
    class_members nested_class
    ;

class_member: 
    TYPE ID SEMICOLON
    |
    TYPE ID COMA member
    ;
    
member:
      ID COMA member
      |
      ID SEMICOLON
      ;
      
function:
    TYPE ID '(' ')' SEMICOLON
    |
    INLINE TYPE ID '(' ')' SEMICOLON
    ;
    
nested_class:
    ACCESS_SPECIFIER CLASS ID SEMICOLON
    ;


%%

void yyerror(const char* s) {
    printf("error : %s\n",s);
}

int main() {
    FILE *fp;
    fp=fopen("a.c","r");
    yyin=fp;
    yyparse();
    return 0;
}

