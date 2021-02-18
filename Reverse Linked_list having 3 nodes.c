#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *next;
};
struct node *start=NULL;
//Program to reverse a linked_list having 3 node.
struct node *createnode()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d",&a->data);
    a->next=NULL;
    return a;
}
struct node *insertatfirst()
{
    struct node *a;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        a->next=start;
        start=a;
    }
    return a;
}
struct node *insertatlast()
{
    struct node *a,*b;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        b=start;
        while(b->next!=NULL)
        {
            b=b->next;
        }
        b->next=a;
    }
    return a;
}
void traverse()
{
    struct node *a=start;
    while(a!=NULL)
    {
        printf("%d ",a->data);
        a=a->next;
    }
}
void reverse_linkedlist()
{
    struct node *a,*b,*c;
    a=start;
    while(a->next->next!=NULL)
    {
        b=a->next->next;
        c=start;
        a=a->next;
    }
    b->next=a;
    a->next=c;
    c->next=NULL;
    start=b;
}
void main()
{
   struct node *a,*b,*c;
   a=insertatfirst();
   b=insertatlast();
   c=insertatlast();
   traverse();
   reverse_linkedlist();
   printf("\nAfter reversing linkedlist is:\n");
   traverse();
   free(a);
   free(b);
   free(c);
}
