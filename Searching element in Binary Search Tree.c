#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *leftsubtree,*rightsubtree;
};
struct node *start=NULL;
int searching();
struct node *createnode()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    return a;
}
void main()
{
    struct node *a,*b,*c;
    int n;
    a=createnode();
    b=createnode();
    c=createnode();
    a->data=19;
    b->data=11;
    c->data=23;
    a->leftsubtree=b;
    a->rightsubtree=c;
    b->leftsubtree=b->rightsubtree=NULL;
    c->leftsubtree=c->rightsubtree=NULL;
    start=a;
    printf("Enter a data\n");
    scanf("%d",&n);
    printf("%d",searching(start,n));
    free(a);
    free(b);
    free(c);
}
int searching(struct node *start,int n)
{
    if(start==NULL)
        return 0;
    if(start->data==n)
        return 1;
    else if(n>start->data)
        searching(start->rightsubtree,n);
    else
        searching(start->leftsubtree,n);
}