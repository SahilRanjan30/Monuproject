#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *next;
};
void traverse();
void createnode();
void peek();
struct node *start=NULL;
void main()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d",&a->data);
    if(start==NULL)
        start=a;
    a->next=start;
    for(int i=0;i<=4;i++)
    {
    createnode();
    }
    traverse();
    peek();
    printf("\n");
    traverse();
    free(a);
}
void traverse()
{
    struct node *a;
    a=start;
    while(a->next!=start)
    {
        printf("%d ",a->data);
        a=a->next;
    }
    printf("%d ",a->data);
}
void createnode()
{
    struct node *a,*b;
    b=(struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d",&b->data);
    a=start;
    while(a->next!=start)
    a=a->next;
    a->next=b;
    b->next=start;
}
void peek()
{
    struct node *a;
    a=start;
    printf("\nFirst element in our list is %d",a->data);
}
