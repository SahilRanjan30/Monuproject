#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *left,*right;
};
struct node *start=NULL;
void preorder(struct node *);
void inorder(struct node *);
void postorder(struct node *);
void main()
{
    struct node *a,*b,*c;
    a=(struct node *)malloc(sizeof(struct node));
    b=(struct node *)malloc(sizeof(struct node));
    c=(struct node *)malloc(sizeof(struct node));
    b->left=b->right=NULL;
    c->left=c->right=NULL;
    a->left=b;
    a->right=c;
    a->data=19;
    b->data=21;
    c->data=34;
    start=a;
    printf("Preorder is:");
    preorder(start);
    printf("Inorder is:");
    inorder(start);
    printf("Postorder is:");
    postorder(start);
    free(a);
    free(b);
    free(c);
}
void preorder(struct node *d)
{
    if(d!=NULL)
    {
        printf("%d ",d->data);
       preorder(d->left);
        preorder(d->right);
    }  
}
void inorder(struct node *a)
{
    if(a!=NULL)
    {
    inorder(a->left);
    printf("%d ",a->data);
    inorder(a->right);
    }
}
void postorder(struct node *b)
{
    if(b!=NULL)
    {
        postorder(b->left);
        postorder(b->right);
        printf("%d ",b->data);
    }
}