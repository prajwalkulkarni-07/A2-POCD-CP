%{
#include "y.tab.h" 
%}
alpha[a-zA-Z]
digit[0-9]
%% 
[\t\n] {}
"for" return FOR;
{digit}+ return NUM;
{alpha}({alpha}|{digit})* return id;
"<=" return le;
">=" return ge;
"==" return eq;
"!=" return ne;
"&&" return and;
"||" return or;
. return yytext[0];
%%
