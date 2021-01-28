#include<stdio.h>
#define size 10 //Here i have created a macro.
int stack[size];
int top=-1;
void main()
{
    system("color 8a");
    printf("%d %d",size,sizeof(stack));
    printf("\n%d\n",top);
    push();
    push();
    pop();
    isempty();
    isfull();
}
void push()
{
    int a;
    printf("Enter a number\n");
    scanf("%d",&a);
    top++;
    stack[top]=a;
}
void pop()
{
    int b;
    b=stack[top];
    printf("Poped Element is:%d\n",b);
    top--;
}
void isempty()
{
    if(top==-1)
        printf("Stack is empty\n");
}
void isfull()
{
    if(top==size-1)
        printf("Stack is full\n");
    printf("Stack is not full you can insert more data\n");
}
