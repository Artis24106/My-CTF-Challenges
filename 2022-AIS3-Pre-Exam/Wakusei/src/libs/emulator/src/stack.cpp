#include "stack.h"

Node::Node(int8_t val = 0) : val(val) {
}

Stack::Stack() : top(nullptr) {
}

Stack::~Stack() {
    while (top) pop();
}

void Stack::push(int8_t val) {
    Node* temp = new Node(val);
    if (!temp) exit(1);
    temp->next = top;
    top = temp;
}

int8_t Stack::pop() {
    if (empty()) exit(1);
    Node* temp = top;
    uint8_t ret = temp->val;
    top = top->next;
    delete temp;
    return ret;
}

int8_t Stack::peek() {
    if (empty()) exit(1);
    return top->val;
}

bool Stack::empty() {
    return top == nullptr;
}

#ifdef DEBUG
void Stack::debug() {
    Node* temp = top;
    while (temp) {
        printf("0x%hhx -> ", temp->val);
        temp = temp->next;
    }
    puts("");
}
#endif