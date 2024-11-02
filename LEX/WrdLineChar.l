%{
    int wc = 0, lc = 0, cc = 0;
%}

%%

[ \t]+          ;              // Ignore spaces and tabs
\n              { lc++; }      // Newline increments line count
.               { cc++; }      // Any character increments character count
[^\n \t]+       { wc++; }      // Sequence of non-space, non-newline characters is treated as a word

%%

#include <stdio.h>
#include <stdlib.h>

int yywrap(void) { return 1; }

void main() {
    yyin = fopen("./textFiles/text.txt", "r");

    yylex();

    printf("\nWord count: %d\nLine count: %d\nCharacter count: %d\n", wc, lc, cc);
}
