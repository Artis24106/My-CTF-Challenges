#include "emulator.h"

Emulator::Emulator(char* input) : ipt(input), ins(&code) {
}

void Emulator::run() {
    while (true) {
        switch (ins[0]) {
            case 0: {  // sav <imm>
                push(ins[1]);
                ins += 2;
                break;
            }
            case 1: {  // sai
                push(ipt[0]);
                ins += 1;
                break;
            }
            case 2: {  // nei
                ipt += 1;
                ins += 1;
                break;
            }
            case 3: {  // pri
                ipt -= 1;
                ins += 1;
                break;
            }
            case 4: {  // dup
                push(peek());
                ins += 1;
                break;
            }
            case 5: {  // cmp
                int8_t a = pop(), b = pop();
                if (a > b)
                    push(1);
                else if (a == b)
                    push(0);
                else
                    push(-1);
                ins += 1;
                break;
            }
            case 6: {  // jf <label> [not implemented]
                break;
            }
            case 7: {  // jmp <label>
                ins += ins[1];
                ins += 2;
                break;
            }
            case 8: {  // jz <label>
                if (pop() == 0) ins += ins[1];
                ins += 2;
                break;
            }
            case 9: {  // jnz <label>
                if (pop() != 0) ins += ins[1];
                ins += 2;
                break;
            }
            case 10: {  // jg <label>
                if (pop() == 1) ins += ins[1];
                ins += 2;
                break;
            }
            case 11: {  // jl <label>
                if (pop() == -1) ins += ins[1];
                ins += 2;
                break;
            }
            case 12: {  // and
                push(pop() & pop());
                ins += 1;
                break;
            }
            case 13: {  // or
                push(pop() | pop());
                ins += 1;
                break;
            }
            case 14: {  // xor
                push(pop() ^ pop());
                ins += 1;
                break;
            }
            case 15: {  // add
                push(pop() + pop());
                ins += 1;
                break;
            }
            case 16: {  // sub
                push(pop() - pop());
                ins += 1;
                break;
            }
            case 17: {  // mul
                push(pop() * pop());
                ins += 1;
                break;
            }
            case 18: {  // mod
                push(pop() % pop());
                ins += 1;
                break;
            }
            case 19: {  // inc
                push(pop() + 1);
                ins += 1;
                break;
            }
            case 20: {  // dec
                push(pop() - 1);
                ins += 1;
                break;
            }
            case 21: {  // exit
                exit(0);
            }
#ifdef DEBUG
            case 22: {  // debug
                printf("[DEBUG %d] ", ins[1]);
                stk.debug();
                ins += 2;
                break;
            }
#endif
            case 23: {  // out <imm>
                cout << ins[1];
                cout.flush();
                ins += 2;
                break;
            }
            default:
                exit(1);
                break;
        }
    }
}

void Emulator::push(int8_t imm) {
    stk.push(imm);
}

int8_t Emulator::pop() {
    int8_t temp = stk.peek();
    stk.pop();
    return temp;
}

int8_t Emulator::peek() {
    return stk.peek();
}