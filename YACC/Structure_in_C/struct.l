%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%
"struct"                        {return STRUCT;}
[A-Za-z]|([A-Za-z]|[0-9]*)      {return ID;}
"int"|"float"|"char"                {return TYPE;}
"{"                              {return BROPEN;}
"}"                             {return BRCLOSE;}
";"                             {return SEMI;}
"[\]\|([\[0-9]*]\)"             {return ARR;}
"\n"                            {return NL;}
.                               {printf("Invalid string\n");exit(0);}
%%
int yywrap(){return 0;}
