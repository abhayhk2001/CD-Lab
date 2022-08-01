#include<stdio.h>
#include<string.h>

int i=0,j=0,z=0,len=0;
char stack[20], input[20];

void check()
{
    int c=len;
    for(z=0; z<c; z++)
    {
        if(stack[z]=='c')
        {
            printf("reduced by S->c");
            stack[z] = 'S';
            stack[z+1] = '\0';
            printf("\n$%s\t\t\t%s$\t\t\t", stack, input);
        }
    }
    for(z=0; z<c-2; z++)
    {
        if(stack[z]=='a' && stack[z+1]=='S' && stack[z+2]=='a')
        {
            printf("reduced by S->aSa");
            stack[z] = 'S';
            stack[z+1] = '\0';
            stack[z+2] = '\0';
            printf("\n$%s\t\t\t%s$\t\t\t", stack, input);
            i=i-2;
        }
    }
    for(z=0; z<c-2; z++)
    {
        if(stack[z]=='b' && stack[z+1]=='S' && stack[z+2]=='b')
        {
            printf("reduced by S->bSb");
            stack[z] = 'S';
            stack[z+1] = '\0';
            stack[z+2] = '\0';
            printf("\n$%s\t\t\t%s$\t\t\t", stack, input);
            i=i-2;
        }
    }
}

int main()
{
    printf("grammar is S->aSa|bSb|c\n");
    printf("enter input: ");
    scanf("%s", input);

    len = strlen(input);
    char action[20] = "Shift";

    printf("STACK\t\t\tINPUT\t\t\tACTION");
    printf("\n$\t\t\t%s$\t\t\t", input);

    for(i=0; j<len; i++,j++)
    {
        printf("%s", action);
        stack[i] = input[j];
        stack[i+1] = '\0';
        input[j] = ' ';
        printf("\n$%s\t\t\t%s$\t\t\t", stack, input);
        check();
    }
    check();
    
    if(stack[0]=='S' && stack[1]=='\0')
        printf("ACCEPT\n");
    else
        printf("REJECT\n");
    return 0;
}
