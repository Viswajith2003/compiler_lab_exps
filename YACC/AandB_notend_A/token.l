%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}
%%
"a"    {return A;}
"b"    {return B;}
"\n"   {return NL;}
.      {printf("Invalid string\n");exit(0);}
%%
int yywrap(){return 0;}
