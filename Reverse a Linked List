#include <stdio.h>
#include <stdlib.h>
struct node
{
    int data;
    struct node *next;
};
struct node *start=NULL;
struct node *createnode(int data)
{
    struct node *a=(struct node *)malloc(sizeof(struct node));
    a->data=data;
    a->next=NULL;
    return a;
}
struct node *insert_at_last(int data)
{
    struct node *a=createnode(data);
    if(start==NULL)
        start=a;
    else
    {
        struct node *b=start;
        while(b->next!=NULL)
            b=b->next;
        b->next=a;
    }
    return a;
}
void traverse()
{
    if(start==NULL)
    {
        return;
    }
    else
    {
        struct node *a=start;
        while(a!=NULL)
        {
            printf("%d ",a->data);
            a=a->next;
        }
    }
}
void reverse_LinkedList()
{
    if(start==NULL)
        return;
    else if(start->next==NULL)
        return;
    else
    {
        struct node *a,*b,*c;
        a=start;
        b=a->next;
        while(b->next!=NULL)
        {
            c=b->next;
            b->next=a;
            a=b;
            b=c;
        }
        b->next=a;
        start->next=NULL;
        start=b;
    }
}
void main()
{
    struct node *a,*b,*c,*d;
    a=insert_at_last(1);
    b=insert_at_last(2);
    c=insert_at_last(2);
    d=insert_at_last(4);
    traverse();
    printf("\n");
    reverse_LinkedList();
    traverse();
    free(a);
    free(b);
    free(c);
    free(d);
}
