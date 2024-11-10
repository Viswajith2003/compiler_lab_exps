%{
#include<stdio.h>
#include<stdlib.h>
#include"lex.yy.c"
%}
%token STRUCT ID BROPEN BRCLOSE TYPE SEMI ARR NL
%%
stmt: S NL {printf("Valid statement\n");exit(0);}
S : STRUCT ID BROPEN TYPE ELE BRCLOSE SEMI
ELE : ID ARR SEMI | ID SEMI 
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

