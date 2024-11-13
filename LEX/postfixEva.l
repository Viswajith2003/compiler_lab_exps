%{
int stack[100],top=-1;
char op;
void push(int i){ stack[++top]=i;}
int pop(){ return stack[top--];}
int calculate(int a,int b,char op)
{
    switch(op)
    {
        case '+':
            return a + b;
            break;
        case '-':
            return a - b;
            break;
        case '/':
            return a / b;
            break;
        case '*':
            return a * b;
            break;
        default:
            return 0;
    }
}
%}
digit[0-9]
opeator "+"|"-"|"/"|"*"
%%
{digit}+   {push(atoi(yytext));}
{opeator}  {push(calculate(pop(),pop(),yytext[0]));}
%%
#include<stdio.h>
#include<string.h>
int yywrap(void){};
void main()
{
    printf("Enter the expression:");
    yylex();
    printf("The result is:%d\n",pop());
}