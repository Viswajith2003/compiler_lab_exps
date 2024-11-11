%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
%}
%token STRUCT SPACE ID BROPEN BRCLOSE TYPE SEMI ARR NL

%%
stmt: S NL { printf("Valid statement\n"); exit(0); };

S : STRUCT SPACE ID SPACE BROPEN ELE BRCLOSE SEMI | STRUCT SPACE ID SPACE BROPEN BRCLOSE SEMI ;

ELE : TYPE ID ARR SEMI    // Array element
    | TYPE ID SEMI | ;      // Non-array element
%%

int yyerror(const char *s) {
    printf("Invalid statement:\n");
    return 1;
}

int main() {
    printf("Enter the structure declaration:\n");
    yyparse();
    return 0;
}
