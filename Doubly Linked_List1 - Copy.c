#include<stdio.h>
#include<stdlib.h>
//Program to implement basic operations on doubly linked list.
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
void traverse(struct node *a)
{
    if(a!=NULL)
    {
        printf("%d ",a->data);
        traverse(a->right);
    }
}
void insert_at_beginning()
{
    struct node *a;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        start->left=a;
        a->right=start;
        start=a;
    }
}
void insert_at_Last()
{
    struct node *a;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        struct node *b;
        b=start;
        while(b->right!=NULL)
            b=b->right;
        b->right=a;
        a->left=b;
    }
}
void deletion_from_beginning()
{
    if(start==NULL)
    {
        printf("Doubly Linked_List is empty\n");
        return;
    }
    else if(start->right==NULL)
    {
        free(start);
        start=NULL;
    }
    else
    {
        struct node *a;
        a=start;
        start=start->right;
        start->left=NULL;
        a->right=NULL;
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
    else if(start->right==NULL)
    {
        free(start);
        start=NULL;
    }
    else
    {
        struct node *a=start;
        while(a->right->right!=NULL)
                a=a->right;
        a->right->left=NULL;
        free(a->right);
        a->right=NULL;
    }
}
void main()
{
    insert_at_beginning();
    insert_at_Last();
    insert_at_beginning();
    traverse(start);
    deletion_from_beginning();
    printf("\n");
    //traverse(start);
    deletion_from_last();
    traverse(start);
}
