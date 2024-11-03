%{
#include<stdio.h>
#include<string.h>
int values[2],i=0;
char op;
%}
digit    [0-9]
operator ["+"|"-"|"*"|"/"]
%%
{digit}+   {values[i++]=atoi(yytext);}
{operator} {op=yytext[0];}
%%
int yywrap(void){}
void main()
{
    printf("Enter the Operation:");
    yylex();
    int result;
    switch(op)
    {
        case '+':
            result=values[0]+values[1];
            break;
        case '-': 
            result=values[0]-values[1];
            break;
        case '*':
            result=values[0]*values[1];
            break;
        case '/':  
            result=values[0]/values[1]; 
            break;
        return 0;
    }
    printf("Result: %d\n",result);
}