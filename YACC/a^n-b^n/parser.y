%{
#include<stdio.h>
#include<string.h>
%}
%token A B NL
%%
stmt :S NL {printf("valid string \n");exit(0);}
S :A S B | ;
%%
int yyerror(char *s)
{
    printf("invalid string \n");
    exit(0);
}
void main()
{
    printf("Enter the string:\n");
    yyparse();
}