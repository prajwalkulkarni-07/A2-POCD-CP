%{
#include "y.tab.h" // Include the YACC-generated header file
%}

%%

"class"            { return CLASS; }
"public"           { return ACCESS_SPECIFIER; }
"private"          { return ACCESS_SPECIFIER; }
"protected"        { return ACCESS_SPECIFIER; }
"int"  	           { return TYPE; }
"float"		   { return TYPE; }
"char"		   { return TYPE; }
"inline"           {return INLINE;  }
"friend"           {return INLINE; }
"virtual"          {return INLINE; }
"{"                { return LEFT_BRACE; }
"}"                { return RIGHT_BRACE; }
";"                { return SEMICOLON; }
":"		   { return COLON; }
","                { return COMA; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[ \t\n]            ; // Skip whitespace
.		   {return yytext[0]; } // Skip any other character
%%

int yywrap() {
    return 1;
}

