%{
#include <stdio.h>
%}

%%
[0-9]+    {printf("\nNumber:%s\t", yytext); }
[\t\n]    {/*ignore whitespace*/}
"+"|"-"|"*"|"/"  { printf("\nOperator: %s\t", yytext);}
.         {printf("\nUnknown character:%s\t", yytext);}
%%

int yywrap() {
    return 1;
}

int main()
{
    printf("Enter the NumberOperator:\t");
    yylex();
    return 0;
}
