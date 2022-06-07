from sys import argv
from m_parser import *
import inspect
from pprint import pprint

DEBUG = False
# DEBUG = True
code_tmpl = '''#include "mcode.h"

// bytecode is here!!
int8_t code[] = "{}";
'''
label_list = dict()
inst_list = list()
opcode_list = [
    "sav",
    "sai",
    "nei",
    "pri",
    "dup",
    "cmp",
    "jf",
    "jmp",
    "jz",
    "jnz",
    "jg",
    "jl",
    "and",
    "or",
    "xor",
    "add",
    "sub",
    "mul",
    "mod",
    "inc",
    "dec",
    "exit",
    "debug",
    "out"]


class CPU:
    def __init__(self, label_list, inst_list):
        global opcode_list
        # input
        self.l_list = label_list
        self.i_list = inst_list
        self.pc = 0
        self.bytecode = b''
        self.op_list = opcode_list

    def gen(self):
        cnt = 0
        for inst in self.i_list:
            # print(f"[{cnt}] ", end='')
            func = eval(f'self._{inst[0]}')
            self.bytecode += func(*inst[1:])
            cnt += 1

    def dump(self, target_path):
        global code_tmpl
        code = code_tmpl.format(''.join('\\x{:02X}'.format(a) for a in self.bytecode))
        open(target_path, 'w').write(code)

    def _f(self, *args, func_name=None):
        if func_name == None:
            func_name = inspect.stack()[1][3][1:]
        opcode = self.op_list.index(func_name)
        # print(func_name, *args)
        return bytes([opcode, *args])

    def _push(self, *argv):
        pass

    def _pop(self, *argv):
        pass

    def _sav(self, *argv):
        imm = int(argv[0])
        return self._f(imm)

    def _sai(self, *argv):
        return self._f()

    def _nei(self, *argv):
        return self._f()

    def _pri(self, *argv):
        return self._f()

    def _dup(self, *argv):
        return self._f()

    def _cmp(self, *argv):
        return self._f()

    def _jmp(self, *argv):
        label, pc = argv[0], int(argv[1])
        dist = self.l_list[label]
        return self._f((dist - pc - 2) & 0xff)

    def _jz(self, *argv):
        label, pc = argv[0], int(argv[1])
        dist = self.l_list[label]
        return self._f((dist - pc - 2) & 0xff)

    def _jnz(self, *argv):
        label, pc = argv[0], int(argv[1])
        dist = self.l_list[label]
        return self._f((dist - pc - 2) & 0xff)

    def _jg(self, *argv):
        label, pc = argv[0], int(argv[1])
        dist = self.l_list[label]
        return self._f((dist - pc - 2) & 0xff)

    def _jl(self, *argv):
        label, pc = argv[0], int(argv[1])
        dist = self.l_list[label]
        return self._f((dist - pc - 2) & 0xff)

    def _and(self, *argv):
        return self._f()

    def _or(self, *argv):
        return self._f()

    def _xor(self, *argv):
        return self._f()

    def _add(self, *argv):
        return self._f()

    def _sub(self, *argv):
        return self._f()

    def _mul(self, *argv):
        return self._f()

    def _mod(self, *argv):
        return self._f()

    def _inc(self, *argv):
        return self._f()

    def _dec(self, *argv):
        return self._f()

    def _exit(self, *argv):
        return self._f()

    def _debug(self, *argv):
        debug_num = int(argv[0])
        return self._f(debug_num)

    def _out(self, *argv):
        imm = int(argv[0])
        return self._f(imm)


def parse(data):
    global label_list, inst_list
    inst_ptr = 0

    for inst in data:
        if is_label(inst):
            label = get_label(inst)
            label_list[label] = inst_ptr
        elif is_inst(inst):
            temp = list(get_inst(inst))
            if not DEBUG and temp[0] == 'debug':
                continue

            temp.append(inst_ptr)
            inst_list.append(temp)
            inst_ptr += 1 if temp[1] == '' else 2

    # pprint(label_list)
    # pprint(inst_list)


if __name__ == "__main__":
    if len(argv) < 2:
        print(f"Usage: python3 {__file__} <.asm_file>")
        exit(0)
    parse(open(argv[1], 'r').readlines())
    cpu = CPU(label_list, inst_list)
    cpu.gen()
    cpu.dump("./temp.cpp")
