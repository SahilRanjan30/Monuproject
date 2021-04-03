#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *left,*next;
};
struct node *start=NULL;
struct node *createnode()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    printf("Enter data\n");
    scanf("%d",&a->data);
    a->left=a->next=NULL;
    return a;
}
void insertion_at_last()
{
    struct node *a;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        struct node *b=start;
        while(b->next!=NULL)
            b=b->next;
        b->next=a;
        a->left=b;
    }
}
void insertion_at_first()
{
    struct node *a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        a->next=start;
        start->left=a;
        start=a;
    }
}
void traverse()
{
    if(start==NULL)
        printf("\nList is empty\n");
    else
    {
        struct node *a=start;
        printf("Element in our list is\n");
        while(a!=NULL)
        {
            printf("%d ",a->data);
            a=a->next;
        }
    }
}
void deletion_from_beginning()
{
    if(start==NULL)
    {
        printf("List is empty\n");
        return;
    }
    else if(start->next==NULL)
    {
        struct node *a;
        a=start;
        start=NULL;
        free(a);
    }
    else
    {
        struct node *a;
        a=start;
        start->next->left=NULL;
        start=start->next;
        a->next=NULL;
        free(a);
    }
}
void deletion_from_last()
{
    if(start==NULL)
    {
        printf("List is empty\n");
        return;
    }
    else if(start->next==NULL)
    {
        struct node *a;
        a=start;
        start=NULL;
        free(a);
    }
    else
    {
        struct node *a,*b;
        a=start;
        while(a->next->next!=NULL)
            a=a->next;
        a->next->left=NULL;
        b=a->next;
        a->next=NULL;
        free(b);
    }
}
void main()
{
   int choice;
   printf("1.Insertion at last\n");
   printf("2.Insertion at first\n");
   printf("3.Deletion from beginning\n");
   printf("4.Deletion from last\n");
   printf("5.Traverse\n");
   printf("6.End\n");
   while(1)
   {
   printf("\nEnter your choice\n");
   scanf("%d",&choice);
   switch(choice)
   {
   case 1:
    {
        insertion_at_last();
        break;
    }
   case 2:
    {
        insertion_at_first();
        break;
    }
   case 3:
    {
        deletion_from_beginning();
        break;
    }
   case 4:
    {
        deletion_from_last();
        break;
    }
   case 5:
    {
        traverse();
        break;
    }
   case 6:
    {
        exit(0);
    }
   default:
    {
        exit(0);
    }
   }
   }
}
