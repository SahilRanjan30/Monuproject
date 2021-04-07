#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *left,*right;
};
struct node *start=NULL;
int count;
struct node *createnode()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    printf("Enter Data\n");
    scanf("%d",&a->data);
    a->left=a->right=NULL;
    return a;
}
struct node *insert_at_start()
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
    if(start==NULL)
    {
        printf("List is empty\n");
        return;
    }
    else
    {
        struct node *a=start;
        while(a!=NULL)
        {
            count++;
            printf("%d ",a->data);
            a=a->right;
        }
    }
}
struct node *insert_at_middle()
{
    struct node *b;
    b=createnode();
    if(start==NULL)
        return;
    else
    {
        struct node *a;
        a=start;
        for(int i=0;i<(count/2)-1;i++)
            a=a->right;
        a->right->left=b;
        b->right=a->right;
        a->right=b;
        b->left=a;
    }
    return b;
}
void main()
{
    struct node *a,*b,*c,*d,*e,*f,*g;
    traverse();
    a=insert_at_start();
    b=insert_at_start();
    c=insert_at_start();
    d=insert_at_start();
    f=insert_at_start();
    g=insert_at_start();
    traverse();
    e=insert_at_middle();
    traverse();
    free(a);
    free(b);
    free(c);
    free(d);
    free(e);
    free(f);
    free(g);
}