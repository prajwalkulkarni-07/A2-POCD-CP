%{
#include "y.tab.h"
%}

%%

"struct"    { return STRUCT; }
"int"|"char"|"double"|"float" {return DATA_TYPES;}
"next"|"prev" {return NODES;}
[a-zA-Z_][a-zA-Z0-9_]*   { return IDENTIFIER; }
","         {return COMMA;}
"*"         {return ASTRIC;}
"{"         { return OPEN_BRACE; }
"}"         { return CLOSE_BRACE; }
";"         { return SEMICOLON; }
[ \t\n]     ; // Skip whitespace and newlines
.           { return yytext[0]; }
%%