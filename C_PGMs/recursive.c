#include <stdio.h>
#include <string.h>
#include <ctype.h>
int E(), Edash(), T(), Tdash(), F();
const char *pt;
char grammar[64];
void main()
{
    printf("Enter the string:");
    scanf("%s", grammar);
    pt = grammar;
    printf("Input\t \tAction\n");
    if (E() && *pt == '\0')
        printf("String is successfully parsed\n");
    else
        printf("Error in parsing String\n");
}
int E()
{
    printf("%-16s E -> T E'\n", pt);
    if (T())
    {
        if (Edash())
            return 1;
        else
            return 0;
    }
    else
        return 0;
}
int Edash()
{
    if (*pt == '+')
    {
        printf("%-16s E' -> + T E'\n", pt);
        pt++;
        if (T())
        {
            if (Edash())
                return 1;
            else
                return 0;
        }
        else
            return 0;
    }
    else
        printf("%-16s E' -> $\n", pt);
    return 1;
}
int T()
{
    printf("%-16s T -> F T'\n", pt);
    if (F())
    {
        if (Tdash())
            return 1;
        else
            return 0;
    }
    else
        return 0;
}
int Tdash()
{
    if (*pt == '*')
    {
        printf("%-16s T' -> *F T'\n", pt);
        pt++;
        if (F())
        {
            if (Tdash())
                return 1;
            else
                return 0;
        }
        else
            return 0;
    }
    else
    {
        printf("%-16s T' -> $\n", pt);
        return 1;
    }
}
int F()
{
    if (*pt == '(')
    {
        printf("%-16s F -> (E)\n", pt);
        pt++;
        if (E())
        {
            if (*pt == ')')
            {
                pt++;
                return 1;
            }
            else
                return 0;
        }
        else
            return 0;
    }
    else if (strncmp(pt, "id", 2) == 0 && !isalnum(pt[2]))
    {
        printf("%-16s F -> id\n", pt);
        pt += 2;
        return 1;
    }
    else
        return 0;
}