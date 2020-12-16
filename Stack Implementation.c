#include<stdio.h>
#include<stdlib.h>
struct stack
{
    int data;
    struct stack *next;
};
struct stack *top=NULL;
void push();
void display();
void peek();
void main()
{
    push();
    push();
    display();
    printf("\nThe Element at top of the stack is:");
    peek();
}
void push()
{
    struct stack *a;
    a=(struct stack *)malloc(sizeof(struct stack));
      printf("Enter a data\n");
    scanf("%d",&a->data);
    if(top==NULL)
    {
    a->next=NULL;
    top=a;
    }
    else
    {
        a->next=top;
        top=a;
    }
}
void display()
{
    struct stack *b;
    b=top;
    while (b!=NULL)
    {
        printf("%d ",b->data);
        b=b->next;
    }
}
void peek()
{
    printf("%d",top->data);
}
