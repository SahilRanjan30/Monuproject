#include<iostream>
#include<stdlib.h>
using namespace std;
struct linked_list
{
    int data;
    struct linked_list *next;
};
struct linked_list *start=NULL;
struct linked_list *createnode()
{
    struct linked_list *a;
    a=new(struct linked_list);
    cout<<"Enter a data"<<endl;
    cin>>a->data;
    a->next=NULL;
    return a;
}
void traverse()
{
    struct linked_list *a;
    a=start;
    while(a!=NULL)
    {
        cout<<a->data<<endl;
        a=a->next;
    }
}
void insert_at_first()
{
    struct linked_list *a;
    a=createnode();
    a->next=start;
    start=a;
}
void insert_at_last()
{
    struct linked_list *c;
    c=start;
    while(c->next!=NULL)
    {
        c=c->next;
    }
    c->next=createnode();
}
int main()
{
    struct linked_list *a;
    cout<<sizeof(a)<<endl;
    a=createnode();
    start=a;
    insert_at_first();
    traverse();
    insert_at_last();
    traverse();
    free(a);
}