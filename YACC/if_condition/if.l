%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%
printf                       { return PRINTF; }
if                           { return IF; }
"("                          { return BROPEN; }
")"                          { return BRCLOSE; }
"{"                          { return CLOPEN; }
"}"                          { return CLCLOSE; }
([A-Za-z]([A-Za-z]|[0-9])*)  { return ID; }
"<"|">"|"<="|">="            { return RELOP; }
\"                           { return STR; }
";"                          { return SEMI; }
\n                           { return NL; }  
(" ")                        { return SPACE; }
%%
int yywrap(){return 1;}