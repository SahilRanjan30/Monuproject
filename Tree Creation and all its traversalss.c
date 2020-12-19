#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *left,*right;
};
struct node *createnode();
void inorder_traversal(struct node *);
void preorder_traversal(struct node *);
void postorder_traversal(struct node *);
struct node *start=NULL;
void main()
{
   /* printf("%d",sizeof(struct node));This sizeof() operator is
     going to return the memory consumed on creation of a variable.*/
    struct node *a,*b,*c,*d,*e,*f,*g;
    a=createnode();
    b=createnode();
    c=createnode();
    d=createnode();
    e=createnode();
    f=createnode();
    g=createnode();
    a->left=b;
    a->right=c;
    b->left=d;
    b->right=e;
    c->left=f;
    c->right=g;
    start=a;
    printf("Inorder traversal is:\n");
    inorder_traversal(start);
    printf("\nPreorder traversal is:\n");
    preorder_traversal(start);
    printf("\nPostorder traversal is:\n");
    postorder_traversal(start);
    free(a);
    free(b);
    free(c);
    free(d);
    free(e);
    free(f);
    free(g);
}
struct node *createnode()
{
    struct node *b;
    b=(struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d",&b->data);
    b->left=b->right=NULL;
    return b;
}
void inorder_traversal(struct node *start)
{
    if(start!=NULL)
    {
    inorder_traversal(start->left);
    printf("%d ",start->data);
    inorder_traversal(start->right);
    }
}
void preorder_traversal(struct node *start)
{
    if(start!=NULL)
    {
    printf("%d ",start->data);
    preorder_traversal(start->left);
    preorder_traversal(start->right);
    }
}
void postorder_traversal(struct node *start)
{
    if(start!=NULL)
    {
    postorder_traversal(start->left);
    postorder_traversal(start->right);
    printf("%d ",start->data);
    }
}