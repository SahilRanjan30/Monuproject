#include <stdio.h>
#include <stdlib.h>
struct node
{
    int data;
    struct node *left, *right;
};
struct node *start = NULL;
void inorder(struct node *);
struct node *createnode();
void insert_node_leftsubtree(struct node *);
void insert_node_rightsubtree(struct node *);
void main()
{
    struct node *a, *b, *c;
    a = createnode();
    b = createnode();
    c = createnode();
    a->left = b;
    a->right = c;
    start = a;
    inorder(start);
    insert_node_leftsubtree(start);
    insert_node_rightsubtree(start);
    inorder(start);
    free(a);
    free(b);
    free(c);
}
struct node *createnode()
{
    struct node *a;
    a = (struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d", &a->data);
    a->left = a->right = NULL;
    return a;
}
void inorder(struct node *start)
{
    if (start != NULL)
    {
        inorder(start->left);
        printf("%d ", start->data);
        inorder(start->right);
    }
}
void insert_node_leftsubtree(struct node *a)
{
    struct node *b;
    b = createnode();
    while (a->left != NULL)
        a = a->left;
    a->left = b;
}
void insert_node_rightsubtree(struct node *b)
{
    struct node *c;
    c = createnode();
    while (b->right != NULL)
        b = b->right;
    b->right = c;
}