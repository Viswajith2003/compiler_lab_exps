%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%
fopen                       { return FOP; }
"("                         { return BROPEN; }
")"                         { return BRCLOSE; }
\"                          { return STR; }
([A-Za-z]([A-Za-z]|[0-9])*)  { return ID; }
.                           { return DOT; }
", "                           { return COMMA; }
("r "|"w ")                 { return OPER; }
"; "                          { return SEMI; }
\n                          { return NL; }   
%%
int yywrap(){return 1;}