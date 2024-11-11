%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%
if                           { return IF; }
"("                          { return BROPEN; }
")"                          { return BRCLOSE; }
"{"                          { return CLOPEN; }
"}"                          { return CLCLOSE; }
([A-Za-z]([A-Za-z]|[0-9])*)  { return ID; }
"<"|">"|"<="|">="            { return RELOP; }
\n                           { return NL; }   
%%
int yywrap(){return 1;}