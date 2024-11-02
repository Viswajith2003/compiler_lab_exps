%{
#include <stdio.h>
#include <stdlib.h>
%}
digit[0-9]
%%
{digit}*("."{digit}+)?("E"("+"|"-")?{digit}+)?  {printf("Valid string\n"); exit(0);}
.* {printf("Invalid string\n"); exit(0);}
%%
int yywrap(void){}
void main()
{
    printf("Enter the number: ");
    yylex();
}