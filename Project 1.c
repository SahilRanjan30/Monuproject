#include<stdio.h>
#include<stdlib.h>
/*In this Project we are simply going to implement  operations
of linkedlist and array*/
void Doublylinkedlist();
void traverse_list();
void insert_at_beginning();
struct node *createnode();
void insert_at_last();
void array();
struct node
{
    int data;     //Here I have defined my own Primitive Data Type as Node
    struct node *prev,*next;
};
struct node *start=NULL;
void main()
{
    int a,b;
    printf("Enter two numbers\n");
    scanf("%d%d",&a,&b);
    a>b?Doublylinkedlist():array();
}
void Doublylinkedlist()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    printf("Enter a data\n");
    scanf("%d",&a->data);
    a->prev=a->next=NULL;
    start=a;
    insert_at_beginning();
    traverse_list();
    insert_at_last();
    traverse_list();
}
void array()
{
    int a,*b,i;
    printf("Enter size of the array\n");
    scanf("%d",&a);
    b=(int *)malloc(a*sizeof(int));
    printf("Enter elements of our array\n");
    for(i=0;i<a;i++)
    {
        scanf("%d",&b[i]);
    }
      for(i=0;i<a;i++)
    {
        printf("%d",b[i]);
    }
    
    free(b);
}
void traverse_list()
{
    struct node *a;
    a=start;
    printf("Elements in our list is:\n");
    while(a!=NULL)
    {
        printf("%d ",a->data);
        a=a->next;
    }
}
void insert_at_beginning()
{
    struct node *b;
    b=createnode();
    printf("Enter a data\n");
    scanf("%d",&b->data);
    b->prev=NULL;
    b->next=start;
    start->prev=b;
    start=b;
}

struct node *createnode()
{
    struct node *a;
    a=(struct node *)malloc(sizeof(struct node));
    return a;
}
void insert_at_last()
{
    struct node *a,*b;
    a=createnode();
    printf("Enter a data\n");
    scanf("%d",&a->data);
    a->next=NULL;
    b=start;
    while(b->next!=NULL)
        b=b->next;
    b->next=a;
    a->prev=b;
}