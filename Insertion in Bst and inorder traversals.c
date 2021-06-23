#include<stdio.h>
#include<stdlib.h>
struct node
{
    int data;
    struct node *left,*right;
};
struct node *insert_in_Bst(struct node **a,int data)
{
    struct node *d=(struct node *)malloc(sizeof(struct node));
    d->data=data;
    d->left=d->right=NULL;
    if(*a==NULL)
        *a=d;
    else
    {
        struct node *b=*a,*c=NULL;
        while(b!=NULL)
        {
            if(data>b->data)
            {
                c=b;
                b=b->right;
            }
            else if(data==b->data)
            {
                free(d);
                return;
            }
            else
            {
                c=b;
                b=b->left;
            }
        }
        if(data>c->data)
            c->right=d;
        else
            c->left=d;
    }
    return d;
}
void inorder(int *arr,struct node *a)
{
    static int i=-1;
    if(a!=NULL)
    {
        inorder(arr,a->left);
        i++;
        arr[i]=a->data;
        inorder(arr,a->right);
    }
}
void preorder(struct node *a)
{
    if(a!=NULL)
    {
        printf("%d ",a->data);
        preorder(a->left);
        preorder(a->right);
    }
}
int searching_element(struct node *a,int data)
{
    if(a==NULL)
    {
        return -1;
    }
    else if(a->data==data)
        return 1;
    else if(data>a->data)
    {
        searching_element(a->right,data);
    }
    else
        searching_element(a->left,data);
}
void deletion_element_in_Bst(struct node **a,int data)
{
    struct node *b=*a,*c=NULL;
    if(b==NULL)
    {
        printf("\nNo node present in our Bst");
        return;
    }
    else if(b->data==data&&b->left==b->right)
    {
        free(b);
        *a=NULL;
    }
    else
    {
        c=b;
        while(c!=NULL)
        {
            if(data>c->data)
            {
                b=c;
                c=c->right;
            }
            else if(c->data==data)
            {
                free(c);
                if(data>b->data)
                    b->right=NULL;
                else
                    b->left=NULL;
                break;
            }
            else
            {
                b=c;
                c=c->left;
            }
        }
        if(c==NULL)
        {
            printf("Element not Present in our Bst\n");
        }
    }
}
int is_Bst(int *a,int n)
{
    for(int i=0;i<n-2;i++)
    {
        if(a[i]<a[i+1])
        {
            continue;
        }
        else
        {
            return -1;
        }
    }
    return 1;
}
void main()
{
    struct node *root=NULL;
    insert_in_Bst(&root,5);
    insert_in_Bst(&root,10);
    insert_in_Bst(&root,3);
    insert_in_Bst(&root,20);
    insert_in_Bst(&root,4);
    insert_in_Bst(&root,8);
    int a[6];
    inorder(a,root);
    for(int i=0;i<6;i++)
        printf("%d ",a[i]);
    a[3]=-1;
    printf("\n");
    for(int i=0;i<6;i++)
    printf("%d ",a[i]);
    printf("\n%d",is_Bst(a,6));
}
