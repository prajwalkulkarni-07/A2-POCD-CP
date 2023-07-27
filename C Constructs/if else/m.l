%{
#include <stdio.h>
%}

%%
"#include"   { printf("Keyword:#include\n"); }
"stdio.h" {printf("Keyword:stdio.h\n");}
"int" { printf("Datatype: int\n"); }
"if"    { printf("Keyword: if\n"); }
"else"  { printf("Keyword: else\n"); }
"return" {printf("Keyword: return\n");}


[0-9]+  { printf("Literal: %s\n", yytext); }

";"     { printf("Delimiter: ;\n"); }
"("     { printf("Delimiter: (\n"); }
")"     { printf("Delimiter: )\n"); }
"{"     { printf("Delimiter: {\n"); }
"}"     { printf("Delimiter: }\n"); }
">"     { printf("Delimiter: >\n"); }
"<"     { printf("Delimiter: <\n"); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }


" "     ; /* Ignore whitespace */
\n      ; /* Ignore newline */
.       ; /* Ignore any other character */

%%
int main()
{
    yyin = fopen("inp4.c", "r"); // Replace "input.c" with the path to your C code file
    yylex();
    fclose(yyin);
    return 0;
}
