#ifndef __EMULATOR_H__
#define __EMULATOR_H__

using namespace std;

#include <iostream>
#include <string>

#include "mcode.h"
#include "stack.h"

using namespace std;

extern int8_t code;

class Emulator {
   public:
    Emulator(char* input);
    void run();

   private:
    char* ipt;    // user input
    int8_t* ins;  // program counter
    Stack stk;    // stack
    void push(int8_t imm);
    int8_t pop();
    int8_t peek();
};

#endif