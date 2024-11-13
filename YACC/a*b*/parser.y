%{
#include<stdio.h>
#include<string.h>
%}
%token A B NL
%%
stmt :S X Y NL {printf("Valid String \n");exit(0);}
S :X Y 
X :A X| ;
Y :B Y| ;
%%
int yyerror(char *s){
    printf("invalid string \n");
    exit(0);
}
void main()
{
    printf("Enter the string :\n");
    yyparse();
}