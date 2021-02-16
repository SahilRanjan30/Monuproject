#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *next;
};
int count;
struct node *start=NULL;
struct node *createnode();
struct node *createnode()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d",&a->data);
    a->next=NULL;
    return a;
}
struct node *insert_at_first()
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
struct node *insert_at_last()
{
    struct node *a,*b;
    a=createnode();
    if(start==NULL)
        start=a;
    else
    {
        b=start;
        while(b->next!=NULL)
            b=b->next;
        b->next=a;
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
        a=a->next;
    }
}
void length_linkedlist()
{
    struct node *a;
    a=start;
    while(a!=NULL)
    {
        count++;
        a=a->next;
    }
    printf("\nLength of our linked list is %d\n",count);
}
void delete_middle_node()
{
    struct node *a,*b;
    int i;
    a=start;
    b=start->next;
    for(i=0;i<(count/2)-1;i++)
    {
        a=b;
        b=b->next;
    }
    a->next=b->next;
    free(b);
}
void main()
{
    struct node *a,*b,*c,*d,*e;
    a=insert_at_first();
    b=insert_at_last();
    c=insert_at_first();
    d=insert_at_last();
    e=insert_at_first();
    traverse();
    length_linkedlist();
    delete_middle_node();
    traverse();
    free(a);
    free(b);
    free(c);
    free(d);
    free(e);
}
