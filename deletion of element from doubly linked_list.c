#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *left,*right;
};
struct node *start=NULL;
struct node *createnode()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d",&a->data);
    a->left=a->right=NULL;
    return a;
}
struct node *insert_at_beginning()
{
    struct node *a;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
    a->right=start;
    start->left=a;
    start=a;
    }
    return a;
}
void traverse()
{
    struct node *a;
    a=start;
    while(a!=NULL)
    {
        printf("%d ",a->data);
        a=a->right;
    }
}
struct node *insert_at_end()
{
    struct node *a,*b;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        b=start;
        while(b->right!=NULL)
            b=b->right;
        b->right=a;
        a->left=b;
    }
    return a;
}
void deletion_of_firstnode()
{
    struct node *a;
    if(start==NULL)
        {
            printf("Linked_List is empty\n");
            return;
        }
    else if(start->right==NULL)
        {
            free(start);
            start=NULL;
        }
    else
    {
        a=start;
        start=a->right;
        start->left=NULL;
        free(a);
    }
}
void deletion_from_lastnode()
{
    struct node *a;
    if(start==NULL)
    {
        printf("Linked List is empty\n");
        return;
    }
    else if(start->right==NULL)
    {
        free(start);
        start=NULL;
    }
    else
    {
        a=start;
        while(a->right->right!=NULL)
            a=a->right;
        free(a->right);
        a->right=NULL;
    }
}
void main()
{
    struct node *a,*b,*c,*d;
    a=insert_at_beginning();
    b=insert_at_end();
    c=insert_at_beginning();
    d=insert_at_beginning();
    traverse();
    printf("\n");
    deletion_from_lastnode();
    deletion_of_firstnode();
    deletion_from_lastnode();
    traverse();
}
