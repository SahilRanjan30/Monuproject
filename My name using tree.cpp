#include<iostream>
#include<stdlib.h>
using namespace std;
struct tree
{
    char name;
    struct tree *left,*right;
};
struct tree *start=NULL;
struct tree *create_tree()
{
    struct tree *a;
    a=new(struct tree);
    a->left=a->right=NULL;
    return a;
}
void Inorder_traversal(struct tree *a)
{
    if(a==NULL)
        return;
    Inorder_traversal(a->left);
    cout<<a->name;
    Inorder_traversal(a->right);
}
int main()
{
    cout<<sizeof(struct tree)<<endl;
    struct tree *a,*b,*c,*d,*e;
    a=create_tree();
    start=a;
    b=create_tree();
    c=create_tree();
    d=create_tree();
    e=create_tree();
    a->name='H';
    b->name='A';
    c->name='S';
    d->name='I';
    e->name='L';
    a->left=b;
    b->left=c;
    a->right=d;
    d->right=e;
    Inorder_traversal(start);
    free(a);
    free(b);
    free(c);
    free(d);
    free(e);
}