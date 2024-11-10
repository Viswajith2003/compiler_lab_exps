%{
#include<stdio.h>
#include<stdlib.h>
#include"lex.yy.c"
%}
%token A B NL
%%
stmt: S NL {printf("Valid statement\n");exit(0);}
S: A S| S B | B
%%
int yyerror()
{
    printf("Invalid statement:\n");
    exit(0);
}
void main()
{
    printf("Enter the string:\n");
    yyparse();
}

