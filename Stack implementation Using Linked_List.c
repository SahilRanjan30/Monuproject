//Implementing Stack using Linked_list
#include<stdio.h>
#include<stdlib.h>
struct stack
{
    int data;
    struct stack *next;
};
struct stack *top=NULL;
struct stack *createnode()
{
    struct stack *a;
    a=(struct stack *)malloc(sizeof(struct stack));
    a->next=NULL;
    return a;
}
void push(int x)
{
    struct stack *a;
    a=createnode();
    a->data=x;
    if(top==NULL)
        top=a;
    else
    {
        a->next=top;
        top=a;
    }
}
int isempty()
{
    if(top==NULL)
        return 1;
    return 0;
}
void pop()
{
    if(top==NULL)
    {
        printf("Stack is empty\n");
        return;
    }
    else
    {
        struct stack *a;
        printf("Poped element is %d\n",top->data);
        a=top;
        top=a->next;
        free(a);
    }
}
void main()
{
    push(67);
    push(100);
    push(65);
    printf("%d\n",isempty());
    pop();
    pop();
    pop();
    printf("%d",isempty());
}
