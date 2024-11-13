%{
int i=0,val[2];
char op;
%}
digit[0-9]
operator "+"|"-"|"*"|"/"
%%
{digit}+   {val[i++]=atoi(yytext);}
{operator} {op=yytext[0];}
%%
#include<stdio.h>
#include<string.h>

int yywrap(void){ }
int main()
{
    printf("Enter the expression:");
    yylex();

    double result;
    switch(op)
    {
        case '+':
            result =val[0] + val[1];
            break;
        case '-':
            result =val[0] - val[1];
            break;
        case '*':
            result =val[0] * val[1];
            break;
        case '/':
            result =(double)val[0] / val[1];
            break;
        default:
            printf("Invalid operator");
    }
    printf("The result is: %.2f",result);
    return 0;
}