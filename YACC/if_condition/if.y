%{
#include "lex.yy.c"
#include <stdio.h>
#include <stdlib.h>
int yyerror(char *s);
%}

%token IF BRCLOSE BROPEN CLCLOSE CLOPEN ID RELOP NL STR PRINTF SEMI

%%
stmt : S NL {printf("Valid Sting");exit(0);} ;
S : IF BROPEN ID RELOP ID BRCLOSE CLOPEN ELE CLCLOSE 
ELE : PRINTF BROPEN BRCLOSE SEMI | PRINTF BROPEN STR ID STR BRCLOSE SEMI | ;

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