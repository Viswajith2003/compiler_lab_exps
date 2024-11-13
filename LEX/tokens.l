keywords "int"|"float"|"char"|"double"|"long"|"if"|"switch"|"else"|"elseif"|"break"|"continue"|"for"|"while"|"do"|"void"|"struct"|"default"|"case"|"switch"|"return" 
letter [A-Za-z]
digit [0-9]
aop "+"|"-"|"/"|"%"|"*"
lop "&&"|"||"|"!"
relop "<"|">"|"<="|">="|"=="|"!="
sp "#"|"@"|"$"|"("|")"|"{"|"}"|";"|"."

%{
char keyword[100][100],identifier[100][100],special[100][100],operator[100][100];
int i=0,j=0,k=0,s=0;
%}
%%
{keywords}  {strcpy(keyword[i++],yytext);}
({aop}|{relop}|{lop})   {strcpy(operator[j++],yytext);}
({letter}|_?({letter}|{digit})*)   {strcpy(identifier[k++],yytext);}
{sp}             {strcpy(special[s++],yytext);}
%%
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int yywrap(void){}
void main()
{
    yyin=fopen("./textFiles/tokens.c","r");
    yylex();

    printf("Keyword are:\n");
    for(int m=0;m<i;m++)
    {
        printf("%s \n",keyword[m]);
    }
    printf("identifiers are:\n");
    for(int m=0;m<i;m++)
    {
        printf("%s \n",identifier[m]);
    }
    printf("Operators are:\n");
    for(int m=0;m<i;m++)
    {
        printf("%s \n",operator[m]);
    }
    printf("Special chars are:\n");
    for(int m=0;m<i;m++)
    {
        printf("%s \n",special[m]);
    }
}