%{
#include <stdio.h>
#include <string.h>

char keywords[100][100], identifiers[100][100], operators[100][100], special[100][100];
int i = 0, j = 0, k = 0, s = 0;
%}

%%

/* Define patterns */
keywords      int|float|char|long|double|if|else|void|for|while|do|break|continue|return|case|switch|default|struct
letter        [A-Za-z]
digit         [0-9]
aop           (\+|-|\*|\/|%)
relop         (<=|>=|==|!=|<|>)
lop           (&&|\|\||!)
sp            [@#${}()\[\]]

%%
{keywords}                { strcpy(keywords[i++], yytext); }
({aop}|{relop}|{lop})     { strcpy(operators[j++], yytext); }
{sp}                      { strcpy(special[s++], yytext); }
({letter}|_)+({letter}|{digit}|_)*  { strcpy(identifiers[k++], yytext); }
.                         {}
%%

int main() {
    yyin = fopen("textFiles/tokens.c", "r");
    if (!yyin) {
        printf("Error: Cannot open file tokens.c\n");
        return 1;
    }
    yylex();
    
    printf("The tokens are:\n");
    
    printf("Keywords:\n");
    for (int m = 0; m < i; m++) {
        printf("%s\n", keywords[m]);
    }
    
    printf("Operators:\n");
    for (int m = 0; m < j; m++) {
        printf("%s\n", operators[m]);
    }
    
    printf("Identifiers:\n");
    for (int m = 0; m < k; m++) {
        printf("%s\n", identifiers[m]);
    }
    
    printf("Special Characters:\n");
    for (int m = 0; m < s; m++) {
        printf("%s\n", special[m]);
    }
    
    return 0;
}
