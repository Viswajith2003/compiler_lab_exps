%{
#include "lex.yy.c"
#include <stdio.h>
#include <stdlib.h>
int yyerror(char *s);
%}

%token IF BRCLOSE BROPEN CLCLOSE CLOPEN ID RELOP NL

%%
stmt : S NL {printf("Valid Sting");exit(0);} ;
S : IF BROPEN ID RELOP ID BRCLOSE CLOPEN CLCLOSE;
%%
int yyerror(char *s)
{
    printf("Invalid statement\n");
    exit(0);
}
void main()
{
    printf("Enter the string:\n");
    yyparse();
}