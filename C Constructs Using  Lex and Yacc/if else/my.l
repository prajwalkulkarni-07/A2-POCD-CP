%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"int"   {return INT;}
"if"    {return IF;}
"else"  {return ELSE;}
"return" {return RETURN;}
"maximum" {return IDENTIFIER;}
[()] {return yytext[0];}
[><=] {return yytext[0];}
"{" {return "{";}
"}" {return "}";}
[a-zA-Z][a-zA-Z0-9_]* {return IDENTIFIER;}
[0-9]+ {return INT;}


[ \t]+              /* ignore whitespace */
\n                  /* ignore newlines */

.       {return yytext[0];}

%%

int yywrap() {
    return 1;
}
