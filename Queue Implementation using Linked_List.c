#include<stdio.h>
#include<stdlib.h>
struct queue
{
    int data;
    struct queue *next;
};
struct queue *front=NULL,*rear=NULL;
struct queue *createqueue()
{
    struct queue *a;
    a=(struct queue *)malloc(sizeof(struct queue));
    printf("Enter a data\n");
    scanf("%d",&a->data);
    a->next=NULL;
    return a;
}
struct queue *enqueue()
{
    struct queue *a;
    a=createqueue();
    if(front==NULL)
        front=rear=a;
    else
    {
        rear->next=a;
        rear=rear->next;
    }
    return a;
}
void dequeue()
{
    if(front==NULL)
    {
        printf("Queue is empty\n");
        return;
    }
    else if(front->next==NULL)
    {
        printf("Element to be deleted from queue is %d\n",front->data);
        free(front);
        front=rear=NULL;
    }
    else
    {
        struct queue *b;
        b=front;
        front=front->next;
        free(b);
    }
}
void main()
{
    //Insertion in queue is called enqueue operation.
    //Deletion in queue is called dequeue operation.
    enqueue();
    enqueue();
    dequeue();
    dequeue();
    dequeue();
    dequeue();
}
