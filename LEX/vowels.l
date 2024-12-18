%{
int v = 0, c = 0;
char vow[100], cons[100];
%}

vowel [AEIOUaeiou]
consonant [B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z]

%%
{vowel}       { strcat(vow, yytext); v++; }
{consonant}   { strcat(cons, yytext); c++; }
.             {}
%%

#include <stdio.h>
#include <string.h>

int yywrap(void) { return 1; }

void main() {

    yyin=fopen("./textFiles/vowel.txt","r");
    yylex();  // Process the input
    
    printf("\nVowel count: %d", v);
    printf("\nConsonant count: %d", c);
    printf("\nVowels are: %s", vow);
    printf("\nConsonants are: %s", cons);
}
