%{
    int wc = 0, lc = 0, cc = 0,sc=0;
%}

%%

[ \t]+          ;              // Ignore spaces and tabs
\n              { lc++; }      // Newline increments line count
[A-Za-z0-9]     { cc++; }      // Any character increments character count
"."             { sc++; }
" "             { wc++; }      // Sequence of non-space, non-newline characters is treated as a word

%%

#include <stdio.h>
#include <stdlib.h>

int yywrap(void) { return 1; }

void main() {
    yyin = fopen("./textFiles/text.txt", "r");
    yylex();

    printf("\nWord count: %d\nLine count: %d\nCharacter count: %d\nsentence count: %d", wc, lc, cc, sc);
}
