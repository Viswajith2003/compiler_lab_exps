%{
#include<stdio.h>
%}
%%
"<"([^>]*)">"  {}
%%
int yywrap(void) {}
void main()
{
    yyin=fopen("textFiles/index.html","r");
    yyout=fopen("textFiles/output.html","w");
    yylex();
}
