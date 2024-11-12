#include <stdio.h>
#include <string.h>

int hasEpsilonTransition[10][10], state1 = 0, state2 = 0, numberOfStates = 0, numberOfTransitions = 0, visited[10];
char input[10];

void main()
{
    printf("Enter the number of states: ");
    scanf("%d", &numberOfStates);
    printf("Enter the number of transitions: ");
    scanf("%d", &numberOfTransitions);
    printf("Transition Table.\n");
    for (int i = 0; i < numberOfTransitions; i++)
    {
        scanf("%d %c %d", &state1, &input[i], &state2);
        if (input[i] == 'e')
        {
            hasEpsilonTransition[state1][state2] = 1;
        }
    }
    printf("Epsilon closure \n");
    for (int i = 0; i < numberOfStates; i++)
    {
        printf("state %d: { Q%d", i, i);
        for (int j = 0; j < numberOfStates; j++)
        {
            visited[j] = 0;
        }
        Eclosure(i);
        printf("}\n");
    }
}
void Eclosure(int i)
{
    visited[i] = 1;
    for (int j = 0; j < numberOfStates; j++)
    {
        if (hasEpsilonTransition[i][j] == 1 && !visited[j])
        {
            printf(", Q%d", j);
            Eclosure(j);
        }
    }
}