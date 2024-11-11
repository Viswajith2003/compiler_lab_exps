%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}
%%
struct                            { return STRUCT; }
([A-Za-z]([A-Za-z]|[0-9])*)             { return ID; }
("int "|"float "|"char "|"double ")     { return TYPE; }
"{"                               { return BROPEN; }
"}"                               { return BRCLOSE; }
\;                                { return SEMI; }
(" ")                             { return SPACE; }
(\[\])?(\[[0-9]*\])*              { return ARR; }    // Array pattern
\n                           { return NL; }
[ \t]                           { /* Ignore whitespace */ }
.                               { printf("Invalid string\n"); return 0; }  // Handle unknown characters
%%
int yywrap() { return 1; }
