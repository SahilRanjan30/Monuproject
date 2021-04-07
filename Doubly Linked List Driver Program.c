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
    printf("Enter a data\n");
    scanf("%d",&a->data);
    a->left=a->next=NULL;
    return a;
}
struct node *insertion_at_last()
{
    struct node *a;
    a=createnode();
    if(start==NULL)
        start=a;
    else if(start->next==NULL)
        start->next=a;
    else
    {
        struct node *b;
        b=start;
        while(b->next!=NULL)
            b=b->next;
        a->left=b;
        b->next=a;
    }
    return a;
}
void traverse()
{
    if(start==NULL)
        printf("List is empty\n");
    else
    {
        struct node *b=start;
        while(b!=NULL)
        {
            printf("%d ",b->data);
            b=b->next;
        }
    }
}
struct node *insertion_at_middle()
{
    int count=0;
    struct node *a,*b;
    b=createnode();
    a=start;
    while(a!=NULL)
    {
        count++;
        a=a->next;
    }
    a=start;
    for(int i=0;i<(count/2)-1;i++)
    {
        a=a->next;
    }
    b->left=a;
    b->next=a->next;
    a->next->left=b;
    a->next=b;
    return b;
}
void main()
{
    struct node *a,*b,*c;
    a=insertion_at_last();
    b=insertion_at_last();
    c=insertion_at_middle();
    traverse();
    free(a);
    free(b);
    free(c);
}
