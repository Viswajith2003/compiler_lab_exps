%{
#include "lex.yy.c"
#include <stdio.h>
#include <stdlib.h>
int yyerror(char *s);
int yylex(void);
%}

%token FOP BRCLOSE BROPEN COMMA STR OPER SEMI ID DOT NL

%%
stmt : S NL {printf("Valid Sting");exit(0);} ;
S : FOP BROPEN T BRCLOSE SEMI ;
T : STR ID DOT ID STR COMMA STR OPER STR | ;
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