#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct Expression
{
    char operator[2], operandOne[5], operandTwo[5], result[5];
    int isRemoved;
} expressions[10];
int numberOfExpressions;
void propogateConstants(int current, int result)
{
    char resultCopy[5];
    sprintf(resultCopy, "%d", result);
    for (int i = current + 1; i < numberOfExpressions; i++)
    {
        if (strcmp(expressions[current].result, expressions[i].operandOne) == 0)
            strcpy(expressions[i].operandOne, resultCopy);
        if (strcmp(expressions[current].result, expressions[i].operandTwo) == 0)
            strcpy(expressions[i].operandTwo, resultCopy);
    }
}
void scanQuadruples()
{
    int result;
    for (int i = 0; i < numberOfExpressions; i++)
    {
        printf("Processing: %s %s %s %s\n", expressions[i].operator,
               expressions[i].operandOne, expressions[i].operandTwo, expressions[i].result);
        if ((isdigit(expressions[i].operandOne[0]) &&
             isdigit(expressions[i].operandTwo[0])) ||
            strcmp(expressions[i].operator, "=") == 0)
        {
            int operandOne = atoi(expressions[i].operandOne), operandTwo =
                                                                  atoi(expressions[i].operandTwo);
            char operator= expressions[i].operator[0];
            switch (operator)
            {
            case '+':
                result = operandOne + operandTwo;
                break;
            case '-':
                result = operandOne - operandTwo;
                break;
            case '*':
                result = operandOne * operandTwo;
                break;
            case '/':
                result = operandOne / operandTwo;
                break;
            case '=':
                result = operandOne;
                break;
            }
            if (strcmp(expressions[i].operator, "=") != 0)
                expressions[i].isRemoved = 1;
            printf("Optimized: %s %s %s %s -> Result: %d\n", expressions[i].operator,
                   expressions[i].operandOne, expressions[i].operandTwo, expressions[i].result, result);
            propogateConstants(i, result);
        }
    }
}
void main()
{
    printf("Number of expressions: ");
    scanf("%d", &numberOfExpressions);
    printf("Enter the input (quadruples):\n");
    for (int i = 0; i < numberOfExpressions; i++)
    {
        scanf("%s %s %s %s", expressions[i].operator, expressions[i].operandOne,
              expressions[i].operandTwo, expressions[i].result);
        expressions[i].isRemoved = 0;
    }
    scanQuadruples();
    printf("Optimized Code:");
    for (int i = 0; i < numberOfExpressions; i++)
    {
        if (!expressions[i].isRemoved)
        {
            printf("\n%s %s %s %s\n", expressions[i].operator, expressions[i].operandOne,
                   expressions[i].operandTwo, expressions[i].result);
        }
    }
}