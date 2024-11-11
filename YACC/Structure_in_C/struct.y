%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
%}
%token STRUCT ID BROPEN BRCLOSE TYPE SEMI ARR NL

%%
stmt: S NL { printf("Valid statement\n"); exit(0); }

S : STRUCT ID BROPEN ELE_LIST BRCLOSE SEMI ;

ELE_LIST : ELE                // Single element
         | ELE_LIST ELE ;     // Multiple elements

ELE : TYPE ID ARR SEMI        // Array element
    | TYPE ID SEMI ;          // Non-array element

%%

int yyerror()
{
    printf("Invalid statement:\n");
    return 1;  // Return error code instead of exiting
}

int main()
{
    printf("Enter the structure declaration:\n");
    yyparse();
    return 0;
}
