%{ 
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
void yyerror(const char* s);
extern FILE* yyin;
%}

%token  STRUCT IDENTIFIER OPEN_BRACE CLOSE_BRACE SEMICOLON DATA_TYPES COMMA ASTRIC NODES

%%
stmt : stmt statement 
     |  
     ;
     
statement: struct_declaration
  | struct_definition
         ;

struct_declaration: STRUCT IDENTIFIER OPEN_BRACE struct_member_list CLOSE_BRACE SEMICOLON
                   {
                       printf("Found a struct declaration\n");
                   }
                   |
                   ;
struct_definition : STRUCT IDENTIFIER ASTRIC IDENTIFIER SEMICOLON
                   {
                        printf("Found a struct definition\n");
                   }
    | STRUCT IDENTIFIER IDENTIFIER SEMICOLON
    {
                        printf("Found a struct definition\n");
                   }
    ; 
struct_member_list: /* empty */ 
                  | struct_member_list struct_member
                   ;

struct_member: DATA_TYPES variable_list SEMICOLON
      | STRUCT variable_list SEMICOLON
              ;
variable_list: IDENTIFIER COMMA variable_list
      | IDENTIFIER
             | IDENTIFIER ASTRIC NODES COMMA variable_list
             | IDENTIFIER ASTRIC NODES
             | ASTRIC NODES
             ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "%s\n", s);
}
int yywrap()
{
 return 1;
}


int main(int argc,char * argv[])
{
  if(argc!=2)
 {
  printf("Usage <./a.out> <src file>\n");
  exit(0);
 }
 yyin=fopen(argv[1],"r");
 yyparse();
 return 0;
}