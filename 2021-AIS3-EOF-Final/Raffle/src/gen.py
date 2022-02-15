import os
from pprint import pprint
from random import shuffle

# EOF{w3_4r3_901ng_70_raffl3_0fF_A_g0...g0-r0u71n3!}
flag = b'w3_4r3_901ng_70_raffl3_0fF_A_g0...g0-r0u71n3!' # 45
input_name = 'input'
func_template = '''func {name}() {
    // fmt.Printf("'{name}', ")
	defer wg.Done()
{rule}
{go}
}'''

main_template = '''package main

import (
	"bytes"
	"fmt"
	"os"
	"runtime"
	"sync"
)

var input []byte
var wg sync.WaitGroup

func init() {
	runtime.GOMAXPROCS(1)
}

{func}

func main() {
	ans := []byte{0x50, 0x4a, 0x1f, 0xe8, 0x9a, 0x70, 0x61, 0x98, 0xdc, 0xb6, 0x68, 0xb3, 0x54, 0xbc, 0xa4, 0xbf, 0x83, 0x65, 0x8b, 0x45, 0xf1, 0xc, 0x35, 0x1e, 0xa4, 0xaf, 0x40, 0x6c, 0xa, 0x7a, 0x88, 0x1f, 0x1e, 0x38, 0x8, 0x41, 0xec, 0x32, 0x92, 0xbb, 0x1a, 0x20, 0xb9, 0x9f, 0x7}
	wg = sync.WaitGroup{}
	if len(os.Args) < 2 || len(os.Args[1]) != 45 {
		fmt.Println(":-(")
		return
	}
	input = []byte(os.Args[1])
	// input = []byte("{flag}")

	wg.Add({total_func})

{init_go}

	wg.Wait()

	// fmt.Println(input)

	if bytes.Equal(input, ans) {
		fmt.Printf("Correct! EOF{%s}\\n", os.Args[1])
	} else {
		fmt.Println("Wrong...")
	}
}'''

name_list = []

def _gen_byte():
    return int.from_bytes(os.urandom(1), byteorder='little')

def gen_name():
    suf = "{:04x}".format(int.from_bytes(os.urandom(2), byteorder='little'))
    while suf in name_list:
        suf = "{:04x}".format(int.from_bytes(os.urandom(2), byteorder='little'))
    return f"node_{suf}"

def gen_add(idx):
    return f"\t{input_name}[{idx}] += {hex(_gen_byte())}"

def gen_mul(idx):
    tmp = _gen_byte()
    while tmp & 1 == 0:
        tmp = _gen_byte()
    return f"\t{input_name}[{idx}] *= {hex(tmp)}"

def gen_xor(idx):
    idx_2 = idx
    while idx_2 == idx:
        idx_2 = _gen_byte() % len(flag)
    return f"\t{input_name}[{idx}] ^= {input_name}[{idx_2}]"

def gen_func(name, rule, go):
    return func_template\
        .replace('{name}', name)\
        .replace('{rule}', rule)\
        .replace('{go}', go)

def gen_main(func, flag, total_func, init_go):
    return main_template\
        .replace('{func}', func)\
        .replace('{flag}', flag)\
        .replace('{total_func}', total_func)\
        .replace('{init_go}', init_go)

gen_list = [gen_add, gen_mul, gen_xor]
dim = [3, 3, 3]
total_func = 3 + 3**2 + 3**3 # 39
total_rule = total_func * 4  # 39 * 4
func_no_go = 3**3            # 27
extra_rule = 21              # 39 * 4 - 45 * 3 = 21

# generate basic rules
rule_list = []
for i in range(len(flag)):  # 45
    for gen in gen_list:  # 3
        rule_list.append(gen(i))

# generate extra rules
for i in range(extra_rule):
    rule_list.append(gen_list[_gen_byte() % 3](_gen_byte() % len(flag)))

# shuffle rules
shuffle(rule_list)

# generate func name
for _ in range(total_func):
    name_list.append(gen_name())

# generate function
name_cnt = 0
rule_cnt = 0
func_list = []
off = 3
for i in range(3):
    func_list.append(
        gen_func(
            name_list[name_cnt], 
            '\n'.join(rule_list[rule_cnt:rule_cnt+3]),
            '\n'.join([f'\tgo {el}()' for el in name_list[i*3+off:i*3+3+off]])
        )
    )
    rule_cnt += 3
    name_cnt += 1

off = 3 + 9
for i in range(9):
    func_list.append(
        gen_func(
            name_list[name_cnt], 
            '\n'.join(rule_list[rule_cnt:rule_cnt+3]),
            '\n'.join([f'\tgo {el}()' for el in name_list[i*3+off:i*3+3+off]])
        )
    )
    rule_cnt += 3
    name_cnt += 1

for i in range(27):
    func_list.append(
        gen_func(
            name_list[name_cnt], 
            '\n'.join(rule_list[rule_cnt:rule_cnt+3]),
            ''
        )
    )
    rule_cnt += 3
    name_cnt += 1

# shuffle func list
shuffle(func_list)

# generate main
main_code = gen_main(
    '\n'.join(func_list),
    flag.decode(),
    total_func.__str__(),
    '\n'.join([f"\tgo {el}()" for el in name_list[:3]])
)
open('main.go', 'w').write(main_code)
