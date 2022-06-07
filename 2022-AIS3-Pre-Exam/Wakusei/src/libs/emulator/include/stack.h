#ifndef __STACK_H__
#define __STACK_H__

#include <cstdint>
#include <iostream>

using namespace std;

#define DEFAULT_SIZE 10

class Node {
   public:
    Node(int8_t val);
    int8_t val;
    Node* next;

   private:
};

class Stack {
   public:
    Stack();
    ~Stack();

    void push(int8_t val);
    int8_t pop();
    int8_t peek();

    bool empty();

#ifdef DEBUG
    void debug();
#endif

   private:
    Node* top;
};

#endif