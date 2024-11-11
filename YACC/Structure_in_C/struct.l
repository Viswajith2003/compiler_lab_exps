%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}
%%
"struct"                        { return STRUCT; }
[A-Za-z_][A-Za-z0-9_]*          { return ID; }
"int"|"float"|"char"|"double"   { return TYPE; }
"{"                             { return BROPEN; }
"}"                             { return BRCLOSE; }
";"                             { return SEMI; }
"\\[[0-9]*\\]"                  { return ARR; }   // Corrected array pattern
"\n"                            { return NL; }
[ \t]                           { /* Ignore whitespace */ }
.                               { printf("Invalid string\n"); return 0; }  // Handle unknown characters without abrupt exit
%%
int yywrap() { return 1; }
