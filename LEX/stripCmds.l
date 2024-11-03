%{
#include<stdio.h>
%}
%%
"//"(.*)         {}
"/*"(.|\n)*"*/"  {}
%%
int yywrap(void) {}
void main()
{
    yyin=fopen("textFiles/input.c","r");
    yyout=fopen("textFiles/output.c","w");
    yylex();
}